package com.ofsoft.cms.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 表注解
 * 
 * @author OF
 * @date 2017年11月24日
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.TYPE })
public @interface TableBind {

	/** 数据源 **/
	String ds() default "main";

	/** 表名 */
	String name();

	/** 主键名 */
	String pk() default "id";
}