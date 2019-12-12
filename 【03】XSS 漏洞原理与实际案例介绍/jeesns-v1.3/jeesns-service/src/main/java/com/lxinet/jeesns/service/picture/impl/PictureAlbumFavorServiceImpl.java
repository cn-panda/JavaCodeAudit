package com.lxinet.jeesns.service.picture.impl;

import com.lxinet.jeesns.dao.picture.IPictureAlbumFavorDao;
import com.lxinet.jeesns.dao.picture.IPictureFavorDao;
import com.lxinet.jeesns.model.picture.PictureAlbumFavor;
import com.lxinet.jeesns.model.picture.PictureFavor;
import com.lxinet.jeesns.service.picture.IPictureAlbumFavorService;
import com.lxinet.jeesns.service.picture.IPictureFavorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 *
 * @author zchuanzhao
 * @date 2017/11/17
 */
@Service("pictureAlbumFavorService")
public class PictureAlbumFavorServiceImpl implements IPictureAlbumFavorService {
    @Resource
    private IPictureAlbumFavorDao pictureAlbumFavorDao;


    @Override
    public PictureAlbumFavor find(Integer pictureAlbumId, Integer memberId) {
        return pictureAlbumFavorDao.find(pictureAlbumId,memberId);
    }

    @Override
    public void save(Integer pictureAlbumId, Integer memberId) {
        pictureAlbumFavorDao.save(pictureAlbumId,memberId);
    }

    @Override
    public void delete(Integer pictureAlbumId, Integer memberId) {
        pictureAlbumFavorDao.delete(pictureAlbumId,memberId);
    }
}
