package com.ofsoft.cms.core.config;

import java.util.Map;

public final class AdminConst {


	/** 在线用户缓存  **/
	public static final String USER_ONLINE_KEY = "shiro-activeSessionCache";

	/** 把User的数据放到session中 **/
	public static final String USER_IN_SESSION = "ofcms_user";

	/** 菜单存放到session中 **/
	public static final String USER_MENU_SESSION = "ofcms_user_menu";

	/** 站点存放到session中 **/
	public static final String SITE_SESSION = "site";
	/**用户状态*/
	public static final String USER_STATUS = "0";
	public static final String NET_ERROR_MSG = "请求接口失败，请检查网络，或者刷新重连";

	public static final String ADMIN_CONFIG = "conf/admin.properties";
	public static final String ADMIN_DB_CONFIG = "conf/db.properties";
	public static final String WEIXIN_CONFIG = "conf/weixin.sdk.properties";
	public static final String ADMIN_INSTALL_SQL = "/conf/sql/install.sql";
	public static final String STRING_CONFIG = "classpath:conf/applicationContext.xml";
	public static final String ERROR_500 = "/comn/500.html";
	public static final String ERROR_404 = "/comn/404.html";
    public static Map ueditDataConfig = null;
    public static String installHtml = "/install/index.html";
	public static String loginHtml = "/admin/login.html";
	public static String indexHtml = "/admin/index.html";
	public final static String DEF = "1";
	/** 业务缓存名 */
	public static final String API = "api";
	/** 医院缓存key */
	public static final String API_HOSP = "hosp";
	/** 系统缓存名 */
	public static final String SYSTEM = "system";
	/** 字典缓存key */
	public static final String SYSTEM_DICT = "dict";
	/** 参数缓存key */
	public static final String SYSTEM_PARAM = "param";
	/** 站点缓存key */
	public static final String SYSTEM_SITE = "site";
	/**
	 * 系统用户表名
	 */
	public static final String TABLE_OF_SYS_USER ="of_sys_user";
	/** 文件大小 1G*/
	public static int VOID_MAX_SIZE = 1000485760;
}
