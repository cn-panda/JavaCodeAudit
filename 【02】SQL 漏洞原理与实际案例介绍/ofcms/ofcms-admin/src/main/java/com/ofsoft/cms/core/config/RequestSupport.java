package com.ofsoft.cms.core.config;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.ofsoft.cms.core.utils.JsonUtil;
import com.ofsoft.cms.core.utils.Tools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RequestSupport {
	private static Logger log = LoggerFactory.getLogger(RequestSupport.class);
	public static final String NULL_VALUE = "NULL";
	/**
	 * 标志不打印日志的参数变量名称
	 */
	public final static String DO_NOT_SAY_LOG = "sys_donotsaylog";

	/**
	 * 用于保存访问的请求对象
	 */
	private static ThreadLocal<HttpServletRequest> tlLocalRequest = new ThreadLocal<HttpServletRequest>();

	private static ThreadLocal<Map> allparams = new ThreadLocal<Map>();

	/**
	 * 保存当前请求对象
	 */
	public static void setLocalRequest(HttpServletRequest request) {
		tlLocalRequest.set(request);
	}

	/**
	 * 获取当前请求对象
	 */
	public static HttpServletRequest getLocalRequest() {
		return tlLocalRequest.get();
	}

	/**
	 * 清除threadlocal中的参数
	 */
	public static void clearUserParams() {
		if (allparams.get() != null) {
			allparams.set(null);
		}
	}

	/**
	 * 手动设置流程中的参数
	 *
	 * @param map
	 */
	public static void setUserParameters(Map map) {
		Map p = allparams.get();
		if (p == null) {
			p = new HashMap();
			allparams.set(p);
		}
		if (map == null) {
			p = new HashMap();
			allparams.set(p);
			return;
		}

		allparams.get().putAll(map);
	}

	/**
	 * 因为前台送的参数值不管是null或是""（空字符串），后台这里接收时都会是""（空字符串）<br />
	 * 这样后台就不能判断真正null值，所以在这里约定：<br />
	 * 前台送参数时，如果是null的，就送一个"null"字符串过来<br />
	 * 后台接收参数时，把值为"null"字符串的参数值置null
	 */
	public static Map<String, Object> dealNullParams(Map<String, Object> params) {
		Map<String, Object> pms = new HashMap<String, Object>();

		Set<Map.Entry<String, Object>> set = params.entrySet();
		for (Map.Entry<String, Object> en : set) {
			String key = en.getKey();
			Object value = en.getValue();

			if (value == null) {
				pms.put(key, null);
			} else if (value.getClass().isArray()) {
				Object[] objs = (Object[]) value;
				List<Object> list = new ArrayList<Object>();
				for (Object obj : objs) {

					if (NULL_VALUE.equals(obj)) {
						list.add(null);
					} else {
						list.add(obj);
					}
				}
				pms.put(key, list.toArray());
			} else if (NULL_VALUE.equals(value)) {
				pms.put(key, null);
			} else {
				pms.put(key, value);
			}
		}
		return pms;
	}

	/**
	 * 取得参数集<br />
	 * 对从request中取得的原始参数集Map进行处理后返回
	 *
	 * @param paramMap
	 *            从request中取得的参数parameter原始Map对象
	 * @param transCharset
	 *            取参数值时是否进行编码转换（转换成系统编码），默认false
	 * @return
	 */
	public static Map<String, Object> convertRequestParameters(@SuppressWarnings("rawtypes") Map paramMap,
			boolean transCharset) {
		@SuppressWarnings("rawtypes")
		Map pm = paramMap;
		if (pm == null || pm.size() < 0) {
			return null;
		}
		@SuppressWarnings("rawtypes")
		Iterator it = pm.keySet().iterator();
		Map<String, Object> map = new HashMap<String, Object>();
		while (it.hasNext()) {
			String key = (String) it.next();
			Object val;
			if (transCharset) {// 转换String值编码
				val = Tools.string2SysCharset(pm.get(key));
			} else {
				val = pm.get(key);
			}
			if (val != null && val.getClass().isArray()) {
				Object[] vals = (Object[]) val;
				if (vals.length == 1) {
					val = vals[0];
				}
			}
			map.put(key, val);
		}
		return dealNullParams(map);
	}

	/**
	 * 取得当前请求的参数集
	 *
	 * @return
	 */
	public static Map<String, Object> getParameters() {

		try {
			if (allparams.get() == null) {
				setRequestParams();
			}

			return allparams.get();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 设置请求参数
	 */
	public static void setRequestParams() {
		try {
			// 初始化allparams
			setUserParameters(null);
			Map<String, Object> map = null;
			String contentType = tlLocalRequest.get().getContentType();

			if (contentType != null && contentType.contains("application/json")) {
				map = getJsonParameters();
				setUserParameters(map);
				log.info("request json parameters : {}",map.get("JSON_STRING"));
			} else {
				HttpServletRequest r = (HttpServletRequest) getLocalRequest();
				Map params = r.getParameterMap();
				if (params == null || params.size() <= 0) {
					return;
				}
				map = convertRequestParameters(r.getParameterMap(), false);
				setUserParameters(map);
			}
			if (map != null && map.size() > 0 && !map.containsKey(DO_NOT_SAY_LOG))
				log.info("request IP[{}] parameters : " + JsonUtil.objectToJson(map), getLocalRequest().getRemoteAddr());
		} catch (Exception e) {

		}
	}

	/**
	 * 获取当前请求的参数值<br />
	 * 供bizr2.tld标签库使用的方法
	 *
	 * @return
	 */
	public static String getRequestParamValue(String paraname) {
		Object obj = getParameters().get(paraname);
		if (obj == null)
			return "";
		return obj.toString();
	}

	 
	 
 

	/**
	 * 构造返回到前端的通用更新结果JSON格式字符串
	 *
	 * @param success
	 *            更新是否成功
	 * @param returnmsg
	 *            返回信息
	 * @param returndata
	 *            返回数据
	 * @return
	 */
	public static String updateReturnJson(boolean success, String returnmsg, Map<String, Object> returndata) {
		returnmsg = Tools.trimString(returnmsg);
		if (returndata == null)
			returndata = new HashMap<String, Object>();

		// 设置返回结果
		Map json = new HashMap();
		json.put("success", success);
		json.put("returnmsg", returnmsg);
		json.put("returndata", returndata);
		String strResult = JsonUtil.objectToJson(json);

		log.info("##### update result : " + strResult);

		return strResult;
	}

	private static Map<String, Object> getJsonParameters() {
		try {
			HttpServletRequest r = (HttpServletRequest) getLocalRequest();
			BufferedReader reader = r.getReader();
			StringBuffer buffer = new StringBuffer();
			String str;
			while ((str = reader.readLine()) != null) {
				buffer.append(str);
			}
			reader.close();
			Map<String, Object> map = new HashMap();
			map.putAll((Map<String, Object>) JsonUtil.jsonToMap(buffer.toString()));
			transParamsArray(map);
			// 用于测试接收到的报文转换情况，如果不需要可以注释掉
			map.put("JSON_STRING", buffer.toString());
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	static void transParamsArray(Map params) {
		Set<Object> keySet = params.keySet();
		for (Object obj : keySet) {// 遍历key
			if (params.get(obj) instanceof String && ((String) params.get(obj)).startsWith("[")
					&& ((String) params.get(obj)).endsWith("]")) {
				log.info("key:" + obj + ",Value:" + params.get(obj));
				String temp = (String) params.get(obj);
				temp = temp.substring(1, temp.length() - 1);
				String sn[] = temp.split("\\,");
				ArrayList tempList = new ArrayList();
				for (String t : sn) {
					tempList.add(t);
				}
				params.put(obj, tempList.toArray());
			}

			if (params.get(obj) instanceof List) {
				log.info("key:" + obj + ",Value:" + params.get(obj));
				params.put(obj, ((List) params.get(obj)).toArray());
			}
		}

	}

	public static void main(String[] args) {
		System.out.println("[1,2,3,4,5,6,7]".substring(1, "[1,2,3,4,5,6,7]".length() - 1));
	}

}
