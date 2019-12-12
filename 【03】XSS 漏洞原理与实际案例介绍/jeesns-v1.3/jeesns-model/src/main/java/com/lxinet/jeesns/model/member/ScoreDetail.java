package com.lxinet.jeesns.model.member;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by zchuanzhao on 17/3/24.
 */
public class ScoreDetail implements Serializable {
    private Integer id;
    private Date createTime;
    private Integer type;
    private Integer memberId;
    private Member member;
    private Integer score;
    private Integer balance;
    private String remark;
    private Integer foreignId;
    private Integer scoreRuleId;
    private Integer status;

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getBalance() {
        return balance;
    }

    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getForeignId() {
        return foreignId;
    }

    public void setForeignId(Integer foreignId) {
        this.foreignId = foreignId;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getScoreRuleId() {
        return scoreRuleId;
    }

    public void setScoreRuleId(Integer scoreRuleId) {
        this.scoreRuleId = scoreRuleId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}