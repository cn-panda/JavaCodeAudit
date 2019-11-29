package com.ofsoft.cms.core.plugin.shiro;

import org.apache.shiro.authz.AuthorizationException;

/**
 * 访问控制处理器接口
 */
interface AuthzHandler {
	/**
	 * 访问控制检查
	 * @throws AuthorizationException 授权异常
	 */
	public void assertAuthorized()throws AuthorizationException;
}
