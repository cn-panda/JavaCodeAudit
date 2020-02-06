package com.sec.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ssrfFileDown
 */
public class ssrfFileDown extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int length;
		String downLoadImgFileName = "SsrfFileDownTest.txt";
		InputStream inputStream = null;
		OutputStream outputStream = null;
		String url = req.getParameter("url");
		try {
			resp.setHeader("content-disposition", "attachment;fileName=" + downLoadImgFileName);
			URL file = new URL(url);
			byte[] bytes = new byte[1024];
			inputStream = file.openStream();
			outputStream = resp.getOutputStream();
			while ((length = inputStream.read(bytes)) > 0) {
				outputStream.write(bytes, 0, length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				inputStream.close();
			}
			if (outputStream != null) {
				outputStream.close();
			}

		}
	}
}