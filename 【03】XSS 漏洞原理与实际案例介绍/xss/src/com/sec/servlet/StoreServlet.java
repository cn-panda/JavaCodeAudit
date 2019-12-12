package com.sec.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sec.pojo.MessageInfo;
import com.sec.service.MessageInfoService;
import com.sec.service.impl.MessageInfoServiceImpl;

/**
 * Servlet implementation class StoreServlet
 */
public class StoreServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		StoreXss(req,resp);
	
	}

	
	public void StoreXss(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = req.getParameter("name");
		String mail = req.getParameter("mail");
		String message = req.getParameter("message");
		if(!name.equals(null) && !mail.equals(null) && !message.equals(null)){
			
			MessageInfoService msginfo = new MessageInfoServiceImpl();
			msginfo.MessageInfoStoreService(name, mail, message);
			
			resp.getWriter().print("<script>alert(\"添加成功\")</script>");
			resp.getWriter().flush();
			resp.getWriter().close();
		}
	}
}
