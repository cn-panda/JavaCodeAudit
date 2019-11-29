#sql("query")
	select  
			 job_id,
		 	 class_path,
		 	 bean_name,
		 	 job_desc,
		 	 params,
		 	 cron_expression,
		 	 create_time,
		 	 status,
		 	 remark
	from
		  of_sys_task where status != '0'
	#if (job_id?? )  and job_id = #para(job_id)#end
	#if (bean_name?? ) and bean_name = #para(bean_name)#end
	#if (sort?? && field) order by order_field order_sort  #else order by job_id desc #end
#end
 
#sql("detail")
	select 
		 	 job_id,
		 	 class_path,
		 	 bean_name,
		 	 job_desc,
		 	 params,
		 	 cron_expression,
		 	 create_time,
		 	 status,
		 	 remark
	  from
		 of_sys_task where  bean_name  = #para(bean_name)
#end
#sql("details")
	select 
		  job_id,
		 	 class_path,
		 	 bean_name,
		 	 job_desc,
		 	 params,
		 	 cron_expression,
		 	 create_time,
		 	 status,
		 	 remark
	  from
		 of_sys_task where  bean_name  = #para(0)
#end

#sql("save")
	insert into of_sys_task (
		 	 class_path, 
		 	 bean_name, 
		 	 job_desc, 
		 	 params, 
		 	 cron_expression, 
		 	 create_time, 
		 	 status, 
		 	 remark 
	) values(
		 	 #para(class_path), 
		 	 #para(bean_name), 
		 	 #para(job_desc), 
		 	 #para(params), 
		 	 #para(cron_expression), 
		 	 now(), 
		 	 '1', 
		 	 #para(remark) 
	)
#end

#sql("delete")
	delete from of_sys_task where  bean_name  = #para(bean_name)
#end

#sql("status")
	update  of_sys_task set status =#para(1) where bean_name  = #para(0)
#end

#sql("statusall")
	update  of_sys_task set status =#para(0) where status !='0'
#end

#sql("update")
	update  
		of_sys_task set
			   class_path = #para(class_path), 
			   bean_name = #para(bean_name), 
			   job_desc = #para(job_desc), 
			   params = #para(params), 
			   cron_expression = #para(cron_expression), 
			   remark = #para(remark) 
	where  job_id  = #para(job_id)
#end
 
