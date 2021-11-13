<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
    String file = request.getParameter("file");
%>

<jsp:include page="<%=file%>"></jsp:include>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>JSP 文件包含测试（本地）</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60492",secure:"60493"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc10-0" data-genuitec-path="/include/WebRoot/include_local.jsp">
File Include Test Page. <br data-genuitec-lp-enabled="false" data-genuitec-file-id="wc10-0" data-genuitec-path="/include/WebRoot/include_local.jsp">
</body>
</html>
