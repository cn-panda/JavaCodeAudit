package com.lxinet.jeesns.model.member;

import java.io.Serializable;
import java.util.Date;

/**
 * 会员私信
 * Created by zchuanzhao on 17/3/9.
 */
public class Message implements Serializable {
    private Integer id;
    private Date createTime;
    private Integer fromMemberId;
    private Member fromMember;
    private Integer toMemberId;
    private Member toMember;
    private String content;
    private String url;
    private Integer isread;
    private Integer appTag;
    private Integer type;
    private Integer relateKeyId;
    private String description;
    private Integer memberId;
    private Member member;

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

    public Integer getFromMemberId() {
        return fromMemberId;
    }

    public void setFromMemberId(Integer fromMemberId) {
        this.fromMemberId = fromMemberId;
    }

    public Member getFromMember() {
        return fromMember;
    }

    public void setFromMember(Member fromMember) {
        this.fromMember = fromMember;
    }

    public Integer getToMemberId() {
        return toMemberId;
    }

    public void setToMemberId(Integer toMemberId) {
        this.toMemberId = toMemberId;
    }

    public Member getToMember() {
        return toMember;
    }

    public void setToMember(Member toMember) {
        this.toMember = toMember;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getIsread() {
        return isread;
    }

    public void setIsread(Integer isread) {
        this.isread = isread;
    }

    public Integer getAppTag() {
        return appTag;
    }

    public void setAppTag(Integer appTag) {
        this.appTag = appTag;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getRelateKeyId() {
        return relateKeyId;
    }

    public void setRelateKeyId(Integer relateKeyId) {
        this.relateKeyId = relateKeyId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}