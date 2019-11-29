package com.ofsoft.cms.core.plugin.shiro;

import java.lang.annotation.Annotation;
import java.util.Arrays;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;

/**
 * 基于角色的访问控制处理器，非单例模式运行。
 */
class RoleAuthzHandler extends AbstractAuthzHandler {

	private final Annotation annotation;

	public RoleAuthzHandler(Annotation annotation){
		this.annotation = annotation;
	}

	public void assertAuthorized() throws AuthorizationException {
		//if (!(annotation instanceof RequiresRoles)) return;
        RequiresRoles rrAnnotation = (RequiresRoles) annotation;
        String[] roles = rrAnnotation.value();

        if (roles.length == 1) {
            getSubject().checkRole(roles[0]);
            return;
        }
        if (Logical.AND.equals(rrAnnotation.logical())) {
            getSubject().checkRoles(Arrays.asList(roles));
            return;
        }
        if (Logical.OR.equals(rrAnnotation.logical())) {
            // Avoid processing exceptions unnecessarily - "delay" throwing the exception by calling hasRole first
            boolean hasAtLeastOneRole = false;
            for (String role : roles) if (getSubject().hasRole(role)) hasAtLeastOneRole = true;
            // Cause the exception if none of the role match, note that the exception message will be a bit misleading
            if (!hasAtLeastOneRole) getSubject().checkRole(roles[0]);
        }
	}
}
