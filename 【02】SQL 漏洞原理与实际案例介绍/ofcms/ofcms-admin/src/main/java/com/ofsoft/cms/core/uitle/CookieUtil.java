package com.ofsoft.cms.core.uitle;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	/**
	 * 提供添加登录名称到客户端cookie的方法<br />
	 * 使用此方法在用户登录时，把登录名称保存到客户端cookie以便打开登录页时给客户端自动填写登录名称
	 * 
	 * @param loginname
	 *            登录名称
	 * @param response
	 *            HttpServletResponse servlet的客户端响应对象
	 */
	public static void setLoginnameCookie(String loginname,
			HttpServletResponse response) {
		Cookie cookieLoginname = new Cookie("syk",
				MD5.MD5Encode(loginname));
		// 设置COOKIE保存期：7天
		cookieLoginname.setMaxAge(60 * 60 * 24 * 7);
		// 添加COOKIE到客户端响应对象
		response.addCookie(cookieLoginname);
	}

	public static void setLogoutCookie(HttpServletResponse response) {
		Cookie cookieLoginname = new Cookie("JSESSIONID", "");
		// 设置COOKIE保存期：0天
		cookieLoginname.setMaxAge(0);
		// 添加COOKIE到客户端响应对象
		response.addCookie(cookieLoginname);
	}

	/**
	 * Get cookie value by cookie name.
	 */
	public String getCookie(String name, String defaultValue) {
		return defaultValue;
		// Cookie cookie = getCookieObject(name);
		// return cookie != null ? cookie.getValue() : defaultValue;
	}
	/**
	 * Get cookie object by cookie name.
	 */
	/*
	 * public Cookie getCookieObject(String name) { Cookie[] cookies =
	 * request.getCookies(); if (cookies != null) for (Cookie cookie : cookies)
	 * if (cookie.getName().equals(name)) return cookie; return null; }
	 */

}
