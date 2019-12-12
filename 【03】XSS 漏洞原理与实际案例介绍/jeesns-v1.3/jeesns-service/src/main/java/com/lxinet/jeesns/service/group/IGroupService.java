package com.lxinet.jeesns.service.group;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.model.group.Group;
import com.lxinet.jeesns.model.member.Member;

import java.util.List;


/**
 * Created by zchuanzhao on 16/12/23.
 */
public interface IGroupService {

    Group findById(int id);

    boolean save(Member loginMember, Group group);

    boolean update(Member loginMember, Group group);

    boolean delete(Member loginMember, int id);

    List<Group> list(int status, String key);

    boolean follow(Member loginMember, Integer groupId, int type);

    boolean changeStatus(int id);

    List<Group> listByCustom(int status, int num, String sort);
}
