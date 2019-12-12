package com.lxinet.jeesns.core.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Created by zchuanzhao on 16/9/27.
 */
@Component("jeesnsConfig")
public class JeesnsConfig {
    @Value("${managePath}")
    private String managePath;
    @Value("${groupPath}")
    private String groupPath;
    @Value("${weiboPath}")
    private String weiboPath;
    @Value("${manageTemplate}")
    private String manageTemplate;
    @Value("${memberTemplate}")
    private String memberTemplate;
    @Value("${frontTemplate}")
    private String frontTemplate;
    @Value("${mobileTemplate}")
    private String mobileTemplate;

    public String getManagePath() {
        return managePath;
    }

    public String getGroupPath() {
        return groupPath;
    }

    public String getWeiboPath() {
        return weiboPath;
    }

    public String getManageTemplate() {
        return manageTemplate;
    }

    public String getMemberTemplate() {
        return memberTemplate;
    }

    public String getFrontTemplate() {
        return frontTemplate;
    }

    public String getMobileTemplate() {
        return mobileTemplate;
    }
}
