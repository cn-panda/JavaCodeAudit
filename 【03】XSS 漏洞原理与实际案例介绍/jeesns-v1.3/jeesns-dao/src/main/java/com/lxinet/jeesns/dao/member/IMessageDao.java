package com.lxinet.jeesns.dao.member;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.member.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 会员私信DAO
 * Created by zchuanzhao on 17/3/9.
 */
public interface IMessageDao extends IBaseDao<Message> {
    List<Message> listByPage(@Param("page") Page page, @Param("fromMemberId") Integer fromMemberId, @Param("toMemberId") Integer toMemberId);

    /**
     * 获取聊提记录
     * @param page
     * @param fromMemberId
     * @param toMemberId
     * @return
     */
    List<Message> messageRecords(@Param("page") Page page, @Param("fromMemberId") Integer fromMemberId, @Param("toMemberId") Integer toMemberId);

    /**
     * 系统信息
     * @param page
     * @param toMemberId
     * @return
     */
    List<Message> systemMessage(@Param("page") Page page, @Param("toMemberId") Integer toMemberId,@Param("basePath") String basePath);

    /**
     * 删除某个会员的所有聊天记录
     * @param memberId
     * @return
     */
    int deleteByMember(@Param("memberId") Integer memberId);

    /**
     * 清空两个会员的聊天记录
     * @param fromMemberId
     * @param toMemberId
     * @return
     */
    int clearMessageByMember(@Param("fromMemberId") Integer fromMemberId, @Param("toMemberId") Integer toMemberId);

    /**
     * 查询会员未读私信数量
     * @param memberId
     * @return
     */
    int countUnreadNum(@Param("memberId") Integer memberId);

    /**
     * 查询系统未读信息数量
     * @param memberId
     * @return
     */
    int countSystemUnreadNum(@Param("memberId") Integer memberId);

    /**
     * 设置已读状态
     * @param fromMemberId
     * @param toMemberId
     * @return
     */
    int setRead(@Param("fromMemberId") Integer fromMemberId, @Param("toMemberId") Integer toMemberId);

    /**
     * 会员发送信息
     * @param message
     * @return
     */
    int sentMsg(Message message);

    /**
     * 系统信息发送
     * @param message
     * @return
     */
    int systemMsgSave(Message message);
}