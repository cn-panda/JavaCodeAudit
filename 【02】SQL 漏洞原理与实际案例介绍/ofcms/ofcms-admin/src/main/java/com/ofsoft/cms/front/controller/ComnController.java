package com.ofsoft.cms.front.controller;

import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.FrontConst;
import com.ofsoft.cms.core.uitle.SiteUtile;

/**
 * 页面配置
 *
 * @author OF
 * @date 2018年1月2日
 */
@Action(path = "/comn/service")
public class ComnController extends BaseController {
    /**
     * 页面配置
     */
    public void page() {
        String p = getPara("p");
        render(FrontConst.TEMPLATE_PATE + SiteUtile.getTemplatePath() + p);
    }
}
