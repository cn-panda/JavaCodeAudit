package com.ofsoft.cms.admin.controller.weixin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.MenuApi;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.core.config.ErrorCode;
import com.ofsoft.cms.admin.domain.WeixinMenuDTO;
import com.ofsoft.cms.core.annotation.Action;

/**
 * 微信菜单请求处理
 * 
 * @author OF
 * @date 2018年3月16日
 */
@Action(path = "/weixin/menu")
public class MenuController extends BaseController {
	public final static String SUCESS_CODE = "200";
	public final static String API_URL = "/api/v1/config/init.json";
	public final static String PARENT_ID = "0";
 
	/**
	 * 创建菜单服务
	 */
	public void createMenuService() {
		try {
			List<Record> records = Db.find(Db.getSql("weixin.menu.weixin_query"));
			ApiResult result = MenuApi.createMenu(menuTree(records));
			if (result.isSucceed()) {
				rendSuccessJson();
			} else {
				rendFailedJson(ErrorCode.get("9999"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}

	}

	/**
	 * 删除菜单
	 */
	public void deleteMenuService() {
		try {
			ApiResult result = MenuApi.deleteMenu();
			if (result.isSucceed()) {
				rendSuccessJson();
			} else {
				rendFailedJson(ErrorCode.get("9999"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}

	}

	/**
	 * 删除菜单
	 */
	public void queryMenuService() {
		try {
			ApiResult result = MenuApi.getMenu();
			if (result.isSucceed()) {
				rendSuccessJson(result.getJson());
			} else {
				rendFailedJson(ErrorCode.get("9999"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}

	}

	/**
	 * 一级菜单
	 * 
	 * @param records
	 *            记录
	 * @return json
	 */
	private String menuTree(List<Record> records) {
		Map<String, List<WeixinMenuDTO>> data = new HashMap<String, List<WeixinMenuDTO>>();
		List<WeixinMenuDTO> list = new ArrayList<WeixinMenuDTO>();
		for (Record record : records) {
			if (PARENT_ID.equals(record.getStr("parent_id"))) {
				list.add(new WeixinMenuDTO(subMenuTree(records,
						record.getStr("menu_id")), record.getStr("name"),
						record.getStr("url"), record.getStr("type")));
			}
		}
		data.put("button", list);
		return JSON.toJSONString(data);
	}

	/**
	 * 二级菜单
	 * 
	 * @param records
	 *            记录
	 * @param menuId
	 *            上级编号
	 * @return list
	 */
	private ArrayList<WeixinMenuDTO> subMenuTree(List<Record> records,
			String menuId) {
		ArrayList<WeixinMenuDTO> list = new ArrayList<WeixinMenuDTO>();
		for (Record record : records) {
			if (menuId.equals(record.getStr("parent_id"))) {
				list.add(new WeixinMenuDTO(subMenuTree(records,
						record.getStr("menu_id")), record.getStr("name"),
						record.getStr("url"), record.getStr("type")));
			}
		}
		return list;
	}
}
