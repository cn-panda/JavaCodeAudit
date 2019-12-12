package com.lxinet.jeesns.service.cms;


import com.lxinet.jeesns.model.cms.ArticleCate;

import java.util.List;


/**
 * Created by zchuanzhao on 16/9/29.
 */
public interface IArticleCateService {

    ArticleCate findById(int id);

    boolean save(ArticleCate articleCate);

    boolean update(ArticleCate articleCate);

    boolean delete(int id);

    /**
     * 获取栏目
     * @return
     */
    List<ArticleCate> list();

    /**
     * 通过父类ID获取子类列表
     * @param fid
     * @return
     */
    List<ArticleCate> findListByFid(int fid);
}
