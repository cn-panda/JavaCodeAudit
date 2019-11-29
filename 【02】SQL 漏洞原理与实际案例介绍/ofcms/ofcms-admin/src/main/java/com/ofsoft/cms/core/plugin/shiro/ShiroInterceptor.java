package com.ofsoft.cms.core.plugin.shiro;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.StrKit;

/**
 * shiro 权限控制
 * 
 * @author OF
 * @date 2018年1月3日
 */
public class ShiroInterceptor implements Interceptor {
	/**
	 * 登录成功时所用的页面。
	 */
	private final String loginUrl;

	/**
	 * 权限验证失败时所用的页面。
	 */
	private final String unauthorizedUrl;

	public ShiroInterceptor() {
		this.loginUrl = ShiroKit.getLoginUrl();
		this.unauthorizedUrl = ShiroKit.getUnauthorizedUrl();
	}

	public void intercept(Invocation ai) {
		AuthzHandler ah = ShiroKit.getAuthzHandler(ai.getActionKey());
		// 存在访问控制处理器。
		if (ah != null) {
			try {
				// 执行权限检查。
				ah.assertAuthorized();
			} catch (UnauthenticatedException lae) {
				// RequiresGuest，RequiresAuthentication，RequiresUser，未满足时，抛出未经授权的异常。
				// 如果没有进行身份验证，返回HTTP401状态码
				if (StrKit.notBlank(this.loginUrl)) {
					ai.getController().render(this.loginUrl);
				} else {
					ai.getController().renderError(401);
				}
				return;
			} catch (AuthorizationException ae) {
				// RequiresRoles，RequiresPermissions授权异常
				// 如果没有权限访问对应的资源，返回HTTP状态码403，或者调转到为授权页面
				if (StrKit.notBlank(this.unauthorizedUrl)) {
					ai.getController().render(this.unauthorizedUrl);
				} else {
					ai.getController().renderError(403);
				}
				return;
			}
		}
		// 执行正常逻辑
		ai.invoke();
	}
}
