package com.ofsoft.cms.core.plugin.quartz;

import java.util.ArrayList;
import java.util.List;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;

import com.google.common.base.Throwables;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class QuartzPlugin implements IPlugin {
	private List<JobBean> jobs = new ArrayList<JobBean>();
	private SchedulerFactory sf;
	public static Scheduler scheduler;
	private String jobConfig;
	public static String status = "2";
	public static Log log = Log.getLog(QuartzPlugin.class);

	public QuartzPlugin(String jobConfig, String confConfig) {
		this.jobConfig = jobConfig;
	}

	public QuartzPlugin(String jobConfig) {
		this.jobConfig = jobConfig;
	}

	public QuartzPlugin() {
		this.jobConfig = "/conf/quartz.properties";
	}

	@Override
	public boolean start() {
		loadJobsFromProperties();
		loadJobsFromDb();
		startJobs();
		return true;
	}

	private void startJobs() {
		try {
			if (StrKit.notBlank(jobConfig)) {
				sf = new StdSchedulerFactory(jobConfig);
			} else {
				sf = new StdSchedulerFactory();
			}
			scheduler = sf.getScheduler();
		} catch (SchedulerException e) {
			Throwables.propagate(e);
		}
		for (JobBean entry : jobs) {
			JobUtile.addJob(scheduler, entry);
		}
		try {
			scheduler.start();
		} catch (SchedulerException e) {
			Throwables.propagate(e);
		}
	}

	/**
	 * 加载配置文件中的任务
	 */
	private void loadJobsFromProperties() {
		if (StrKit.isBlank(jobConfig)) {
			return;
		}
		String jobArray = PropKit.use(jobConfig).get("job.list");
		if (StrKit.isBlank(jobArray)) {
			return;
		}
		String[] jobArrayList = jobArray.split(",");
		for (String jobName : jobArrayList) {
			jobs.add(createJobBean(jobName));
		}
	}

	/**
	 * 加载配置数据库中的任务
	 */
	private void loadJobsFromDb() {

		List<Record> list = Db.find(Db.getSqlPara("system.task.query"));
		for (Record record : list) {
			if (status.equals(record.getStr("status"))) {
				jobs.add(createJobBean(record));
			}
		}
	}

	private JobBean createJobBean(Record record) {
		JobBean job = new JobBean();
		job.setBaenName(record.getStr("bean_name"));
		job.setJobClass(record.getStr("class_path"));
		job.setCronExpression(record.getStr("cron_expression"));
		job.setJobDesc(record.getStr("job_desc"));
		job.setStatus(record.getStr("status"));
		return job;
	}

	private JobBean createJobBean(String key) {
		JobBean job = new JobBean();
		job.setBaenName(key);
		job.setJobClass(PropKit.use(jobConfig).get(key + ".job"));
		job.setCronExpression(PropKit.use(jobConfig).get(key + ".cron"));
		job.setJobGroup(PropKit.use(jobConfig).get(key));
		job.setJobDesc(PropKit.use(jobConfig).get(key + ".desc"));
		job.setJobDesc(PropKit.use(jobConfig).get(key + ".status"));
		return job;
	}

	@Override
	public boolean stop() {
		try {
			scheduler.shutdown();
		} catch (SchedulerException e) {
			Throwables.propagate(e);
		}
		return true;
	}
}