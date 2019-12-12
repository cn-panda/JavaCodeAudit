package com.lxinet.jeesns.dao.cms;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.cms.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 文章DAO接口
 * Created by zchuanzhao on 2016/11/26.
 */
public interface IArticleDao extends IBaseDao<Article> {

    int save(Article article);

    List<Article> listByPage(@Param("page") Page page, @Param("key") String key, @Param("cateid") Integer cateid, @Param("status") Integer status, @Param("memberId") Integer memberId);

    /**
     * 设置某个栏目的所有文章为未分类文章，一般在删除某个栏目的时候调用
     * @param cateid
     * @return
     */
    int setArticleAsNoneCate(@Param("cateid") int cateid);

    /**
     * 更新阅读数
     * @param articleId
     * @return
     */
    int updateViewCount(@Param("articleId") int articleId);

    /**
     * 审核文章
     * @param id
     * @return
     */
    int audit(@Param("id") int id);

    Article findById(@Param("id") Integer id, @Param("loginMemberId") Integer loginMemberId);

    /**
     * 自定义条件查询
     * @param cid 栏目ID，0不限制
     * @param sort 排序字段
     * @param num 获取数量
     * @param day 天，获取多少天之内的数据，0不限制
     * @param thumbnail 缩略图 0不限制，1必须有缩略图
     * @return
     */
    List<Article> listByCustom(@Param("cid") int cid,@Param("sort") String sort,@Param("num") int num,@Param("day") int day,@Param("thumbnail") int thumbnail);
}