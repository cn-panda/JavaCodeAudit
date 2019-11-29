#sql("query")
	select distinct
		m.*,sm.name parent_name
	from
		of_sys_menu m
	left join of_sys_menu sm on m.parent_id = sm.menu_id where m.menu_id is not null
	#if (menu_id??) and m.menu_id  = #para(menu_id)#end
	#if (name??) and m.name like concat('%', #para(name), '%')#end
	#if (parent_name??) and m.parent_id in( select ss.menu_id from of_sys_menu ss where ss.name like concat('%', #para(parent_name), '%'))#end
	#if (sort?? && field) order by order_field order_sort #end
#end
#sql("home_query")
	select  
		m.*,sm.name parent_name
	from
		of_sys_menu m
	left join of_sys_menu sm on m.parent_id = sm.menu_id where m.status='1' order by m.order_num asc
#end
#sql("tree")
	select *  from of_sys_menu
#end

#sql("detail")
	select m.* ,sm.name parent_name from of_sys_menu m left join of_sys_menu sm on m.parent_id = sm.menu_id  where m.menu_id = #para(menu_id)
#end

#sql("save")
	insert into of_sys_menu (parent_id,name,type,url,icon, order_num,perms,status) values(#para(parent_id), #para(name), #para(type), #para(url),#para(icon),#para(order_num),#para(perms),#para(status))
#end

#sql("delete")
	delete from of_sys_menu where menu_id = #para(menu_id)
#end

#sql("update")
	update  of_sys_menu set parent_id = #para(parent_id),name = #para(name),type = #para(type),url = #para(url),icon = #para(icon),order_num = #para(order_num),perms = #para(perms),status = #para(status) where menu_id = #para(menu_id)
#end
#sql("menu")
	select  
		m.*
	from
		of_sys_menu m
#end
#sql("role_menu")
	select m.* from  of_sys_role_menu r right join of_sys_menu m on r.menu_id = m.menu_id where m.status='1'  and r.role_id= #para(0)
#end

#sql("perms_menu")
	select m.perms from of_sys_menu m
#end

#sql("sys_role_menu")
	select m.perms from  of_sys_role_menu r right join of_sys_menu m on r.menu_id = m.menu_id where r.role_id=?
#end
