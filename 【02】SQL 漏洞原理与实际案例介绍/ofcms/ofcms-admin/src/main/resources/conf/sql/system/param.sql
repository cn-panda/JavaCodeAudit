#sql("query")
	select  
			 	 param_id,
		 	 param_name,
		 	 param_value,
		 	 param_desc,
		 	 param_group,
		 	 param_type,
		 	 is_show,
		 	 status,
		 	 remark
	from
		  of_sys_param where status = '1'
	#if (param_id?? )  and  param_id = #para(param_id)#end
	#if (param_name??) and  param_name like concat('%', #para(param_name), '%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by param_id desc #end
#end
#sql("query_weixin")
	select  
			 param_id,
		 	 param_name,
		 	 param_value,
		 	 param_desc,
		 	 param_group,
		 	 param_type,
		 	 is_show,
		 	 status,
		 	 remark
	from
		  of_sys_param where status = '1' and param_group = 'weixin' order by param_id desc
#end
 
#sql("detail")
	select 
		 	 param_id,
		 	 param_name,
		 	 param_value,
		 	 param_desc,
		 	 param_group,
		 	 param_type,
		 	 is_show,
		 	 status,
		 	 remark
	  from
		 of_sys_param where  param_id  = #para(param_id)
#end

#sql("save")
	insert into of_sys_param (
		 	 param_name, 
		 	 param_value, 
		 	 param_desc, 
		 	 param_group, 
		 	 param_type, 
		 	 is_show, 
		 	 status, 
		 	 remark 
	) values(
		 	 #para(param_name), 
		 	 #para(param_value), 
		 	 #para(param_desc), 
		 	 #para(param_group), 
		 	 #para(param_type), 
		 	 #para(is_show), 
		 	 '1', 
		 	 #para(remark) 
	)
#end

#sql("delete")
	update  of_sys_param set status = '0'  where param_id  = #para(param_id)
#end

#sql("status")
	update  of_sys_param set status = '0'  where param_id  = #para(param_id)
#end

#sql("update")
	update  
		of_sys_param set
			   param_name = #para(param_name), 
			   param_value = #para(param_value), 
			   param_desc = #para(param_desc), 
			   param_group = #para(param_group), 
			   param_type = #para(param_type), 
			   is_show = #para(is_show), 
			   remark = #para(remark) 
	where  param_id  = #para(param_id)
#end
#sql("update_param_name")
	update
		of_sys_param set
			   param_value = #para(param_value)
	where  param_name  = #para(param_name)
#end
 
