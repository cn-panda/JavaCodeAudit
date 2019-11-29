package com.ofsoft.cms.admin.service;

import com.jfinal.plugin.activerecord.SqlPara;
import org.apache.commons.lang3.StringUtils;

public abstract class BaseService {
	/**
	 * 动态增加order by参数
	 */
	public void setPageOrderByParams(SqlPara sql, String field, String sort) {
		if (!StringUtils.isEmpty(field) && !StringUtils.isEmpty(sort)) {
			sql.setSql(sql.getSql().replace("order_sort", sort));
			sql.setSql(sql.getSql().replace("order_field", field));
		}
	}
}
