package com.lxinet.jeesns.service.cms;

import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.cms.ArticleComment;
import com.lxinet.jeesns.model.member.Member;

import java.util.List;


/**
 * Created by zchuanzhao on 2016/10/14.
 */
public interface IArticleCommentService {

    ArticleComment findById(int id);

    boolean save(Member loginMember, String content, Integer articleId);

    boolean delete(Member loginMember, int id);

    List<ArticleComment> listByPage(Page page, int articleId, String key);

    void deleteByArticle(Integer articleId);
}
