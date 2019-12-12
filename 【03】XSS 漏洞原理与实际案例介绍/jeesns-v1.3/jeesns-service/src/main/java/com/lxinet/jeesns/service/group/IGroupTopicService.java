package com.lxinet.jeesns.service.group;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.group.GroupTopic;
import com.lxinet.jeesns.model.member.Member;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by zchuanzhao on 2016/12/26.
 */
public interface IGroupTopicService {
    GroupTopic findById(int id);

    GroupTopic findById(int id,Member loginMember);

    boolean save(Member member, GroupTopic groupTopic);

    boolean update(Member member, GroupTopic groupTopic);

    boolean delete(Member loginMember, int id);

    boolean indexDelete(HttpServletRequest request, Member loginMember, int id);

    ResultModel listByPage(Page page, String key, int groupId, int status, int memberId, int typeId);

    boolean audit(Member member, int id);

    boolean top(Member member, int id, int top);

    boolean essence(Member member, int id, int essence);

    ResultModel favor(Member loginMember, int id);

    List<GroupTopic> listByCustom(int gid, String sort, int num, int day, int thumbnail);
}
