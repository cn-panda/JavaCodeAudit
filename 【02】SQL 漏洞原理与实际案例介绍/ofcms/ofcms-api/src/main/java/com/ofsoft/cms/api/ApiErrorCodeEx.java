package com.ofsoft.cms.api;

import com.ofsoft.cms.core.api.ApiErrorCode;

/**
 * 自定义业务错误码
 * @date 2018-8-27
 * @author OF
 */
public class ApiErrorCodeEx extends ApiErrorCode {
	static {
		ERROR_CODE.put("111", "系统繁忙，此时请稍候再试");
		ERROR_CODE.put("333", "处理成功");
	}
}
