#sql("query")
	select * from of_sys_role where status = '1'
	#if (role_id??) and role_id  = #para(role_id)#end
	#if (role_name??) and role_name like concat('%', #para(role_name), '%')#end
	#if (sort?? && field) order by order_field order_sort #end
#end
#sql("detail")
	select * from of_sys_role where role_id = #para(role_id)
#end
#sql("save")
	insert into of_sys_role (role_name,role_desc,role_type,create_time, update_time,status) values( #para(role_name), #para(role_desc), #para(role_type),now(),now(),#para(status))
#end
#sql("delete")
	delete from of_sys_role where role_id = #para(role_id)
#end
#sql("update")
	update  of_sys_role set role_name = #para(role_name),role_type = #para(role_type),role_desc = #para(role_desc),status = #para(status) where role_id = #para(role_id)
#end

#sql("delete_role_menu")
	delete from of_sys_role_menu where role_id = ?
#end
#sql("save_role_menu")
	INSERT INTO of_sys_role_menu ( role_id , menu_id ) VALUES (?, ?);
#end

#sql("role_permission")
select
	m.menu_id,'false' nocheck,m.name,m.parent_id, (
		case
		when rm.role_menu_id is null then
			'false'
		else
			'true'
		end
	) open,
	(
		case
		when rm.role_menu_id is null then
			'false'
		else
			'true'
		end
	) checked
from
	of_sys_menu m
left join of_sys_role_menu rm on m.menu_id = rm.menu_id
and rm.role_id = ?
#end