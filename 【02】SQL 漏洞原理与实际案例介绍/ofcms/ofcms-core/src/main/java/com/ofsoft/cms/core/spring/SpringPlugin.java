package com.ofsoft.cms.core.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.jfinal.kit.PathKit;
import com.jfinal.plugin.IPlugin;

/**
 * 与spring 集成
 * 
 * @author OF
 * @date 2017年11月23日
 */
public class SpringPlugin implements IPlugin {
	private String[] configurations;
	private ApplicationContext ctx;

	public SpringPlugin() {
	}

	public SpringPlugin(String... configurations) {
		this.configurations = configurations;
	}

	public SpringPlugin(ApplicationContext ctx) {
		this.ctx = ctx;
	}

	public boolean start() {
		if (ctx != null)
			IocInterceptor.ctx = ctx;
		else if (configurations != null)
			IocInterceptor.ctx = new FileSystemXmlApplicationContext(
					configurations);
		else
			IocInterceptor.ctx = new FileSystemXmlApplicationContext(
					PathKit.getWebRootPath()
							+ "/applicationContext.xml");
		return true;
	}

	public boolean stop() {
		return true;
	}
}
