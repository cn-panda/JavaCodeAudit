package com.lxinet.jeesns.service.weibo;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.model.weibo.Weibo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zchuanzhao on 2016/11/25.
 */
public interface IWeiboService {

    Weibo findById(int id, int memberId);

    boolean save(HttpServletRequest request, Member loginMember, String content, String pictures);

    ResultModel<Weibo> listByPage(Page page, int memberId, int loginMemberId, String key);

    boolean delete(HttpServletRequest request, Member loginMember, int id);

    boolean userDelete(HttpServletRequest request, Member loginMember, int id);

    List<Weibo> hotList(int loginMemberId);

    ResultModel favor(Member loginMember, int weiboId);

    List<Weibo> listByCustom(int loginMemberId, String sort,int num,int day);

    ResultModel<Weibo> listByTopic(Page page, int loginMemberId, String topicName);
}
