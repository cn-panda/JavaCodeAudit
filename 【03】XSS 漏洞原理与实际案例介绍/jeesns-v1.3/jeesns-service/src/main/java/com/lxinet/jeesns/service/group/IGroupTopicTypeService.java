package com.lxinet.jeesns.service.group;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.model.group.GroupTopicType;
import com.lxinet.jeesns.model.member.Member;

import java.util.List;

/**
 * @author: zchuanzhao
 * @date: 2018/5/8 下午11:13
 */
public interface IGroupTopicTypeService {

    GroupTopicType findById(int id);

    List<GroupTopicType> list(int groupId);

    boolean delete(Member member, int id);

    boolean save(Member member, GroupTopicType groupTopicType);

    boolean update(Member member, GroupTopicType groupTopicType);
}
