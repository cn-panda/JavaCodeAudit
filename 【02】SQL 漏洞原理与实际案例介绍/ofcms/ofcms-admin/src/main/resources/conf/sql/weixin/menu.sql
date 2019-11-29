#sql("query")
	select  
			 m.menu_id,
		 	 m.parent_id,
		 	 m.name,
		 	 m.type,
		 	 m.url,
		 	 m.menu_key,
		 	 m.media_id,
		 	 m.status,
		 	 m.created,wm.name parent_name,
		 	 m.updated
	from
		  of_sys_weixin_menu m
		  left join of_sys_weixin_menu wm on m.parent_id = wm.menu_id
		  where m.is_del = '1'
	#if (menu_id?? ) and  m.menu_id = #para(menu_id)#end
	#if (name?? ) and  m.name like concat('%', #para(name), '%') #end
	#if (sort?? && field) order by order_field order_sort  #else order by m.menu_id desc #end
#end
#sql("weixin_query")
	select  
			 menu_id,
		 	 parent_id,
		 	 name,
		 	 type,
		 	 url,
		 	 menu_key,
		 	 media_id,
		 	 status,
		 	 created,
		 	 updated
	from
		  of_sys_weixin_menu where is_del = '1' and status = '1' order by menu_id desc
#end
 
#sql("detail")
	select 
			 m.menu_id,
		 	 m.parent_id,
		 	 m.name,
		 	 m.type,
		 	 m.url,
		 	 m.menu_key,
		 	 m.media_id,
		 	 m.status,
		 	 m.created,wm.name parent_name,
		 	 m.updated
	from
		  of_sys_weixin_menu m
		  left join of_sys_weixin_menu wm on m.parent_id = wm.menu_id where  m.menu_id  = #para(menu_id)
#end

#sql("save")
	insert into of_sys_weixin_menu (
		 	 menu_id, 
		 	 parent_id, 
		 	 name, 
		 	 type, 
		 	 url, 
		 	 menu_key, 
		 	 media_id, 
		 	 created
	) values(
		 	 #para(menu_id), 
		 	 #para(parent_id), 
		 	 #para(name), 
		 	 #para(type), 
		 	 #para(url), 
		 	 #para(menu_key), 
		 	 #para(media_id), 
		 	 now()  
	)
#end

#sql("delete")
	delete from of_sys_weixin_menu where  menu_id  = #para(menu_id)
#end

#sql("status")
	update  of_sys_weixin_menu set is_del = '0'  where menu_id  = #para(menu_id)
#end
#sql("status_show")
	update  of_sys_weixin_menu set status = #para(status)  where menu_id  = #para(id)
#end
#sql("update")
	update  
		of_sys_weixin_menu set
			   parent_id = #para(parent_id), 
			   name = #para(name), 
			   type = #para(type), 
			   url = #para(url), 
			   menu_key = #para(menu_key), 
			   media_id = #para(media_id), 
			   updated = now() 
	where  menu_id  = #para(menu_id)
#end
 
