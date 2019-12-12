package com.lxinet.jeesns.service.picture.impl;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.Const;
import com.lxinet.jeesns.core.utils.StringUtils;
import com.lxinet.jeesns.dao.picture.IPictureAlbumDao;
import com.lxinet.jeesns.model.picture.PictureAlbum;
import com.lxinet.jeesns.service.picture.IPictureAlbumService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zchuanzhao on 2017/3/7.
 */
@Service
public class PictureAlbumServiceImpl implements IPictureAlbumService {
    @Resource
    private IPictureAlbumDao pictureAlbumDao;

    @Override
    public ResultModel listByMember(Integer memberId) {
        List<PictureAlbum> list = pictureAlbumDao.listByMember(memberId);
        ResultModel model = new ResultModel(0);
        model.setData(list);
        return model;
    }

    @Override
    public ResultModel<PictureAlbum> listByPage(Page page) {
        List<PictureAlbum> list = pictureAlbumDao.listByPage(page);
        ResultModel model = new ResultModel(0, page);
        model.setData(list);
        return model;
    }

    @Override
    public boolean delete(Integer id) {
        return pictureAlbumDao.delete(id) == 1;
    }

    @Override
    public boolean save(PictureAlbum pictureAlbum) {
        if (pictureAlbum.getType() == null){
            pictureAlbum.setType(0);
        }
        if (StringUtils.isEmpty(pictureAlbum.getCover())){
            pictureAlbum.setCover(Const.DEFAULT_PICTURE_COVER);
        }
        return pictureAlbumDao.save(pictureAlbum) == 1;
    }

    @Override
    public boolean update(PictureAlbum pictureAlbum) {
        return pictureAlbumDao.update(pictureAlbum) == 1;
    }

    @Override
    public PictureAlbum findWeiboAlbum(Integer memberId) {
        return pictureAlbumDao.findWeiboAlbum(memberId);
    }

    @Override
    public PictureAlbum findById(Integer id) {
        return pictureAlbumDao.findById(id);
    }
}
