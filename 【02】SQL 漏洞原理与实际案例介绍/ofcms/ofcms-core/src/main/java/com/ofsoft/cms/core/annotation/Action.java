package com.ofsoft.cms.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * action注解
 * 
 * @author OF
 * @date 2017年11月24日
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.TYPE, ElementType.METHOD })
public @interface Action {
	/** 对应的路径名 已/开头 */
	String path() default "/";

	/** 模板所在目录 */
	String viewPath() default "";

	/** 名称 */
	String name() default "";

	/** 系统名称 */
	String sys() default "";

	/** 模块 */
	String model() default "";

	/** 编码 5位编码 可用于绑定权限 */
	String code() default "";
}
