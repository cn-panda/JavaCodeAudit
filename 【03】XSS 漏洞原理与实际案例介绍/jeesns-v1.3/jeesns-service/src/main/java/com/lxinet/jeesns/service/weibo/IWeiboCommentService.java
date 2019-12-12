package com.lxinet.jeesns.service.weibo;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.model.weibo.WeiboComment;


/**
 * Created by zchuanzhao on 2016/10/14.
 */
public interface IWeiboCommentService {

    WeiboComment findById(int id);

    boolean save(Member loginMember, String content, Integer weiboId, Integer weiboCommentId);

    boolean delete(Member loginMember, int id);

    ResultModel listByWeibo(Page page, int weiboId);

    void deleteByWeibo(Integer weiboId);
}
