package com.ofsoft.cms.admin.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 公共service
 * 
 * @author OF
 * @date 2018年1月25日
 */
@Service("comnService")
public class ComnService extends BaseService {
	/**
	 * 公共查询
	 */
	public Page<Record> query(Map<String, Object> params, Integer pageNum,
			Integer pageSize, String field, String sort) {
		SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
		setPageOrderByParams(sql, field, sort);
		Page<Record> page = Db.paginate(pageNum, pageSize, sql);
		return page;
	}

}
