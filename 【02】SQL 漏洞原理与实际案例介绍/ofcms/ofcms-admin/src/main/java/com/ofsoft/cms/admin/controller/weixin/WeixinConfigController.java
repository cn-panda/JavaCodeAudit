package com.ofsoft.cms.admin.controller.weixin;

import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.annotation.Action;

import java.util.Map;

/**
 * 微信配置
 *
 * @author OF
 * @date 2018年8月23日
 */
@Action(path = "/weixin/config")
public class WeixinConfigController extends BaseController {
    public void index() {
        setAttr("data", SystemUtile.getParamGroup("weixin_config" ));
        render("/admin/weixin/config/index.html");
    }

    public void detail() {
        rendSuccessJson(SystemUtile.getParamGroup("weixin_config"));
    }

    public void update() {
        Map<String, Object> params = getParamsMap();
        for (String key : params.keySet()) {
            SystemUtile.setParam(key, params.get(key).toString());
        }
        SystemUtile.initParam();
        rendSuccessJson();
    }
}
