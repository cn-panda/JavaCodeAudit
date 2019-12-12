package com.lxinet.jeesns.core.utils;

import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * XSS攻击处理
 * Created by zchuanzhao on 2017/3/23.
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

    public XssHttpServletRequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
    }

    @Override
    public String[] getParameterValues(String parameter) {
        String[] values = super.getParameterValues(parameter);
        if (values==null)  {
            return null;
        }
        int count = values.length;
        String[] encodedValues = new String[count];
        for (int i = 0; i < count; i++) {
            encodedValues[i] = cleanXSS(values[i]);
        }
        return encodedValues;
    }

    @Override
    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        if (value == null) {
            return null;
        }
        return cleanXSS(value);
    }
    @Override
    public String getHeader(String name) {
        String value = super.getHeader(name);
        if (value == null) {
            return null;
        }
        return cleanXSS(value);
    }
    private String cleanXSS(String value) {
        //first checkpoint
        //(?i)忽略大小写
        value = value.replaceAll("(?i)<style>", "&lt;style&gt;").replaceAll("(?i)</style>", "&lt;&#47;style&gt;");
        value = value.replaceAll("(?i)<script>", "&lt;script&gt;").replaceAll("(?i)</script>", "&lt;&#47;script&gt;");
        value = value.replaceAll("(?i)<script", "&lt;script");
        value = value.replaceAll("(?i)eval\\((.*)\\)", "");
        value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");

        //second checkpoint
        // 需要过滤的脚本事件关键字
        String[] eventKeywords = { "onmouseover", "onmouseout", "onmousedown",
                "onmouseup", "onmousemove", "onclick", "ondblclick",
                "onkeypress", "onkeydown", "onkeyup", "ondragstart",
                "onerrorupdate", "onhelp", "onreadystatechange", "onrowenter",
                "onrowexit", "onselectstart", "onload", "onunload",
                "onbeforeunload", "onblur", "onerror", "onfocus", "onresize",
                "onscroll", "oncontextmenu", "alert" };
        // 滤除脚本事件代码
        for (int i = 0; i < eventKeywords.length; i++) {
            // 添加一个"_", 使事件代码无效
            value = value.replaceAll(eventKeywords[i],"_" + eventKeywords[i]);
        }
        return value;
    }
}
