package com.lxinet.jeesns.service.weibo.impl;

import com.lxinet.jeesns.common.utils.*;
import com.lxinet.jeesns.core.consts.AppTag;
import com.lxinet.jeesns.core.enums.MessageType;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.enums.Messages;
import com.lxinet.jeesns.core.exception.NotLoginException;
import com.lxinet.jeesns.core.exception.OpeErrorException;
import com.lxinet.jeesns.core.exception.ParamException;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.*;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.model.weibo.Weibo;
import com.lxinet.jeesns.model.weibo.WeiboTopic;
import com.lxinet.jeesns.service.picture.IPictureService;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IMessageService;
import com.lxinet.jeesns.service.member.IScoreDetailService;
import com.lxinet.jeesns.service.system.IActionLogService;
import com.lxinet.jeesns.dao.weibo.IWeiboDao;
import com.lxinet.jeesns.service.weibo.IWeiboFavorService;
import com.lxinet.jeesns.service.weibo.IWeiboService;
import com.lxinet.jeesns.service.weibo.IWeiboTopicService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zchuanzhao on 2016/11/25.
 */
@Service("weiboService")
public class WeiboServiceImpl implements IWeiboService {
    @Resource
    private IWeiboDao weiboDao;
    @Resource
    private IWeiboFavorService weiboFavorService;
    @Resource
    private IActionLogService actionLogService;
    @Resource
    private IPictureService pictureService;
    @Resource
    private IScoreDetailService scoreDetailService;
    @Resource
    private IMessageService messageService;
    @Resource
    private IMemberService memberService;
    @Resource
    private IWeiboTopicService weiboTopicService;

    @Override
    public Weibo findById(int id, int memberId) {
        Weibo weibo = weiboDao.findById(id,memberId);
        return weibo;
    }

    @Override
    @Transactional
    public boolean save(HttpServletRequest request, Member loginMember, String content, String pictures) {
        if("0".equals(request.getServletContext().getAttribute(ConfigUtil.WEIBO_POST.toUpperCase()))){
            throw new OpeErrorException("微博已关闭");
        }
        ValidUtill.checkIsNull(content, Messages.CONTENT_NOT_EMPTY);
        if(content.length() > Integer.parseInt((String) request.getServletContext().getAttribute(ConfigUtil.WEIBO_POST_MAXCONTENT.toUpperCase()))){
            throw new ParamException("内容不能超过"+request.getServletContext().getAttribute(ConfigUtil.WEIBO_POST_MAXCONTENT.toUpperCase())+"字");
        }
        //获取话题
        String topicName = WeiboTopicUtil.getTopicName(content);
        WeiboTopic weiboTopic = null;
        if (StringUtils.isNotBlank(topicName)){
            weiboTopic = weiboTopicService.findByName(topicName);
            if (weiboTopic == null){
                weiboTopic = new WeiboTopic();
                weiboTopic.setName(topicName);
                weiboTopicService.save(weiboTopic);
            }
        }
        Weibo weibo = new Weibo();
        weibo.setMemberId(loginMember.getId());
        weibo.setContent(content);
        weibo.setStatus(1);
        if(StringUtils.isEmpty(pictures)){
            //普通文本
            weibo.setType(0);
        }else {
            //图片
            weibo.setType(1);
        }
        if (weiboTopic != null){
            weibo.setTopicId(weiboTopic.getId());
        }
        int result = weiboDao.save(weibo);
        if(result == 1){
            //@会员处理并发送系统消息
            messageService.atDeal(loginMember.getId(),content, AppTag.WEIBO, MessageType.WEIBO_REFER,weibo.getId());
            pictureService.update(weibo.getId(),pictures, content);
            actionLogService.save(loginMember.getCurrLoginIp(),loginMember.getId(), ActionUtil.POST_WEIBO,"", ActionLogType.WEIBO.getValue(),weibo.getId());
            //发布微博奖励
            scoreDetailService.scoreBonus(loginMember.getId(), ScoreRuleConsts.RELEASE_WEIBO, weibo.getId());
        }
        return result == 1;
    }

    @Override
    public ResultModel<Weibo> listByPage(Page page, int memberId, int loginMemberId, String key) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key.trim()+"%";
        }
        List<Weibo> list = weiboDao.listByPage(page, memberId,loginMemberId,key);
        list = this.formatWeibo(list);
        ResultModel model = new ResultModel(0,page);
        model.setData(list);
        return model;
    }

    @Transactional
    @Override
    public boolean delete(HttpServletRequest request, Member loginMember, int id) {
        Weibo weibo = this.findById(id,loginMember.getId());
        ValidUtill.checkIsNull(weibo, Messages.WEIBO_NOT_EXISTS);
        weiboDao.delete(id);
        //扣除积分
        scoreDetailService.scoreCancelBonus(loginMember.getId(),ScoreRuleConsts.RELEASE_WEIBO,id);
        pictureService.deleteByForeignId(request, id);
        actionLogService.save(loginMember.getCurrLoginIp(),loginMember.getId(), ActionUtil.DELETE_WEIBO, "ID："+weibo.getId()+"，内容："+weibo.getContent());
        return true;
    }

    @Transactional
    @Override
    public boolean userDelete(HttpServletRequest request, Member loginMember, int id) {
        Weibo weibo = this.findById(id,loginMember.getId());
        ValidUtill.checkIsNull(weibo, Messages.WEIBO_NOT_EXISTS);
        if(loginMember.getIsAdmin() == 0 && (loginMember.getId().intValue() != weibo.getMember().getId().intValue())){
            throw new OpeErrorException("没有权限");
        }
        return this.delete(request, loginMember,id);
    }

    @Override
    public List<Weibo> hotList(int loginMemberId) {
        List<Weibo> hotList = weiboDao.hotList(loginMemberId);
        hotList = this.formatWeibo(hotList);
        return hotList;
    }

    @Transactional
    @Override
    public ResultModel favor(Member loginMember, int weiboId) {
        ValidUtill.checkParam(weiboId != 0);
        Weibo weibo = this.findById(weiboId,loginMember.getId());
        ResultModel resultModel = new ResultModel(0);
        if(weiboFavorService.find(weiboId,loginMember.getId()) == null){
            //增加
            weiboDao.favor(weiboId,1);
            weibo.setFavor(weibo.getFavor() + 1);
            weiboFavorService.save(weiboId,loginMember.getId());
            //发布微博奖励
            scoreDetailService.scoreBonus(loginMember.getId(), ScoreRuleConsts.WEIBO_RECEIVED_THUMBUP, weiboId);
            //点赞之后发送系统信息
            messageService.diggDeal(loginMember.getId(),weibo.getMemberId(),AppTag.WEIBO,MessageType.WEIBO_ZAN,weibo.getId());
        }else {
            //减少
            weiboDao.favor(weiboId,-1);
            weibo.setFavor(weibo.getFavor() - 1);
            weiboFavorService.delete(weiboId,loginMember.getId());
            //扣除积分
            scoreDetailService.scoreCancelBonus(loginMember.getId(),ScoreRuleConsts.WEIBO_RECEIVED_THUMBUP,weiboId);
            resultModel.setCode(1);
        }
        resultModel.setData(weibo.getFavor());
        return resultModel;
    }

    @Override
    public List<Weibo> listByCustom(int loginMemberId, String sort, int num, int day) {
        List<Weibo> list = weiboDao.listByCustom(loginMemberId,sort,num,day);
        list = this.formatWeibo(list);
        return list;
    }

    @Override
    public ResultModel<Weibo> listByTopic(Page page, int loginMemberId, String topicName) {
        WeiboTopic weiboTopic = weiboTopicService.findByName(topicName);
        List<Weibo> list;
        if (weiboTopic == null){
            weiboTopic = new WeiboTopic();
            weiboTopic.setName(topicName);
            weiboTopicService.save(weiboTopic);
            list = new ArrayList<>();
        }else {
            list = weiboDao.listByTopic(page, loginMemberId, weiboTopic.getId());
            list = this.formatWeibo(list);
        }
        ResultModel model = new ResultModel(0,page);
        model.setData(list);
        return model;
    }

    public Weibo formatWeibo(Weibo weibo){
        weibo.setContent(memberService.atFormat(weibo.getContent()));
        weibo.setContent(WeiboTopicUtil.formatTopic(weibo.getContent()));
        return weibo;
    }

    public List<Weibo> formatWeibo(List<Weibo> weiboList){
        for (Weibo weibo : weiboList){
            formatWeibo(weibo);
        }
        return weiboList;
    }

}
