#sql("query")
	select  
			 	 bbs_id,
		 	 site_id,
		 	 title,
		 	 content,
		 	 rev_content,
		 	 mobile,
		 	 email,
		 	 qq,
		 	 clicks,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 is_check,
		 	 status,
		 	 remark
	from
		  of_cms_bbs where status = '1' and site_id = #para(site_id)
	#if (title?? ) and  title like concat ('%', #para(title),'%')#end
	#if (sort?? && field) order by order_field order_sort  #else order by bbs_id desc #end
#end
 
#sql("detail")
	select 
		 	 bbs_id,
		 	 site_id,
		 	 title,
		 	 content,
		 	 rev_content,
		 	 mobile,
		 	 email,
		 	 qq,
		 	 clicks,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 is_check,
		 	 status,
		 	 remark
	  from
		 of_cms_bbs where  bbs_id  = #para(bbs_id)
#end

#sql("save")
	insert into of_cms_bbs (
		 	 site_id,
		 	 title, 
		 	 content, 
		 	 rev_content, 
		 	 mobile, 
		 	 email, 
		 	 qq, 
		 	 clicks,
		 	 create_time,
		 	 sort,
		 	 is_check, 
		 	 status
	) values(
		 	 #para(site_id),
		 	 #para(title), 
		 	 #para(content), 
		 	 #para(rev_content), 
		 	 #para(mobile), 
		 	 #para(email), 
		 	 #para(qq), 
		 	 '1',
		 	 now(),
		 	  '1',
		 	 '0',
		   '1'
	)
#end

#sql("delete")
	delete from of_cms_bbs where  bbs_id  = #para(bbs_id)
#end

#sql("status")
	update  of_cms_bbs set status = '0'  where bbs_id  = #para(bbs_id)
#end

#sql("update")
	update  
		of_cms_bbs set 
			   title = #para(title),
			   content = #para(content), 
			   rev_content = #para(rev_content), 
			   mobile = #para(mobile), 
			   email = #para(email), 
			   qq = #para(qq), 
			   update_time =now(),
			   is_check = #para(is_check)
	where  bbs_id  = #para(bbs_id)
#end
 
#sql("list")
	select
			bbs_id,
		 	 site_id,
		 	 title,
		 	 content,
		 	 rev_content,
		 	 mobile,
		 	 email,
		 	 qq,
		 	 clicks,
		 	 create_time,
		 	 update_time,
		 	 sort,
		 	 is_check,
		 	 status,
		 	 remark
	from
		  of_cms_bbs where status = '1' and site_id = #para(site_id)  order by create_time desc
#end