#sql("query")
	select  
			 	 id,
		 	 title,
		 	 content,
		 	 type,
		 	 user_id,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 remark,
		 	 status
	from
		  of_sys_announce where status = '1'
	#if (id?? ) and  id = #para(id)#end
	#if (title??) and  title like concat('%', #para(title), '%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by id desc #end
#end
 
#sql("detail")
	select 
		 	 id,
		 	 title,
		 	 content,
		 	 type,
		 	 user_id,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 remark,
		 	 status
	  from
		 of_sys_announce where  id  = #para(id)
#end

#sql("save")
	insert into of_sys_announce (
		 	 title, 
		 	 content, 
		 	 type, 
		 	 user_id, 
		 	 create_time, 
		 	 sort, 
		 	 remark, 
		 	 status 
	) values(
		 	 #para(title), 
		 	 #para(content), 
		 	 #para(type), 
		 	 #para(user_id), 
		 	 now(), 
		 	 #para(sort), 
		 	 #para(remark), 
		 	 '1' 
	)
#end

#sql("delete")
	delete from of_sys_announce where  id  = #para(id)
#end

#sql("status")
	update  of_sys_announce set status = '0'  where id  = #para(id)
#end

#sql("update")
	update  
		of_sys_announce set
			   title = #para(title), 
			   content = #para(content), 
			   type = #para(type), 
			   user_id = #para(user_id), 
			   update_time = now(), 
			   sort = #para(sort), 
			   remark = #para(remark) 
	where  id  = #para(id)
#end
 
