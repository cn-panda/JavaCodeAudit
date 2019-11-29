package com.ofsoft.cms.front.template.directive;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.front.template.freemarker.TagBase;

import java.util.HashMap;
import java.util.Map;

/**
 * 公告列表标签
 * Created by OF on 2018/8/9.
 */
public class AnnounceListDirective extends TagBase {
    public static final String sqlid = "cms.announce.front_query";
    //显示记录条数默认为空显示5条
    public static  final int limit = 5;
    //默认1 页
    public static final int pageNum = 1;

    @Override
    public void onRender() {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("site_id", getParam("site_id"));
        Page<Record> page = Db.paginate(pageNum,   getParamToInt("limit", limit), Db.getSqlPara(sqlid, params));
        setVariable("announce", page.getList());
        setVariable("page",page);
        renderBody();
    }
}
