package com.ofsoft.cms.admin.controller.system;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.weixin.sdk.utils.JsonUtils;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.core.annotation.Action;

import java.util.List;
import java.util.Map;

/**
 * 系统角色功能
 * 
 * @author OF
 * @date 2018年1月8日
 */
@Action(path = "/system/role")
public class SysRoleController extends BaseController {

	/**
	 * 权限获取
	 */
	public void permission() {
		String roleId = getPara("role_id");
		String sql = Db.getSql("system.role.role_permission");
		List<Record> list = Db.find(sql,roleId);
		setAttr("ztree", JsonUtils.toJson(list));
		setAttr("roleid", roleId);
		render("/admin/system/role/permission.html");
	}

	/**
	 * 权限设置
	 */
	public void setPermission() {
		Map<String, Object> jsonObject =getParaJsonMap();
		Integer roleId = Integer.valueOf(getParaJson("role_id"));
		String sql = Db.getSql("system.role.delete_role_menu");
		Db.update(sql,roleId);
		String svaeSql = Db.getSql("system.role.save_role_menu");
		@SuppressWarnings("unchecked")
		List <Integer> nodes = (List<Integer>) jsonObject.get("nodes");
		Integer [] [] bath = new Integer [nodes.size()] [2];
		for(int i = 0 ;i < bath.length;i++ ){
			for(int j = 0 ;j < 1;j++ ){
				bath [i][j] = roleId;
				bath [i][++j] = nodes.get(i);
			}
		}
		Db.batch(svaeSql, bath, nodes.size());
		rendSuccessJson();
	}
}
