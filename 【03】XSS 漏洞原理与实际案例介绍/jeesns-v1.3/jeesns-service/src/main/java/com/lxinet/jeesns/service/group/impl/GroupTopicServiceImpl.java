package com.lxinet.jeesns.service.group.impl;

import com.lxinet.jeesns.common.utils.ActionLogType;
import com.lxinet.jeesns.common.utils.ActionUtil;
import com.lxinet.jeesns.common.utils.ScoreRuleConsts;
import com.lxinet.jeesns.common.utils.ValidUtill;
import com.lxinet.jeesns.core.consts.AppTag;
import com.lxinet.jeesns.core.enums.MessageType;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.enums.Messages;
import com.lxinet.jeesns.core.exception.NotLoginException;
import com.lxinet.jeesns.core.exception.OpeErrorException;
import com.lxinet.jeesns.core.exception.ParamException;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.Const;
import com.lxinet.jeesns.core.utils.StringUtils;
import com.lxinet.jeesns.dao.group.IGroupTopicDao;
import com.lxinet.jeesns.model.common.Archive;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.group.GroupTopic;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.common.IArchiveService;
import com.lxinet.jeesns.service.group.IGroupFansService;
import com.lxinet.jeesns.service.group.IGroupService;
import com.lxinet.jeesns.service.group.IGroupTopicCommentService;
import com.lxinet.jeesns.service.group.IGroupTopicService;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IMessageService;
import com.lxinet.jeesns.service.member.IScoreDetailService;
import com.lxinet.jeesns.service.system.IActionLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import javax.crypto.spec.OAEPParameterSpec;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zchuanzhao on 2016/12/26.
 */
@Service("groupTopicService")
public class GroupTopicServiceImpl implements IGroupTopicService {
    @Resource
    private IGroupTopicDao groupTopicDao;
    @Resource
    private IGroupService groupService;
    @Resource
    private IGroupTopicCommentService groupTopicCommentService;
    @Resource
    private IGroupFansService groupFansService;
    @Resource
    private IArchiveService archiveService;
    @Resource
    private IActionLogService actionLogService;
    @Resource
    private IScoreDetailService scoreDetailService;
    @Resource
    private IMessageService messageService;
    @Resource
    private IMemberService memberService;

    @Override
    public GroupTopic findById(int id) {
        return this.findById(id,null);
    }

    @Override
    public GroupTopic findById(int id,Member loginMember) {
        int loginMemberId = loginMember == null ? 0 : loginMember.getId();
        return this.atFormat(groupTopicDao.findById(id,loginMemberId));
    }

    @Override
    @Transactional
    public boolean save(Member member, GroupTopic groupTopic) {
        if(groupTopic.getGroupId() == null || groupTopic.getGroupId() == 0){
            throw new ParamException();
        }
        Group group = groupService.findById(groupTopic.getGroupId());
        ValidUtill.checkIsNull(group, Messages.GROUP_NOT_EXISTS);
        if(groupFansService.findByMemberAndGroup(group.getId(),member.getId()) == null){
            throw new OpeErrorException("必须关注该群组后才能发帖");
        }
        if(group.getCanPost() == 0){
            throw new OpeErrorException("群组已关闭发帖功能");
        }
        groupTopic.setMemberId(member.getId());
        Archive archive = new Archive();
        try {
            //复制属性值
            archive = archive.copy(groupTopic);
        } catch (Exception e) {
            e.printStackTrace();
        }
        archive.setPostType(2);
        //保存文档
        if(!archiveService.save(member,archive)){
            throw new OpeErrorException();
        }
        //保存文章
        groupTopic.setStatus(group.getTopicReview()==0?1:0);
        groupTopic.setArchiveId(archive.getArchiveId());
        int result = groupTopicDao.save(groupTopic);
        if(result == 1){
            //@会员处理并发送系统消息
            messageService.atDeal(member.getId(),groupTopic.getContent(), AppTag.GROUP, MessageType.GROUP_TOPIC_REFER,groupTopic.getId());
            //群组发帖奖励
            scoreDetailService.scoreBonus(member.getId(), ScoreRuleConsts.GROUP_POST, groupTopic.getId());
            actionLogService.save(member.getCurrLoginIp(),member.getId(), ActionUtil.POST_GROUP_TOPIC,"", ActionLogType.GROUP_TOPIC.getValue(),groupTopic.getId());
        }
        return result == 1;
    }

    @Override
    public ResultModel listByPage(Page page, String key, int groupId, int status, int memberId, int typeId) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }
        List<GroupTopic> list = groupTopicDao.listByPage(page, key,groupId,status,memberId,typeId);
        ResultModel model = new ResultModel(0,page);
        model.setData(list);
        return model;
    }

    @Override
    @Transactional
    public boolean update(Member member, GroupTopic groupTopic) {
        GroupTopic findGroupTopic = this.findById(groupTopic.getId(),member);
        ValidUtill.checkIsNull(findGroupTopic, Messages.TOPIC_NOT_EXISTS);
        if(member.getId().intValue() != findGroupTopic.getMember().getId().intValue()){
            throw new OpeErrorException("没有权限");
        }
        groupTopic.setArchiveId(findGroupTopic.getArchiveId());
        Archive archive = new Archive();
        try {
            //复制属性值
            archive = archive.copy(groupTopic);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (groupTopic.getTypeId() != null && !groupTopic.getTypeId().equals(findGroupTopic.getTypeId())){
            groupTopicDao.updateType(groupTopic.getId(),groupTopic.getTypeId());
        }
        return archiveService.update(member,archive);
    }

    @Override
    @Transactional
    public boolean delete(Member loginMember, int id) {
        GroupTopic groupTopic = this.findById(id);
        ValidUtill.checkIsNull(groupTopic, Messages.TOPIC_NOT_EXISTS);
        int result = groupTopicDao.delete(id);
        if(result == 1){
            //扣除积分
            scoreDetailService.scoreCancelBonus(loginMember.getId(),ScoreRuleConsts.GROUP_POST,id);
            archiveService.delete(groupTopic.getArchiveId());
            groupTopicCommentService.deleteByTopic(id);
            actionLogService.save(loginMember.getCurrLoginIp(),loginMember.getId(), ActionUtil.DELETE_GROUP_TOPIC,"ID："+groupTopic.getId()+"，标题："+groupTopic.getTitle());

        }
        return result == 1;
    }


    @Override
    @Transactional
    public boolean indexDelete(HttpServletRequest request, Member loginMember, int id) {
        GroupTopic groupTopic = this.findById(id,loginMember);
        ValidUtill.checkIsNull(groupTopic, Messages.TOPIC_NOT_EXISTS);
        Group group = groupService.findById(groupTopic.getGroup().getId());
        ValidUtill.checkIsNull(group);
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(loginMember.getId().intValue() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        if(loginMember.getId().intValue() == groupTopic.getMember().getId().intValue() || loginMember.getIsAdmin() > 0 ||
                isManager || loginMember.getId().intValue() == group.getCreator().intValue()){
            boolean flag = this.delete(loginMember,id);
            return flag;
        }
        throw new OpeErrorException("没有权限");
    }

    @Override
    public boolean audit(Member member, int id) {
        GroupTopic groupTopic = this.findById(id,member);
        ValidUtill.checkIsNull(groupTopic, Messages.TOPIC_NOT_EXISTS);
        Group group = groupService.findById(groupTopic.getGroup().getId());
        ValidUtill.checkIsNull(group);
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(member.getId() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        if(member.getId().intValue() == groupTopic.getMember().getId().intValue() || member.getIsAdmin() > 0 ||
                isManager || member.getId().intValue() == group.getCreator().intValue()){
            return groupTopicDao.audit(id) == 1;
        }
        throw new OpeErrorException("没有权限");
    }

    @Override
    public boolean top(Member member, int id, int top) {
        GroupTopic groupTopic = this.findById(id,member);
        ValidUtill.checkIsNull(groupTopic, Messages.TOPIC_NOT_EXISTS);
        Group group = groupService.findById(groupTopic.getGroup().getId());
        ValidUtill.checkIsNull(group);
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(member.getId() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        if(member.getId().intValue() == groupTopic.getMember().getId().intValue() || member.getIsAdmin() > 0 ||
                isManager || member.getId().intValue() == group.getCreator().intValue()){
            return groupTopicDao.top(id,top) == 1;
        }
        throw new OpeErrorException("没有权限");
    }

    /**
     * 将帖子设置精华
     * @param member
     * @param id
     * @param essence
     * @return
     */
    @Override
    public boolean essence(Member member, int id, int essence) {
        GroupTopic groupTopic = this.findById(id,member);
        ValidUtill.checkIsNull(groupTopic, Messages.TOPIC_NOT_EXISTS);
        Group group = groupService.findById(groupTopic.getGroup().getId());
        ValidUtill.checkIsNull(group);
        String groupManagers = group.getManagers();
        String[] groupManagerArr = groupManagers.split(",");
        boolean isManager = false;
        for (String manager : groupManagerArr){
            if(member.getId() == Integer.parseInt(manager)){
                isManager = true;
            }
        }
        if(member.getId().intValue() == groupTopic.getMember().getId().intValue() || member.getIsAdmin() > 0 ||
                isManager || member.getId().intValue() == group.getCreator().intValue()){
            return groupTopicDao.essence(id,essence) == 1;
        }
        throw new OpeErrorException("没有权限");
    }


    @Override
    public ResultModel favor(Member loginMember, int id) {
        GroupTopic groupTopic = this.findById(id);
        ValidUtill.checkIsNull(groupTopic, Messages.TOPIC_NOT_EXISTS);
        ResultModel resultModel = archiveService.favor(loginMember,groupTopic.getArchiveId());
        if(resultModel.getCode() == 0){
            //帖子收到喜欢
            scoreDetailService.scoreBonus(loginMember.getId(), ScoreRuleConsts.GROUP_TOPIC_RECEIVED_LIKE, id);
            //点赞之后发送系统信息
            messageService.diggDeal(loginMember.getId(),groupTopic.getMemberId(),AppTag.GROUP,MessageType.GROUP_TOPIC_LIKE,groupTopic.getId());
        }else if(resultModel.getCode() == 1){
            //帖子取消喜欢
            //扣除积分
            scoreDetailService.scoreCancelBonus(loginMember.getId(),ScoreRuleConsts.GROUP_TOPIC_RECEIVED_LIKE, id);
        }
        return resultModel;
    }

    @Override
    public List<GroupTopic> listByCustom(int gid, String sort, int num, int day,int thumbnail) {
        return groupTopicDao.listByCustom(gid,sort,num,day,thumbnail);
    }

    public GroupTopic atFormat(GroupTopic groupTopic){
        groupTopic.setContent(memberService.atFormat(groupTopic.getContent()));
        return groupTopic;
    }
}
