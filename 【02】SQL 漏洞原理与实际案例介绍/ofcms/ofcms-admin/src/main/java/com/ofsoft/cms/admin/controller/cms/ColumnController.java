package com.ofsoft.cms.admin.controller.cms;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.admin.domain.TreeGird;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.ErrorCode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模板功能
 *
 * @author OF
 * @date 2018年5月16日
 */
@Action(path = "/cms/column")
public class ColumnController extends BaseController {
    /**
     * 上级编号
     */
    public static final String parent = "0";

    /**
     * 分类查询
     */
    public void query() {
        Map<String, Object> params = getParaJsonMap();
        params.put("site_id", SystemUtile.getSiteId());
        try {
            SqlPara sql = Db
                    .getSqlPara("cms.column.select_query", params);
            List<Record> list = Db.find(sql);
            rendSuccessJson(list);
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    /**
     * 分类删除
     */
    public void del() {
        Map<String, Object> params = getParaJsonMap();
        try {
            SqlPara sql = Db.getSqlPara("cms.column.delete", params);
            Db.update(sql);
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    /**
     * 模板目录
     */
    public void menu() {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("site_id", SystemUtile.getSiteId());
        List<Record> list = Db.find(Db.getSqlPara("cms.column.query", params));
        List<TreeGird> result = SystemUtile.tree(list, parent);
        rendSuccessJson(result);
    }

    public void singleDetail() {
        Map<String, Object> params = getParamsMap();
        try {
            SqlPara sql = Db.getSqlPara("cms.single.detail", params);
            Record record = Db.findFirst(sql);
            setAttr("data", record);
            render("/admin/cms/single/edit.html");
        } catch (Exception e) {
            e.printStackTrace();
            render("/admin/cms/single/edit.html");
        }
    }
}
