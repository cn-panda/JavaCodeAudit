package com.ofsoft.cms.admin.controller.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.core.config.ErrorCode;
import com.ofsoft.cms.core.plugin.quartz.JobBean;
import com.ofsoft.cms.core.plugin.quartz.JobUtile;
import com.ofsoft.cms.core.plugin.quartz.QuartzPlugin;
import com.ofsoft.cms.core.annotation.Action;
import org.quartz.impl.StdSchedulerFactory;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;

/**
 * 系统定时任务管理
 * 
 * @author OF
 * @date 2018年1月8日
 */
@Action(path = "/system/task")
public class SystemJobController extends BaseController {

	public void addJob() {
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

	/**
	 * 更新定时任务
	 */
	public void updateJob() {
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

	/**
	 * 删除定时任务
	 */
	public void deleteJob() {
		try {
			String beanName = getPara("bean_name");
			Db.update(Db.getSqlPara("system.task.status", beanName, "0"));
			JobUtile.deleteJob(QuartzPlugin.scheduler, beanName);
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(ErrorCode.get("9999"));
		}

	}

	/**
	 * 暂停任务
	 */
	public void pauseJob() {
		try {
			String beanName = getPara("bean_name");
			Db.update(Db.getSqlPara("system.task.status", beanName, "4"));
			JobUtile.pauseJob(QuartzPlugin.scheduler, beanName);
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(e.getMessage());
		}

	}

	/**
	 * 恢复任务
	 */
	public void resumeJob() {
		try {
			String beanName = getPara("bean_name");
			Db.update(Db.getSqlPara("system.task.status", beanName, "2"));
			JobUtile.resumeJob(QuartzPlugin.scheduler, beanName);
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(e.getMessage());
		}

	}

	/**
	 * 立即执行任务
	 */
	public void runJob() {
		try {
			String beanName = getPara("bean_name");
			JobUtile.run(QuartzPlugin.scheduler, beanName);
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(e.getMessage());
		}

	}

	/**
	 * 停止
	 */
	public void shutdownJob() {
		try {
			String beanName = getPara("bean_name");
			JobUtile.deleteJob(QuartzPlugin.scheduler, beanName);
			Db.update(Db.getSqlPara("system.task.status", beanName, "3"));
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(e.getMessage());
		}

	}

	/**
	 * 关闭所有定时任务
	 */
	public void shutdownJobs() {
		try {
			Db.update(Db.getSqlPara("system.task.statusall", "3"));
			JobUtile.shutdownJobs(QuartzPlugin.scheduler);
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(e.getMessage());
		}

	}

	/**
	 * 启动所有定时任务
	 */
	public void startJobs() {
		try {
			List<JobBean> jobs = new ArrayList<JobBean>();
			List<Record> list = Db.find(Db.getSqlPara("system.task.query"));
			for (Record record : list) {
					jobs.add(JobUtile.createJobBean(record));
			}
			QuartzPlugin.scheduler = new StdSchedulerFactory().getScheduler();
			for (JobBean entry : jobs) {
				JobUtile.addJob(QuartzPlugin.scheduler, entry);
			}
			JobUtile.startJobs(QuartzPlugin.scheduler);
			Db.update(Db.getSqlPara("system.task.statusall", "2"));
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(e.getMessage());
		}
	}

	/**
	 * 启动一个任务
	 */
	public void startJob() {
		try {
			String beanName = getPara("bean_name");
			JobUtile.startTask(QuartzPlugin.scheduler, JobUtile
					.createJobBean(Db.findFirst(Db.getSqlPara(
							"system.task.details", beanName))));
			Db.update(Db.getSqlPara("system.task.status", beanName, "2"));
			rendSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			rendFailedJson(e.getMessage());
		}
	}
}
