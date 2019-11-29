package com.ofsoft.cms.admin.controller.system;

import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.core.annotation.Action;

import java.util.Map;

/**
 * 系统设置
 * 
 * @author OF
 * @date 2018年1月8日
 */
@Action(path = "/system")
public class SystemController extends BaseController {
	public void detail() {
		rendSuccessJson(SystemUtile.getParamGroup("system"));
	}
	public void update() {
		Map<String, Object> params = getParamsMap();
		for (String key : params.keySet()) {
			SystemUtile.setParam(key, params.get(key).toString());
		}
		SystemUtile.initParam();
		SystemUtile.initAdminIndex(params.get("index").toString());
		rendSuccessJson();
	}
}
