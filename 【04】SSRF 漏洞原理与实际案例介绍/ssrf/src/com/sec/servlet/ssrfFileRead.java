package com.sec.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ssrfFileRead
 */
public class ssrfFileRead extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @return
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
			BufferedReader base = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			StringBuffer html = new StringBuffer();
			while ((htmlContent = base.readLine()) != null) {
				html.append(htmlContent);
			}
			base.close();
			print.println(html.toString());
			print.flush();

		} catch (Exception e) {
			e.printStackTrace();
			print.println("ERROR!");
			print.flush();
		}
	}
}
