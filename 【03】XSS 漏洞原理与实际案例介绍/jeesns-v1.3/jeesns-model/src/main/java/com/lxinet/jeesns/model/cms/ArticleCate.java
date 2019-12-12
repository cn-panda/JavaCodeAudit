package com.lxinet.jeesns.model.cms;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.Digits;
import java.io.Serializable;
import java.util.Date;

/**
 * 文章栏目实体类
 * Created by zchuanzhao on 2016/11/26.
 */
public class ArticleCate implements Serializable {

    private Integer id;
    private Date createTime;
    @Digits(integer = 11,fraction = 0,message = "上级栏目不能为空")
    private Integer fid;
    @NotBlank(message = "栏目名称不能为空")
    private String name;
    private Integer status;
    private Integer sort;

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

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}