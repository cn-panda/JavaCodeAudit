package com.ofsoft.cms.core.config;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ofsoft.cms.model.SysUser;

/**
 * 自定义认证主体
 * 
 * @author LiHongYuan
 * 
 */
public class ShiroPrincipal implements Serializable {

	private static final long serialVersionUID = -5216712981159026254L;

	// 用户对象
	private SysUser admin;
	// 用户权限列表
	private List<String> authorities = new ArrayList<String>();
	// 用户角色列表
	private List<String> roles = new ArrayList<String>();
	// 是否已授权。如果已授权，则不需要再从数据库中获取权限信息，减少数据库访问
	// 这里会导致修改权限时，需要重新登录方可有效
	private boolean isAuthorized = false;

	/**
	 * 构造函数，参数为Admin对象 根据Admin对象属性，赋值给Principal相应的属性上
	 * 
	 * @param admin
	 */
	public ShiroPrincipal(SysUser admin) {
		this.admin = admin;
	}

	public List<String> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<String> authorities) {
		this.authorities = authorities;
	}

	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	public boolean isAuthorized() {
		return isAuthorized;
	}

	public void setAuthorized(boolean isAuthorized) {
		this.isAuthorized = isAuthorized;
	}

	public SysUser getAdmin() {
		return admin;
	}

	public void setAdmin(SysUser admin) {
		this.admin = admin;
	}

	public String getAdminName() {
		return this.admin.getLoginName();
	}

	public String getId() {
		return this.admin.getUserId().toString();
	}

	/**
	 * <shiro:principal/>标签显示中文名称
	 */
	@Override
	public String toString() {
		return this.admin.getLoginName();
	}
}
