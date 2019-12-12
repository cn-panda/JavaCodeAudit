package com.lxinet.jeesns.core.utils;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zchuanzhao on 2016/11/26.
 */
public class HtmlUtil {
	private static final String REGEX_SCRIPT = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式
	private static final String REGEX_STYLE = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式
	private static final String REGEX_HTML = "<[^>]+>"; // 定义HTML标签的正则表达式
	private static final String REGEX_SPACE = "\\s*|\t|\r|\n";// 定义空格回车换行符

	private HtmlUtil(){

	}

	/**
	 * @param htmlStr
	 * @return 删除Html标签
	 */
	public static String delHTMLTag(String htmlStr) {
		if(StringUtils.isNotEmpty(htmlStr)){
			Pattern pScript = Pattern.compile(REGEX_SCRIPT, Pattern.CASE_INSENSITIVE);
			Matcher mScript = pScript.matcher(htmlStr);
			htmlStr = mScript.replaceAll(""); // 过滤script标签

			Pattern pStyle = Pattern.compile(REGEX_STYLE, Pattern.CASE_INSENSITIVE);
			Matcher mStyle = pStyle.matcher(htmlStr);
			htmlStr = mStyle.replaceAll(""); // 过滤style标签

			Pattern pHtml = Pattern.compile(REGEX_HTML, Pattern.CASE_INSENSITIVE);
			Matcher mHtml = pHtml.matcher(htmlStr);
			htmlStr = mHtml.replaceAll(""); // 过滤html标签

			Pattern pSpace = Pattern.compile(REGEX_SPACE, Pattern.CASE_INSENSITIVE);
			Matcher mSpace = pSpace.matcher(htmlStr);
			htmlStr = mSpace.replaceAll(""); // 过滤空格回车标签
			return htmlStr.trim();
		}
		return htmlStr;
	}
}
