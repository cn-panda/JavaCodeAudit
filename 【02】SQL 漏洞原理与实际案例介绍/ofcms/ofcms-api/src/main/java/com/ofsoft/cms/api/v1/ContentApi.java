package com.ofsoft.cms.api.v1;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.api.ApiBase;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.api.ApiMapping;
import com.ofsoft.cms.core.api.RequestMethod;
import com.ofsoft.cms.core.api.check.EmailCheck;
import com.ofsoft.cms.core.api.check.ParamsCheck;
import com.ofsoft.cms.core.api.check.ParamsCheckType;


/**
 * 内容接口
 *
 * @author OF
 * @date 2017年12月14日
 */
@Action(path = "/content")
public class ContentApi extends ApiBase {

    /**
     * 获取内容信息
     */
    @ApiMapping(method = RequestMethod.GET)
    @ParamsCheck({@ParamsCheckType(name = "content_id",isNotNull = true,checkType = EmailCheck.class), @ParamsCheckType(name = "site_id")})
    public void get() {
        try {
           Record record =  Db.findFirst(Db.getSqlPara("cms.content.detail",getParamsMap()));
            rendSuccessJson(record);
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson();
        }
    }

    /**
     * 获取内容列表
     */
    @ApiMapping(method = RequestMethod.GET)
    @ParamsCheck(@ParamsCheckType(name = "site_id"))
    public void list() {
        try {
            rendSuccessJson( Db.find(Db.getSqlPara("cms.content.query",getParamsMap())));
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson();
        }
    }

    /**
     * 保存内容信息
     */
    @ApiMapping(method = RequestMethod.POST)
    public void save() {
        try {
            rendSuccessJson("测试");
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson();
        }
    }
}
