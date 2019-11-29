package com.ofsoft.cms.api.v1;

import com.jfinal.plugin.activerecord.Db;
import com.ofsoft.cms.api.ApiBase;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.api.ApiMapping;
import com.ofsoft.cms.core.api.RequestMethod;
import com.ofsoft.cms.core.api.check.NumberCheck;
import com.ofsoft.cms.core.api.check.ParamsCheck;
import com.ofsoft.cms.core.api.check.ParamsCheckType;


/**
 * 内容接口
 *
 * @author OF
 * @date 2018年9月4日
 */
@Action(path = "/bbs")
public class BbsApi extends ApiBase {
    /**
     * 获取内容信息
     */
    @ApiMapping(method = RequestMethod.POST)
    @ParamsCheck({@ParamsCheckType(name = "content"), @ParamsCheckType(name = "site_id",checkType = NumberCheck.class)})
    public void save() {
        try {
           Db.update(Db.getSqlPara("cms.bbs.save",getParamsMap()));
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson();
        }
    }

}
