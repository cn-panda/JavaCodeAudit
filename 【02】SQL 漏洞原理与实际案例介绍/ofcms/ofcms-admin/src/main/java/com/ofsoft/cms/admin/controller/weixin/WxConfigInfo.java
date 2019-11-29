package com.ofsoft.cms.admin.controller.weixin;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 微信默认回复配置信息
 * 
 * @author OF
 * @date 2018年3月16日
 */
public final class WxConfigInfo {
	private static WxConfigInfo me = new WxConfigInfo();
	private static List<Record> list = null;
	private static Map<String, Object> info = new HashMap<String, Object>();

	private WxConfigInfo() {

	}

	public static WxConfigInfo getInstance() {
		return me;
	}

	/**
	 * 初始化内容到内存中
	 */
	public void init() {
		list = Db
				.find("select param_id, param_name, param_value, param_desc, param_group, param_type, is_show, status, remark from of_sys_param where status = '1' and param_group = 'weixin' order by param_id desc");
		for (Record record : list) {
			info.put(record.getStr("param_name"), record.getStr("param_value"));
		}
	}

	/**
	 * 获取参数
	 * 
	 * @param key
	 *            关键字
	 * @return 内容
	 */
	public static String getMsg(String key) {
		Object obj = info.get(key);
		if (obj == null) {
			return "";
		}
		return (String) obj;
	}
}
