package com.lxinet.jeesns.service.member.impl;

import com.lxinet.jeesns.common.utils.ScoreRuleConsts;
import com.lxinet.jeesns.core.exception.OpeErrorException;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.dao.member.ICheckinDao;
import com.lxinet.jeesns.model.member.Checkin;
import com.lxinet.jeesns.service.member.ICheckinService;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IScoreDetailService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 签到
 * Created by zchuanzhao on 18/8/20.
 */
@Service
public class CheckinServiceImpl implements ICheckinService {
    @Resource
    private ICheckinDao checkinDao;
    @Resource
    private IScoreDetailService scoreDetailService;

    @Override
    public List<Checkin> list(Page page, Integer memberId) {
        List<Checkin> list = checkinDao.listByPage(page,memberId);
        return list;
    }

    @Override
    public List<Checkin> todayList(Page page) {
        List<Checkin> list = checkinDao.todayList(page);
        return list;
    }

    @Override
    public List<Checkin> todayContinueList() {
        return checkinDao.todayContinueList();
    }

    @Override
    public Checkin todayCheckin(Integer memberId) {
        return checkinDao.todayCheckin(memberId);
    }

    @Override
    public Checkin yesterdayCheckin(Integer memberId) {
        return checkinDao.yesterdayCheckin(memberId);
    }

    @Override
    @Transactional
    public boolean save(Integer memberId) {
        synchronized (this){
            if (null != todayCheckin(memberId)){
                throw new OpeErrorException("今天已经签到过了");
            }
            Checkin checkin = new Checkin();
            checkin.setMemberId(memberId);
            Checkin yesterdayCheckin = yesterdayCheckin(memberId);
            if (null != yesterdayCheckin){
                checkin.setContinueDay(yesterdayCheckin.getContinueDay() + 1);
            }else {
                checkin.setContinueDay(1);
            }
            boolean result = checkinDao.save(checkin) == 1;
            if (result){
                scoreDetailService.scoreBonus(memberId, ScoreRuleConsts.CHECKIN, checkin.getId());
            }
            return result;
        }

    }
}
