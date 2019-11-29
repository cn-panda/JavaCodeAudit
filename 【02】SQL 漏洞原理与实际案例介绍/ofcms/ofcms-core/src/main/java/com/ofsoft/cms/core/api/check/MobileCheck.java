package com.ofsoft.cms.core.api.check;

import java.util.regex.Pattern;

/**
 * 手机检验
 * @author OF
 * @version v1.0
 * @className MobileCheck
 * @date 2018/8/24
 */
public class MobileCheck extends AbstractCheck{
    @Override
    public boolean check(String value) {

          return Pattern.matches("^((13[0-9])|(15[0-3,5-9])|(18[0-9])|(17[0,6,7,8,9]))\\d{8}$", value);
    }
}
