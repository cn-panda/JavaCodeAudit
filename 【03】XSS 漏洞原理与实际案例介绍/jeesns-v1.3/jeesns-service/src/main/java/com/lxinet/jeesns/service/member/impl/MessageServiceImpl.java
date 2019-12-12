package com.lxinet.jeesns.service.member.impl;

import com.lxinet.jeesns.core.enums.MessageType;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.AtUtil;
import com.lxinet.jeesns.dao.member.IMessageDao;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.model.member.Message;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zchuanzhao on 2017/3/9.
 */
@Service("messageService")
public class MessageServiceImpl implements IMessageService {
    @Resource
    private IMessageDao messageDao;
    @Resource
    private IMemberService memberService;

    @Override
    public ResultModel sentMsg(Integer fromMemberId, Integer toMemberId, String content) {
        if(fromMemberId.intValue() == toMemberId.intValue()){
            return new ResultModel(-1, "不能发信息给自己");
        }
        Message message = new Message();
        message.setFromMemberId(fromMemberId);
        message.setToMemberId(toMemberId);
        message.setContent(content);
        if(messageDao.sentMsg(message) == 1){
            return new ResultModel(0, "信息发送成功");
        }
        return new ResultModel(-1, "信息发送失败");
    }

    @Override
    public ResultModel systemMsgSave(Integer toMemberId, String content, Integer appTag, Integer type, Integer relateKeyId, Integer loginMemberId, String description) {
        Message message = new Message();
        message.setToMemberId(toMemberId);
        message.setContent(content);
        message.setAppTag(appTag);
        message.setRelateKeyId(relateKeyId);
        message.setType(type);
        message.setMemberId(loginMemberId);
        message.setDescription(description);
        if(messageDao.systemMsgSave(message) == 1){
            return new ResultModel(0, "信息发送成功");
        }
        return new ResultModel(-1, "信息发送失败");
    }

    @Override
    public ResultModel<Message> listByPage(Page page, Integer fromMemberId, Integer toMemberId) {
        List<Message> list = messageDao.listByPage(page,fromMemberId, toMemberId);
        ResultModel model = new ResultModel(0,page);
        model.setData(list);
        return model;
    }

    @Override
    public ResultModel<Message> messageRecords(Page page, Integer fromMemberId, Integer toMemberId) {
        List<Message> list = messageDao.messageRecords(page, fromMemberId, toMemberId);
        ResultModel model = new ResultModel(0, page);
        model.setData(list);
        //设置该会员聊天记录为已读
        this.setRead(fromMemberId,toMemberId);
        return model;
    }

    @Override
    public ResultModel<Message> systemMessage(Page page, Integer toMemberId, String basePath) {
        List<Message> list = messageDao.systemMessage(page, toMemberId,basePath);
        ResultModel model = new ResultModel(0, page);
        model.setData(list);
        //设置该会员聊天记录为已读
        this.setRead(null,toMemberId);
        return model;
    }

    @Override
    public int deleteByMember(Integer memberId) {
        return messageDao.deleteByMember(memberId);
    }

    @Override
    public int clearMessageByMember(Integer fromMemberId, Integer toMemberId) {
        return messageDao.clearMessageByMember(fromMemberId, toMemberId);
    }

    @Override
    public int countUnreadNum(int memberId) {
        return messageDao.countUnreadNum(memberId);
    }

    @Override
    public int countSystemUnreadNum(int memberId) {
        return messageDao.countSystemUnreadNum(memberId);
    }

    @Override
    public int setRead(Integer fromMemberId, Integer toMemberId) {
        return messageDao.setRead(fromMemberId,toMemberId);
    }

    @Override
    public void atDeal(int loginMemberId,String content,int appTag,MessageType messageType,int relateKeyId) {
        List<String> atMemberList = AtUtil.getAtNameList(content);
        if (atMemberList.size() > 0){
            for (String name : atMemberList){
                Member findAtMember = memberService.findByName(name);
                if (findAtMember != null && loginMemberId != findAtMember.getId()){
                    this.systemMsgSave(findAtMember.getId(),content,appTag,messageType.getCode(),relateKeyId,loginMemberId,messageType.getContent());
                }
            }
        }
    }

    @Override
    public void diggDeal(int loginMemberId, int toMemberId,String content, int appTag, MessageType messageType, int relateKeyId) {
        if (loginMemberId != toMemberId){
            this.systemMsgSave(toMemberId,content,appTag,messageType.getCode(),relateKeyId,loginMemberId,messageType.getContent());
        }
    }

    @Override
    public void diggDeal(int loginMemberId, int toMemberId, int appTag, MessageType messageType, int relateKeyId) {
        diggDeal(loginMemberId,toMemberId,null,appTag,messageType,relateKeyId);
    }
}
