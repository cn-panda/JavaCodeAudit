package com.lxinet.jeesns.dao.picture;

import com.lxinet.jeesns.model.picture.PictureTag;

public interface IPictureTagDao {
    int deleteByPrimaryKey(Integer id);

    int insert(PictureTag record);

    int insertSelective(PictureTag record);

    PictureTag selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PictureTag record);

    int updateByPrimaryKey(PictureTag record);
}