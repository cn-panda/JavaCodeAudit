package com.ofsoft.cms.core.handler;

import com.jfinal.handler.Handler;
import com.ofsoft.cms.admin.controller.BaseController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 请求后缀名处理
 * 
 * @author OF
 * @date 2017年11月24日
 */
public class ActionHandler extends Handler {
	private String[] suffix = { ".html", ".jsp", ".json" };
    public static final String exclusions = "static/";
	// private String baseApi = "api";

	public ActionHandler(String[] suffix) {
		super();
		this.suffix = suffix;
	}

	public ActionHandler() {
		super();
	}

	@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
		/**
		 * 不包括 suffix 、以及api 地址的直接返回
		 */
		/*
		 * if (!isSuffix(target) && !"/".equals(target) &&
		 * !target.contains(baseApi)) { return; }
		 */
		//过虑静态文件
		if(target.contains(exclusions)){
			return;
		}
		target = isDisableAccess(target);
		BaseController.setRequestParams();
//		RequestSupport.setLocalRequest(request);
//		RequestSupport.setRequestParams();
		//JFinal.me().getAction(target,null);
		next.handle(target, request, response, isHandled);
	}

	private String isDisableAccess(String target) {
		for (int i = 0; i < suffix.length; i++) {
			String suffi =  getSuffix(target);
			if (suffi.contains(suffix[i])) {
				return target.replace(suffi, "");
			}
		}
		return target;
	}

	/*
	 * private boolean isSuffix(String target) { for (int i = 0; i <
	 * suffix.length; i++) { if (suffix[i].equalsIgnoreCase(getSuffix(target)))
	 * { return true; } } return false; }
	 */

	public static String getSuffix(String fileName) {
		if (fileName != null && fileName.contains(".")) {
			return fileName.substring(fileName.lastIndexOf("."));
		}
		return "";
	}
}
