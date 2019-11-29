package com.ofsoft.cms.core.render;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.jfinal.kit.JsonKit;
import com.jfinal.render.Render;
import com.jfinal.render.RenderException;

/**
 * 渲染json render
 * 
 * @author OF
 * 
 *         <pre>
 * IE 不支持content type 为 application/json, 在 ajax 上传文件完成后返回 json时 IE
 * 提示下载文件,<br>
 * 解决办法是使用： render(new JsonRender(params).forIE());
 * </pre>
 */
public class SykJsonRender extends Render {

	private static final Set<String> excludedAttrs = new HashSet<String>() {
		private static final long serialVersionUID = 9186138395157680676L;
		{
			add("javax.servlet.request.ssl_session");
			add("javax.servlet.request.ssl_session_id");
			add("javax.servlet.request.ssl_session_mgr");
			add("javax.servlet.request.key_size");
			add("javax.servlet.request.cipher_suite");
		}
	};

	/**
	 * 仅对无参 renderJson() 起作用
	 */
	public static void addExcludedAttrs(String... attrs) {
		if (attrs != null) {
			for (String attr : attrs) {
				excludedAttrs.add(attr);
			}
		}
	}

	public static void removeExcludedAttrs(String... attrs) {
		if (attrs != null) {
			for (String attr : attrs) {
				excludedAttrs.remove(attr);
			}
		}
	}

	public static void clearExcludedAttrs() {
		excludedAttrs.clear();
	}

	/**
	 * http://zh.wikipedia.org/zh/MIME 在wiki中查到:
	 * 尚未被接受为正式数据类型的subtype，可以使用x-开始的独立名称（例如application/x-gzip） 所以以下可能要改成
	 * application/x-json
	 * 
	 * 通过使用firefox测试,struts2-json-plugin返回的是 application/json, 所以暂不改为
	 * application/x-json 1: 官方的 MIME type为application/json, 见
	 * http://en.wikipedia.org/wiki/MIME_type 2: IE 不支持 application/json, 在 ajax
	 * 上传文件完成后返回 json时 IE 提示下载文件
	 */
	private static final String contentType = "application/json; charset="
			+ getEncoding();
	private static final String contentTypeForIE = "text/html; charset="
			+ getEncoding();
	private boolean forIE = false;

	public SykJsonRender forIE() {
		forIE = true;
		return this;
	}

	private String jsonText;
	private String[] attrs;

	public SykJsonRender() {

	}

	@SuppressWarnings("serial")
	public SykJsonRender(final String key, final Object value) {
		if (key == null) {
			throw new IllegalArgumentException(
					"The parameter key can not be null.");
		}
		this.jsonText = JsonKit.toJson(new HashMap<String, Object>() {
			{
				put(key, value);
			}
		});
	}

	public SykJsonRender(String[] attrs) {
		if (attrs == null) {
			throw new IllegalArgumentException(
					"The parameter attrs can not be null.");
		}
		this.attrs = attrs;
	}

	public SykJsonRender(String jsonText) {
		if (jsonText == null) {
			// throw new
			// IllegalArgumentException("The parameter jsonString can not be null.");
			this.jsonText = "null";
		} else {
			this.jsonText = jsonText;
		}
	}

	public SykJsonRender(Object object) {
		this.jsonText = JsonKit.toJson(object);
	}

	public void render() {
		if (jsonText == null) {
			buildJsonText();
		}

		PrintWriter writer = null;
		try {
			response.setHeader("Pragma", "no-cache"); // HTTP/1.0 caches might
														// not implement
														// Cache-Control and
														// might only implement
														// Pragma: no-cache
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);

			response.setContentType(forIE ? contentTypeForIE : contentType);
			writer = response.getWriter();
			writer.write(jsonText);
			writer.flush();
		} catch (IOException e) {
			throw new RenderException(e);
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void buildJsonText() {
		Map map = new HashMap();
		if (attrs != null) {
			for (String key : attrs) {
				map.put(key, request.getAttribute(key));
			}
		} else {
			for (Enumeration<String> attrs = request.getAttributeNames(); attrs
					.hasMoreElements();) {
				String key = attrs.nextElement();
				if (excludedAttrs.contains(key)) {
					continue;
				}

				Object value = request.getAttribute(key);
				map.put(key, value);
			}
		}

		this.jsonText = JsonKit.toJson(map);
	}

	public String[] getAttrs() {
		return attrs;
	}

	public String getJsonText() {
		return jsonText;
	}

	public Boolean getForIE() {
		return forIE;
	}
}
