package com.lxinet.jeesns.service.common.impl;

import com.lxinet.jeesns.common.utils.ValidUtill;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.enums.Messages;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.dao.common.ILinkDao;
import com.lxinet.jeesns.model.common.Link;
import com.lxinet.jeesns.service.common.ILinkService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zchuanzhao on 2017-10-13.
 */
@Service("linkService")
public class LinkServiceImpl implements ILinkService {
    @Resource
    private ILinkDao linkDao;

    @Override
    public boolean save(Link link) {
        return linkDao.save(link) == 1;
    }

    @Override
    public ResultModel listByPage(Page page) {
        List<Link> list = linkDao.listByPage(page);
        ResultModel model = new ResultModel(0, page);
        model.setData(list);
        return model;
    }

    @Override
    public ResultModel allList() {
        List<Link> list = linkDao.allList();
        ResultModel model = new ResultModel(0);
        model.setData(list);
        return model;
    }

    @Override
    public ResultModel recommentList() {
        List<Link> list = linkDao.recommentList();
        ResultModel model = new ResultModel(0);
        model.setData(list);
        return model;
    }

    @Override
    public boolean update(Link link) {
        Link findLink = this.findById(link.getId());
        ValidUtill.checkIsNull(findLink, Messages.FRIIEND_LINK_NOT_EXISTS);
        return linkDao.update(link) == 1;
    }

    @Override
    public boolean delete(Integer id) {
        return linkDao.delete(id) == 1;
    }

    @Override
    public Link findById(Integer id) {
        return linkDao.findById(id);
    }

    @Override
    public boolean enable(Integer id) {
       return linkDao.enable(id) == 1;
    }
}
