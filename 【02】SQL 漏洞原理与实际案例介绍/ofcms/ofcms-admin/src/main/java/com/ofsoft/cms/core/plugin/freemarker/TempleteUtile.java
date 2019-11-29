package com.ofsoft.cms.core.plugin.freemarker;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 类名： TempleteManager<br>
 * 功能：交易模板管理类<br>
 * 版本： 1.0<br>
 * 日期： 2016年1月8日<br>
 * 作者： OF<br>
 * 说明：freemarker 模板生成。<br>
 */
public class TempleteUtile {
	private static TempleteUtile tplm = null;

	private Configuration configuration;
	private String templetePath = "/conf/template/";

	@SuppressWarnings("deprecation")
	private TempleteUtile() {
		configuration = new Configuration();
		try {
			configuration.setClassForTemplateLoading(this.getClass(),
					templetePath);
			configuration.setDefaultEncoding("utf-8");
			configuration.setEncoding(new Locale("zh"), "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static Template getTemplate(String name) throws IOException {
		if (tplm == null) {
			tplm = new TempleteUtile();
			tplm.configuration.setEncoding(new Locale("zh"), "utf-8");
		}
		return tplm.configuration.getTemplate(name);
	}

	/**
	 * 生成template
	 * 
	 * @param templatefile
	 *            模板文件
	 * @param param
	 *            参数
	 * @return
	 * @throws IOException
	 *             异常
	 * @throws TemplateException
	 */
	public static String process(String templatefile, Map<?, ?> param)
			throws IOException, TemplateException {
		Template template = TempleteUtile.getTemplate(templatefile);
		StringWriter sw = new StringWriter();
		template.process(param, sw);
		return sw.toString().replaceAll(">(\\s*)<", "><").trim();
	}

	public static void process(String templatefile, Map<String, Object> param,
			File file) throws IOException, TemplateException {
		Template template = TempleteUtile.getTemplate(templatefile);
		// FileWriter sw = new FileWriter(file);
		Writer sw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(file), "UTF-8"));
		template.process(param, sw);
		sw.flush();
		sw.close();
	}

	public static void main(String[] args) {
		Map<String, Object> singleObject = new HashMap<String, Object>();
		singleObject.put("employee_name", "username");
		singleObject.put("salary_month", "12");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> a = new HashMap<String, Object>();
		a.put("name", "scroll_pic_name");
		Map<String, Object> b = new HashMap<String, Object>();
		b.put("name", "img_url");
		list.add(a);
		list.add(b);

		Map param = new HashMap();
		param.put("data", singleObject);
		param.put("list", list);
		TempleteUtile email = new TempleteUtile();
		try {
			System.out.println(email.getClass().getResource("/").getPath());
			File file = new File(
					"D:/soft/tools/kkdev/workspace/eter/syk-wx/syk-wx-web-admin/src/main/resources/conf/template/1.sql");
			file.createNewFile();
			email.process("comn.sql.html", param, file);
		} catch (IOException | TemplateException e) {
			e.printStackTrace();
		}
	}

}
