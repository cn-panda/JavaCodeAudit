package com.ofsoft.cms.core.config;

import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.druid.DruidStatViewHandler;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.admin.controller.weixin.MessageController;
import com.ofsoft.cms.admin.controller.weixin.WeiXinConfig;
import com.ofsoft.cms.admin.service.meesage.MsgWebSocketServer;
import com.ofsoft.cms.core.handler.ActionHandler;
import com.ofsoft.cms.core.handler.WebSocketHandler;
import com.ofsoft.cms.core.plugin.quartz.QuartzPlugin;
import com.ofsoft.cms.core.plugin.shiro.ShiroInterceptor;
import com.ofsoft.cms.core.plugin.shiro.ShiroPlugin;
import com.ofsoft.cms.core.plugin.shiro.freemarker.ShiroTags;
import com.ofsoft.cms.core.route.AutoBindRoutes;
import com.ofsoft.cms.core.spring.SpringDataSourcePlugin;
import com.ofsoft.cms.core.spring.SpringPlugin;
import com.ofsoft.cms.core.utils.Tools;
import com.ofsoft.cms.front.template.freemarker.FreemarkerUtile;
import com.ofsoft.cms.model._MappingKit;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.StandardCompress;
import org.apache.log4j.Logger;
import org.java_websocket.server.WebSocketServer;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

/**
 * 配置文件
 *
 * @author OF
 * @date 2017年11月24日
 */
public final class JFWebConfig extends JFinalConfig {
    private Routes route = null;
    private Logger logger = Logger.getLogger(JFWebConfig.class);
    private WebSocketServer webSocket;

    @Override
    public void configConstant(Constants me) {
        loadPropertyFile(AdminConst.ADMIN_CONFIG);
        PropKit.use(AdminConst.ADMIN_CONFIG);
        me.setEncoding("UTF-8");
        me.setI18nDefaultBaseName("i18n");
        me.setI18nDefaultLocale("zh_CN");
        me.setError401View("/comn/404.html");
        me.setError403View("/comn/404.html");
        me.setError404View("/comn/404.html");
        me.setError500View("/comn/500.html");
        me.setRenderFactory(new RenderFactoryImpl());
        me.setViewType(ViewType.FREE_MARKER);
        // me.setJsonFactory(new FastJsonFactory());
        ApiConfigKit.setDevMode(getPropertyToBoolean("jfinal.devmode"));
        WeiXinConfig.setDevMode(getPropertyToBoolean("jfinal.devmode"));
        // 上传绝对路径时必需设置
        //me.setBaseUploadPath(getProperty("base_upload_path"));
    }

    @Override
    public void configRoute(Routes me) {
        this.route = new AutoBindRoutes("/admin", "com.ofsoft.cms.admin.controller");
        me.add(new AutoBindRoutes("com.ofsoft.cms.front.controller"));
        me.add(new AutoBindRoutes("/api/v1", "com.ofsoft.cms.api.v1"));
        me.add(new AutoBindRoutes("/api/v2", "com.ofsoft.cms.api.v2"));
        me.add("/weixin", MessageController.class);
        me.add(route);
    }

    @Override
    public void configPlugin(Plugins me) {
        if (SystemUtile.isInstall()) {
            // spring plugin
            String[] configurations = new String[]{AdminConst.STRING_CONFIG,
                    AdminConst.STRING_CONFIG + "-*"};
            SpringPlugin springPlugin = new SpringPlugin(configurations);
            me.add(springPlugin);
            // 添加自动绑定model与表插件
            ActiveRecordPlugin activeRecordPlugin = new ActiveRecordPlugin(
                    new SpringDataSourcePlugin());
            activeRecordPlugin.setShowSql(true);
            activeRecordPlugin.setDevMode(true);
            activeRecordPlugin
                    .setContainerFactory(new CaseInsensitiveContainerFactory(true));
            activeRecordPlugin.setBaseSqlTemplatePath(PathKit.getRootClassPath()
                    + "/conf/sql");
            activeRecordPlugin.addSqlTemplate("init.sql");
            _MappingKit.mapping(activeRecordPlugin);
            me.add(activeRecordPlugin);
            if (getPropertyToBoolean("jfinal.devmode")) {
                AutoReloadSqlConfig auto = new AutoReloadSqlConfig();
                auto.setSqlKit(activeRecordPlugin.getSqlKit());
                auto.setInterval(15);
                auto.start();
            }
            // 定时任务插件
            QuartzPlugin quartz = new QuartzPlugin("/conf/quartz.properties");
            me.add(quartz);
        }
        // 缓存插件
        ShiroPlugin shiroPlugin = new ShiroPlugin(route);
        shiroPlugin.setExtName(".html");
        shiroPlugin.setLoginUrl(AdminConst.loginHtml);
        shiroPlugin.setSuccessUrl(AdminConst.indexHtml);
        shiroPlugin.setUnauthorizedUrl(AdminConst.loginHtml);
        me.add(shiroPlugin);
        // 缓存插件
        me.add(new EhCachePlugin());

    }

    @Override
    public void configInterceptor(Interceptors me) {
        // 启动Shiro拦截器
        me.add(new ShiroInterceptor());
        me.add(new SessionInViewInterceptor());
        // me.add(new TxByMethodRegex("(.*save.*|.*update.*)"));
        // me.add(new TxByMethods("save", "update"));
    }

    @Override
    public void configHandler(Handlers me) {
        // 该处理器将request.getContextPath()存储在root中，可以解决路径问题
        me.add(new ActionHandler());
        me.add(new DruidStatViewHandler("/admin/druid"));
        me.add(new WebSocketHandler());
    }

    @Override
    public void afterJFinalStart() {
        // MobileConst.MOBILE_CONFIG = AdminConst.ADMIN_CONFIG;
        // 初始化系统数据
        if (SystemUtile.isInstall()) {
            SystemUtile.init();
        }
        // 启动通知服务
        try {
            webSocket = new MsgWebSocketServer(9999);
            webSocket.start();
        } catch (UnknownHostException e1) {
            try {
                webSocket.stop();
            } catch (IOException | InterruptedException e) {
                e.printStackTrace();
            }
            e1.printStackTrace();
        }
        Configuration cf = FreeMarkerRender.getConfiguration();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("webroot", JFinal.me().getContextPath());
        map.put("reroot", JFinal.me().getContextPath() + "/static");
        if (SystemUtile.isInstall()) {
            map.put("http_image_url", SystemUtile.getParam("http_image_url"));
            map.put("compress", StandardCompress.INSTANCE);
            map.put("system", SystemUtile.getParamGroup("system"));
        }
        try {
            cf.setSharedVaribles(map);
            cf.setSharedVariable("tools", new Tools());
            cf.setSharedVariable("system_util", new SystemUtile());
            cf.setSharedVariable(FrontConst.DIRECTIVE_PREFIX, FreemarkerUtile.initTemplate());
        } catch (TemplateModelException e) {
            e.printStackTrace();
        }
        cf.setTemplateUpdateDelay(getPropertyToInt("template.update_delay", 0));
        cf.setDefaultEncoding(getProperty("template.encoding"));
        cf.setURLEscapingCharset(getProperty("template.encoding"));
        // •AUTO_DETECT_TAG_SYNTAX: 可以自定义格式，系统会选择第一个标签作为参照；
        // •ANGLE_BRACKET_TAG_SYNTAX: 使用尖括号；
        // •SQUARE_BRACKET_TAG_SYNTAX: 使用方括号；
        cf.setTagSyntax(Configuration.AUTO_DETECT_TAG_SYNTAX);
        cf.setWhitespaceStripping(true);
        cf.setClassicCompatible(true);
        cf.setNumberFormat(getProperty("template.number_format"));
        cf.setBooleanFormat(getProperty("template.boolean_format"));
        cf.setDateTimeFormat(getProperty("template.datetime_format"));
        cf.setDateFormat(getProperty("template.date_format"));
        cf.setTimeFormat(getProperty("template.time_format"));
        // 增加权限标签
        cf.setSharedVariable("shiro", new ShiroTags());
        cf.setServletContextForTemplateLoading(JFinal.me().getServletContext(),
                getProperty("template.loader_path"));
//		cf.setTemplateLoader(new MultiTemplateLoader(new TemplateLoader[]{}));
        logger.info("服务已经启动完成!");
        super.afterJFinalStart();
    }

    @Override
    public void beforeJFinalStop() {
        super.beforeJFinalStop();
        try {
            webSocket.stop();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void configEngine(Engine me) {
    }

}
