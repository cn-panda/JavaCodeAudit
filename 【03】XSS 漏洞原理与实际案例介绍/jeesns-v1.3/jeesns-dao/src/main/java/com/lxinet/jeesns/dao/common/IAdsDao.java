package com.lxinet.jeesns.dao.common;

import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.common.Ads;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zchuanzhao on 2017/9/07.
 */
public interface IAdsDao extends IBaseDao<Ads>{

    /**
     * 分页查询广告信息
     * @param page
     * @return
     */
    List<Ads> listByPage(@Param("page") Page page);

    int enable(@Param("id") Integer id);
}
