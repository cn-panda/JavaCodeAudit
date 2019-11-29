package com.ofsoft.cms.front.template.directive;

import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.front.template.freemarker.TagBase;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统标签
 * Created by OF on 2018/9/3.
 */
public class SystemDirective extends TagBase {

    @Override
    public void onRender() {
        Map data = SystemUtile.getParamGroup("system");
        setVariable("system", data);
        renderBody();
    }
}
