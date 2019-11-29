package com.ofsoft.cms.admin.controller.weixin;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.ErrorCode;

import java.util.List;

/**
 * 微信默认回复
 *
 * @author OF
 * @date 2018年3月15日
 */
@Action(path = "/weixin/reply")
public class ReplyController extends BaseController {
    public final static String SUCESS_CODE = "200";
    public final static String API_URL = "/api/v1/config/init.json";

    /**
     * 首页
     */
    public void index() {
        List<Record> list = Db.find(Db.getSqlPara("system.param.query_weixin"));
        setAttr("list", list);
        render("/admin/weixin/reply/index.html");
    }

    //更新缓存
    public void config() {
        try {
            WxConfigInfo.getInstance().init();
            rendSuccessJson();
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson(ErrorCode.get("9999"));
        }
    }
}
