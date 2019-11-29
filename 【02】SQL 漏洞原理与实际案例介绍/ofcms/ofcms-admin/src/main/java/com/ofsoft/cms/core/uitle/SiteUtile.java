package com.ofsoft.cms.core.uitle;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.core.config.FrontConst;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 站点工具类
 * Created by OF on 2018/5/10.
 */
public class SiteUtile {
    /**
     * 当前站点线程变量
     */
    private static ThreadLocal<Record> localSite = new ThreadLocal<Record>();
    /**
     * 用于保存访问的请求对象
     */
    private static ThreadLocal<HttpServletRequest> tlLocalRequest = new ThreadLocal<HttpServletRequest>();

    /**
     * 获取当前请求对象
     */
    public static HttpServletRequest getLocalRequest() {
        return tlLocalRequest.get();
    }

    /**
     * 保存当前请求对象
     */
    public static void setLocalRequest(HttpServletRequest request) {
        tlLocalRequest.set(request);
    }

    public static Record getSite(HttpServletRequest request) {
        Record record = (Record) request.getSession().getAttribute(FrontConst.SITE_SESSION);
        return record;
    }

    public static Record getSite() {
        return localSite.get();
    }

    /**
     * 设置当前站点
     *
     * @param site
     */
    public static void setSite(Record site) {
        localSite.set(site);
    }

    public static void setSite(HttpServletRequest request, Record site) {
        request.getSession().setAttribute(FrontConst.SITE_SESSION, site);
    }

    public static String getTemplatePath() {
        return getSite().getStr("template_path");
    }

    public static String getDomainName() {
        return getSite().getStr("domain_name");
    }

    public static String getSiteId() {
        return getSite().getStr("site_id");
    }

    /**
     * 获取当前栏目对像
     *
     * @param column
     * @return
     */
    public static Record getColumn(Map column) {

        return Db.findFirst(Db.getSqlPara("cms.column.front_column",column));
    }

    public static String getTemplatePath(String templatePath, String defulatPath) {
        if (templatePath == null || "".equals(templatePath)) {
            templatePath = defulatPath;
        } else {
            if (!templatePath.startsWith("/")) {
                templatePath = "/" + templatePath;
            }
            if (!templatePath.endsWith(".html")) {
                templatePath = templatePath + ".html";
            }
        }
        return templatePath;
    }
}
