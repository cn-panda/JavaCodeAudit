package com.ofsoft.cms.admin.controller.weixin;

import com.jfinal.weixin.sdk.api.ApiConfig;
import com.ofsoft.cms.admin.controller.system.SystemUtile;

/**
 * 微信公共配置
 *
 * @author OF
 * @date 2017年12月4日
 */
public class WeiXinConfig  {
    public static ApiConfig ac = null;
    /**
     * 是否是开发模式
     */
    private static boolean devMode = true;
    //是否是开启支付结果验证
    private static boolean checkSing = true;

    /**
     * 濑汉式线成安全
     */
    public static ApiConfig getApiConfig() {
        if (ac == null) {
            synchronized (WeiXinConfig.class) {
                if (ac == null) {
                    ac = new ApiConfig();
                    if (SystemUtile.isInstall()) {
                        // 配置微信 API 相关常量
                        ac.setToken(SystemUtile.getParam("wx_app_token"));
                        ac.setAppId(SystemUtile.getParam("wx_app_id"));
                        ac.setAppSecret(SystemUtile.getParam("wx_app_secret"));
                        ac.setEncryptMessage(SystemUtile.getParamBoolean("encryptMessage", false));
                        ac.setEncodingAesKey(SystemUtile.getParam("encodingAesKey"));
                    }
                }
            }
        }
        return ac;
    }

    public static boolean isDevMode() {
        return devMode;
    }

    public static void setDevMode(boolean devMode) {
        WeiXinConfig.devMode = devMode;
    }

    public static boolean isCheckSing() {
        return checkSing;
    }

    public static void setCheckSing(boolean checkSing) {
        WeiXinConfig.checkSing = checkSing;
    }

}
