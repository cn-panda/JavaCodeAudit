#sql("query")
select
			t.column_id,
		 	t.site_id,
		 	t.column_code,
		 	t.up_column_id,
		 	t.form_id,f.form_name,
		 	t.column_name,
		 	t.column_english,
		 	t.template_path,
		 	t.column_desc,
		 	t.content_url,
		 	t.column_content,
		 	t.column_image,
		 	t.column_index_page,
		 	t.column_list_page,
		 	t.column_content_page,
		 	t.is_show,
		 	t.sort,
		 	t.create_time,
		 	t.upate_time,
		 	t.status,
		 	t.remark
	from
		  of_cms_column t left join of_cms_form f on t.form_id = f.form_id  where t.status = '1' and t.is_show = '1' and t.site_id = #para(site_id)
	#if (column_name?? ) and  t.column_name = #para(column_name)#end
	#if (sort?? && field) order by order_field order_sort  #else order by t.sort asc #end
#end

 #sql("select_query")
select
			t.column_id,
		 	t.site_id,
		 	t.column_code,
		 	t.up_column_id,
		 	t.form_id,
		 	t.column_name,
		 	t.remark
	from
		  of_cms_column t  where t.status = '1' and t.is_show = '1' and t.is_open != '1' and t.site_id = #para(site_id) and t.up_column_id =#para(up_column_id)
	#if (column_name?? ) and  t.column_name = #para(column_name)#end
	#if (sort?? && field) order by order_field order_sort  #else order by t.sort asc #end
#end
#sql("front_column")
select
			t.column_id,
		 	t.site_id,
		 	t.column_code,
		 	t.up_column_id,
		 	t.form_id,
		 	t.column_name,
		 	t.column_english,
		 	t.template_path,
		 	t.title,
		 	t.keywords,
		 	t.description,
		 	t.column_desc,
		 	t.content_url,
		 	t.column_content,
		 	t.column_image,
		 	t.column_index_page,
		 	t.column_list_page,
		 	t.column_content_page,
		 	t.is_show,
		 	t.is_open,
		 	t.sort,
		 	t.create_time,
		 	t.upate_time,
		 	t.status,
		 	t.remark
	from
		  of_cms_column t  where t.status = '1' and t.site_id = #para(site_id)  and t.column_english = #para(column_english)
#end

#sql("front_index_column")
select
			t.column_id,
		 	t.site_id,
		 	t.column_code,
		 	t.up_column_id,
		 	t.form_id,
		 	t.column_name,
		 	t.column_english,
		 	t.template_path,
		 	t.column_desc,
		 	t.content_url,
		 	t.column_content,
		 	t.column_image,
		 	t.column_index_page,
		 	t.column_list_page,
		 	t.column_content_page,
		 	t.is_show,
		 	t.sort,
		 	t.create_time,
		 	t.upate_time,
		 	t.status,
		 	t.remark
	from
		  of_cms_column t  where t.status = '1' and t.is_show = '1' and t.site_id = #para(site_id)
		  #if (up_column_id?? ) and  t.up_column_id = #para(up_column_id)#end

#end

#sql("detail")
	select 
		 	 column_id,
		 	 site_id,
		 	 column_code,
		 	 up_column_id,
		 	 form_id,
		 	 column_name,template_path,
		 	 column_english,
		 	 column_desc,
		 	 column_content,
		 	 column_image,
		 	 column_index_page,
		 	 column_list_page,
		 	 column_content_page,
		 	 is_show,
		 	 is_open,
		 	 sort,
		 	 create_time,
		 	 upate_time,
		 	 status,
		 	 remark
	  from
		 of_cms_column where  column_id  = #para(column_id)
#end

#sql("save")
	insert into of_cms_column (
		 	 site_id,
		 	 column_code, 
		 	 up_column_id, 
		 	 form_id,
		 	 column_name, 
		 	 column_english, 
		 	 column_desc, 
		 	 column_content, 
		 	 template_path,
		 	 column_image,
		 	 is_show,
		 	 is_open,
		 	 sort,
		 	 create_time,
		 	 status
	) values(
		 	 #para(site_id),
		 	 #para(column_name),
		 	 #para(up_column_id), 
		 	 #para(form_id),
		 	 #para(column_name), 
		 	 #para(column_english), 
		 	 #para(column_desc), 
		 	 #para(column_content), 
		 	 #para(template_path),
		 	 #para(column_image),
		 	 #para(is_show),
		 	 #para(is_open),
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
			   up_column_id = #para(up_column_id),
			   form_id = #para(form_id),
			   column_name = #para(column_name), 
			   column_english = #para(column_english), 
			   column_desc = #para(column_desc), 
			   column_content = #para(column_content), 
			   column_image = #para(column_image), 
			   template_path = #para(template_path),
			   column_content_page = #para(column_content_page),
			   is_show = #para(is_show),
			   is_open = #para(is_open),
			   sort = #para(sort),
			   upate_time = now()
	where  column_id  = #para(column_id)
#end
 
