package com.ofsoft.cms.core.plugin.shiro.freemarker;

import freemarker.template.SimpleHash;

/**
 * Shortcut for injecting the tags into Freemarker
 * <p/>
 * <p>Usage: cfg.setSharedVeriable("shiro", new ShiroTags());</p>
 */
@SuppressWarnings("serial")
public class ShiroTags extends SimpleHash {
  @SuppressWarnings("deprecation")
  public ShiroTags() {
    put("authenticated", new AuthenticatedTag());
    put("guest", new GuestTag());
    put("hasAnyRoles", new HasAnyRolesTag());
    put("hasPermission", new HasPermissionTag());
    put("hasRole", new HasRoleTag());
    put("lacksPermission", new LacksPermissionTag());
    put("lacksRole", new LacksRoleTag());
    put("notAuthenticated", new NotAuthenticatedTag());
    put("principal", new PrincipalTag());
    put("user", new UserTag());
    put("isLoginFailure", new IsLoginFailureTag());
    put("loginException", new LoginExceptionTag());
    put("loginUsername", new LoginUsernameTag());
  }
}