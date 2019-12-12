package com.lxinet.jeesns.dao.group;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.group.GroupTopic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zchuanzhao on 16/12/26.
 */
public interface IGroupTopicDao extends IBaseDao<GroupTopic> {

    @Override
    int save(GroupTopic groupTopic);

    List<GroupTopic> listByPage(@Param("page") Page page, @Param("key") String key, @Param("groupId") Integer groupId, @Param("status") Integer status, @Param("memberId") Integer memberId, @Param("typeId") Integer typeId);

    int audit(@Param("id") Integer id);

    GroupTopic findById(@Param("id") Integer id,@Param("loginMemberId") Integer loginMemberId);

    /**
     * 置顶
     * @param top 0取消置顶，1置顶，2超级置顶
     * @return
     */
    int top(@Param("id") Integer id,@Param("top") Integer top);

    /**
     * 加精
     * @param essence 0取消加精，1加精
     * @return
     */
    int essence(@Param("id") Integer id,@Param("essence") Integer essence);

    /**
     * 修改分类
     * @param typeId
     * @return
     */
    int updateType(@Param("id") Integer id,@Param("typeId") Integer typeId);

    /**
     * 自定义条件查询
     * @param gid 群组ID，0不限制
     * @param sort 排序字段
     * @param num 获取数量
     * @param day 天，获取多少天之内的数据，0不限制
     * @param thumbnail 缩略图 0不限制，1必须有缩略图
     * @return
     */
    List<GroupTopic> listByCustom(@Param("gid") int gid,@Param("sort") String sort,@Param("num") int num,@Param("day") int day,@Param("thumbnail") int thumbnail);

}