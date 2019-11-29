package com.ofsoft.cms.core.api.check;

/**
 * 默认不检验
 * @author OF
 * @version v1.0
 * @className EmailCheck
 * @date 2018/8/25
 */
public class DefaultCheck extends AbstractCheck {
    @Override
    public boolean check(String value) {
        return true;
    }
}
