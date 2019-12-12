package com.lxinet.jeesns.model.common;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by zchuanzhao on 2017/2/9.
 */
public class ArchiveFavor implements Serializable {
    private Integer id;
    private Date createTime;
    private Integer memberId;
    private Integer archiveId;

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

    public Integer getArchiveId() {
        return archiveId;
    }

    public void setArchiveId(Integer archiveId) {
        this.archiveId = archiveId;
    }
}
