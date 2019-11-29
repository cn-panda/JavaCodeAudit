package com.ofsoft.cms.core.plugin.quartz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.quartz.*;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Record;

/**
 * 任务工具
 * 
 * @author OF
 * @date 2018年1月23日
 */
public class JobUtile {
	public static Log log = Log.getLog(JobUtile.class);
	public static String formart = "yyyy-MM-dd HH:mm:ss";
	public static String basePath = "com.ofsoft.cms.admin.task.";
	private final static String JOB_NAME = "TASK_";

	/**
	 * 获取触发器key
	 */
	public static TriggerKey getTriggerKey(String beanName) {
		return TriggerKey.triggerKey(JOB_NAME + beanName);
	}

	/**
	 * 获取jobKey
	 */
	public static JobKey getJobKey(String beanName) {
		return JobKey.jobKey(JOB_NAME + beanName);
	}

	/**
	 * 获取表达式触发器
	 */
	public static CronTrigger getCronTrigger(Scheduler scheduler,
			String beanName) {
		try {
			return (CronTrigger) scheduler.getTrigger(getTriggerKey(beanName));
		} catch (SchedulerException e) {
			// throw new RRException("获取定时任务CronTrigger出现异常", e);
		}
		return null;
	}

	/**
	 * 增加任务
	 * 
	 * @param scheduler
	 *            调度器
	 * @param job
	 *            任务实例
	 */
	public static void addJob(Scheduler scheduler, JobBean job) {
		try {
			TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobDesc(),
					job.getJobGroup());
			// 触发器
			CronTrigger trigger = (CronTrigger) scheduler
					.getTrigger(triggerKey);
			// 不存在，创建一个
			if (null == trigger) {
				@SuppressWarnings("unchecked")
				Class<Job> j2 = (Class<Job>) Class
						.forName(job.getJobClass() == null
								|| "".equals(job.getJobClass()) ? basePath
								+ job.getBaenName() : job.getJobClass());
				JobDetail jobDetail = JobBuilder.newJob(j2)
						.withIdentity(getJobKey(job.getBaenName())).build();
				jobDetail.getJobDataMap().put("scheduleJob", job);
				CronScheduleBuilder  scheduleBuilder = CronScheduleBuilder.cronSchedule(job
							.getCronExpression());
				// 按新的cronExpression表达式构建一个新的trigger
				trigger = TriggerBuilder.newTrigger()
						.withIdentity(getTriggerKey(job.getBaenName()))
						.withSchedule(scheduleBuilder).build();
				try {
					scheduler.scheduleJob(jobDetail, trigger);
				} catch (ObjectAlreadyExistsException e) {
					throw new RuntimeException("任务已经启动!");
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
			} else {
				// Trigger已存在，那么更新相应的定时设置
				// 表达式调度构建器
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
						.cronSchedule(job.getCronExpression());

				// 按新的cronExpression表达式重新构建trigger
				trigger = trigger.getTriggerBuilder().withIdentity(triggerKey)
						.withSchedule(scheduleBuilder).build();

				// 按新的trigger重新设置job执行
				scheduler.rescheduleJob(triggerKey, trigger);
			}
		} catch (ClassNotFoundException e) {
			log.error("task not class :" + job.getJobClass());
			throw new RuntimeException("找不到 "+e.getMessage());
		} catch (Exception e) {
			log.error("task error :" + e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}

	/**
	 * 更新定时任务
	 */
	public static void updateJob(Scheduler scheduler, JobBean jobBean) {
		try {
			TriggerKey triggerKey = getTriggerKey(jobBean.getBaenName());

			// 表达式调度构建器
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
					.cronSchedule(jobBean.getCronExpression())
					.withMisfireHandlingInstructionDoNothing();

			CronTrigger trigger = getCronTrigger(scheduler,
					jobBean.getBaenName());

			// 按新的cronExpression表达式重新构建trigger
			trigger = trigger.getTriggerBuilder().withIdentity(triggerKey)
					.withSchedule(scheduleBuilder).build();

			// 参数
			trigger.getJobDataMap().put(jobBean.getJobDesc(), jobBean);

			scheduler.rescheduleJob(triggerKey, trigger);

			// 暂停任务
			// if(scheduleJob.getStatus() == ScheduleStatus.PAUSE.getValue()){
			// pauseJob(scheduler, scheduleJob.getJobId());
			// }

		} catch (SchedulerException e) {
			 throw new RuntimeException("更新定时任务失败", e);
		}
	}

	/**
	 * 暂停任务
	 */
	public static void pauseJob(Scheduler scheduler, String beanName) {
		try {
			scheduler.pauseJob(getJobKey(beanName));
		} catch (SchedulerException e) {
			e.printStackTrace();
			 throw new RuntimeException("暂停定时任务失败", e);
		}
	}

	/**
	 * 恢复任务
	 */
	public static void resumeJob(Scheduler scheduler, String beanName) {
		try {
			scheduler.resumeJob(getJobKey(beanName));
		} catch (SchedulerException e) {
			  throw new RuntimeException("恢复定时任务失败", e);
		}
	}

	/**
	 * 立即执行任务
	 */
	public static void run(Scheduler scheduler, String beanName) {
		try {
			scheduler.triggerJob(getJobKey(beanName));
		} catch (SchedulerException e) {
			e.printStackTrace();
			throw new RuntimeException("立即执行定时任务失败、任务未启动");
		}
	}

	/**
	 * 启动
	 */
	public static void startTask(Scheduler scheduler, JobBean job) {
		job.setStatus("2");
		addJob(scheduler, job);
	}

	/**
	 * 删除定时任务
	 */
	public static void deleteJob(Scheduler scheduler, String beanName) {
		try {
			scheduler.deleteJob(getJobKey(beanName));
		} catch (SchedulerException e) {
			e.printStackTrace();
//			 throw new RuntimeException("删除定时任务失败", e);
		}
	}

	/**
	 * 关闭所有定时任务
	 * 
	 * @param sched
	 *            调度器
	 */
	public static void shutdownJobs(Scheduler scheduler) {
		try {
			if (!scheduler.isShutdown()) {
				scheduler.shutdown();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 启动所有定时任务
	 * 
	 * @param sched
	 *            调度器
	 */
	public static void startJobs(Scheduler scheduler) {
		try {
			scheduler.start();
		} catch (Exception e) {
			throw new RuntimeException("启动全部定时任务失败："+e.getMessage());
		}
	}

	/**
	 * 时间转表达式
	 * 
	 * @param date
	 *            时间
	 * @return cron
	 */
	public static String formaterCronExpression(String date) {
		SimpleDateFormat format = new SimpleDateFormat(formart.substring(0,
				date.length() - 1));
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy MM dd HH mm ss");
		try {
			Date d = format.parse(date);
			date = format2.format(d);
			String[] dateArry = date.split(" ");
			String exp = dateArry[5] + " " + dateArry[4] + " " + dateArry[3]
					+ " " + dateArry[2] + " " + dateArry[1] + " ? "
					+ dateArry[0];
			return exp;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}

	public static JobBean createJobBean(Map<String, Object> record) {
		JobBean job = new JobBean();
		job.setBaenName(record.get("bean_name").toString());
		job.setJobClass(record.get("class_path").toString());
		job.setCronExpression(record.get("cron_expression").toString());
		job.setJobDesc(record.get("job_desc").toString());
		return job;
	}

	public static JobBean createJobBean(Record record) {
		JobBean job = new JobBean();
		job.setBaenName(record.getStr("bean_name"));
		job.setJobClass(record.getStr("class_path"));
		job.setCronExpression(record.getStr("cron_expression"));
		job.setJobDesc(record.getStr("job_desc"));
		job.setStatus(record.getStr("status"));
		return job;
	}

	public static void main(String[] args) {
		/*
		 * JobBean job = new JobBean();
		 * job.setJobClass("com.momoda.quartz.DakeTaskJob");
		 * job.setCronExpression
		 * (formaterCronExpression(task.getStr("closingTime")));
		 * job.setJobGroup("DakeTaskJob"); job.setJobDesc("DakeTaskJob_" +
		 * taskid); QuartzPlugin.addJob(job);
		 */
	}
}
