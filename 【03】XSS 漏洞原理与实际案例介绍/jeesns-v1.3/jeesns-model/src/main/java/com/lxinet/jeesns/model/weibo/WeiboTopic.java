package com.lxinet.jeesns.model.weibo;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by zchuanzhao on 2018/11/14.
 */
public class WeiboTopic implements Serializable {
    private Integer id;
    private Date createTime;
    private String name;
    private Integer count;

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

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
