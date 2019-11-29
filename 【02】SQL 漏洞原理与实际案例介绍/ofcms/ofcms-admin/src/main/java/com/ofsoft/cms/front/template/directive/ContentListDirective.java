package com.ofsoft.cms.front.template.directive;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.ofsoft.cms.front.template.freemarker.TagBase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 内容列表标签
 * Created by OF on 2018/5/12.
 */
public class ContentListDirective extends TagBase {
    public static final String SQL_ID = "cms.content.list";
    public static final String CONTENT = "cms.content.content_field";
    public static final String COLUMN = "cms.content.column_name";
    //显示记录条数默认为空显示5条
    public static final int limit = 5;
    //默认1 页
    public static final int pageNum = 1;

    @Override
    public void onRender() {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("site_id", getParam("site_id"));
        params.put("column_id", getParam("column_id"));
        if (getParam("column_name") != null) {
            params.put("column_name", getParam("column_name"));
            List<Record> records = Db.find(Db.getSqlPara(COLUMN, params));
            if (records.size() > 0) {
                StringBuilder sb = new StringBuilder();
                for (Record record : records) {
                    sb.append(record.getInt("column_id")).append(",");
                }
                params.put("column_id", sb.delete(sb.lastIndexOf(","), sb.length()).toString());
            }
        }
        SqlPara sql = Db.getSqlPara(SQL_ID, params);
        Page<Record> page = Db.paginate(getPageNum(), getParamToInt("limit", limit), sql);
        List<Record> list = page.getList();
        if(list.size() >0) {
            for (Record record : list) {
                params.put("content_id", record.get("content_id"));
                record.set("url",record.get("column_english")+"-c-"+record.get("content_id")+".html");
                List<Record> sub = Db.find(Db.getSqlPara(CONTENT, params));
                for (int i = 0; i < sub.size(); i++) {
                    record.set(sub.get(i).getStr("name"), sub.get(i).getStr("value"));
                }
            }
            setVariable("content_list", list);
            setVariable("page", page);
        }
        renderBody();
    }
}
