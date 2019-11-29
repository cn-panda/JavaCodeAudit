package com.ofsoft.cms.admin.controller;

import com.jfinal.kit.PathKit;
import com.ofsoft.cms.core.config.SysBeans;
import com.ofsoft.cms.core.annotation.Action;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.jasperreports.JasperReportsUtils;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

@Action(path = "/reprot")
public class ReprotAction extends BaseController {
	protected static Logger log = LoggerFactory.getLogger(ReprotAction.class);

	/**
	 * 默认通用导出功能<br>
	 * 根据配置的列表字段
	 * 
	 * @return
	 * @throws Exception
	 */

	public void expReport() {
		HttpServletResponse response = getResponse();
		Map<String, Object> hm = getParamsMap();
		String jrxmlFileName = (String) hm.get("j");
		jrxmlFileName = "/WEB-INF/jrxml/" + jrxmlFileName + ".jrxml";
		File file = new File(PathKit.getWebRootPath() + jrxmlFileName);
		String fileName = (String) hm.get("reportName");
		log.info("报表文件名[{}]", file.getPath());
		 OutputStream out = null;
		try {
			DataSource dataSource = (DataSource) SysBeans
					.getBean("dataSourceProxy");
			JasperPrint jprint = (JasperPrint) JasperFillManager.fillReport(
					JasperCompileManager
							.compileReport(new FileInputStream(file)), hm,
					dataSource.getConnection());
			JRXlsExporter exporter = new JRXlsExporter();
			response.setHeader("Content-Disposition", "attachment;filename="
					+ URLEncoder.encode(fileName, "utf-8") + ".xls");
			response.setContentType("application/xls");
			response.setCharacterEncoding("UTF-8");
			JasperReportsUtils.render(exporter, jprint,
					response.getOutputStream());
			response.setStatus(HttpServletResponse.SC_OK);
			 out=response.getOutputStream();
			 out.flush();
	         out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		renderNull();
//		renderJson();
	}
}
