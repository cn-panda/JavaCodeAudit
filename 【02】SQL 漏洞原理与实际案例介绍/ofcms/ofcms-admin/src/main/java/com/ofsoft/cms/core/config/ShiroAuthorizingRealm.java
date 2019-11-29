package com.ofsoft.cms.core.config;

import com.jfinal.plugin.activerecord.Db;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.model.SysUser;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * shiro的认证授权域
 * 
 * @author OF
 * @date 2018年1月9日
 */
public class ShiroAuthorizingRealm extends AuthorizingRealm {

	/**
	 * 登录认证(登录时调用)
	 * 
	 * @param token
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken userToken = (UsernamePasswordToken) token;
		SysUser user = null;
		String username = userToken.getUsername();
		String password = new String((char[]) token.getCredentials());
		user = SysUser.dao
				.findFirst(
						Db.getSql("system.user.user_role"),
						username);
		// 账号不存在
		if (user == null) {
			throw new UnknownAccountException("账号或密码不正确");
		}
		// 密码错误
		if (!password.equals(user.getUserPassword())) {
			throw new IncorrectCredentialsException("账号或密码不正确");
		}
		// 账号锁定
		if (AdminConst.USER_STATUS.equals(user.getStatus())) {
			throw new LockedAccountException("账号已被禁止使用,请联系管理员");
		}
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,
				user.getUserPassword(), getName());
		setSession(AdminConst.USER_IN_SESSION, user);
		BaseController.logService(user.getUserId().toString(),
				user.getUserName(), "用户登录");
		return info;
	}


	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 * 
	 * @param principals
	 *            用户信息
	 * @return
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		SysUser user = (SysUser) principals.getPrimaryPrincipal();
		List<String> permsList = null;
		if (SystemUtile.isAdmin()) {
			permsList = Db.query(Db.getSql("system.menu.perms_menu"));
		} else {
			permsList = Db
					.query(Db.getSql("system.menu.sys_role_menu"),
							user.getRoleId());
		}
		// 用户权限列表
		Set<String> permsSet = new HashSet<String>();
		for (String perms : permsList) {
			if (StringUtils.isBlank(perms)) {
				continue;
			}
			permsSet.addAll(Arrays.asList(perms.trim().split(",")));
		}
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.setStringPermissions(permsSet);
		return info;
	}

	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 *  比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				session.setAttribute(key, value);

			}
		}
	}

	/**
	 * @param roleSet
	 * @param permissionSet
	 * @param roles
	 */
	/*
	 * private void loadRole(Set<String> roleSet, Set<String> permissionSet,
	 * List<Role> roles) { List<Permission> permissions; for (Role role : roles)
	 * { // 角色可用 if (role.getDeleteFlag() == false) {
	 * roleSet.add(role.getValue()); String sql =
	 * "SELECT * FROM permission WHERE id IN (SELECT permissions FROM permission_role WHERE roles = ?)"
	 * ; permissions = Permission.dao.find(sql, role.getId());
	 * loadAuth(permissionSet, permissions); } } }
	 */

	/**
	 * @param permissionSet
	 * @param permissions
	 */
	/*
	 * private void loadAuth(Set<String> permissionSet, List<Permission>
	 * permissions) { // 遍历权限 for (Permission permission : permissions) { //
	 * 权限可用 if (permission.getDeleteFlag() == false) {
	 * permissionSet.add(permission.getValue()); } } }
	 */

	/**
	 * 更新用户授权信息缓存.
	 */
	public void clearCachedAuthorizationInfo(Object principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(
				principal, getName());
		clearCachedAuthorizationInfo(principals);
	}

	/**
	 * 清除所有用户授权信息缓存.
	 */
	public void clearAllCachedAuthorizationInfo() {
		Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
		if (cache != null) {
			for (Object key : cache.keys()) {
				cache.remove(key);
			}
		}
	}

}
