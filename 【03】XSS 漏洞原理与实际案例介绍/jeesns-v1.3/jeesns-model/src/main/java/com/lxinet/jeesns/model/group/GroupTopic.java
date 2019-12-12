package com.lxinet.jeesns.model.group;


import com.lxinet.jeesns.model.common.Archive;
import org.hibernate.validator.internal.xml.GroupsType;

import java.util.Date;

/**
 * Created by zchuanzhao on 16/12/26.
 */
public class GroupTopic extends Archive {
    private Integer id;
    private Date collectTime;
    private Integer groupId;
    private Group group;
    private Integer typeId;
    private GroupTopicType groupTopicType;
    private Integer status;
    private Integer isTop;
    private Integer isEssence;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsTop() {
        return isTop;
    }

    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
    }

    public Integer getIsEssence() {
        return isEssence;
    }

    public void setIsEssence(Integer isEssence) {
        this.isEssence = isEssence;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public GroupTopicType getGroupTopicType() {
        return groupTopicType;
    }

    public void setGroupTopicType(GroupTopicType groupTopicType) {
        this.groupTopicType = groupTopicType;
    }
}