package com.ofsoft.cms.front.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.kit.StrKit;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.AdminConst;
import com.ofsoft.cms.core.uitle.InstallUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.List;

/**
 * 初始化安装
 *
 * @author OF
 * @date 2018年8月29日
 */
@Action(path = "/install")
public class InstallController extends BaseController {
    @ActionKey(value = "/install/index")
    public void step1() {
        if(SystemUtile.isInstall()) {
            redirect("/");
            return;
        }
        render("/admin/install/step1.html");
    }

    @ActionKey(value = "/install/step2")
    public void step2() {
        if(SystemUtile.isInstall()) {
            redirect("/");
            return;
        }
        String dbHost = getPara("db_host");
        String dbHostPort = getPara("db_host_port");
        String dbName = getPara("db_name");
        String dbUser = getPara("db_user");
        String dbPassword = getPara("db_password");
        if (!StrKit.notBlank(dbHost,dbHostPort, dbName, dbUser,dbPassword)) {
            render("/admin/install/step2.html");
            return;
        }
        InstallUtils.init(dbHost,dbHostPort, dbName, dbUser,dbPassword);
        try {
            List<String> tableList= InstallUtils.getTableList();
            if (null != tableList && tableList.size() > 0) {
                if (tableList.contains( AdminConst.TABLE_OF_SYS_USER)) {
                    setAttr("ret_msg","数据表已经存在");
                    render("/admin/install/step2.html");
                    return;
                }
            }
            //创建数据库表 初始化sql
            InstallUtils.createDatabaseTables();
        } catch (SQLException e) {
            setAttr("db_name",dbName);
            setAttr("db_user",dbUser);
            setAttr("db_password",dbPassword);
            setAttr("ret_msg",e.getMessage());
            render("/admin/install/step2.html");
            e.printStackTrace();
            return;
        }
        redirect("/install/step3.html");
    }

    @ActionKey(value = "/install/step3")
    public void step3() {
        if(SystemUtile.isInstall()) {
            redirect("/");
            return;
        }
        String webName = getPara("web_name");
        String userName = getPara("username");
        String password = getPara("password");
         if (StrKit.isBlank(webName) || StrKit.isBlank(userName) || StrKit.isBlank(password)) {
            keepPara();
             render("/admin/install/step3.html");
            return;
        }
        try {
            HttpServletRequest request = getRequest();
            String url= request.getServerName()+":"+request.getServerPort()+request.getContextPath();
            String domain = request.getServerName();
            password = new Sha256Hash(password).toHex();
            InstallUtils.setWebFirstUser(userName, password);
            InstallUtils.setSiteInfo(webName, domain,url);
        } catch (SQLException e) {
            setAttr("ret_msg",e.getMessage());
            render("/admin/install/step3.html");
            return;
        }
        //数据用户账号
        if(!SystemUtile.isInstall()) {
            InstallUtils.createDbProperties();
        }
        redirect("/install/finished.html");
    }
    @ActionKey(value = "/install/finished")
    public void finished() {
        if(SystemUtile.isInstall()) {
            redirect("/");
        }
        render("/admin/install/finished.html");
    }
}
