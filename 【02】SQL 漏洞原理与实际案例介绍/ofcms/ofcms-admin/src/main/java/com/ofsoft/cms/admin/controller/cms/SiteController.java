package com.ofsoft.cms.admin.controller.cms;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.ErrorCode;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 站点设置
 *
 * @author OF
 * @date 2018年7月24日
 */
@Action(path = "/cms/site")
public class SiteController extends BaseController {
    public void update() {
        List<Record> list = new ArrayList<Record>();
        Map<String, Object> params = getParamsMap();
        try {
            Db.update(Db.getSqlPara("cms.site.update",params));
            SystemUtile.initSite();
            SystemUtile.setSite(SystemUtile.getSiteId());
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }


}
