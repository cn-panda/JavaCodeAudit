<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户信息查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
  <center>
  <br>
    <form  action="info" method="get">
   	 	<select name="id">
			  <option value ="1">用户 1</option>
			  <option value ="2">用户 2</option>
			  <option value="3">用户 3</option>
			  <option value="4">用户 4</option>
			  <option value="5">用户 5</option>
		</select>
		<input type="submit" value="查询"/>
    </form>
    </center>
  </body>
</html>
