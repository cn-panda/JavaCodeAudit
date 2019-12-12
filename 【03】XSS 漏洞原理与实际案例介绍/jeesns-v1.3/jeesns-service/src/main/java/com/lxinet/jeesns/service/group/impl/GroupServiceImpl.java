package com.lxinet.jeesns.service.group.impl;

import com.lxinet.jeesns.common.utils.ValidUtill;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.enums.Messages;
import com.lxinet.jeesns.core.exception.OpeErrorException;
import com.lxinet.jeesns.core.utils.*;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.model.system.ScoreRule;
import com.lxinet.jeesns.service.group.IGroupService;
import com.lxinet.jeesns.dao.group.IGroupDao;
import com.lxinet.jeesns.service.group.IGroupFansService;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IScoreDetailService;
import com.lxinet.jeesns.service.system.IActionLogService;
import com.lxinet.jeesns.service.system.IConfigService;
import com.lxinet.jeesns.common.utils.ActionUtil;
import com.lxinet.jeesns.common.utils.ConfigUtil;
import com.lxinet.jeesns.common.utils.ScoreRuleConsts;
import com.lxinet.jeesns.service.system.IScoreRuleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by zchuanzhao on 2016/12/23.
 */
@Service("groupService")
public class GroupServiceImpl implements IGroupService {
    @Resource
    private IGroupDao groupDao;
    @Resource
    private IGroupFansService groupFansService;
    @Resource
    private IMemberService memberService;
    @Resource
    private IConfigService configService;
    @Resource
    private IActionLogService actionLogService;
    @Resource
    private IScoreDetailService scoreDetailService;
    @Resource
    private IScoreRuleService scoreRuleService;

    @Override
    public List<Group> list(int status, String key) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key.trim()+"%";
        }
        List<Group> list = groupDao.list(status,key);
        return list;
    }

    /**
     * 关注、取消关注群组
     * @param loginMember
     * @param groupId
     * @param type 0关注，1取消关注
     * @return
     */
    @Override
    public boolean follow(Member loginMember, Integer groupId, int type) {
        Group group = this.findById(groupId);
        ValidUtill.checkIsNull(group,Messages.GROUP_NOT_EXISTS);
        if(type == 0){
            return groupFansService.save(loginMember,groupId);
        }else {
            //创建者无法取消关注
            if(loginMember.getId().intValue() == group.getCreator().intValue()){
                throw new OpeErrorException("管理员不能取消关注");
            }
            return groupFansService.delete(loginMember,groupId);
        }

    }

    @Override
    public boolean changeStatus(int id) {
       return groupDao.changeStatus(id) == 1;
    }

    @Override
    public List<Group> listByCustom(int status, int num, String sort) {
        return groupDao.listByCustom(status,num,sort);
    }

    @Override
    public Group findById(int id) {
        return groupDao.findById(id);
    }

    @Override
    @Transactional
    public boolean save(Member loginMember, Group group) {
        loginMember = memberService.findById(loginMember.getId());
        Map<String,String> config = configService.getConfigToMap();
        group.setCreator(loginMember.getId());
        if(loginMember.getIsAdmin() > 0){
            group.setStatus(1);
        }else {
            if("0".equals(config.get(ConfigUtil.GROUP_APPLY))){
                throw new OpeErrorException("群组申请功能已关闭");
            }
            ScoreRule scoreRule = scoreRuleService.findById(ScoreRuleConsts.APPLY_GROUP);
            if (scoreRule != null && loginMember.getScore() < Math.abs(scoreRule.getScore())){
                throw new OpeErrorException("账户积分不足无法申请群组，申请群组需要积分：" + Math.abs(scoreRule.getScore()) + "，当前积分余额为：" + loginMember.getScore());
            }
            if("0".equals(config.get(ConfigUtil.GROUP_APPLY_REVIEW))){
                group.setStatus(0);
            }else {
                group.setStatus(1);
            }
        }
        //默认图标
        if(StringUtils.isEmpty(group.getLogo())){
            group.setLogo(Const.DEFAULT_IMG_URL);
        }
        //设置管理员
        String managerIds = String.valueOf(loginMember.getId());
        group.setManagers(managerIds);
        group.setCanPost(1);
        group.setTopicReview(0);
        boolean result = groupDao.save(group) == 1;
        if(result){
            //创建者默认关注群组
            groupFansService.save(loginMember,group.getId());
            //申请群组奖励、扣款
            scoreDetailService.scoreBonus(loginMember.getId(), ScoreRuleConsts.APPLY_GROUP, group.getId());
        }
        return result;
    }

    @Override
    public boolean update(Member loginMember, Group group) {
        Group findGroup = this.findById(group.getId());
        ValidUtill.checkIsNull(findGroup, Messages.GROUP_NOT_EXISTS);
        if(loginMember.getId().intValue() != findGroup.getCreator().intValue()){
            throw new OpeErrorException("没有权限");
        }

        //设置管理员
        String managerNames = group.getManagers();
        String managerIds = "";
        String[] names = managerNames.split(",");
        if(names.length > 10){
            throw new OpeErrorException("管理员不能超过10个");
        }
        for (String name : names){
            Member member = memberService.findByName(name.trim());
            if(member != null){
                managerIds += member.getId() + ",";
            }
        }
        if(managerIds.length() > 0){
            managerIds = managerIds.substring(0,managerIds.length()-1);
        }
        if(StringUtils.isNotEmpty(group.getLogo())){
            findGroup.setLogo(group.getLogo());
        }
        findGroup.setManagers(managerIds);
        findGroup.setName(group.getName());
        findGroup.setTags(group.getTags());
        findGroup.setCanPost(group.getCanPost());
        findGroup.setTopicReview(group.getTopicReview());
        findGroup.setIntroduce(group.getIntroduce());
        findGroup.setTypeId(group.getTypeId());
        return groupDao.update(findGroup) == 1;
    }

    @Override
    public boolean delete(Member loginMember, int id) {
        Group findGroup = this.findById(id);
        ValidUtill.checkIsNull(findGroup, Messages.GROUP_NOT_EXISTS);
        if(groupDao.delete(id) == 1){
            actionLogService.save(loginMember.getCurrLoginIp(),loginMember.getId(), ActionUtil.DELETE_GROUP,"ID："+findGroup.getId()+"，名字："+findGroup.getName());
        }
        return groupDao.delete(id) == 1;
    }


}
