<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>远程文件包含测试</title>
    <%

        String url = request.getParameter("url");

    %>
    <c:import url="<%=url%>"></c:import>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">


<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60492",secure:"60493"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc10-1" data-genuitec-path="/include/WebRoot/include_remote.jsp">
This is my JSP page. <br data-genuitec-lp-enabled="false" data-genuitec-file-id="wc10-1" data-genuitec-path="/include/WebRoot/include_remote.jsp">
</body>
</html>
