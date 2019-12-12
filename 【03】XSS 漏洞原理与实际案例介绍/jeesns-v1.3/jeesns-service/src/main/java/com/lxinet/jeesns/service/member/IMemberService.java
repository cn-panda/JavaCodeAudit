package com.lxinet.jeesns.service.member;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.member.Member;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zchuanzhao on 16/9/29.
 */
public interface IMemberService {

    /**
     * 会员登录
     * @param member
     * @param request
     * @return
     */
    boolean login(Member member, HttpServletRequest request);

    Member manageLogin(Member member, HttpServletRequest request);

    Member findById(int id);

    /**
     * 注册
     * @param member
     * @param request
     * @return
     */
    ResultModel register(Member member, HttpServletRequest request);

    ResultModel update(Member member);

    ResultModel delete(int id);

    ResultModel<Member> listByPage(Page page, String key);

    /**
     * 管理员列表
     * @param page
     * @param key
     * @return
     */
    ResultModel<Member> managerList(Page page, String key);

    /**
     * 管理员授权
     * @param name
     * @return
     */
    ResultModel managerAdd(Member loginMember, String name);

    /**
     * 管理员取消
     * @param id
     * @return
     */
    ResultModel managerCancel(Member loginMember, int id);

    /**
     * 会员启用、禁用操作
     * @param id
     * @return
     */
    ResultModel isenable(int id);

    /**
     * 后台修改密码
     * @param id
     * @param password
     * @return
     */
    ResultModel changepwd(Member loginMember, int id, String password);


    /**
     * 会员修改密码
     * @param loginMember
     * @param oldPassword
     * @param newPassword
     * @return
     */
    ResultModel changepwd(Member loginMember, String oldPassword, String newPassword);

    /**
     * 修改头像
     * @param member
     * @param oldAvatar 旧头像
     * @param request
     * @return
     */
    ResultModel updateAvatar(Member member, String oldAvatar, HttpServletRequest request);

    /**
     * 修改会员级别信息
     * @param member 登录会员
     * @param name  昵称
     * @param sex  性别
     * @param introduce  个人说明
     * @return
     */
    ResultModel editBaseInfo(Member member, String name, String sex, String introduce);

    /**
     * 修改会员其他信息
     * @param loginMember 登录会员
     * @param birthday
     * @param qq
     * @param wechat
     * @param contactPhone
     * @param contactEmail
     * @param website
     * @return
     */
    ResultModel editOtherInfo(Member loginMember, String birthday, String qq, String wechat, String contactPhone,
                              String contactEmail, String website);


    Member findByName(String name);

    ResultModel sendEmailActiveValidCode(Member loginMember, HttpServletRequest request);

    /**
     * 会员账号激活
     * @param loginMember
     * @param randomCode
     * @return
     */
    ResultModel active(Member loginMember, String randomCode, HttpServletRequest request);

    Member findByNameAndEmail(String name, String email);

    ResultModel forgetpwd(String name, String email, HttpServletRequest request);

    ResultModel resetpwd(String email, String token, String password, HttpServletRequest request);

    /**
     * 关注、取消关注
     * @param loginMember
     * @param followWhoId
     * @return
     */
    ResultModel follows(Member loginMember, Integer followWhoId);

    /**
     * 是否已关注
     * @param loginMember
     * @param followWhoId
     * @return
     */
    ResultModel isFollowed(Member loginMember, Integer followWhoId);

    /**
     * 获取私信中的联系人列表
     * @param page
     * @param memberId
     * @return
     */
    List<Member> listContactMemberIds(Page page, Integer memberId);

    /**
     * 获取私信中的联系人列表
     * @param page
     * @param memberId
     * @return
     */
    ResultModel<Member> listContactMembers(Page page, Integer memberId);

    /**
     * 更新会员积分
     * @param score
     * @param memberId
     * @return
     */
    boolean updateScore(Integer score, Integer memberId);

    String atFormat(String content);

}
