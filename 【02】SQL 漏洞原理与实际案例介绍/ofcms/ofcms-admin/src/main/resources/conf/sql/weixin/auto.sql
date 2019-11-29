#sql("query")
	select  
			 	 id,
		 	 auto_key,
		 	 content,
		 	 status,
		 	 created,
		 	 updated
	from
		  of_sys_weixin_auto  where is_del = '1'
	#if (auto_key?? )and auto_key like concat('%', #para(auto_key), '%') #end
	#if (sort?? && field) order by order_field order_sort  #else order by id desc #end
#end
 
#sql("detail")
	select 
		 	 id,
		 	 auto_key,
		 	 content,
		 	 status,
		 	 created,
		 	 updated
	  from
		 of_sys_weixin_auto where  id  = #para(id)
#end

#sql("save")
	insert into of_sys_weixin_auto (
		 	 auto_key, 
		 	 content, 
		 	 status, 
		 	 created 
	) values(
		 	 #para(auto_key), 
		 	 #para(content), 
		 	 #para(status), 
		 	 now()
	)
#end

#sql("delete")
	delete from of_sys_weixin_auto where  id  = #para(id)
#end

#sql("status")
	update  of_sys_weixin_auto set is_del = '0'  where id  = #para(id)
#end
#sql("status_show")
	update  of_sys_weixin_auto set status = #para(status)  where id  = #para(id)
#end

#sql("update")
	update  
		of_sys_weixin_auto set
			   auto_key = #para(auto_key), 
			   content = #para(content), 
			   status = #para(status), 
			   updated = now() 
	where  id  = #para(id)
#end
 
