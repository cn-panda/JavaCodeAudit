package com.sec.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.HttpURLConnection;
import java.io.PrintWriter;

/**
 * Servlet implementation class ssrfTest
 */
public class ssrfTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");

			PrintWriter print = response.getWriter();
			String url = request.getParameter("url");
			String htmlContent;
			try {
				URL u = new URL(url);
				URLConnection urlConnection = u.openConnection();
				HttpURLConnection httpUrl = (HttpURLConnection) urlConnection;
				BufferedReader base = new BufferedReader(new InputStreamReader(httpUrl.getInputStream(), "UTF-8"));
				StringBuffer html = new StringBuffer();
				while ((htmlContent = base.readLine()) != null) {
					html.append(htmlContent);
				}
				base.close();
				print.println("<b>端口探测</b></br>");
				print.println("<b>url:" + url + "</b></br>");
				print.println(html.toString());
				print.flush();
			} catch (Exception e) {
				e.printStackTrace();
				print.println("ERROR!");
				print.flush();
			}
		}
	
}
