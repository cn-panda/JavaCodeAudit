package com.ofsoft.cms.core.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;

public class WebSocketHandler extends Handler {
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {

		// 对于websocket 不交予 jfinal 处理
		if (target.indexOf("/socket") == -1) {
			next.handle(target, request, response, isHandled);
		}
	}
}
