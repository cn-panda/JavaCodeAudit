package com.lxinet.jeesns.dao.group;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.model.group.GroupTopicType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: zchuanzhao
 * @date: 2018/5/8 下午10:59
 */
public interface IGroupTopicTypeDao extends IBaseDao<GroupTopicType> {

    List<GroupTopicType> list(@Param("groupId") Integer groupId);

}