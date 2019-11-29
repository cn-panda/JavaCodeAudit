#sql("query")
	select  
			 	 ad_id,
		 	 site_id,
		 	 ad_name,
		 	 ad_edition,
		 	 ad_image_url,
		 	 ad_type,
		 	 ad_jump_url,
		 	 request_time,
		 	 start_date,
		 	 stop_date,
		 	 sort_order,
		 	 status,
		 	 remark
	from
		  of_cms_ad where site_id = #para(site_id)
	#if (ad_edition?? )  and  ad_edition = #para(ad_edition)#end
	#if (sort?? && field) order by order_field order_sort  #else order by sort_order desc #end
#end

#sql("front_query")
	select
			 ad_id,
		 	 site_id,
		 	 ad_name,
		 	 ad_edition,
		 	 ad_image_url,
		 	 ad_type,
		 	 ad_jump_url,
		 	 request_time,
		 	 start_date,
		 	 stop_date,
		 	 sort_order,
		 	 status,
		 	 remark
	from
		  of_cms_ad where status = '1'  and  site_id = #para(site_id)
	#if (edition?? ) and ad_edition = #para(edition)#end
	#if (sort?? && field) order by order_field order_sort  #else order by sort_order asc #end
#end

#sql("detail")
	select 
		 	 ad_id,
		 	 site_id,
		 	 ad_name,
		 	 ad_edition,
		 	 ad_image_url,
		 	 ad_type,
		 	 ad_jump_url,
		 	 request_time,
		 	 start_date,
		 	 stop_date,
		 	 sort_order,
		 	 status,
		 	 remark
	  from
		 of_cms_ad where  ad_id  = #para(ad_id)
#end

#sql("save")
	insert into of_cms_ad (
		 	 site_id,
		 	 ad_name, 
		 	 ad_edition, 
		 	 ad_image_url, 
		 	 ad_type, 
		 	 ad_jump_url, 
		 	 request_time, 
		 	 start_date, 
		 	 stop_date, 
		 	 sort_order, 
		 	 status, 
		 	 remark 
	) values(
		 	 #para(site_id),
		 	 #para(ad_name), 
		 	 #para(ad_edition), 
		 	 #para(ad_image_url), 
		 	 '1',
		 	 #para(ad_jump_url), 
		 	 now(),
		 	 now(),
		 	 #para(stop_date), 
		 	 #para(sort_order),
		 	 #para(status), 
		 	 #para(remark) 
	)
#end

#sql("delete")
	delete from of_cms_ad where  ad_id  = #para(ad_id)
#end

#sql("status")
	update  of_cms_ad set status = '0'  where ad_id  = #para(ad_id)
#end

#sql("update")
	update  
		of_cms_ad set 
			   ad_name = #para(ad_name),
			   ad_edition = #para(ad_edition), 
			   ad_image_url = #para(ad_image_url), 
			   ad_jump_url = #para(ad_jump_url),
			   request_time = #para(request_time), 
			   start_date = #para(start_date), 
			   stop_date = #para(stop_date), 
			   sort_order = #para(sort_order), 
			   status = #para(status), 
			   remark = #para(remark) 
	where  ad_id  = #para(ad_id)
#end
 
