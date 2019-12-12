package com.lxinet.jeesns.dao.cms;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.cms.ArticleComment;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * 文章评论DAO接口
 * Created by zchuanzhao on 2016/11/26.
 */
public interface IArticleCommentDao extends IBaseDao<ArticleComment> {

    List<ArticleComment> listByPage(@Param("page") Page page, @Param("articleId") Integer articleId, @Param("key") String key);

    int deleteByArticle(@Param("articleId") Integer articleId);
}