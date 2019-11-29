package com.ofsoft.cms.core.plugin.shiro.freemarker;

import com.ofsoft.cms.admin.controller.system.SystemUtile;

/**
 * <p>Equivalent to {@link org.apache.shiro.web.tags.HasPermissionTag}</p>
 *
 * @since 0.1
 */
public class HasPermissionTag extends PermissionTag {
  protected boolean showTagBody(String p) {
	  //是超级管理员直接返回正确
	if(  SystemUtile.isAdmin())
		return true;
    return isPermitted(p);
  }
}
