package com.lxinet.jeesns.service.common;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.common.Ads;

/**
 * Created by zchuanzhao on 2017/9/07.
 */
public interface IAdsService {
    /**
     * 保存广告信息
     * @param ads
     * @return
     */
    boolean save(Ads ads);
    /**
     * 分页查询广告信息
     * @param page
     * @return
     */
    ResultModel listByPage(Page page);

    boolean update(Ads ads);

    boolean delete(Integer id);

    Ads findById(Integer id);

    boolean enable(Integer id);
}
