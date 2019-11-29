package com.ofsoft.cms.core.config;

import com.ofsoft.cms.model.SysUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;


/**
 * shiro 工具类
 *
 * @author OF
 *
 */
public class ShiroUtils {
	/**
	 * 返回当前登录的认证实体AdminId
	 *
	 * @return
	 */
	public static String getLoginAdminId() {
		ShiroPrincipal principal = getAdminPrincipal();
		if (principal != null)
			return principal.getId();
		return "";
	}

	/**
	 * 返回当前登录的认证实体Admin
	 *
	 * @return
	 */
	public static SysUser getLoginAdmin() {
		ShiroPrincipal principal = getAdminPrincipal();
		if (principal != null) {
			return principal.getAdmin();
		}
		return null;
	}

	/**
	 * 获取当前登录的Admin认证实体
	 *
	 * @return
	 */
	public static ShiroPrincipal getAdminPrincipal() {
		Subject subject = SecurityUtils.getSubject();
		return (ShiroPrincipal) subject.getPrincipal();
	}

	/**
	 * 获取当前认证Admin实体的中文名称
	 *
	 * @return
	 */
	public static String getAdminFullname() {
		ShiroPrincipal principal = getAdminPrincipal();
		if (principal != null)
			return principal.toString();
		return "";
	}

	/**
	 * 获取当前认证Admin实体的登录名称
	 *
	 * @return
	 */
	public static String getLoginAdminName() {
		ShiroPrincipal principal = getAdminPrincipal();
		if (principal != null)
			return principal.getAdminName();
		throw new RuntimeException("user's name is null.");
	}

	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	public static Session getSession() {
		return SecurityUtils.getSubject().getSession();
	}

	public static void setSessionAttribute(Object key, Object value) {
		getSession().setAttribute(key, value);
	}

	public static Object getSessionAttribute(Object key) {
		return getSession().getAttribute(key);
	}

	public static SysUser getSysUser() {
		return (SysUser) SecurityUtils.getSubject().getPrincipal();
	}

	public static boolean isLogin() {
		return SecurityUtils.getSubject().getPrincipal() != null;
	}

	public static void logout() {
		SecurityUtils.getSubject().logout();
	}

	public static String getKaptcha(String key) {
		String kaptcha = getSessionAttribute(key).toString();
		getSession().removeAttribute(key);
		return kaptcha;
	}

}
