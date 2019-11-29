package com.ofsoft.cms.core.api;

import com.jfinal.core.Controller;

/**
 * apiInterceptor
 */
public class ApiInterceptor extends AbstractsApi {

	/**
	 * 登录验证
	 * @param controller
	 */
	@Override
	protected void isAuth(Controller controller) {

	}

	/**
	 * 是否开启ip白名单
	 * @return
	 */
	@Override
	public boolean isOpenIpCheck() {
		return true;
	}
}
