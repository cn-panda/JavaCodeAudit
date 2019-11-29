package com.ofsoft.cms.front.template.directive;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.front.template.freemarker.TagBase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 栏目标签
 * Created by OF on 2018/5/12.
 */
public class ColumnDirective extends TagBase {
    public static final String sqlid = "cms.column.front_index_column";
    /**上级编号*/
    public static final String parent = "0";
    @Override
    public void onRender() {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("site_id", getParam("site_id"));
        params.put("up_column_id", getParam("parent_id","0"));
        List <Record> list = Db.find(Db.getSqlPara(sqlid,params));
//        List<TreeGird> result = SystemUtile.ColumnTree(list,parent);
        setVariable("column", list);
        renderBody();
    }
}
