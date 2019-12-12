package com.lxinet.jeesns.service.system.impl;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.exception.OpeErrorException;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.dao.system.ITagDao;
import com.lxinet.jeesns.model.system.Tag;
import com.lxinet.jeesns.service.system.ITagService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zchuanzhao on 2017-11-01.
 */
@Service("tagService")
public class TagServiceImpl implements ITagService {
    @Resource
    private ITagDao tagDao;

    @Override
    public boolean save(Tag tag) {
        return tagDao.save(tag) == 1;
    }

    @Override
    public ResultModel listByPage(Page page, int funcType) {
        List<Tag> list = tagDao.listByPage(page,funcType);
        ResultModel model = new ResultModel(0, page);
        model.setData(list);
        return model;
    }

    @Override
    public boolean update(Tag tag) {
        Tag findTag = this.findById(tag.getId());
        if (findTag == null) {
            throw new OpeErrorException("标签不存在");
        }
        return tagDao.update(tag) == 1;
    }

    @Override
    public boolean delete(Integer id) {
        return tagDao.delete(id) > 0;
    }

    @Override
    public Tag findById(Integer id) {
        return tagDao.findById(id);
    }
}
