package com.lxinet.jeesns.model.group;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: zchuanzhao
 * @date: 2018/5/8 下午10:59
 */
public class GroupTopicType implements Serializable {
    private Integer id;
    private Date createTime;
    private Integer groupId;
    private String name;
    private Integer juri;

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

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getJuri() {
        return juri;
    }

    public void setJuri(Integer juri) {
        this.juri = juri;
    }
}
