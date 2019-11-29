package com.ofsoft.cms.core.spring;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 依赖注入
 * 
 * <pre>
 * 增加注解注入到spring 容器
 * </pre>
 * @author OF
 * @date 2017年11月23日
 */
public class Inject {
	private Inject() {
	}

	@Inherited
	@Retention(RetentionPolicy.RUNTIME)
	@Target({ ElementType.FIELD })
	public static @interface Autowired {
	}

	@Inherited
	@Retention(RetentionPolicy.RUNTIME)
	@Target({ ElementType.FIELD })
	public static @interface Injection {
	}

	/*
	 * @Inherited
	 * 
	 * @Retention(RetentionPolicy.RUNTIME)
	 * 
	 * @Target({ElementType.FIELD}) public static @interface IGNORE {}
	 */
}
