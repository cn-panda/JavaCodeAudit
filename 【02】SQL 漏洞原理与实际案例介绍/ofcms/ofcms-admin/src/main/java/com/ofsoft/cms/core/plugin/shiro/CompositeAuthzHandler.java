package com.ofsoft.cms.core.plugin.shiro;

import java.util.List;

import org.apache.shiro.authz.AuthorizationException;

/**
 * 组合模式访问控制处理器
 */
class CompositeAuthzHandler implements AuthzHandler {

	private final List<AuthzHandler> authzHandlers;

	public CompositeAuthzHandler(List<AuthzHandler> authzHandlers){
		this.authzHandlers = authzHandlers;
	}

	public void assertAuthorized() throws AuthorizationException {
		for(AuthzHandler authzHandler : authzHandlers){
			authzHandler.assertAuthorized();
		}
	}
}
