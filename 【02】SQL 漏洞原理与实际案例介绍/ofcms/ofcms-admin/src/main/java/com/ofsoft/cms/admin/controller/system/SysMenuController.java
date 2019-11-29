package com.ofsoft.cms.admin.controller.system;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.jfinal.weixin.sdk.utils.JsonUtils;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.AdminConst;
import com.ofsoft.cms.core.config.ShiroUtils;

import java.util.List;
import java.util.Map;

/**
 * 系统菜单功能
 * 
 * @author OF
 * @date 2018年1月8日
 */
@Action(path = "/system/menu")
public class SysMenuController extends BaseController {

	/**
	 * 菜单树结构
	 */
	public void tree() {
		Map<String, Object> params = getParamsMap();
		SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
		List<Record> list = Db.find(sql);
		rendSuccessJson(list);
	}

	/**
	 * 获取菜单
	 */

	public void getMenu() {
		// 如果是管理刚查看全部 否则根据权限显示
		// 菜单存入到session中
		String result = null;
		Object obj = ShiroUtils
				.getSessionAttribute(AdminConst.USER_MENU_SESSION);
		SqlPara sql = null;
		if (obj == null) {
			if (SystemUtile.isAdmin()) {
				sql = Db.getSqlPara("system.menu.home_query");
			} else {
				sql = Db.getSqlPara("system.menu.role_menu", ShiroUtils
						.getSysUser().getRoleId());
			}

			result = JsonUtils.toJson(Db.find(sql));
//			ShiroUtils
//					.setSessionAttribute(AdminConst.USER_MENU_SESSION, result);
		} else {
			result = (String) obj;
		}
		rendSuccessJson(result);
	}
}
