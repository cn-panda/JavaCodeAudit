package com.ofsoft.cms.core.spring;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import org.springframework.context.ApplicationContext;

import java.lang.reflect.Field;

/**
 * 注入拦截器
 * 
 * @author OF
 * @date 2017年11月23日
 */
public class IocInterceptor implements Interceptor {

	static ApplicationContext ctx;
	public void intercept(Invocation ai) {
		Controller controller = ai.getController();
		Field[] fields = controller.getClass().getDeclaredFields();
		for (Field field : fields) {
			Object bean = null;
			if (field.isAnnotationPresent(Inject.Injection.class))
				bean = ctx.getBean(field.getName());
			else if (field.isAnnotationPresent(Inject.Autowired.class))
				bean = ctx.getBean(field.getType());
			else
				continue;

			try {
				if (bean != null) {
					field.setAccessible(true);
					field.set(controller, bean);
				}
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}

		ai.invoke();
	}
}