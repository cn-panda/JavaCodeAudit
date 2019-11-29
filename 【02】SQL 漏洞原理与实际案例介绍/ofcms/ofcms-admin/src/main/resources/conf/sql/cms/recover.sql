#sql("query")
	select  
			 t.content_id,
		 	 t.content_code,
		 	 t.site_id,
		 	 t.column_id,c.column_name,
		 	 t.form_id,
		 	 t.template_path,
		 	 t.content_url,
		 	 t.title_name,
		 	 t.title_url,
		 	 t.annex,
		 	 t.clicks,
		 	 t.create_people,
		 	 t.create_time,
		 	 t.check_status,
		 	 t.status,
		 	 t.remark
	from
		  of_cms_content t  left join of_cms_column c on t.column_id = c.column_id where t.status = '2' and t.site_id = #para(site_id)
	#if (title_name?? ) and  t.title_name like concat ('%',#para(title_name),'%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by t.content_id desc #end
#end
 
#sql("detail")
	select 
		 	 content_id,
		 	 content_code,
		 	 site_id,
		 	 column_id,
		 	 form_id,
		 	 template_path,
		 	 content_url,
		 	 title_name,
		 	 title_url,
		 	 annex,
		 	 title,
		 	 keywords,
		 	 description,
		 	 tag,
		 	 is_recommend,
		 	 is_top,
		 	 is_show,
		 	 clicks,
		 	 create_people,
		 	 create_time,
		 	 update_time,
		 	 check_status,
		 	 status,
		 	 remark
	  from
		 of_cms_content where  content_id  = #para(content_id)
#end

#sql("save")
	insert into of_cms_content (
		 	 content_id, 
		 	 content_code, 
		 	 site_id, 
		 	 column_id, 
		 	 form_id, 
		 	 template_path, 
		 	 content_url, 
		 	 title_name, 
		 	 title_url, 
		 	 annex, 
		 	 title, 
		 	 keywords, 
		 	 description, 
		 	 tag, 
		 	 is_recommend, 
		 	 is_top, 
		 	 is_show, 
		 	 clicks, 
		 	 create_people, 
		 	 create_time, 
		 	 update_time, 
		 	 check_status, 
		 	 status, 
		 	 remark 
	) values(
		 	 #para(content_id), 
		 	 #para(content_code), 
		 	 #para(site_id), 
		 	 #para(column_id), 
		 	 #para(form_id), 
		 	 #para(template_path), 
		 	 #para(content_url), 
		 	 #para(title_name), 
		 	 #para(title_url), 
		 	 #para(annex), 
		 	 #para(title), 
		 	 #para(keywords), 
		 	 #para(description), 
		 	 #para(tag), 
		 	 #para(is_recommend), 
		 	 #para(is_top), 
		 	 #para(is_show), 
		 	 #para(clicks), 
		 	 #para(create_people), 
		 	 #para(create_time), 
		 	 #para(update_time), 
		 	 #para(check_status), 
		 	 #para(status), 
		 	 #para(remark) 
	)
#end

#sql("delete")
	delete from of_cms_content where  content_id  = #para(content_id)
#end

#sql("status")
	update  of_cms_content set status = '0'  where content_id  = #para(content_id)
#end
#sql("restore")
	update  of_cms_content set status = '1'  where content_id  = #para(content_id)
#end

#sql("update")
	update  
		of_cms_content set 
			   content_id = #para(content_id), 
			   content_code = #para(content_code), 
			   site_id = #para(site_id), 
			   column_id = #para(column_id), 
			   form_id = #para(form_id), 
			   template_path = #para(template_path), 
			   content_url = #para(content_url), 
			   title_name = #para(title_name), 
			   title_url = #para(title_url), 
			   annex = #para(annex), 
			   title = #para(title), 
			   keywords = #para(keywords), 
			   description = #para(description), 
			   tag = #para(tag), 
			   is_recommend = #para(is_recommend), 
			   is_top = #para(is_top), 
			   is_show = #para(is_show), 
			   clicks = #para(clicks), 
			   create_people = #para(create_people), 
			   create_time = #para(create_time), 
			   update_time = #para(update_time), 
			   check_status = #para(check_status), 
			   status = #para(status), 
			   remark = #para(remark) 
	where  content_id  = #para(content_id)
#end
 
