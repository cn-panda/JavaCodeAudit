#sql("query")
	select  
			 	 field_id,
		 	 form_id,
		 	 field_name,
		 	 field_desc,
		 	 field_default_value,
		 	 field_type,
		 	 field_sub_type,
		 	 field_sort,
		 	 field_regular,
		 	 field_verification,
		 	 is_disabled,
		 	 is_required,
		 	 is_print,
		 	 is_default,
		 	 status,
		 	 remark
	from
		  of_cms_field where status != '0' and form_id = #para(form_id)
	#if (field_id?? )  and   field_id = #para(field_id)#end
	#if (sort?? && field) order by order_field order_sort  #else order by field_sort asc #end
#end
 
#sql("detail")
	select 
		 	 field_id,
		 	 form_id,
		 	 field_name,
		 	 field_desc,
		 	 field_default_value,
		 	 field_type,
		 	 field_sub_type,
		 	 field_sort,
		 	 field_regular,
		 	 field_verification,
		 	 is_disabled,
		 	 is_required,
		 	 is_print,
		 	 is_default,
		 	 status,
		 	 remark
	  from
		 of_cms_field where  field_id  = #para(field_id)
#end

#sql("save")
	insert into of_cms_field (
		 	 form_id,
		 	 field_name, 
		 	 field_desc, 
		 	 field_default_value, 
		 	 field_type, 
		 	 field_sub_type, 
		 	 field_sort, 
		 	 field_regular, 
		 	 field_verification, 
		 	 is_disabled, 
		 	 is_required, 
		 	 is_print, 
		 	 is_default, 
		 	 status, 
		 	 remark 
	) values(
		 	 #para(form_id),
		 	 #para(field_name), 
		 	 #para(field_desc), 
		 	 #para(field_default_value), 
		 	 #para(field_type), 
		 	 #para(field_sub_type), 
		 	 #para(field_sort), 
		 	 #para(field_regular), 
		 	 #para(field_verification), 
		 	 #para(is_disabled), 
		 	 #para(is_required), 
		 	 #para(is_print), 
		 	 #para(is_default), 
		 	 #para(status), 
		 	 #para(remark) 
	)
#end

#sql("delete")
	delete from of_cms_field where  field_id  = #para(field_id)
#end

#sql("status")
	update  of_cms_field set status = '0'  where field_id  = #para(field_id)
#end

#sql("update")
	update  
		of_cms_field set 
			   field_name = #para(field_name),
			   field_desc = #para(field_desc), 
			   field_default_value = #para(field_default_value), 
			   field_type = #para(field_type), 
			   field_sub_type = #para(field_sub_type), 
			   field_sort = #para(field_sort), 
			   field_regular = #para(field_regular), 
			   field_verification = #para(field_verification), 
			   is_disabled = #para(is_disabled), 
			   is_required = #para(is_required), 
			   is_print = #para(is_print), 
			   is_default = #para(is_default), 
			   status = #para(status),
			   remark = #para(remark)
	where  field_id  = #para(field_id)
#end
 
