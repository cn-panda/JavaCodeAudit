#sql("query")
select table_name, engine, table_comment, create_time from information_schema.tables 
	where table_schema = (select database()) 
	#if (table_name??) and table_name = #para(table_name)  #end
	#if (sort?? && field) order by order_field order_sort #end
#end
 
#sql("column")
select column_name, data_type, column_comment, column_key, extra from information_schema.columns 
	  where table_schema = (select database()) 
	  #if (table_name??) and table_name = #para(table_name)  #end
	  order by ordinal_position 
#end
