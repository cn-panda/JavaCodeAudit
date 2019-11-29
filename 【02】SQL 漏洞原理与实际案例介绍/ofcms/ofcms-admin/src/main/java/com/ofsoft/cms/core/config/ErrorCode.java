package com.ofsoft.cms.core.config;

import java.util.HashMap;
import java.util.Map;

/**
 * 全局返回码
 * 
 * @author OF
 * @date 2017年12月6日
 */
public class ErrorCode {
	private static final Map<String, String> errCodeToErrMsg = new HashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("-200", "系统繁忙");
			put("200", "请求成功");
			put("3333", "网络超时!");
			put("9999", "处理失败请稍后重试!");
			put("10001", "未配置站点!");
		}
	};

	/**
	 * 通过返回码获取返回信息
	 * 
	 * @param errCode
	 *            错误码
	 * @return {String}
	 */
	public static String get(String errCode) {
		String result = errCodeToErrMsg.get(errCode);
		return result != null ? result : "未知返回码：" + errCode;
	}
	 
}
