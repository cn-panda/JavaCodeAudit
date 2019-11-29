package com.ofsoft.cms.core.api;

import java.util.HashMap;
import java.util.Map;

/**
 * 微信错误码
 * 
 * @author OF
 */
public   class ApiErrorCode {

	/**
	 * 全局返回码说明
	 */
	protected final static Map<String, String> ERROR_CODE = new HashMap<String, String>();
	static {
		ERROR_CODE.put("-1", "系统繁忙,请稍候再试!");
		ERROR_CODE.put("1001", "校验参数不正确");
		ERROR_CODE.put("1002", "不允许此方法访问");
		ERROR_CODE.put("1003", "未找到验证策略");
		ERROR_CODE.put("1004", "不允许此IP访问");
		ERROR_CODE.put("200", "处理成功");
	}

	public static final  String ERROR_CODE_1001 = "1001";
	public static final  String ERROR_CODE_1002 = "1002";
	public static final  String ERROR_CODE_1003 = "1003";
	public static final  String ERROR_CODE_1004 = "1004";
	/**
	 * 通过返回码获取返回信息
	 * 
	 * @param errCode
	 *            错误码
	 * @return {String}
	 */
	public static String getErrCode(String errCode) {
		String result = ERROR_CODE.get(errCode);
		return result != null ? result : "未知返回码：" + errCode;
	}
}
