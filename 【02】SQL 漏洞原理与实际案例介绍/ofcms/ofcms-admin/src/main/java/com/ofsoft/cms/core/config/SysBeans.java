package com.ofsoft.cms.core.config;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 系统公共bean获取
 * 
 * @author OF
 * @date 2017年7月6日
 */
public class SysBeans implements ApplicationContextAware {
	private static ApplicationContext applicationContext;

	/**
	 * 注入实例
	 * 
	 */
	public void setApplicationContext(ApplicationContext applicationContext) {
		SysBeans.applicationContext = applicationContext;
	}

	/**
	 * 注入实例
	 * 
	 */
	public static void setApplication(ApplicationContext applicationContext) {
		SysBeans.applicationContext = applicationContext;
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	/**
	 * 获取静态bean实例
	 * 
	 * @param bean
	 * @return
	 */
	public static Object getBean(String bean) {
		return applicationContext.getBean(bean);
	}

	/**
	 * 获取数据源
	 * 
	 * @return
	 */
	public static DataSource getDataSource() {
		return (DataSource) getBean("dataSourceProxy");
	}

}
