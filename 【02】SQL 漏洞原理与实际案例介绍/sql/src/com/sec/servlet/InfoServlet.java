package com.sec.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sec.pojo.UserInfo;
import com.sec.service.UserInfoService;
import com.sec.service.impl.UserInfoServiceImpl;

/**
 * Servlet implementation class InfoServlet
 */
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		UserInfoFound(req,resp);  
	}

		//查询用户信息
	private void UserInfoFound(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取请求信息
		String id = req.getParameter("id");
		
		//获取 service 层对象
		UserInfoService  uif = new UserInfoServiceImpl();
		UserInfo u = uif.UserInfoFoundService(id);
		
		req.setAttribute("userinfo", u);
		
		req.getRequestDispatcher("/info.jsp").forward(req, resp);

	}





}
