package com.lxinet.jeesns.service.picture;


import com.lxinet.jeesns.model.picture.PictureAlbumFavor;

/**
 * 图片点赞Service接口
 * Created by zchuanzhao on 2017/11/17.
 */
public interface IPictureAlbumFavorService {

    PictureAlbumFavor find(Integer pictureAlbumId, Integer memberId);

    void save(Integer pictureAlbumId, Integer memberId);

    void delete(Integer pictureAlbumId, Integer memberId);
}