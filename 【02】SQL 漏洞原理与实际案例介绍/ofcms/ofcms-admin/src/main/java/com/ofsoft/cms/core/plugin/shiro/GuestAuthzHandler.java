package com.ofsoft.cms.core.plugin.shiro;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;

/**
 * 访客访问控制处理器
 */
class GuestAuthzHandler extends AbstractAuthzHandler {
	private static GuestAuthzHandler gah = new GuestAuthzHandler();

	private GuestAuthzHandler(){}

	public static  GuestAuthzHandler me(){
		return gah;
	}

	public void assertAuthorized() throws AuthorizationException {
		 if (getSubject().getPrincipal() != null) {
	            throw new UnauthenticatedException("Attempting to perform a guest-only operation.  The current Subject is " +
	                    "not a guest (they have been authenticated or remembered from a previous login).  Access " +
	                    "denied.");
	        }
	}

}
