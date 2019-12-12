package com.lxinet.jeesns.model.picture;

import org.aspectj.weaver.Member;

import java.util.Date;

public class PictureAlbumComment {
    private Integer id;

    private Date createTime;

    private Integer memberId;

    private Member member;

    private Integer pictureAlbumId;

    private PictureAlbum pictureAlbum;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getPictureAlbumId() {
        return pictureAlbumId;
    }

    public void setPictureAlbumId(Integer pictureAlbumId) {
        this.pictureAlbumId = pictureAlbumId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public PictureAlbum getPictureAlbum() {
        return pictureAlbum;
    }

    public void setPictureAlbum(PictureAlbum pictureAlbum) {
        this.pictureAlbum = pictureAlbum;
    }
}