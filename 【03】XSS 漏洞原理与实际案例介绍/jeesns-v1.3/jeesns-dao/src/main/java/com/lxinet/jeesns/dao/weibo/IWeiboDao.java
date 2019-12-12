package com.lxinet.jeesns.dao.weibo;

import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.weibo.Weibo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by zchuanzhao on 2016/11/25.
 */
public interface IWeiboDao extends IBaseDao<Weibo> {

    /**
     * 列表
     * @param memberId 查询该会员微博列表
     * @param loginMemberId 当前登录的会员ID，用来判断是否已点赞
     * @return
     */
    List<Weibo> listByPage(@Param("page") Page page, @Param("memberId") int memberId, @Param("loginMemberId") int loginMemberId, @Param("key") String key);

    int save(Weibo weibo);

    int delete(int id);

    List<Weibo> hotList(@Param("loginMemberId") int loginMemberId);

    int favor(@Param("id") Integer id,@Param("num") Integer num);

    /**
     * 查询微博明细
     * @param id
     * @param loginMemberId 当前登录的会员ID，用来判断是否已点赞
     * @return
     */
    Weibo findById(@Param("id") Integer id,@Param("loginMemberId") Integer loginMemberId);

    /**
     * 自定义条件查询
     * @param loginMemberId 当前登录的会员ID，用来判断是否已点赞
     * @param sort 排序字段
     * @param num 获取数量
     * @param day 天，获取多少天之内的数据，0不限制
     * @return
     */
    List<Weibo> listByCustom(@Param("loginMemberId") Integer loginMemberId,@Param("sort") String sort,@Param("num") int num,@Param("day") int day);

    List<Weibo> listByTopic(@Param("page") Page page, @Param("loginMemberId") int loginMemberId, @Param("topicId") Integer topicId);

}
