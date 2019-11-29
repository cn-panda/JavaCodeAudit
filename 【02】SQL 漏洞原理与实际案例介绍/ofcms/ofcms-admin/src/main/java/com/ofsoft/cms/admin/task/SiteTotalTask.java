package com.ofsoft.cms.admin.task;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.utils.CalendarUtil;

import java.util.List;

public class SiteTotalTask extends BaseTask {

	@Override
	public void task( ) {
		List<Record> sites =  SystemUtile.getSitCache();
		for(Record site : sites) {
			Record record = new Record();
			record.set("site_id", site.get("site_id"));
			record.set("count_date", CalendarUtil.getNowTime("yyyy-MM-dd"));
			//判断今天是否存在.今天是否已经统计过。
			Record isStatus = Db.findFirst(Db.getSqlPara("cms.count.query",record));
			if(isStatus != null){
				continue;
			}
			record.set("count_date", CalendarUtil.getDayOffsetDate("yyyy-MM-dd",-1));
			//查询昨天数据
			Record count = Db.findFirst(Db.getSqlPara("cms.count.total_query",record));
			if(count == null){
				//为空则说明是新建的站点
				count = record ;
				count.set("day_content_count",0);
				count.set("total_content_count",0);
				count.set("total_access_count",0);
				count.set("day_access_count",0);
				count.set("day_comment_count",0);
				count.set("total_comment_count",0);
				count.set("day_bbs_count",0);
				count.set("total_bbs_count",0);
			}
			Db.update(Db.getSqlPara("cms.count.save_count", count));
		}
	}
}
