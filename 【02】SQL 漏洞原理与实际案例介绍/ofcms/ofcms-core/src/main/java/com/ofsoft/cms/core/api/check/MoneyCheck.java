package com.ofsoft.cms.core.api.check;

import java.util.regex.Pattern;

/**
 * money检验
 * @author OF
 * @version v1.0
 * @className MoneyCheck
 * @date 2018/8/25
 */
public class MoneyCheck extends AbstractCheck{

    @Override
    public boolean check(String money) {
        Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,4})?$");
        return pattern.matcher(money).matches();
    }
}
