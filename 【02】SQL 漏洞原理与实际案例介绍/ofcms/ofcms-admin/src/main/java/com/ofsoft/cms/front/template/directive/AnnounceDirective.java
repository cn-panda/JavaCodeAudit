package com.ofsoft.cms.front.template.directive;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.front.template.freemarker.TagBase;

import java.util.HashMap;
import java.util.Map;

/**
 * 公告标签
 * Created by OF on 2018/8/9.
 */
public class AnnounceDirective extends TagBase {
    public static final String sqlid = "cms.announce.detail";
    @Override
    public void onRender() {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("site_id", getParam("site_id"));
        params.put("id", getParam("content_id"));
        Record  record =  Db.findFirst(Db.getSqlPara(sqlid,params));
        setVariable("announce", record);
        renderBody();
    }
}
