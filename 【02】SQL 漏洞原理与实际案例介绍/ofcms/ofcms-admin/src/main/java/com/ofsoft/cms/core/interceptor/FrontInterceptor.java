package com.ofsoft.cms.core.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.config.AdminConst;
import com.ofsoft.cms.core.config.ErrorCode;
import com.ofsoft.cms.core.config.FrontConst;
import com.ofsoft.cms.core.uitle.SiteUtile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 前端页面拦截器
 * Created by OF on 2018/5/9.
 */
public class FrontInterceptor implements Interceptor {
    public void intercept(Invocation ai) {
        if (!SystemUtile.isInstall()) {
            ai.getController().redirect(AdminConst.installHtml);
            return;
        }
        Controller controller = ai.getController();
        HttpServletRequest request = controller.getRequest();
        SiteUtile.setLocalRequest(request);
        List<Record> list = SystemUtile.getSitCache();
        Record site = null;
        if (list == null || list.size() <= 0) {
            controller.renderJson(ErrorCode.get("10001"));
        } else {
            site = SiteUtile.getSite(request);
            if (site == null) {
                String server = request.getServerName();
                for (Record record : list) {
                    if (server.equals(record.getStr("domain_name"))) {
                        site = record;
                    }
                }
            }
            if (site == null) {
                SystemUtile.initSite();
                site = SystemUtile.getDefualSitCache();
            }
            controller.setAttr(FrontConst.SITE_SESSION, site);
            controller.setAttr("reroot", JFinal.me().getContextPath() + "/resource/" + site.get("template_path"));
            SiteUtile.setSite(request, site);
            SiteUtile.setSite(site);
            //增加访问记录
            SystemUtile.addAccessLog(request, site);
            ai.invoke();
        }
    }
}
