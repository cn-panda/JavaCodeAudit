package com.ofsoft.cms.admin.controller.cms;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.ErrorCode;
import com.ofsoft.cms.core.config.ShiroUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 内容功能
 *
 * @author OF
 * @date 2018年5月28日
 */
@Action(path = "/cms/content")
public class ContentController extends BaseController {
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
                    .getSqlPara("cms.content.query", params);
            List<Record> list = Db.find(sql);
            rendSuccessJson(list);
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    /**
     * 内容保存
     * <p> 未开启事物 </p>
     */
    public void save() {
        Map<String, Object> params = getParamsMap();
        List<Record> list = new ArrayList<Record>();
        try {
            //保存内容
            Record record = new Record();
            record.set("site_id", params.get("site_id"));
            record.set("template_path", params.get("template_path"));
            record.set("form_id", params.get("form_id"));
            record.set("title_name", params.get("title_name"));
            record.set("topic_id", MapUtils.getIntValue(params,"topic_id",0));
            record.set("column_id", params.get("column_id"));
            record.set("check_status", "1");
            record.set("create_people", ShiroUtils.getSysUser().getLoginName());
            record.set("clicks", "0");
            record.set("create_time", new Date());
            record.set("status", "1");
            Db.save("of_cms_content", "content_id",record);
            String contentId = record.getStr("content_id");
            //组装参数
            for (String key : params.keySet()) {
                list.add(new Record().set("name",key).set("value", params.get(key).toString()).set("content_id", contentId).set("form_id", params.get("form_id")));
            }
            //批量插入
            Db.batchSave("of_cms_content_field",list, list.size());
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    public void add() {
        Map<String, Object> params = getParamsMap();
        SqlPara sql = Db
                .getSqlPara("cms.field.query", params);
        List<Record> list = Db.find(sql);
        setAttr("params", params);
        setAttr("result", list);
        render("/admin/cms/content/add.html");
    }

    public void del() {
        try {
            Map<String, Object> params = getParamsMap();
            String sqlid = getPara("sqlid");
            String delkey = getPara("delkey");
            if (!StringUtils.isBlank(delkey)) {
                String id = getPara(delkey);
                String[] ids = id.split(",");
                for (int i = 0; i < ids.length; i++) {
                    params.put(delkey, ids[i]);
                    SqlPara sql = Db.getSqlPara(sqlid, params);
                    Db.update(sql);
                }
            } else {
                SqlPara sql = Db.getSqlPara(sqlid, params);
                Db.update(sql);
            }
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    public void update() {
        List<Record> list = new ArrayList<Record>();
        Map<String, Object> params = getParamsMap();
        try {
            //修改内容
            Record record = new Record();
            record.set("title_name", params.get("title_name"));
            record.set("content_id", params.get("content_id"));
            Db.update("of_cms_content", "content_id",record);
            //组装参数
            for (String key : params.keySet()) {
                list.add(new Record().set("name",key).set("value", params.get(key).toString()).set("content_id", params.get("content_id")));
            }
            //批量修改
            Db.batchUpdate("of_cms_content_field","content_id,name",list, list.size());

            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    public void detail() {
        Map<String, Object> params = getParamsMap();
        try {
           /* SqlPara sql = Db.getSqlPara(params.get("sqlid").toString(), params);
            Record record = Db.findFirst(sql);*/
            SqlPara field = Db.getSqlPara("cms.content.field_detail", params);
           List <Record> list = Db.find(field);
            setAttr("params", params);
            setAttr("result", list);
            render("/admin/cms/content/edit.html");
        } catch (Exception e) {
            e.printStackTrace();
            render("/admin/cms/content/edit.html");
        }
    }



}
