#sql("query")
	select  
			 site_id,
		 	 site_name,
		 	 site_path,
		 	 keywords,
		 	 domain_name,
		 	 access_protocol,
		 	 access_path,
		 	 template_name,
		 	 template_path,
		 	 is_master,
		 	 sort,
		 	 create_time,
		 	 update_time,
		 	 status,
		 	 remark
	from
		  of_cms_site where status = '1'
	#if (site_name?? ) and site_name like concat ('%',#para(site_name),'%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by site_id asc #end
#end
 
#sql("detail")
	select 
		 	 site_id,
		 	 site_name,
		 	 site_path,
		 	 keywords,
		 	 domain_name,
		 	 access_protocol,
		 	 access_path,
		 	 template_name,
		 	 template_path,
		 	 is_master,
		 	 sort,
		 	 create_time,
		 	 update_time,
		 	 status,
		 	 remark
	  from
		 of_cms_site where  site_id  = #para(site_id)
#end

#sql("save")
	insert into of_cms_site (
		 	 site_name,
		 	 site_path, 
		 	 keywords, 
		 	 domain_name, 
		 	 access_protocol, 
		 	 access_path, 
		 	 template_name, 
		 	 template_path, 
		 	 is_master, 
		 	 sort, 
		 	 create_time, 
		 	 status,
		 	 remark 
	) values(
		 	 #para(site_name),
		 	 #para(site_path), 
		 	 #para(keywords), 
		 	 #para(domain_name), 
		 	 #para(access_protocol), 
		 	 #para(access_path), 
		 	 #para(template_name), 
		 	 #para(template_path), 
		 	 #para(is_master), 
		 	 #para(sort), 
		 	 now(),
		 	 '1',
		 	 #para(remark) 
	)
#end

#sql("delete")
	delete from of_cms_site where  site_id  = #para(site_id)
#end

#sql("status")
	update  of_cms_site set status = '0'  where site_id  = #para(site_id)
#end

#sql("update")
	update  
		of_cms_site set 
			   site_name = #para(site_name),
			   site_path = #para(site_path), 
			   keywords = #para(keywords), 
			   domain_name = #para(domain_name), 
			   access_protocol = #para(access_protocol), 
			   access_path = #para(access_path), 
			   template_name = #para(template_name), 
			   template_path = #para(template_path), 
			   is_master = #para(is_master), 
			   sort = #para(sort), 
			   update_time = now(),
			   remark = #para(remark)
	where  site_id  = #para(site_id)
#end
 
