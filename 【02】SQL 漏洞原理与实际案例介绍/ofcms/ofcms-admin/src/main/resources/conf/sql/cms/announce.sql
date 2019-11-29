#sql("query")
	select  
			 	 id,
		 	 site_id,
		 	 title,
		 	 content,
		 	 type,
		 	 user_id,
		 	 release_terminal,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 remark,
		 	 status
	from
		  of_cms_announce where  status = '1' and  site_id = #para(site_id)
	#if (title?? ) and title like concat ('%',#para(title),'%' )#end
	#if (sort?? && field) order by order_field order_sort  #else order by id desc #end
#end

#sql("front_query")
	select
			 id,
		 	 title,
		 	 content,
		 	 type,
		 	 release_terminal,
		 	 create_time,
		 	 update_time
	from
		  of_cms_announce where  status = '1' and  site_id = #para(site_id)  order by sort desc , create_time desc
#end

#sql("detail")
	select 
		 	 id,
		 	 site_id,
		 	 title,
		 	 content,
		 	 type,
		 	 user_id,
		 	 release_terminal,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 remark,
		 	 status
	  from
		 of_cms_announce where  id  = #para(id)
#end

#sql("save")
	insert into of_cms_announce (
		 	 site_id,
		 	 title, 
		 	 content, 
		 	 type, 
		 	 user_id, 
		 	 release_terminal, 
		 	 create_time, 
		 	 sort,
		 	 status
	) values(
		 	 #para(site_id),
		 	 #para(title), 
		 	 #para(content), 
		 	 #para(type), 
		 	 #para(user_id), 
		 	 '1',
		 	 now(),
		 	 #para(sort),
		 	 '1'
	)
#end

#sql("delete")
	delete from of_cms_announce where  id  = #para(id)
#end

#sql("status")
	update  of_cms_announce set status = '0'  where id  = #para(id)
#end

#sql("update")
	update  
		of_cms_announce set 
			   title = #para(title),
			   content = #para(content), 
			   type = #para(type), 
			   user_id = #para(user_id), 
			   update_time = now(),
			   sort = #para(sort)
	where  id  = #para(id)
#end
 
