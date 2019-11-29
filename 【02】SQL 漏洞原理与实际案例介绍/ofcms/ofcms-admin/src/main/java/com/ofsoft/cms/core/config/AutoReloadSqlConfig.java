package com.ofsoft.cms.core.config;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.sql.SqlKit;

/**
 * 用于自动重新加载配置文件的线程
 * 
 * @author OF
 * 
 */
public class AutoReloadSqlConfig extends Thread {
	private static Logger log = Logger.getLogger(AutoReloadSqlConfig.class);

	private volatile boolean stopRequested;
	private Thread runThread;

	public SqlKit sqlKit;

	/**
	 * 更新间隔时间
	 */
	private int interval = 10;

	public void run() {
		if (interval <= 0) {
			log.info("#####  自动更新配置文件服务更新间隔时间为0，将不启动");
			return;
		}
		if (interval < 5) {// 更新间隔时间不能小于5秒
			interval = 5;
		}
		runThread = Thread.currentThread();
		stopRequested = false;
		while (!stopRequested) {
			log.info("##### 自动更新配置文件服务启动, 更新间隔时间 " + interval + " 秒");
			// 去除 Engine 中的缓存，以免 get 出来后重新判断 isModified
			sqlKit.getEngine().removeAllTemplateCache();
			sqlKit.parseSqlTemplate();
			try {
				sleep(interval * 1000);
			} catch (InterruptedException e) {
				runThread.interrupt();
			}
		}
		log.info("##### 自动更新配置文件服务退出");
	}

	/**
	 * 停止线程
	 */
	public void stopRequest() {
		stopRequested = true;
		if (runThread != null)
			runThread.interrupt();
	}

	public void setInterval(int interval) {
		this.interval = interval;
	}

	public SqlKit getSqlKit() {
		return sqlKit;
	}

	public void setSqlKit(SqlKit sqlKit) {
		this.sqlKit = sqlKit;
	}

}
