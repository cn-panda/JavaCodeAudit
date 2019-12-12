package com.lxinet.jeesns.service.member;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.member.MemberFans;


/**
 * Created by zchuanzhao on 17/2/21.
 */
public interface IMemberFansService {

    boolean save(Integer whoFollowId, Integer followWhoId);

    boolean delete(Integer whoFollowId, Integer followWhoId);

    ResultModel followsList(Page page, Integer whoFollowId);

    ResultModel fansList(Page page, Integer followWhoId);

    MemberFans find(Integer whoFollowId, Integer followWhoId);
}
