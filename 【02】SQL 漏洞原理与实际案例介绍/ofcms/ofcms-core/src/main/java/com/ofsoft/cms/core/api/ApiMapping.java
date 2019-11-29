package com.ofsoft.cms.core.api;

import java.lang.annotation.*;

@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface ApiMapping {
    //请求地址
    String url() default "";
    //是否需要验证权限 访问此接口是否有权限
    boolean isAuth() default false;
    //是否开启
    boolean isOpen() default true;
    //是否签名
    boolean isSign() default false;
    /**
     * 请求方法
     */
    RequestMethod method() default RequestMethod.ALL ;

    //每分钟最大请求
    int limit() default 100;
}