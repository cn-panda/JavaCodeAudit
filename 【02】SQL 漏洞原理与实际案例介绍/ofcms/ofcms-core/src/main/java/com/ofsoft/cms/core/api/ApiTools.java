package com.ofsoft.cms.core.api;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author OF
 * @version v1.0
 * @className ApiTools
 * @date 2018/8/25
 */
public class ApiTools {

    public static boolean isMobile(String mobile)
    {
        return Pattern.matches("^((13[0-9])|(15[0-3,5-9])|(18[0-9])|(17[0,6,7,8,9]))\\d{8}$", mobile);
    }

    public static boolean isNumber(String number)
    {
        return Pattern.matches("^[1-9][0-9]\\d*$", number);
    }

    public static boolean isTelephone(String phoneNumber)
    {
        String phone = "0\\d{2,3}-\\d{7,8}";
        Pattern p = Pattern.compile(phone);
        Matcher m = p.matcher(phoneNumber);
        return m.matches();
    }

    public static boolean isMoney(String money)
    {
        Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,4})?$");
        return pattern.matcher(money).matches();
    }

    public static boolean isEmail(String email)
    {
        return Pattern.matches("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$", email);
    }
}
