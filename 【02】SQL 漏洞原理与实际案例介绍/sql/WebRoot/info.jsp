<%@ page language="java" import="java.util.*,com.sec.pojo.UserInfo,com.sec.service.UserInfoService" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>SQL 测试</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <style>
    .table11_7 table {
        width:100%;
        margin:15px 0;
        border:0;
    }
    .table11_7 th {
        background-color:#00A5FF;
        color:#FFFFFF
    }
    .table11_7,.table11_7 th,.table11_7 td {
        font-size:0.95em;
        text-align:center;
        padding:4px;
        border-collapse:collapse;
    }
    .table11_7 th,.table11_7 td {
        border: 1px solid #2087fe;
        border-width:1px 0 1px 0;
        border:2px inset #ffffff;
    }
    .table11_7 tr {
        border: 1px solid #ffffff;
    }
    .table11_7 tr:nth-child(odd){
        background-color:#aae1fe;
    }
    .table11_7 tr:nth-child(even){
        background-color:#ffffff;
    }
</style>

<%
	UserInfo userinfo = (UserInfo)request.getAttribute("userinfo");
 %>
 
 <center>
<table class=table11_7>
    <tr>
        <th>编号</th><th>姓名</th><th>年龄</th><th>联系方式</th><th>地址</th>
    </tr>
    <tr>
        <td><%=userinfo.getId() %></td>
        <td><%=userinfo.getName() %></td>
        <td><%=userinfo.getAge() %></td>
        <td><%=userinfo.getContent() %></td>
        <td><%=userinfo.getAddress() %></td>
    </tr>
    
</table>
</center>
  </body>
</html>
