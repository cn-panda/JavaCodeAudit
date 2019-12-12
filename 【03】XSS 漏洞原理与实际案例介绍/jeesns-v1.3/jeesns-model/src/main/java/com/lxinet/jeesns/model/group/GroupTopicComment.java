package com.lxinet.jeesns.model.group;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lxinet.jeesns.model.member.Member;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by zchuanzhao on 16/12/27.
 */
public class GroupTopicComment implements Serializable {
    private Integer id;

    private Date createTime;

    private Integer groupTopicId;

    private GroupTopic groupTopic;

    private Integer memberId;

    private Member member;

    private String content;

    private Integer commentId;

    private GroupTopicComment groupTopicComment;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getGroupTopicId() {
        return groupTopicId;
    }

    public void setGroupTopicId(Integer groupTopicId) {
        this.groupTopicId = groupTopicId;
    }

    public GroupTopic getGroupTopic() {
        return groupTopic;
    }

    public void setGroupTopic(GroupTopic groupTopic) {
        this.groupTopic = groupTopic;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public GroupTopicComment getGroupTopicComment() {
        return groupTopicComment;
    }

    public void setGroupTopicComment(GroupTopicComment groupTopicComment) {
        this.groupTopicComment = groupTopicComment;
    }
}