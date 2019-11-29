package com.ofsoft.cms.api.v2;

import com.ofsoft.cms.api.ApiBase;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.api.check.ParamsCheck;
import com.ofsoft.cms.core.api.check.ParamsCheckType;
import com.ofsoft.cms.core.api.PostApiMapping;
import com.ofsoft.cms.core.api.check.EmailCheck;


/**
 * 就诊人接口
 *
 * @author OF
 * @date 2017年12月14日
 */
@Action(path = "/user")
public class UserApi extends ApiBase {

    /**
     * 获取就诊人列表
     */
    @PostApiMapping()
    @ParamsCheck({@ParamsCheckType(name = "user_id",checkType = EmailCheck.class), @ParamsCheckType(name = "user_name"), @ParamsCheckType(name = "user_password")})
    public void get() {
        String method = getRequest().getMethod();
        if (!"GET".equals(method)) {
            rendFailedJson("not is get method");
            return;
        }
        try {
//			List<UserFriendsInfo> list = userFriendsInfoService.queryList(
//					openId, hospNo);
            rendSuccessJson("测试");
        } catch (Exception e) {
            e.printStackTrace();
            rendFailedJson();
        }
    }
}
