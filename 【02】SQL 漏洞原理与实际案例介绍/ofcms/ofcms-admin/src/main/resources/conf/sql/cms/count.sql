#sql("query")
	select  
			 id,
		 	 site_id,
		 	 day_content_count,
		 	 total_content_count,
		 	 day_access_count,
		 	 total_access_count,
		 	 day_comment_count,
		 	 total_comment_count,
		 	 day_bbs_count,
		 	 total_bbs_count,
		 	 count_date
	from
		  of_cms_count where   site_id = #para(site_id) and count_date = #para(count_date)
#end
#sql("list")
select
			 id,
		 	 site_id,
		 	 day_content_count,
		 	 total_content_count,
		 	 day_access_count,
		 	 total_access_count,
		 	 day_comment_count,
		 	 total_comment_count,
		 	 day_bbs_count,
		 	 total_bbs_count,
		 	 count_date,create_time
	from
		  of_cms_count where   site_id = #para(site_id)
		 #if (count_date?? ) and count_date = #para(count_date)#end
	#if (sort?? && field) order by order_field order_sort  #else order by id desc #end
#end

#sql("save_access")
	insert into of_cms_access (
		 	 site_id,
		 	 access_ip,
		 	 access_entry_page,
		 	 access_last_page,
		 	 access_date,
		 	 access_time,
		 	 access_source,
		 	 access_keyword
	) values(
		 	 #para(site_id),
		 	 #para(access_ip),
		 	 #para(access_entry_page),
		 	 #para(access_last_page),
		 	 curdate(),
		 	 curtime(),
		 	 #para(access_referer),
		 	 #para(user_agent)
	)
#end
#sql("save_count")
	insert into of_cms_count (
		 	 site_id,
		 	 total_content_count,
		 	 total_access_count,
		 	 total_comment_count,
		 	 total_bbs_count,
		 	 day_content_count,
		 	 day_access_count,
		 	 day_comment_count,
		 	 day_bbs_count,
		 	 create_time,
		 	 count_time,
		 	 count_date
	) values(
	     #para(site_id),
		 	 #para(day_content_count+total_content_count),
		 	 #para(day_access_count+total_access_count),
		 	 #para(day_comment_count+total_comment_count),
		 	 #para(day_bbs_count+total_bbs_count),
		 	 0,
		 	 0,
		 	 0,
		 	 0,
		 	 now(),
		 	 curtime(),
		 	 curdate()
	)
#end

#sql("update_count")
  update of_cms_count
  set day_content_count =#para(content),
      day_access_count =#para(access),
      day_comment_count =#para(comment),
      day_bbs_count = #para(bbs)
  where site_id = #para(site_id) and count_date = #para(count_date)
#end
#sql("update_total_count")
  update of_cms_count
  set total_content_count = (total_content_count+day_content_count),
      total_access_count = (total_access_count+day_access_count),
      total_comment_count = (total_comment_count+day_comment_count),
      total_bbs_count = (total_bbs_count+day_bbs_count),
      day_content_count =0,
      day_access_count =0,
      day_comment_count =0,
      day_bbs_count = 0
  where site_id = #para(site_id) and count_date = #para(count_date)
#end
#sql("total_query")
	select
			 id,
		 	 site_id,
		 	 day_content_count,
		 	 total_content_count,
		 	 day_access_count,
		 	 total_access_count,
		 	 day_comment_count,
		 	 total_comment_count,
		 	 day_bbs_count,
		 	 total_bbs_count,
		 	 count_date
	from
		  of_cms_count where   site_id = #para(site_id) order by count_date desc limit 1
#end

#sql("index_query")
  select * from of_cms_count where date_sub(curdate(), INTERVAL 7 DAY) <= count_date and site_id=#para(site_id)
#end
