package com.lxinet.jeesns.dao.group;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.group.GroupFans;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zchuanzhao on 16/12/26.
 */
public interface IGroupFansDao extends IBaseDao<GroupFans> {

    /**
     * 获取群组粉丝
     * @return
     */
    List<GroupFans> listByPage(@Param("page") Page page, @Param("groupId") Integer groupId);

    GroupFans findByMemberAndGroup(@Param("groupId") Integer groupId,@Param("memberId") Integer memberId);

    int save(@Param("groupId") Integer groupId,@Param("memberId") Integer memberId);

    int delete(@Param("groupId") Integer groupId,@Param("memberId") Integer memberId);


    /**
     * 获取用户关注的群组列表
     * @param page
     * @param memberId
     * @return
     */
    List<Group> listByMember(@Param("page") Page page, @Param("memberId") Integer memberId);
}