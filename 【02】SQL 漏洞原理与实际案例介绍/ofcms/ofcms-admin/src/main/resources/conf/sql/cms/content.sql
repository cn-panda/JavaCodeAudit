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
		  of_cms_content t  left join of_cms_column c on t.column_id = c.column_id where t.status = '1'  and t.site_id = #para(site_id)
	#if (title_name?? ) and  t.title_name like concat ('%',#para(title_name),'%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by t.content_id desc #end
#end
 
#sql("field_detail")
select
       f.content_id,
       f.`name`,
       f.`value`,
       cf.field_id,
		 	 cf.form_id,
		 	 cf.field_name,
		 	 cf.field_desc,
		 	 cf.field_default_value,
		 	 cf.field_type,
		 	 cf.field_sub_type,
		 	 cf.field_sort,
		 	 cf.field_regular,
		 	 cf.field_verification,
		 	 cf.is_disabled,
		 	 cf.is_required,
		 	 cf.is_print,
		 	 cf.is_default,
		 	 cf.status,
		 	 cf.remark
from
	of_cms_content_field f
inner join of_cms_field cf on f.form_id = cf.form_id
and f.name = cf.field_name
where
	f.content_id = #para(content_id) order by cf.field_sort asc;
#end

#sql("content_field")
  select * from of_cms_content_field f where f.content_id = #para(content_id)
#end

#sql("list")
  select
			 t.content_id,
			 c.column_english,
		 	 t.template_path,
		 	 t.content_url,
		 	 t.title_name,
		 	 t.title_url,
		 	 t.annex,
		 	 t.clicks,
		 	 t.create_people,
		 	 t.create_time,
		 	 t.check_status,
		 	 t.remark
	from
		  of_cms_content t left join of_cms_column c on t.column_id = c.column_id where t.status = '1' and t.site_id = #para(site_id)
	#if (column_id?? ) and  t.column_id in (#(column_id)) #end
	#if (title_name?? ) and  t.title_name like concat ('%',#para(title_name),'%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by t.content_id desc #end
#end

#sql("column_name")
select
			t.column_id
	from
		  of_cms_column t  where t.status = '1' and t.site_id = #para(site_id)  and t.column_english in (#para(column_name))
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
		 	 clicks,
		 	 create_people,
		 	 create_time,
		 	 check_status,
		 	 status,
		 	 remark
	  from
		 of_cms_content where  content_id  = #para(content_id)
#end
#sql("content_save")
insert into of_cms_content_field(content_id,form_id,name,value)values(#para(content_id),#para(form_id),#para(name),#para(value))#end
#sql("save")
	insert into of_cms_content (
		 	 site_id,
		 	 column_id,
		 	 form_id, 
		 	 template_path, 
		 	 content_url,
		 	 title_name, 
		 	 title_url, 
		 	 annex, 
		 	 clicks, 
		 	 create_people, 
		 	 create_time, 
		 	 check_status, 
		 	 status, 
		 	 remark 
	) values(
		 	 #para(site_id),
		 	 #para(column_id),
		 	 #para(form_id), 
		 	 #para(template_path), 
		 	 #para(content_url),
		 	 #para(title_name), 
		 	 #para(title_url), 
		 	 #para(annex), 
		 	 '0',
		 	 #para(create_people), 
		 	 now(),
		 	 '1',
		 	 #para(status), 
		 	 #para(remark) 
	)
#end

#sql("delete")
	delete from of_cms_content where  content_id  = #para(content_id)
#end

#sql("status")
	update  of_cms_content set status = '2'  where content_id  = #para(content_id)
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
			   clicks = #para(clicks), 
			   create_people = #para(create_people), 
			   create_time = #para(create_time), 
			   check_status = #para(check_status), 
			   status = #para(status), 
			   remark = #para(remark) 
	where  content_id  = #para(content_id)
#end
#sql("front_update")
	update
		of_cms_content set
			   clicks = (clicks + 1)
	where  content_id  = #para(content_id)
#end
 
