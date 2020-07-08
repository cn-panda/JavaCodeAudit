package com.sec.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sec.pojo.Command;

/**
 * Servlet implementation class recTest
 */
@WebServlet("/rceTest")
public class rceTest extends HttpServlet {


	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		try {
			CommandFound(req,resp);
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | NoSuchMethodException | SecurityException | IllegalArgumentException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  

	
	}

	public void CommandFound(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException, IOException {
		// TODO Auto-generated method stub
		PrintWriter print = resp.getWriter();
		
		String name = req.getParameter("command");
		String method = req.getParameter("method");
		String str = req.getParameter("str");
//		
//		String name = "java.lang.Runtime";
//		String names = "exec";
//		String cmd = "open /System/Applications/Calculator.app";
		
	    Class getCommandClass = Class.forName(name);
	    Constructor constructor = getCommandClass.getDeclaredConstructor();
	    
	    constructor.setAccessible(true);
	    	
	    Object getInstance = constructor.newInstance();

	    Method getCommandMethod = getCommandClass.getDeclaredMethod(method, String.class);
	    getCommandMethod.setAccessible(true);

	    Object mes = getCommandMethod.invoke(getInstance, str);
	    
	    print.println("即将执行的操作指令：<br>");
	    print.println(mes);
	    print.flush();
	}

}
