package com.ofsoft.cms.core.spring;

import javax.sql.DataSource;

import com.jfinal.plugin.activerecord.IDataSourceProvider;

/**
 * 数据源插件
 * 
 * @author OF
 * @date 2017年11月23日
 */
public class SpringDataSourcePlugin implements IDataSourceProvider {

	@Override
	public DataSource getDataSource() {
		return (DataSource) SpringContextUtil.getApplicationContext().getBean(
				"dataSourceProxy");
	}

}
