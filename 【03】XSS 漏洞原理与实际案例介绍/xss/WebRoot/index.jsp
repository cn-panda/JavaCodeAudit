<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>XSS - 测试</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>

  <body>
	<br>
	<li><a href="search.jsp"  target="_balnk">反射型 XSS</a></li><br>
	<li><a href="store.jsp"  target="_balnk">插入 XSS</a></li><br>
	<li><a href="show"  target="_balnk">存储型 XSS</a></li><br>
	

  </body>
</html>
