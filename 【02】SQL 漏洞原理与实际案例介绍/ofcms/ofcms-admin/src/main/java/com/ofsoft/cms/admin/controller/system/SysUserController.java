package com.ofsoft.cms.admin.controller.system;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.jfinal.plugin.ehcache.CacheKit;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.admin.domain.UserOnline;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.AdminConst;
import com.ofsoft.cms.core.config.ErrorCode;
import com.ofsoft.cms.core.uitle.CookieUtil;
import com.ofsoft.cms.model.SysUser;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.session.Session;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 系统用户功能
 *
 * @author OF
 * @date 2018年1月8日
 */
@Action(path = "/system/user", viewPath = "/system/user")
public class SysUserController extends BaseController {

    /**
     * 查询列表方法
     */
    public void getData() {
        Map<String, Object> params = getParamsMap();
        SqlPara sql = Db.getSqlPara("system.user.query", params);
        setPageOrderByParams(sql, getPara("field"), getPara("sort"));
        Page<Record> page = Db.paginate(getPageNum(), getPageSize(), sql);
        rendSuccessJson(page.getList(), page.getTotalRow(),
                page.getPageNumber());
    }

    public void add() {
        Map<String, Object> params = getParamsMap();
        String password = (String) params.get("user_password");
        password = new Sha256Hash(password).toHex();
        String roleId = (String) params.get("role_id");
        params.remove("role_id");
        params.put("user_password", password);
        Record record = new Record();
        record.setColumns(params);
        try {
            Db.save(AdminConst.TABLE_OF_SYS_USER, record);
            if (!StringUtils.isBlank(roleId)) {
                SqlPara sql = Db.getSqlPara("system.user.role_save",
                        record.get("id"), roleId);
                Db.update(sql);
            }

            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    public void del() {
        String userId = getPara("user_id");
        try {
            String[] user = userId.split(",");
            for (int i = 0; i < user.length; i++) {
                Db.update("system.user.delete", user[i]);
            }
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    public void update() {
        Map<String, Object> params = getParamsMap();
        String password = (String) params.get("password");
        if (!StringUtils.isBlank(password)) {
            password = new Sha256Hash(password).toHex();
            params.put("user_password", password);
        }
        params.remove("password");

        String roleId = (String) params.get("role_id");
        if (!StringUtils.isBlank(roleId)) {
            SqlPara sql = Db.getSqlPara("system.user.role_update", params);
            Db.update(sql);
        }
        params.remove("role_id");

        Record record = new Record();
        record.setColumns(params);
        try {
            Db.update(AdminConst.TABLE_OF_SYS_USER, "user_id", record);
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    public void respwd() {
        Map<String, Object> params = getParamsMap();
        String password = (String) params.get("password");
        String newpassword = (String) params.get("newpassword");
        if (!password.equals(newpassword)) {
            rendFailedJson("两次密码不一致!");
            return;
        }
        Record record = new Record();
        if (!StringUtils.isBlank(password)) {
            password = new Sha256Hash(password).toHex();
            record.set("user_password", password);
        }
        record.set("user_id", params.get("user_id"));
        try {
            Db.update(AdminConst.TABLE_OF_SYS_USER, "user_id", record);
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    public void detail() {
        String userId = getPara("user_id");
        try {
            Record record = Db
                    .findFirst(
                            Db.getSql("system.user.detail"),
                            userId);
            rendSuccessJson(record);
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    /**
     * 强制剔除
     */
    public void forceLogout() {
        String sessionId = getPara("id");
        Session session = CacheKit.get(AdminConst.USER_ONLINE_KEY, sessionId);
//		Session s = SessionDao.sessionDAO.readSession(sessionId);
//	       s .setTimeout(0);
        session.removeAttribute(AdminConst.USER_IN_SESSION);
        session.removeAttribute("JSESSIONID");
        CacheKit.remove(AdminConst.USER_ONLINE_KEY, sessionId);
        session.setTimeout(0);
        CookieUtil.setLogoutCookie(getResponse());
//		SessionDao.sessionDAO.delete(session);
        rendSuccessJson();
        setCookie("of", "", 0);
        setCookie("jsessionid", "", 0);
        setCookie("JSESSIONID", "", 0);
    }

    /**
     * 获取在线用户
     */
    public void getOnlineUserList() {
//        setCookie("of", "123123", 120);
        setCookie("jsessionid", "", 0);
        setCookie("JSESSIONID", "", 0);
        getSession().removeAttribute("JSESSIONID");
//        CookieUtil.setLoginnameCookie("ofofo", getResponse());
        List<UserOnline> list = new ArrayList<UserOnline>();
        @SuppressWarnings("unchecked")
        List<String> sessions = CacheKit.getKeys(AdminConst.USER_ONLINE_KEY);
        for (String sessionId : sessions) {
            Session session = CacheKit.get(AdminConst.USER_ONLINE_KEY,
                    sessionId);
            // 获取用户信息
            SysUser sysUser = (SysUser) session
                    .getAttribute(AdminConst.USER_IN_SESSION);
            UserOnline user = new UserOnline();
            user.setUserName(sysUser.getUserName());
            user.setLoginName(sysUser.getLoginName());
            user.setUserId(sysUser.getUserId());
            user.setUserMobile(sysUser.getUserMobile());
            user.setUserEmail(sysUser.getUserEmail());
            user.setStatus(sysUser.getStatus());
            user.setUserSex(sysUser.getUserSex());
            user.setId(sessionId);
            user.setHost(session.getHost());
            user.setStartTimestamp(session.getStartTimestamp());
            user.setLastAccessTime(session.getLastAccessTime());
            user.setTimeout(session.getTimeout());
            list.add(user);
        }
        rendSuccessJson(list);
    }
}
