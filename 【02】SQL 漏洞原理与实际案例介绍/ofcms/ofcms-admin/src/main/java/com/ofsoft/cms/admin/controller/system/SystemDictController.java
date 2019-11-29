package com.ofsoft.cms.admin.controller.system;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.ErrorCode;
import org.apache.commons.lang3.StringUtils;

import java.util.Map;

/**
 * 系统字典
 * 
 * @author OF
 * @date 2018年1月8日
 */
@Action(path = "/system/dict")
public class SystemDictController extends BaseController {

	/**
	 * 查询方法
	 */
	public void query() {
		Map<String, Object> params = getParamsMap();
		SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
		setPageOrderByParams(sql, getPara("field"), getPara("sort"));
		Page<Record> page = Db.paginate(getPageNum(), getPageSize(), sql);
		rendSuccessJson(page.getList(), page.getTotalRow(),
				page.getPageNumber());
	}
	public void get() {
		rendSuccessJson(SystemUtile.getDictGroup(getPara("dict_value")));
	}
	public void getSingle() {
		rendSuccessJson(SystemUtile.getDict(getPara("dict_value")));
	}

	public void add() {
		Map<String, Object> params = getParamsMap();
		try {
			SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
			Db.update(sql);
			SystemUtile.initDict();
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}
	}

	public void del() {
		try {
			Map<String, Object> params = getParamsMap();
			String sqlid = getPara("sqlid");
			String delkey = getPara("delkey");
			if (!StringUtils.isBlank(delkey)) {
				String id = getPara(delkey);
				String[] ids = id.split(",");
				for (int i = 0; i < ids.length; i++) {
					params.put(delkey, ids[i]);
					SqlPara sql = Db.getSqlPara(sqlid, params);
					Db.update(sql);
				}
			} else {
				SqlPara sql = Db.getSqlPara(sqlid, params);
				Db.update(sql);
			}
			SystemUtile.initDict();
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}
	}

	public void update() {
		Map<String, Object> params = getParamsMap();
		try {
			SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
			Db.update(sql);
			SystemUtile.initDict();
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}
	}

	public void detail() {
		Map<String, Object> params = getParamsMap();
		try {
			SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
			Record record = Db.findFirst(sql);
			rendSuccessJson(record);
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}
	}

}
