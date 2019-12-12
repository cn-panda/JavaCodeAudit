package com.lxinet.jeesns.dao.picture;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.model.picture.PictureAlbumFavor;
import org.apache.ibatis.annotations.Param;

public interface IPictureAlbumFavorDao extends IBaseDao<PictureAlbumFavor> {
    PictureAlbumFavor find(@Param("pictureAlbumId") Integer pictureAlbumId, @Param("memberId") Integer memberId);

    Integer save(@Param("pictureAlbumId") Integer pictureAlbumId, @Param("memberId") Integer memberId);

    Integer delete(@Param("pictureAlbumId") Integer pictureAlbumId, @Param("memberId") Integer memberId);
}