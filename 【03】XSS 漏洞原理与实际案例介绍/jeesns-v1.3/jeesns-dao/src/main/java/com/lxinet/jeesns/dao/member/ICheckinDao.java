package com.lxinet.jeesns.dao.member;

import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.dao.common.IBaseDao;
import com.lxinet.jeesns.model.member.Checkin;
import com.lxinet.jeesns.model.member.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 会员签到DAO
 * Created by zchuanzhao on 18/8/20.
 */
public interface ICheckinDao extends IBaseDao<Checkin> {
    List<Checkin> listByPage(@Param("page") Page page, @Param("memberId") Integer memberId);

    List<Checkin> todayList(@Param("page") Page page);

    List<Checkin> todayContinueList();

    Checkin todayCheckin(@Param("memberId") Integer memberId);

    Checkin yesterdayCheckin(@Param("memberId") Integer memberId);

}