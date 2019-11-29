package com.ofsoft.cms.admin.controller.system;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.ErrorCode;
import com.ofsoft.cms.core.uitle.GenUtils;

import java.util.List;
import java.util.Map;

/**
 * 系统代码生成
 * 
 * @author OF
 * @date 2018年1月22日
 */
@Action(path = "/system/generate", viewPath = "system/generate/")
public class SystemGenerateController extends BaseController {

	/**
	 * 生成
	 */
	public void code() {
		try {
			Map<String, Object> params = getParamsMap();
			String tableName = getPara("table_name");
			String moduleName = getPara("module_name");
			String fuctionName = getPara("fuction_name");
			SqlPara sql = Db.getSqlPara("system.generate.column", params);
			List<Record> columnList = Db.find(sql);
			GenUtils.createSql(tableName, moduleName, fuctionName, columnList);
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}
	}

	/**
	 * 创建表
	 */
	public void create() {
		try {
			String sql = getPara("sql");
			Db.update(sql);
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"), e.getMessage());
		}
	}
}
