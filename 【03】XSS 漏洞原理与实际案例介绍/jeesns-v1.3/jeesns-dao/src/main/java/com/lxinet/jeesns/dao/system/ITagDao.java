package com.lxinet.jeesns.dao.system;

import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.model.system.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ITagDao extends IBaseDao<Tag> {

    /**
     * 分页查询
     *
     * @param page
     * @return
     */
    List<Tag> listByPage(@Param("page") Page page, @Param("funcType") int funcType);

}
