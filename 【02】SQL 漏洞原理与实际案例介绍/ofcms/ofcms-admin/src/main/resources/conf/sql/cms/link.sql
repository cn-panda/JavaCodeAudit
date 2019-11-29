#sql("query")
	select  
			 link_id,
		 	 site_id,
		 	 link_name,
		 	 link_url,
		 	 link_image,
		 	 clicks,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 is_show,
		 	 status,
		 	 remark
	from
		  of_cms_link where status = '1' and site_id = #para(site_id)
	#if (link_name?? ) and link_name like concat ('%',#para(link_name),'%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by link_id desc #end
#end
 
#sql("detail")
	select 
		 	 link_id,
		 	 site_id,
		 	 link_name,
		 	 link_url,
		 	 link_image,
		 	 clicks,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 is_show,
		 	 status,
		 	 remark
	  from
		 of_cms_link where  link_id  = #para(link_id)
#end

#sql("save")
	insert into of_cms_link (
		 	 site_id,
		 	 link_name, 
		 	 link_url, 
		 	 link_image, 
		 	 clicks, 
		 	 create_time, 
		 	 sort,
		 	 is_show,
		 	 status, 
		 	 remark 
	) values(
		 	 #para(site_id),
		 	 #para(link_name), 
		 	 #para(link_url), 
		 	 #para(link_image), 
		 	 #para(clicks), 
		 	 now(),
		 	 #para(sort),
		 	 #para(is_show),
		 	 '1',
		 	 #para(remark) 
	)
#end

#sql("delete")
	delete from of_cms_link where  link_id  = #para(link_id)
#end

#sql("status")
	update  of_cms_link set status = '0'  where link_id  = #para(link_id)
#end

#sql("update")
	update  
		of_cms_link set 
			   link_name = #para(link_name),
			   link_url = #para(link_url), 
			   link_image = #para(link_image), 
			   clicks = #para(clicks), 
			   update_time = now(),
			   sort = #para(sort), 
			   is_show = #para(is_show),
			   remark = #para(remark)
	where  link_id  = #para(link_id)
#end
 
