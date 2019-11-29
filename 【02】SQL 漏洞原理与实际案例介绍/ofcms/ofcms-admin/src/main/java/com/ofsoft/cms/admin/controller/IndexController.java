package com.ofsoft.cms.admin.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.AdminConst;
import com.ofsoft.cms.core.config.ShiroUtils;
import com.ofsoft.cms.core.utils.CalendarUtil;
import com.ofsoft.cms.core.utils.JsonUtil;
import com.ofsoft.cms.model.SysUser;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;

import java.util.*;

/**
 * 页面配置
 *
 * @author OF
 * @date 2018年1月2日
 */
@Action(path = "/")
public class IndexController extends BaseController {
    /**
     * 默认首页
     */
    @ActionKey(value = "/admin/index")
    public void index() {
        render(AdminConst.indexHtml);
    }

    @ActionKey(value = "/admin/index1")
    public void index1() {
        SystemUtile.initAdminIndex(SystemUtile.INDEX);
        render(AdminConst.indexHtml);
    }

    @ActionKey(value = "/admin/index2")
    public void index2() {
        SystemUtile.initAdminIndex(SystemUtile.INDEX2);
        render(AdminConst.indexHtml);
    }

    // @RequiresPermissions(value = "123")
    @ActionKey(value = "/admin/login")
    public void login() {
        if (!SystemUtile.isInstall()) {
            redirect("/");
            return;
        }
        render(AdminConst.loginHtml);
    }

    public void help() {
        render("help.html");
    }

    public void getList() {
        render("getList.json");
    }

    /**
     * 公共页面跳转请求处理
     * <p>
     * 返回显示页面
     */
    @ActionKey(value = "/admin/f")
    public void f() {
        String uuid = getPara("_fsUuid");
        String mode = getPara("_mode");
        StringBuilder sb = new StringBuilder();
        if (!StringUtils.isBlank(uuid)) {
            sb.append("?").append("_fsUuid = ").append(uuid.trim())
                    .append("&_mode = ").append(mode);
        }
        String p = getPara("p");
        setAttr("result", getParamsMap());
        renderHTML(p);
    }

    /**
     * 实际的登录代码 如果登录成功，跳转至首页；登录失败，则将失败信息反馈对用户
     *
     * @return
     */
    @ActionKey(value = "/admin/dologin")
    public void dologin() {
        String msg = "处理成功";
        String userName = getParaJson("username");
        String password = getParaJson("password");
        String rememberMe = getParaJson("rememberMe");
        password = new Sha256Hash(password).toHex();
        UsernamePasswordToken token = new UsernamePasswordToken(userName,
                password);
        if (rememberMe != null && "on".contains(rememberMe)) {
            token.setRememberMe(true);
        }
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            if (subject.isAuthenticated()) {
                // CookieUtil.setLoginnameCookie(userName, response);
                //设置默认站点
                SystemUtile.setSite(getRequest());
                rendSuccessJson(msg);
                return;
            } else {
                msg = "账户密码不正确!";
                rendFailedJson(msg);
                return;
            }
        } catch (IncorrectCredentialsException e) {
            msg = "登录密码错误.";
            e.printStackTrace();
            rendFailedJson(msg);
        } catch (ExcessiveAttemptsException e) {
            msg = "登录失败次数过多,账户锁定10分钟";
            rendFailedJson(msg);
        } catch (LockedAccountException e) {
            msg = e.getMessage();
            rendFailedJson(msg);
        } catch (DisabledAccountException e) {
            msg = "帐号已被禁用.";
            rendFailedJson(msg);
        } catch (ExpiredCredentialsException e) {
            msg = "帐号已过期.";
            rendFailedJson(msg);
        } catch (UnknownAccountException e) {
            System.out.println(e.getMessage());
            msg = "帐号不存在.";
            rendFailedJson(msg);
        }

    }

    /**
     * 退出
     */
    @ActionKey(value = "/admin/logout")
    public void logout() {
        SysUser user = ShiroUtils.getSysUser();
        if (null != user) {
            logService(user.getUserId().toString(), user.getUserName(), "用户退出");
        }
        SecurityUtils.getSubject().logout();
        ShiroUtils.getSession().removeAttribute(AdminConst.USER_MENU_SESSION);
        render(AdminConst.loginHtml);
    }

    @ActionKey(value = "/admin/setSite")
    public void setSite() {
        SystemUtile.setSite(getPara("site_id"));
        render(AdminConst.indexHtml);
    }

    @ActionKey(value = "/admin/main")
    public void main() {
        Map<String, Object> params = getParamsMap();
        try {
            params.put("site_id", SystemUtile.getSiteId());
            params.put("count_date", CalendarUtil.getNowTime("yyyy-MM-dd"));
            Record record = Db.findFirst(Db.getSqlPara("cms.count.query", params));
            if (record == null) {
                record = new Record();
            }
            // 系统属性
            Properties props = System.getProperties();
            record.set("java_version", props.getProperty("java.version"));
            record.set("host_name", SystemUtile.getHostName());
            record.set("os_name", props.getProperty("os.name"));
            record.set("os_arch", props.getProperty("os.arch"));
            record.set("os_version", props.getProperty("os.version"));
            record.set("local_ip", SystemUtile.getLocalHostIp());
            List<Record> count = Db.find(Db.getSqlPara("cms.count.index_query", params));
            Map access = new HashMap();
            access.put("date", recordToStringArrary(count, "count_date"));
            access.put("data", recordToStringArrary(count, "day_access_count"));
            record.set("access", JsonUtil.objectToJson(access));
            setAttr("data", record);
            render("/admin/main.html");
        } catch (Exception e) {
            e.printStackTrace();
            render("/admin/main.html");
        }
    }

    public List<String> recordToStringArrary(List<Record> list, String key) {
        List<String> s = new ArrayList<String>(list.size());
        for (Record record : list) {
            s.add(record.getStr(key));
        }
        return s;
    }
}
