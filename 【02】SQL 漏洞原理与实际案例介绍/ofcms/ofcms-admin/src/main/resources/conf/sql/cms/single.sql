#sql("query")
	select  
			 column_id,
		 	 column_name,
		 	 column_english,
		 	 column_desc,
		 	 column_content,
		 	 column_image,
		 	 template_path,
		 	 title,
		 	 keywords,
		 	 description,
		 	 is_show,
		 	 sort,
		 	 create_time,
		 	 upate_time,
		 	 remark
	from
		  of_cms_column where  status = '1' and  site_id = #para(site_id) and is_open = '1'
	#if (column_name?? )  and  column_name = #para(column_name)#end
	#if (sort?? && field) order by order_field order_sort  #else order by column_id desc #end
#end
 
#sql("detail")
	select 
		 	 column_id,
		 	 site_id,
		 	 column_name,
		 	 column_english,
		 	 column_desc,
		 	 column_content,
		 	 column_image,
		 	 template_path,
		 	 content_url,
		 	 title,
		 	 keywords,
		 	 description,
		 	 sort,
		 	 status,
		 	 remark
	  from
		 of_cms_column where  column_id  = #para(column_id)
#end

#sql("save")
	insert into of_cms_column (
		 	 column_id, 
		 	 site_id, 
		 	 column_code,
		 	 up_column_id,
		 	 form_id,
		 	 column_name,
		 	 column_english,
		 	 column_desc, 
		 	 column_content, 
		 	 column_image, 
		 	 template_path, 
		 	 content_url, 
		 	 title, 
		 	 keywords, 
		 	 description, 
		 	 is_open,
		 	 is_show, 
		 	 sort, 
		 	 create_time, 
		 	 status
	) values(
		 	 #para(column_id), 
		 	 #para(site_id), 
		 	 #para(column_name),
		 	 '0',
		 	 '1',
		 	 #para(column_name),
		 	 #para(column_english),
		 	 #para(column_desc), 
		 	 #para(column_content), 
		 	 #para(column_image), 
		 	 #para(template_path), 
		 	 #para(content_url), 
		 	 #para(title), 
		 	 #para(keywords), 
		 	 #para(description), 
		 	 '1',
		 	 '2',
		 	 #para(sort), 
		 	 now(),
		 	 '1'
	)
#end

#sql("delete")
	delete from of_cms_column where  column_id  = #para(column_id)
#end

#sql("status")
	update  of_cms_column set status = '0'  where column_id  = #para(column_id)
#end

#sql("update")
	update  
		of_cms_column set 
			   column_name = #para(column_name),
			   column_english = #para(column_english), 
			   column_content = #para(column_content),
			   column_image = #para(column_image), 
			   template_path = #para(template_path), 
			   content_url = #para(content_url), 
			   title = #para(title), 
			   keywords = #para(keywords), 
			   description = #para(description), 
			   sort = #para(sort),
			   upate_time = now()
	where  column_id  = #para(column_id)
#end
 
