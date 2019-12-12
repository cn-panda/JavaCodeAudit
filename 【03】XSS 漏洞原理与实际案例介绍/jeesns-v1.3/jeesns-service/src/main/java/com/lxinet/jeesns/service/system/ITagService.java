package com.lxinet.jeesns.service.system;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.system.Tag;

public interface ITagService {
    boolean save(Tag tag);

    ResultModel listByPage(Page page, int funcType);

    boolean update(Tag tag);

    boolean delete(Integer id);

    Tag findById(Integer id);

}
