package com.ofsoft.cms.core.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

import java.util.HashSet;
import java.util.Set;

/**
 * rest Interceptor
 */
public class RestfulInterceptor implements Interceptor {
	private static final String isRestfulForwardKey = "_isRestfulForward";
	private Set<String> set = new HashSet<String>() {
		private static final long serialVersionUID = 2717581127375143508L;
		{
			add("show");
			add("save");
			add("update");
			add("delete");
		}
	};

	@Override
	public void intercept(Invocation inv) {
		 
		Controller controller = inv.getController();
		Boolean isRestfulForward = controller.getAttr(isRestfulForwardKey);
		String methodName = inv.getMethodName();
		if (set.contains(methodName) && isRestfulForward == null) {
			inv.getController().renderJson("{'code':'9999','msg':'未找到相关方法!'}");;
			return;
		}
		if (isRestfulForward != null && isRestfulForward) {
			inv.invoke();
			return;
		}
		String controllerKey = inv.getControllerKey();
		String method = controller.getRequest().getMethod().toUpperCase();
		String urlPara = controller.getPara();
		if ("GET".equals(method)) {
			if ("GET".equals(method)) {
				controller.setAttr(isRestfulForwardKey, Boolean.TRUE);
				controller.forwardAction(controllerKey + "/get/" + urlPara);
				return;
			}
		} else if ("POST".equals(method)) {
			controller.setAttr(isRestfulForwardKey, Boolean.TRUE);
			controller.forwardAction(controllerKey + "/post");
			return;
		} else if ("PUT".equals(method)) {
			controller.setAttr(isRestfulForwardKey, Boolean.TRUE);
			controller.forwardAction(controllerKey + "/put/" + urlPara);
			return;
		} else if ("DELETE".equals(method)) {
			controller.setAttr(isRestfulForwardKey, Boolean.TRUE);
			controller.forwardAction(controllerKey + "/delete/" + urlPara);
			return;
		}

		inv.invoke();
	}

}
