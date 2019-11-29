package com.ofsoft.cms.admin.controller;

import com.alibaba.fastjson.JSON;
import com.jfinal.aop.Clear;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.jfinal.upload.UploadFile;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.config.ErrorCode;
import com.ofsoft.cms.admin.service.meesage.MsgServerPool;
import com.ofsoft.cms.core.annotation.Action;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * 公共请求数据
 * 
 * @author OF
 * @date 2018年1月8日
 */
@Action(path = "/comn/service")
public class ComnController extends BaseController {

	/**
	 * 公共查询方法
	 */
	public void query() {
		Map<String, Object> params = getParamsMap();
		SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
		setPageOrderByParams(sql, getPara("field"), getPara("sort"));
		Page<Record> page = Db.paginate(getPageNum(), getPageSize(), sql);
		rendSuccessJson(page.getList(), page.getTotalRow(),
				page.getPageNumber());
	}

	public void add() {
		Map<String, Object> params = getParamsMap();
		try {
			SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
			Db.update(sql);
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

	@Clear
	public void upload() {
		try {
			UploadFile file = this.getFile("file", "image");
			file.getFile().createNewFile();
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("filePath", "/upload/image/" + file.getFileName());
			data.put("fileName", file.getFileName());
			rendSuccessJson(data);
		} catch (Exception e) {
			rendFailedJson(ErrorCode.get("9999"));
		}
	}

	@Clear
	public void editUploadImage() {
		try {
			UploadFile file = this.getFile("file", "image");
			file.getFile().createNewFile();
			Map<String, Object> msg = new HashMap<String, Object>();
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("src", SystemUtile.getParam("http_image_url")
					+ "/upload/image/" + file.getFileName());
			data.put("title", file.getFileName());
			msg.put("data", data);
			msg.put("code", 0);
			msg.put("msg", "处理成功");
			rendJson(msg);
		} catch (Exception e) {
			rendFailedJson(ErrorCode.get("9999"));
		}
	}

	public void sendMsg() {
		Map<String, Object> params = getParamsMap();
		try {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("msg_type", "1");
			data.put("msg_content", "1");
			data.put("msg_count", "10");
			MsgServerPool.sendMessage(JSON.toJSONString(data));
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}
	}
}
