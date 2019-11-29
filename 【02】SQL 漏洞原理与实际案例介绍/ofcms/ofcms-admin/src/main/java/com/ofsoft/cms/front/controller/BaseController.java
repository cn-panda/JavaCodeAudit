package com.ofsoft.cms.front.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.render.JsonRender;
import com.jfinal.weixin.sdk.utils.JsonUtils;
import com.ofsoft.cms.core.config.AdminConst;
import com.ofsoft.cms.core.config.RenderFactoryImpl;
import com.ofsoft.cms.core.spring.IocInterceptor;
import com.ofsoft.cms.core.utils.CalendarUtil;
import com.ofsoft.cms.core.utils.ResultUtil;
import com.ofsoft.cms.core.interceptor.FrontInterceptor;
import com.ofsoft.cms.model.SysUser;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 基类
 * 
 * @author OF
 */
@Before({  FrontInterceptor.class ,IocInterceptor.class})
public abstract class BaseController extends Controller {
	public Logger log = Logger.getLogger(getClass());
	/**
	 * 本地参数安全线程
	 */
	private static ThreadLocal<Map<String, Object>> params = new ThreadLocal<Map<String, Object>>();

	public String getParaString() {
		return HttpKit.readData(getRequest());
	}

	/**
	 * 获取k/vMap 参数
	 * 
	 * @return Map
	 */
	public Map<String, Object> getParamsMap() {
		Map<String, String[]> params = getParaMap();
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		for (String value : params.keySet()) {
			result.put(value, params.get(value)[0]);
		}
		return result;
	}

	/**
	 * 获取json参数
	 * 
	 * @return json
	 */
	public String getParaJson() {
		return HttpKit.readData(getRequest());
	}

	/**
	 * 获取json参数
	 * 
	 * @param name
	 *            参数名
	 * @return 参数值
	 */
	public String getParaJson(String name) {
		return (String) getParaJsonMap().get(name);
	}

	/**
	 * 获取json参数
	 * 
	 * @param name
	 *            参数名
	 * @return 参数值
	 */
	public Integer getParaJsonInt(String name) {
		return (Integer) getParaJsonMap().get(name);
	}

	/**
	 * 获取json Map
	 * 
	 *            参数名
	 * @return 参数值
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map<String, Object> getParaJsonMap() {
		if (params.get() == null) {
			Map result = JsonUtils.parse(getParaJson(), Map.class);
			params.set(result);
		}
		return params.get();
	}

	public static void setRequestParams() {
		params.set(null);
	}

	/**
	 * 获取xml参数
	 * 
	 * @return xml
	 */
	public String getParaXml() {
		return HttpKit.readData(getRequest());
	}

	protected int getPageNum() {
		return this.getParaToInt("pageNum", 1);
	}

	protected int getPageSize() {
		return this.getParaToInt("pageSize", 10);
	}

	protected String getPageStringNum() {
		return this.getPara("pageNum", "1");
	}

	protected String getPageStringSize() {
		return this.getPara("pageSize", "10");
	}

	/**
	 * 获取用户实例
	 * 
	 * @return User
	 */
	protected SysUser getUser() {
		return (SysUser) getSession().getAttribute(AdminConst.USER_IN_SESSION);
	}

	/**
	 * 获取用户编号
	 * 
	 * @return UserId
	 */
	protected Integer getUserId() {
		return getUser().getUserId();
	}

	/**
	 * 获取手机号
	 * 
	 * @return mobile
	 */
	protected String getMobile() {
		return getUser().getUserMobile();
	}

	/**
	 * HTML视图
	 * 
	 * @param view
	 *            视图文件名不含.html
	 */
	protected void renderHTML(String view) {
		if (view.endsWith(".html")) {
			super.render(view);
		} else {
			super.render(view + ".html");
		}
	}

	protected void redirect500() {
		redirect500(null);
	}

	protected void redirect500(String msg) {
		setAttr("error", msg);
		super.render(AdminConst.ERROR_500);
	}

	protected void rendSuccessJson(Object data) {
		rendJson(ResultUtil.genSuccessResult(data));
	}

	protected void rendSuccessJson(Object data, Integer TotalPage,
			Integer PageNumber) {
		Map<String, Object> map = ResultUtil.genSuccessResult();
		map.put("data", data);
		map.put("total_rows", TotalPage);
		map.put("page_size", PageNumber);
		rendJson(map);
	}

	protected void rendSuccessJson() {
		rendJson(ResultUtil.genSuccessResult());
	}

	protected void rendFailedJson(final String msg) {
		rendJson(ResultUtil.genFailedResult(msg));
	}

	protected void rendFailedJson(final int code, final String msg) {
		rendJson(ResultUtil.genFailedResult(code, msg));
	}

	protected void rendFailedJson(final String code, final String msg) {
		rendJson(ResultUtil.genFailedResult(code, msg));
	}

	protected void rendJson(Object json) {
		String agent = getRequest().getHeader("User-Agent");
		if (agent.contains("MSIE"))
			this.render(new JsonRender(json).forIE());
		else {
			this.render(new JsonRender(json));
		}
	}

	/**
	 * 输入流转换成String
	 * 
	 * @param in
	 *            输入流
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	protected String inputStream2String(InputStream in)
			throws UnsupportedEncodingException, IOException {
		if (in == null)
			return "";
		StringBuffer out = new StringBuffer();
		byte[] b = new byte[4096];
		for (int n; (n = in.read(b)) != -1;) {
			out.append(new String(b, 0, n, "UTF-8"));
		}
		return out.toString();
	}

	/**
	 * 获取序列公共方法 增加前缀名 {C20160404000000001}
	 * 
	 * @param seqflay
	 *            获取的序列名
	 * @param prefix
	 *            前缀名 如： ：C
	 * @param isDate
	 *            是否需要加日期 trur false
	 * @param number
	 *            左补零的位数
	 * @return 序列
	 */
	protected static String getSeq(String seqflay, String prefix,
			boolean isDate, int number) {
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuilder sb = new StringBuilder();
		String date = "";
		if (isDate) {
			date = CalendarUtil.getNowTime("yyyyMMdd");
		}
		params.put("seqflay", seqflay);
		params.put("number", number);
		String result = getSeq(seqflay, number);
		sb.append(prefix).append(date).append(result);
		return sb.toString();
	}

	/**
	 * 获取序列
	 */
	protected static String getSeq(String seqflay, int number) {
		Record record = Db.findFirst("select LPAD(seq('" + seqflay + "'),"
				+ number + ",'0') seq from dual;");
		return record.getStr("seq");
	}

	public static final RenderFactoryImpl sykRender = new  RenderFactoryImpl();
}
