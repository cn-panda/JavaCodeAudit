package com.ofsoft.cms.core.api.check;

import java.util.regex.Pattern;

/**
 * 邮箱检验
 * @author OF
 * @version v1.0
 * @className EmailCheck
 * @date 2018/8/25
 */
public class EmailCheck extends AbstractCheck {
    @Override
    public boolean check(String email) {
        return Pattern.matches("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$", email);
    }
}
