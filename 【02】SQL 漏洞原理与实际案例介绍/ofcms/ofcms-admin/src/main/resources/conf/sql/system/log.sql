#sql("query")
	select * from of_sys_oper_log where status = '1'
    #if (oper_date??) and oper_date  = #para(oper_date)#end 
    #if (user_name??) and user_name like concat('%', #para(user_name), '%')#end 
    #if (sort?? && field) order by order_field order_sort #else order by logid desc  #end
#end
 
#sql("detail")
	select * from of_sys_oper_log where logid = #para(logid)
#end
#sql("save")
	INSERT INTO of_sys_oper_log (user_id, user_name, function_name, business_code, oper_date, oper_time, oper_desc, status)
	VALUES (#para(user_id), #para(user_name),#para(function_name),#para(business_code), now(), now(), #para(function_name), '1')
#end
#sql("delete")
	delete from of_sys_oper_log where logid = #para(logid)
#end
#sql("update")
	update  of_sys_oper_log set role_name = #para(role_name),role_type = #para(role_type),role_desc = #para(role_desc),status = #para(status) where role_id = #para(role_id)
#end