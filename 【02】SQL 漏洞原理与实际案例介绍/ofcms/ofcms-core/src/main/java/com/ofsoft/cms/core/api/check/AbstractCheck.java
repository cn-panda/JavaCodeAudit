package com.ofsoft.cms.core.api.check;

/**
 * @author OF
 * @version v1.0
 * @className AbsctorCheck
 * @date 2018/9/3
 */
public abstract class AbstractCheck {

    public abstract boolean check(String value);
    /**
     * 错误信息
     * @return String
     */
    public String errorMsg() {

        return "数据类型检验失败";
    }
}
