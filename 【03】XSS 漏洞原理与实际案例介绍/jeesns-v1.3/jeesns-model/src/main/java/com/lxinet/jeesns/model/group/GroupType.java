package com.lxinet.jeesns.model.group;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: zchuanzhao
 * @date: 2018/5/15 下午10:59
 */
public class GroupType implements Serializable {
    private Integer id;
    private Date createTime;
    private String name;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
