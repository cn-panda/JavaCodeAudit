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

public class ShowServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		ShowMessage(req,resp);
	
	}

	public void ShowMessage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MessageInfoService msginfo = new MessageInfoServiceImpl();
		
		List<MessageInfo> msg = msginfo.MessageInfoShowService();
		if( msg != null){
			req.setAttribute("msg", msg);
			req.getRequestDispatcher("/message.jsp").forward(req, resp);
			return ;
		}

	}
}
