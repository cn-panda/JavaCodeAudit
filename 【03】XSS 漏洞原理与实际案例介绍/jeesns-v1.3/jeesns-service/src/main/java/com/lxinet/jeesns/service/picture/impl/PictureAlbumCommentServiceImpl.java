package com.lxinet.jeesns.service.picture.impl;

import com.lxinet.jeesns.common.utils.ValidUtill;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.enums.Messages;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.dao.picture.IPictureAlbumCommentDao;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.model.picture.PictureAlbum;
import com.lxinet.jeesns.model.picture.PictureAlbumComment;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.picture.IPictureAlbumCommentService;
import com.lxinet.jeesns.service.picture.IPictureAlbumService;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 *
 * @author zchuanzhao
 * @date 2017/11/17
 */
@Service("pictureAlbumCommentService")
public class PictureAlbumCommentServiceImpl implements IPictureAlbumCommentService {
    @Resource
    private IPictureAlbumCommentDao pictureAlbumCommentDao;
    @Resource
    private IPictureAlbumService pictureAlbumService;
    @Resource
    private IMemberService memberService;

    @Override
    public PictureAlbumComment findById(int id) {
        PictureAlbumComment pictureAlbumComment = pictureAlbumCommentDao.findById(id);
        atFormat(pictureAlbumComment);
        return pictureAlbumComment;
    }

    @Override
    public boolean save(Member loginMember, String content, Integer pictureAlbumId) {
        PictureAlbum pictureAlbum = pictureAlbumService.findById(pictureAlbumId);
        ValidUtill.checkIsNull(pictureAlbum, Messages.PICTURE_ALBUM_NOT_EXISTS);
        PictureAlbumComment pictureAlbumComment = new PictureAlbumComment();
        pictureAlbumComment.setMemberId(loginMember.getId());
        pictureAlbumComment.setPictureAlbumId(pictureAlbumId);
        pictureAlbumComment.setContent(content);
        int result = pictureAlbumCommentDao.save(pictureAlbumComment);
        return result == 1;
    }

    @Override
    public ResultModel listByPictureAlbum(Page page, int pictureAlbumId) {
        List<PictureAlbumComment> list = pictureAlbumCommentDao.listByPictureAlbum(page, pictureAlbumId);
        atFormat(list);
        ResultModel model = new ResultModel(0,page);
        model.setData(list);
        return model;
    }

    @Override
    public void deleteByPictureAlbum(Integer pictureAlbumId) {
        pictureAlbumCommentDao.deleteByPictureAlbum(pictureAlbumId);
    }

    @Override
    public boolean delete(Member loginMember, int id) {
        PictureAlbumComment pictureAlbumComment = this.findById(id);
        ValidUtill.checkIsNull(pictureAlbumComment, Messages.COMMENT_NOT_EXISTS);
        int result = pictureAlbumCommentDao.delete(id);
        return result == 1;
    }

    public PictureAlbumComment atFormat(PictureAlbumComment pictureAlbumComment){
        pictureAlbumComment.setContent(memberService.atFormat(pictureAlbumComment.getContent()));
        return pictureAlbumComment;
    }

    public List<PictureAlbumComment> atFormat(List<PictureAlbumComment> pictureAlbumCommentList){
        for (PictureAlbumComment pictureAlbumComment : pictureAlbumCommentList){
            atFormat(pictureAlbumComment);
        }
        return pictureAlbumCommentList;
    }
}
