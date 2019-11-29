#sql("query")
	select  
			 	 dict_id,
		 	 dict_name,
		 	 dict_value,
		 	 dict_desc,
		 	 dict_group,
		 	 status
	from
		  of_sys_dict where status = '1'
	#if (dict_id?? ) and  dict_id = #para(dict_id)#end
	#if (dict_group??) and  dict_group like concat('%', #para(dict_group), '%')#end
	#if (dict_name??) and  dict_name like concat('%', #para(dict_name), '%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by dict_id desc #end
#end
 
#sql("detail")
	select 
		 	 dict_id,
		 	 dict_name,
		 	 dict_value,
		 	 dict_desc,
		 	 dict_group,
		 	 status
	  from
		 of_sys_dict where  dict_id  = #para(dict_id)
#end

#sql("save")
	insert into of_sys_dict (
		 	 dict_name, 
		 	 dict_value, 
		 	 dict_desc, 
		 	 dict_group, 
		 	 status 
	) values(
		 	 #para(dict_name), 
		 	 #para(dict_value), 
		 	 #para(dict_desc), 
		 	 #para(dict_group), 
		 	 '1' 
	)
#end

#sql("delete")
	update  of_sys_dict set status = '0'  where dict_id  = #para(dict_id)
#end

#sql("status")
	update  of_sys_dict set status = '0'  where dict_id  = #para(dict_id)
#end

#sql("update")
	update  
		of_sys_dict set
			   dict_name = #para(dict_name), 
			   dict_value = #para(dict_value), 
			   dict_desc = #para(dict_desc), 
			   dict_group = #para(dict_group) 
	where  dict_id  = #para(dict_id)
#end
 
