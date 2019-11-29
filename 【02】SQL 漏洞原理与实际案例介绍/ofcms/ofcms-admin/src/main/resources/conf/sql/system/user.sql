#sql("query")
	select u.*,r.role_name from of_sys_user u
	left join of_sys_user_role ur on u.user_id = ur.user_id left join of_sys_role r on ur.role_id = r.role_id
	 where u.user_id is not null 
	#if (user_id??) and u.user_id  = #para(user_id)#end
	#if (user_name??) and u.user_name like concat('%', #para(user_name), '%')#end
	#if (user_mobile??) and u.user_mobile like concat('%', #para(user_mobile), '%')#end
	#if (sort?? && field) order by order_field order_sort #end
#end
#sql("role_save")
	 insert into of_sys_user_role (role_id,user_id,create_time,status) values( #para(1), #para(0),now(),'1')
#end
#sql("role_update")
	update  of_sys_user_role set role_id = #para(role_id) where user_id = #para(user_id)
#end
#sql("detail")
	select u.*,r.role_id from of_sys_user u left join of_sys_user_role ur on u.user_id = ur.user_id left join of_sys_role r on ur.role_id = r.role_id   where u.user_id = ?
#end
#sql("delete")
  delete from of_sys_user where user_id = ?
#end
#sql("user_role")
  select u.*,r.role_id from of_sys_user u left join of_sys_user_role r on u.user_id = r.user_id where login_name = ?
#end