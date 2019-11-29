#sql("query")
	select  
			 form_id,
		 	 cat_id,
		 	 type,
		 	 form_name,
		 	 form_desc,
		 	 form_params,
		 	 ext_params,
		 	 create_time,
		 	 update_time,
		 	 status,
		 	 remark
	from
		  of_cms_form 
	#if (form_name?? ) where  form_name like concat ('%',#para(form_name) ,'%' )#end
	#if (sort?? && field) order by order_field order_sort  #else order by form_id desc #end
#end
 
#sql("detail")
	select 
		 	 form_id,
		 	 cat_id,
		 	 type,
		 	 form_name,
		 	 form_desc,
		 	 form_params,
		 	 ext_params,
		 	 create_time,
		 	 update_time,
		 	 status,
		 	 remark
	  from
		 of_cms_form where  form_id  = #para(form_id)
#end

#sql("save")
	insert into of_cms_form (
		 	 form_name,
		 	 form_desc, 
		 	 form_params, 
		 	 ext_params, 
		 	 create_time,
		 	 status, type,
		 	 remark 
	) values(
		 	 #para(form_name),
		 	 #para(form_desc), 
		 	 #para(form_params), 
		 	 #para(ext_params), 
		 	 now(),
		 	 #para(status),'1',
		 	 #para(remark) 
	)
#end

#sql("delete")
	delete from of_cms_form where  form_id  = #para(form_id)
#end

#sql("status")
	update  of_cms_form set status = '0'  where form_id  = #para(form_id)
#end

#sql("update")
	update  
		of_cms_form set 
			   form_name = #para(form_name),
			   form_desc = #para(form_desc), 
			   form_params = #para(form_params), 
			   ext_params = #para(ext_params), 
			   update_time = now(),
			   status = #para(status), 
			   remark = #para(remark) 
	where  form_id  = #para(form_id)
#end
 
