<%@ page language="java" import="java.util.*,com.sec.pojo.MessageInfo" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>留言列表 -- 测试</title>
<style>
.keleyitable {
width: 800px;
}
 
.keleyitable table, td, th {
border: 1px solid green;margin-top:10px;margin-left:45px;
}
.klytd {width:80px;text-align:center
}
.hvttd {width:500px;}
</style>
 
</head>
<body>
<div style="margin:0px auto;" class="keleyitable"><h2>留言列表</h2>

<%
	List<MessageInfo> msginfo = (ArrayList<MessageInfo>)request.getAttribute("msg");
	for(MessageInfo m:msginfo){
 %>
<table>

	<tr><td class="klytd"> 留言人：</td>
		<td class ="hvttd">　<%=m.getName() %></td>
	</tr> 
	<tr><td class="klytd"> e-mail：</td><td class ="hvttd">　<%=m.getMail() %></td>
		</tr>
	<tr><td class="klytd"> 内容：</td><td class ="hvttd">　<%=m.getMessage() %></td></tr>

</table> <% } %>
</div>
 

</body>
</html>


