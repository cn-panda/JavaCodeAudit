package com.lxinet.jeesns.service.member;


import com.lxinet.jeesns.model.member.MemberToken;

/**
 * Created by zchuanzhao on 2017/7/15.
 */
public interface IMemberTokenService {

    MemberToken getByToken(String token);

    void save(Integer memberId,String token);

}