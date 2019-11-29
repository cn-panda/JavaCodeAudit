package com.ofsoft.cms.admin.task;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.utils.CalendarUtil;

import java.util.List;

/**
 * 站点统计任务
 */
public class SiteCountTask extends BaseTask {
	@Override
	public void task() {
		List<Record> sites =  SystemUtile.getSitCache();
		for(Record site : sites) {
			//获取今日发布数
			Record content = Db.findFirst("select count(content_id) content from of_cms_content t where date_format(t.create_time,'%Y-%m-%d') = ? and t.site_id = ?", CalendarUtil.getNowTime("yyyy-MM-dd"),site.get("site_id"));
			//获取今日访问数
			content.set("access", Db.findFirst("select count(access_id) access from of_cms_access t where  t.access_date = ?  and t.site_id = ?", CalendarUtil.getNowTime("yyyy-MM-dd"),site.get("site_id")).getInt("access"));
			//获取今日留言数
			content.set("bbs", Db.findFirst("select count(bbs_id) bbs from of_cms_bbs t where date_format(t.create_time,'%Y-%m-%d') = ? and t.site_id = ?", CalendarUtil.getNowTime("yyyy-MM-dd"),site.get("site_id")).getInt("bbs"));
			//获取今日评论数
			content.set("comment", Db.findFirst("select count(comment_id) comm from of_cms_comment t where date_format(t.create_time,'%Y-%m-%d') = ? and t.site_id = ?", CalendarUtil.getNowTime("yyyy-MM-dd"),site.get("site_id")).getInt("comm"));
			content.set("site_id",site.get("site_id"));
			content.set("count_date",CalendarUtil.getNowTime("yyyy-MM-dd"));
			//更新统计表数
			Db.update(Db.getSqlPara("cms.count.update_count", content));
		}
	}
}
