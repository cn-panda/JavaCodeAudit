package com.ofsoft.cms.front.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.AdminConst;
import com.ofsoft.cms.core.config.FrontConst;
import com.ofsoft.cms.core.uitle.SiteUtile;

import java.util.Map;

/**
 * 页面配置
 *
 * @author OF
 * @date 2018年1月2日
 */
@Action()
public class IndexController extends BaseController {

    /**
     * 首页页面
     */
    @ActionKey(value = "index")
    public void front() {
        render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + "/index.html");
    }

    /**
     * 管理台首页默认跳转
     */
    @ActionKey(value = "/admin")
    public void admin() {
        redirect(AdminConst.indexHtml);
    }

    /**
     * 首页面配置
     */
    @ActionKey(value = "/")
    public void index() {
        Map params = getParamsMap();
        String page = getPara(0);
        //是否是首页
        if ("/".equals(page) || page == null || "index".equals(page)) {
            setAttr("site", SiteUtile.getSite());
            render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + "/index.html");
            return;
        }
        //获取当前栏目
        params.put("site_id", SiteUtile.getSiteId());
        params.put("column_english", page);
        params.put("page", page);
        Record record = SiteUtile.getColumn(params);
        String isContent = getPara(1);
        if (record == null) {
            if ("c".equals(isContent)) {
                params.put("content_id", getParaToInt(2, 0));
                setAttr("params", params);
                render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + "/article.html");
                return;
            }
            render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + FrontConst.pageError);
            return;
        }
        setAttr("columns", record);
        setAttr("params", params);
        //是否是内容
        if ("c".equals(isContent)) {
            params.put("content_id", getParaToInt(2, 0));
            String templatePath = SiteUtile.getTemplatePath(record.getStr("column_content_page"), "/article.html");
            render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + templatePath);
            return;
        }
        //是否是单页
        if ("1".equals(record.getStr("is_open"))) {
            String templatePath = SiteUtile.getTemplatePath(record.getStr("template_path"), "/sing.html");
            render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + templatePath);
            return;
        }
        //当前页码 栏目页
        int pageNum = getParaToInt(1, 1);
        setAttr("pageNum", pageNum);
        String templatePath = SiteUtile.getTemplatePath(record.getStr("template_path"), "/list.html");
        render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + templatePath);
        return;
    }


    /**
     * 列表页面
     */
    @ActionKey(value = "/list")
    public void list() {
        render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + "/list.html");
    }

    /**
     * 内容页面
     */
    @ActionKey(value = "/content")
    public void content() {
        String p = getRequest().getRequestURI();
        p = p.replace(getRequest().getContextPath(), "").replace("/content", "");
        render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + p);
    }

    /**
     * 栏目页面
     */
    @ActionKey(value = "/column")
    public void column() {
        Map params = getParamsMap();
        String page = getPara(0);
        //当前页码
        int pageNum = getParaToInt(1, 1);
        //获取当前栏目
        params.put("site_id", SiteUtile.getSiteId());
        params.put("column_english", page);
        params.put("page", page);
        Record record = SiteUtile.getColumn(params);
        setAttr("columns", record);
        setAttr("params", params);
        setAttr("pageNum", pageNum);
        String templatePath = record.getStr("template_path");
        if (templatePath == null) {
            templatePath = "index.html";
        } else {
            if (!templatePath.startsWith("/")) {
                templatePath = "/" + templatePath;
            }
            if (!templatePath.endsWith(".html")) {
                templatePath = templatePath + ".html";
            }
        }
        render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + templatePath);
    }

    /**
     * 普通页面
     */
    @ActionKey(value = "/news")
    public void news() {
        String p = getRequest().getRequestURI();
        p = p.replace(getRequest().getContextPath(), "").replace("/page", "");
        render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + p);
    }

    /**
     * 页面配置
     */
    @ActionKey(value = "page")
    public void page() {
        String s = getPara("s");
        if (s.lastIndexOf(".html") != 0) {
            s = s + ".html";
        }
        setAttr("params", getParamsMap());
        render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + s);
    }
}
