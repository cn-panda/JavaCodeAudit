#sql("query")
	select  
			 topic_id,
		 	 site_id,
		 	 topic_name,
		 	 topic_url,
		 	 topic_image,
		 	 description,
		 	 topic_content_image,
		 	 topic_template,
		 	 clicks,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 is_show,
		 	 status,
		 	 remark
	from
		  of_cms_topic where status = '1' and site_id = #para(site_id)
	#if (topic_name?? )  and  topic_name like concat('%', #para(topic_name),'%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by topic_id desc #end
#end
#sql("list")
	select
			 topic_id,
		 	 topic_name
	from
		  of_cms_topic where status = '1'
		 #if (site_id?? ) and site_id = #para(site_id)#end
	#if (sort?? && field) order by order_field order_sort  #else order by topic_id desc #end
#end
 
#sql("detail")
	select 
		 	 topic_id,
		 	 site_id,
		 	 topic_name,
		 	 topic_url,
		 	 topic_image,
		 	 description,
		 	 topic_content_image,
		 	 topic_template,
		 	 clicks,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 is_show,
		 	 status,
		 	 remark
	  from
		 of_cms_topic where  topic_id  = #para(topic_id)
#end

#sql("save")
	insert into of_cms_topic (
		 	 site_id,
		 	 topic_name, 
		 	 topic_url, 
		 	 topic_image, 
		 	 description, 
		 	 topic_content_image, 
		 	 topic_template, 
		 	 clicks, 
		 	 create_time, 
		 	 sort,
		 	 is_show,
		 	 status
	) values(
		 	 #para(site_id),
		 	 #para(topic_name), 
		 	 #para(topic_url), 
		 	 #para(topic_image), 
		 	 #para(description), 
		 	 #para(topic_content_image), 
		 	 #para(topic_template), 
		 	 '0',
		 	 now(),
		 	 #para(sort),
		 	 #para(is_show),
		 	 '1'
	)
#end

#sql("delete")
	delete from of_cms_topic where  topic_id  = #para(topic_id)
#end

#sql("status")
	update  of_cms_topic set status = '0'  where topic_id  = #para(topic_id)
#end

#sql("update")
	update  
		of_cms_topic set 
			   topic_name = #para(topic_name),
			   topic_url = #para(topic_url), 
			   topic_image = #para(topic_image), 
			   description = #para(description), 
			   topic_content_image = #para(topic_content_image), 
			   topic_template = #para(topic_template), 
			   clicks = #para(clicks), 
			   update_time = now(),
			   sort = #para(sort), 
			   is_show = #para(is_show)
	where  topic_id  = #para(topic_id)
#end
 
