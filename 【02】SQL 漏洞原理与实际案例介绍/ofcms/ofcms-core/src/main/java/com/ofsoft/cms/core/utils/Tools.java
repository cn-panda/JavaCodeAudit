package com.ofsoft.cms.core.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

public class Tools {

	public static final String[] emptyArrayString = new String[] {};

	public static final Integer[] emptyArrayInteger = new Integer[] {};

	public static final BigDecimal ZERO_E_BIGDECIMAL = new BigDecimal("0E-10");
	/**
	 * 值为0的Short实例
	 */
	public static final Short zeroShort = 0;

	public static final Date emptyDate = new Date(-28800000);

	private static String defaultCharset = "UTF-8";

	/**
	 * 取得new Date(0l)对象 在系统中,将把该对象作为空白日期对象处理
	 */
	public static Date getEmptyDate() {
		return emptyDate;
	}

	/**
	 * 将秒值转换成具体时间描述
	 */
	public static String second2mGb(long seconds) {
		Integer[] padding = new Integer[] { 60 * 60 * 24, 60 * 60, 60, 1 };
		String[] text = new String[] { "天", "小时", "分钟", "秒" };
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < padding.length; i++) {
			long n = seconds / padding[i];
			if (n > 0) {
				seconds = seconds % padding[i];
				sb.append(n).append(text[i]);
			}
		}
		return sb.toString();
	}

	/**
	 * 取得今天日期对象（时分秒值为0）
	 */
	public static Date today() {
		return str2Dt(dt2Date1(new Date()));
	}

	/**
	 * 把yyyyMMdd格式的日期字符串转成yyyy-MM-dd格式字符串返回
	 */
	public static String dateFormat(String date) {
		if (date == null)
			return "";
		String str = date.trim();
		if (str.length() == 8) {
			return Tools.substr(str, 0, 4) + '-' + Tools.substr(str, 4, 2)
					+ '-' + Tools.substr(str, 6, 2);
		}
		return str;
	}

	/**
	 * 把hhmmss格式的日期字符串转成hh:mm:ss格式字符串返回<br />
	 * 或hhmm => hh:mm
	 */
	public static String timeFormat(String time) {
		if (time == null)
			return "";
		String str = time.trim();
		if (str.length() == 6) {
			return Tools.substr(str, 0, 2) + ':' + Tools.substr(str, 2, 2)
					+ ':' + Tools.substr(str, 4, 2);
		} else if (str.length() == 4) {
			return Tools.substr(str, 0, 2) + ':' + Tools.substr(str, 2, 2);
		}
		return str;
	}

	/**
	 * 把yyyyMMdd hhmmss格式的日期字符串转成yyyy-MM-dd hh:mm:ss格式字符串返回
	 */
	public static String datetimeFormat(String datetime) {
		if (datetime == null)
			return "";
		String str = datetime.trim();
		String[] strs = str.split("[ ]");
		if (strs.length == 2) {
			return Tools.dateFormat(strs[0]) + ' ' + Tools.timeFormat(strs[1]);
		}
		return str;
	}

	/**
	 * 把yyyyMMddhhmmss格式的日期字符串转成yyyy-MM-dd hh:mm:ss格式字符串返回
	 */
	public static String datetimeFormatEx(String datetime) {
		if (datetime == null)
			return "";
		String str = datetime.trim();
		if (datetime.length() != 14)
			return datetime;
		String date = str.substring(0, 8);
		String time = str.substring(8);
		return Tools.dateFormat(date) + ' ' + Tools.timeFormat(time);
	}

	/**
	 * 把日期字符串转换成Date类型<br />
	 * 
	 * @param date
	 * @return
	 */
	public static Date str2Dt(String date) {
		if (date.indexOf('-') == -1)
			return str2Dt1(date);
		else
			return str2Dt2(date);
	}

	/**
	 * "yyyyMMdd"格式的字段串转换成Date类型
	 */
	private static Date str2Dt1(String date) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
		try {
			dt = fmt.parse(date);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return dt;
	}

	/**
	 * 把日期时间字符串（精确到时分秒）转换成Date类型
	 * 
	 * @param datetime
	 * @return
	 */
	public static Date strDt2Dt(String datetime) {
		String format;
		if (datetime.indexOf('-') > -1)
			format = "yyyy-MM-dd";
		else
			format = "yyyyMMdd";

		if (datetime.indexOf(':') > -1)
			format += " HH:mm:ss";
		else
			format += " HHmmss";

		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat(format);
		try {
			dt = fmt.parse(datetime);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return dt;

	}

	/**
	 * 时间字符串转换成Date类型
	 */
	public static Date strTime2Dt(String time) {
		if (time.indexOf(':') == -1)
			return strTime2Dt1(time);
		else
			return strTime2Dt2(time);
	}

	/**
	 * "HHmm"格式的字段串转换成Date类型
	 */
	private static Date strTime2Dt1(String time) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("HHmm");
		try {
			dt = fmt.parse(time);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return dt;
	}

	/**
	 * "HH:mm"格式的字段串转换成Date类型
	 */
	private static Date strTime2Dt2(String time) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("HH:mm");
		try {
			dt = fmt.parse(time);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return dt;
	}

	/**
	 * "yyyy-MM-dd"格式的字段串转换成Date类型
	 */
	private static Date str2Dt2(String date) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			dt = fmt.parse(date);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return dt;
	}

	/**
	 * Date类型转换成MM.dd格式的字符串
	 */
	public static String dt2Date7(Date date) {
		if (date == null)
			return "";

		SimpleDateFormat formatter = new SimpleDateFormat(
				"MM.dd");
		return formatter.format(date);
	}

	/**
	 * Date类型转换成yyyyMMdd格式的字符串
	 */
	public static String dt2Date1(Date date) {
		if (date == null)
			return "";

		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyyMMdd");
		return formatter.format(date);
	}

	/**
	 * Date类型转换成yyyy-MM-dd格式的字符串
	 */
	public static String dt2Date2(Date date) {
		if (date == null)
			return "";

		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyy-MM-dd");
		return formatter.format(date);
	}

	/**
	 * Date类型转换成yyyy-MM-dd HH:mm:ss格式的字符串
	 */
	public static String dt2Datetime(Date date) {
		if (date == null)
			return "";

		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		return formatter.format(date);
	}

	/**
	 * Date类型转换成yyyyMMddHHmmss格式的字符串
	 */
	public static String dt2Date(Date date) {
		if (date == null)
			return "";

		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyyMMddHHmmss");
		return formatter.format(date);
	}

	/**
	 * "yyyy-MM-dd HH:mm:ss"格式的字段串转换成yyyyMMdd类型
	 */
	public static String str2Dt3(String datetime) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dt = fmt.parse(datetime);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return Tools.dt2Date1(dt);
	}

	/**
	 * "yyyy-MM-dd HH:mm:ss"格式的字段串转换成MM.dd类型
	 */
	public static String str2Dt7(String datetime) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dt = fmt.parse(datetime);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return Tools.dt2Date7(dt);
	}

	/**
	 * "yyyy-MM-dd HH:mm:ss"格式的字段串转换成yyyy-MM-dd类型
	 */
	public static String str2Date2(String datetime) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dt = fmt.parse(datetime);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return Tools.dt2Date2(dt);
	}

	/**
	 * 日期转星期
	 * 
	 * @param datetime
	 * @return
	 */
	public static String dateTimeToWeek(String datetime) {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String[] weekDays = { "周日", "周一", "周二", "周三", "周四", "周五", "周六" };
		Calendar cal = Calendar.getInstance(); // 获得一个日历
		Date datet = null;
		try {
			datet = f.parse(datetime);
			cal.setTime(datet);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
		if (w < 0)
			w = 0;
		return weekDays[w];
	}

	/**
	 * 日期转星期
	 * 
	 * @param datetime
	 * @return
	 */
	public static String dateToWeek(String datetime) {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String[] weekDays = { "周日", "周一", "周二", "周三", "周四", "周五", "周六" };
		Calendar cal = Calendar.getInstance(); // 获得一个日历
		Date datet = null;
		try {
			datet = f.parse(datetime);
			cal.setTime(datet);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
		if (w < 0)
			w = 0;
		return weekDays[w];
	}

	/**
	 * "yyyy-MM-dd HH:mm:ss"格式的字段串转换成yyyyMMddHHmmss类型
	 */
	public static String str2Dt5(String datetime) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dt = fmt.parse(datetime);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return Tools.dt2Date(dt);
	}

	/**
	 * "yyyy-MM-dd HH:mm:ss"格式的字段串转换成HHmmss类型
	 */
	public static String str2Dt4(String datetime) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dt = fmt.parse(datetime);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return Tools.dt2Time1(dt);
	}

	/**
	 * "yyyy-MM-dd HH:mm:ss"格式的字段串转换成HHmmss类型
	 */
	public static String str2Dt6(String datetime) {
		Date dt;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dt = fmt.parse(datetime);
		} catch (Exception e) {
			dt = getEmptyDate();
		}
		return Tools.dt2Date2(dt);
	}

	/**
	 * Date类型转换成HHmmss格式的字符串
	 */
	public static String dt2Time1(Date date) {
		if (date == null)
			return "";

		SimpleDateFormat formatter = new SimpleDateFormat(
				"HHmmss");
		return formatter.format(date);
	}

	/**
	 * Date类型转换成HH:mm:ss格式的字符串
	 */
	public static String dt2Time2(Date date) {
		if (date == null)
			return "";

		SimpleDateFormat formatter = new SimpleDateFormat(
				"HH:mm:ss");
		return formatter.format(date);
	}

	/**
	 * Date类型转换成[HH时mm分]格式的字符串
	 */
	public static String dt2TimeBg(Date date) {
		if (date == null)
			return "";

		SimpleDateFormat formatter = new SimpleDateFormat(
				"HH时mm分");
		return formatter.format(date);
	}

	/**
	 * Date类型转换成 yyyy年MM月dd日 星期几 格式的字符串
	 */
	public static String dt2DateBg(Date date) {
		return dt2DateBg(date, true);
	}

	/**
	 * Date类型转换成 yyyy年MM月dd日 星期几 格式的字符串
	 * 
	 * @param date
	 *            要转换的Date对象
	 * @param showWeek
	 *            是否输出星期几
	 */
	@SuppressWarnings("deprecation")
	public static String dt2DateBg(Date date, Boolean showWeek) {
		if (date == null)
			return "";

		String[] weeks = new String[] { "日", "一", "二", "三", "四", "五", "六" };
		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyy年MM月dd日");
		String str = formatter.format(date);
		if (showWeek) {
			str += " 星期" + weeks[date.getDay()];
		}
		return str;
	}

	/**
	 * Date类型转换成 yyyy年MM月dd日 星期几 HH时mm分 格式的字符串
	 */
	@SuppressWarnings("deprecation")
	public static String dt2DatetimeBg(Date date) {
		if (date == null)
			return "";

		String[] weeks = new String[] { "日", "一", "二", "三", "四", "五", "六" };
		SimpleDateFormat formatter = new SimpleDateFormat(
				String.format("yyyy年MM月dd日 星期%s HH时mm分", weeks[date.getDay()]));
		return formatter.format(date);
	}

	/**
	 * 返回一个新的Date对象，其值是在date日期加上addMonths个月的日期<br />
	 * （此方法不改变date对象的值）
	 */
	public static Date dtAddMonths(Date date, int addMonths) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, addMonths);
		return calendar.getTime();
	}

	/**
	 * 返回中文格式的当前日期时间
	 */
	public static String nowDateBg() {
		return dt2DateBg(new Date());
	}

	/**
	 * 返回 yyyy年MM月dd日 星期几 HH时mm分 格式的当前日期时间
	 */
	public static String nowDatetimeBg() {
		return dt2DatetimeBg(new Date());
	}

	/**
	 * 返回Date对象是否空日期<br />
	 * 空日期的定义是：是否为null
	 */
	public static Boolean dtIsEmpty(Date date) {
		return date == null;
	}

	/**
	 * 返回当前年份的第一天的日期对象
	 */
	public static Date firstDayOfCurrYear() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.MONTH, 0);// 一月
		c.set(Calendar.DATE, 1); // 一日
		return c.getTime();
	}

	/**
	 * 返回date里当月的第一天的日期对象
	 */
	public static Date firstDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DATE, 1); // 一日
		return c.getTime();
	}

	/**
	 * 返回date里当月的最后一天的日期对象
	 */
	public static Date lastDayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DATE, 1); // 把日期设置为当月第一天
		c.add(Calendar.DATE, -1); // 日期回滚一天，也就是最后一天
		return c.getTime();
	}

	/**
	 * 获以昨天的日期对象
	 * 
	 * @return
	 */
	public static Date yeatoday() {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());// 今天的日期
		c.add(Calendar.DATE, -1);// 日期减一天
		return c.getTime();
	}

	/**
	 * 返回日期对象的年份
	 */
	@SuppressWarnings("deprecation")
	public static Integer getYear(Date date) {
		return date.getYear() + 1900;
	}

	/**
	 * 返回日期对象的月份
	 */
	@SuppressWarnings("deprecation")
	public static Integer getMonth(Date date) {
		return date.getMonth() + 1;
	}

	/**
	 * 返回日期对象的第几日
	 * 
	 * @param date
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Integer getDay(Date date) {
		return date.getDate();
	}

	/**
	 * 检查一个包含多个ID的字符串,格式是否ID1,ID2,ID3,...IDn,<br />
	 * 检查内容包括:<br />
	 * 1. 以逗号分格;<br />
	 * 2. 逗号分格的字符都是正确的长整型数
	 */
	public static boolean checkIds(String ids) {
		if (ids != null) {
			String[] arr = ids.split(",");
			if (arr.length > 0) {
				for (String str : arr) {
					try {
						Long.parseLong(str);
					} catch (NumberFormatException e) {
						return false;
					}
				}
				return true;
			}
		}
		return false;
	}

	/**
	 * 检查str字符串里的字符是否全都是整数字符
	 */
	public static boolean isInt(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	/**
	 * 检查str字符串里的字符是否有效的数字字符
	 */
	public static boolean isNumber(String str) {
		try {
			Double.parseDouble(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	/**
	 * 将字符串转换为int型,如果转换失败,则返回0
	 */
	public static Integer str2Int(String str) {
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return 0;
		}
	}

	/**
	 * 字符串转换成Long类型
	 */
	public static Long str2Long(String str) {
		try {
			return Long.parseLong(str);
		} catch (NumberFormatException e) {
			return 0l;
		}
	}

	/**
	 * 字符串转换成Double类型
	 */
	public static Double str2Double(String str) {
		try {
			return Double.parseDouble(str);
		} catch (NumberFormatException e) {
			return 0.0;
		}
	}

	/**
	 * 字符串转换成BigDecimal类型
	 */
	public static BigDecimal str2BigDecimal(String str) {
		try {
			return new BigDecimal(str);
		} catch (Exception e) {
			return BigDecimal.ZERO;
		}
	}

	/**
	 * 字符串转换成Short类型
	 */
	public static Short str2Short(String str) {
		try {
			return Short.parseShort(str);
		} catch (NumberFormatException e) {
			return 0;
		}
	}

	/**
	 * 判断一个字符是AscII字符还是其它字符（如汉，日，韩文字符）
	 * 
	 * @param char c, 需要判断的字符
	 * @return boolean, 返回true,AscII字符
	 */
	public static boolean isLetter(char c) {
		int k = 0x80;
		return c / k == 0 ? true : false;
	}

	/**
	 * 返回字符串str的长度（中文字符以两位计算）
	 */
	public static int strLen(String str) {
		if (str == null)
			return 0;
		return str.replaceAll("—", "-").getBytes().length;
	}

	/**
	 * 在str的左边不够len长度的位数补chr字符<br />
	 * (chr将str填够len长度，如果str比len长,则直接返回str)
	 */
	public static String padLeft(String str, int len, char chr) {
		if (str == null)
			return makeChars(len, chr);

		return makeChars(len - strLen(str), chr) + str;
	}

	/**
	 * 在str的右边不够len长度的位数补chr字符<br />
	 * (chr将str填够len长度，如果str比len长,则直接返回str)
	 */
	public static String padRight(String str, int len, char chr) {
		if (str == null)
			return makeChars(len, chr);

		return str + makeChars(len - strLen(str), chr);
	}

	/**
	 * 产生num个以chr组成的字符串返回
	 */
	public static String makeChars(int num, char chr) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < num; i++) {
			sb.append(chr);
		}
		return sb.toString();
	}

	/**
	 * 给出一个类(多为model类)的.class,取得其类名(去掉前缀的包名)
	 */
	public static String getClassLastName(
			@SuppressWarnings("rawtypes") Class mClass) {
		String str = mClass.getName();

		return str.substring(str.lastIndexOf(".") + 1);
	}

	/**
	 * html编码<br />
	 * 空格不会被编码，如果要连空格一起编码，请使用这个方法的另一个重载htmlEncode(String str, Boolean
	 * encodeBlank)<br />
	 * 单引号没有被编码，因为很多情况下单引号的编码都不被解析为单引号<br />
	 * 所以要求所有的html编码输出都用双引号括起来
	 */
	public static String htmlEncode(String str) {
		return htmlEncode(str, false);
	}

	/**
	 * html编码<br />
	 * 单引号没有被编码，因为很多情况下单引号的编码都不被解析为单引号<br />
	 * 所以要求所有的html编码输出都用双引号括起来
	 * 
	 * @param encodeBlank
	 *            是否对空格进行编码默认false
	 */
	public static String htmlEncode(String str, Boolean encodeBlank) {
		if (str == null)
			return "";

		str = str.replace("&", "&amp;");
		// str = str.replace("'", "&apos;");
		str = str.replace("\"", "&quot;");
		str = str.replace("<", "&lt;");
		str = str.replace(">", "&gt;");
		if (encodeBlank)
			str = str.replace(" ", "&nbsp;");
		return str;
	}

	/**
	 * html解码
	 */
	public static String htmlDecode(String str, Boolean decodeBlank) {
		if (str == null)
			return "";

		str = str.replace("&amp;", "&");
		// str = str.replace("&apos;", "'");
		str = str.replace("&quot;", "\"");
		str = str.replace("&lt;", "<");
		str = str.replace("&gt;", ">");
		str = str.replace("&nbsp;", " ");
		return str;
	}

	/**
	 * 去掉字符串中的html标签
	 * 
	 * @param input
	 *            要处理的字符串
	 */
	public static String htmlErase(String input) {
		if (input == null || input.trim().equals("")) {
			return "";
		}
		// 去掉所有html元素,
		String str = input.replaceAll("\\&[a-zA-Z]{1,10};", "").replaceAll(
				"<[^>]*>", "");
		str = str.replaceAll("[(/>)<]", "");
		return str;
	}

	/**
	 * url解码
	 * 
	 * @param url
	 *            需要转码的URL
	 * @return
	 */
	public static String urlEncode(String url) {
		return urlEncode(url, defaultCharset);
	}

	/**
	 * url解码
	 * 
	 * @param url
	 *            需要转码的URL
	 * @param charset
	 *            转码字符编码集
	 * @return
	 */
	public static String urlEncode(String url, String charset) {
		try {
			return java.net.URLEncoder.encode(url, charset);
		} catch (UnsupportedEncodingException e) {
			return java.net.URLEncoder.encode(url);
		}
	}

	/**
	 * url解码
	 * 
	 * @param url
	 *            需要转码的URL
	 * @return
	 */
	public static String urlDecode(String url) {
		return urlDecode(url, defaultCharset);
	}

	/**
	 * url解码
	 * 
	 * @param url
	 *            需要转码的URL
	 * @param charset
	 *            转码字符编码集
	 * @return
	 */
	public static String urlDecode(String url, String charset) {
		try {
			return java.net.URLDecoder.decode(url, charset);
		} catch (UnsupportedEncodingException e) {
			return java.net.URLDecoder.decode(url);
		}
	}

	/**
	 * 将回车换行符转换成HTML的换行标签<br />
	 */
	public static String nl2br(String str) {
		return str.replaceAll("\r\n", "<br />").replaceAll("\n", "<br />");
	}

	/**
	 * 将HTML的换行标签<br />
	 * 转换成换行符
	 */
	public static String br2nl(String str) {
		return str.replaceAll("<br />", "\n").replaceAll("<br>", "\n");
	}

	/**
	 * 如果str为空(null), 或者将str去掉首尾空格后,等于空字符串(""), 则返回真
	 */
	public static boolean strIsEmpty(String str) {
		if (str == null || "".equals(str.trim()))
			return true;
		else
			return false;
	}

	/**
	 * 把字符串去掉前后空格后转换成Long
	 */
	public static Long str2Long2(String str) {
		if (str == null)
			return 0l;

		return str2Long(str.trim());
	}

	/**
	 * 把int型数字转换成字符串类型String
	 */
	public static String int2Str(Integer num) {
		if (num == null)
			return "";

		return num.toString();
	}

	/**
	 * 把long型数字转换成字符串类型String
	 */
	public static String long2Str(Long num) {
		if (num == null)
			return "";

		return num.toString();
	}

	/**
	 * 把int型转换成Long
	 */
	public static Long int2Long(Integer num) {
		if (num == null)
			return 0l;

		return Long.parseLong(num.toString());
	}

	public static Long BigInteger2Long(BigInteger num) {
		if (num == null)
			return 0l;

		return num.longValue();
	}

	public static Long BigDecimal2Long(BigDecimal num) {
		if (num == null)
			return 0l;

		return num.longValue();
	}

	public static Double BigDecimal2Double(BigDecimal num) {
		if (num == null)
			return 0d;

		return Double.parseDouble(num.toString());
	}

	/**
	 * 把int型转换成Short
	 */
	public static Short int2Short(Integer num) {
		if (num == null)
			return 0;

		return num.shortValue();
	}

	/**
	 * 将Object[]里的元素以sparator为间隔串连接起来成String返回
	 */
	public static String arrayJoin(Object[] arr, String sparator) {
		if (arr == null || arr.length == 0)
			return "";

		StringBuilder sb = new StringBuilder();
		for (Object str : arr) {
			if (str == null)
				continue;

			if (sb.length() > 0) {
				sb.append(sparator);
			}
			sb.append(str);
		}
		return sb.toString();
	}

	/**
	 * 将list里的元素以","号为间隔串连接起来成String返回
	 */
	public static String listJoin(@SuppressWarnings("rawtypes") List list) {
		return listJoin(list, ",");
	}

	/**
	 * 将list里的元素以sparator为间隔串连接起来成String返回
	 */
	public static String listJoin(@SuppressWarnings("rawtypes") List list,
			String sparator) {
		if (list == null || list.size() == 0)
			return "";

		StringBuilder sb = new StringBuilder();
		for (Object obj : list) {
			if (obj == null)
				continue;

			if (sb.length() > 0) {
				sb.append(sparator);
			}
			sb.append(obj);
		}
		return sb.toString();
	}

	/**
	 * 将set里的元素以sparator为间隔串连接起来成String返回
	 */
	public static String setJoin(@SuppressWarnings("rawtypes") Set set,
			String sparator) {
		if (set == null || set.size() == 0)
			return "";

		StringBuilder sb = new StringBuilder();
		for (Object obj : set) {
			if (obj == null)
				continue;

			if (sb.length() > 0) {
				sb.append(sparator);
			}
			sb.append(obj);
		}
		return sb.toString();
	}

	/**
	 * 将obj的值转成type指定类型的对象返回<br />
	 * 
	 * @param type
	 *            转换的类型为：<br />
	 * 
	 *            <pre>
	 * int        - Integer
	 * double     - Double
	 * short      - Short
	 * date       - yyyyMMdd格式的日期值转成Date对象
	 * date2      - yyyy-MM-dd格式的日期值转成Date对象
	 * long       - Long
	 * bigdecimal - BigDecimal
	 * money	  - BigDecimal
	 * time	      - HH:mm格式的时间值转成Date对象
	 * datetime   - yyyy-MM-dd HH:mm格式的日期值转成Date对象
	 * </pre>
	 */
	public static Object formatToType(String obj, String type) {
		if ("int".equalsIgnoreCase(type)) {
			return str2Int(obj);
		} else if ("double".equalsIgnoreCase(type)) {
			return str2Double(obj);
		} else if ("short".equalsIgnoreCase(type)) {
			return str2Short(obj);
		} else if ("date".equalsIgnoreCase(type)) {
			return str2Dt(obj);
		} else if ("time".equalsIgnoreCase(type)) {
			return strTime2Dt(obj);
		} else if ("datetime".equalsIgnoreCase(type)) {
			return strDt2Dt(obj);
		} else if ("long".equalsIgnoreCase(type)) {
			return str2Long(obj);
		} else if ("bigdecimal".equalsIgnoreCase(type)
				|| "money".equalsIgnoreCase(type)) {
			return str2BigDecimal(obj);
		} else {
			return obj;
		}
	}

	/**
	 * 在date日期上加上(或减去)amount天后返回一个新的Date对象
	 * 
	 * @param amount
	 *            正数则加，负数则减
	 */
	public static Date dateAdd(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, amount);
		return cal.getTime();
	}

	/**
	 * 在date日期上加上(或减去)amount个月后返回一个新的Date对象
	 * 
	 * @param amount
	 *            正数则加，负数则减
	 */
	public static Date dateAddMonth(Date date, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, amount);
		return cal.getTime();
	}

	/**
	 * 传入周几的数字（0 - 6）返回中文周几（日 - 一）
	 */
	public static String getWeekDay(Short week) {
		String[] weeks = new String[] { "日", "一", "二", "三", "四", "五", "六" };
		if (week >= 0 && week <= 6) {
			return weeks[week];
		}
		return "";
	}

	/**
	 * 用urlDecode解码list里的所有元素
	 */
	public static void urlDecodeList(List<String> list) {
		if (list == null)
			return;

		for (int i = 0; i < list.size(); i++) {
			list.set(i, urlDecode(list.get(i)).replace("\r\n", ""));
		}
	}

	/**
	 * 截取字符串
	 * 
	 * @param str
	 *            被截取的字符串
	 * @param startIndex
	 *            开始位置
	 * @param length
	 *            截取长度
	 */
	public static String substr(String str, int startIndex, int length) {
		return str.substring(startIndex, startIndex + length);
	}

	/**
	 * 截取字符串
	 * 
	 * @param str
	 *            被截取的字符串
	 * @param startIndex
	 *            开始位置
	 * @param length
	 *            截取长度
	 */
	public static String substr(String str, Long startIndex, int length) {
		return substr(str, startIndex.intValue(), length);
	}

	/**
	 * 截取带中文（一个中文算两个字符）的字符串
	 * 
	 * @param str
	 *            被截取的字符串
	 * @param startIndex
	 *            截取开始位置
	 * @param len
	 *            截取长度
	 * @return 截取后的字符串
	 */
	public static String substrGb(String str, int startIndex, int len) {
		byte[] bStr = str.getBytes();
		if (startIndex > bStr.length)
			return "";

		if (startIndex + len > bStr.length) {
			len = bStr.length - startIndex;
		}

		String cStr = new String(bStr, startIndex, len);
		if (!str.contains(cStr)) {
			return new String(bStr, startIndex, len - 1);
		} else {
			return cStr;
		}
	}

	/**
	 * 调用owner对象的get方法取得owner里的某属性值
	 * 
	 * @param owner
	 *            源对象
	 * @param propertyName
	 *            要取值的成员变量名称
	 * @return 返回取得的值
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static Object invokeGetMethod(Object owner, String propertyName)
			throws Exception {
		@SuppressWarnings("rawtypes")
		Class ownerClass = owner.getClass();
		propertyName = propertyName.substring(0, 1).toUpperCase()
				+ propertyName.substring(1);
		Method method = null;
		try {
			method = ownerClass.getMethod("get" + propertyName);
		} catch (SecurityException e) {
		} catch (NoSuchMethodException e) {
			return null;
		}

		Object obj = method.invoke(owner);

		ownerClass = null;
		method = null;

		return obj;
	}

	/**
	 * 取得一个指定范围内的随机整数
	 * 
	 * @param min
	 *            最小值（包含此最小值）
	 * @param max
	 *            最大值（包含此最大值）
	 */
	public static Integer getRandomNumber(int min, int max) {
		Random random = new Random((new Date()).getTime());// 指定种子数
		return min + random.nextInt(max - min) + 1;
	}

	/**
	 * 给系统java.library.path参数添加路径
	 * 
	 * @param s
	 * @throws IOException
	 */
	public static void addDir(String s) {
		try {
			Field field = ClassLoader.class.getDeclaredField("usr_paths");
			field.setAccessible(true);
			String[] paths = (String[]) field.get(null);
			for (int i = 0; i < paths.length; i++) {
				if (s.equals(paths[i])) {
					return;
				}
			}
			String[] tmp = new String[paths.length + 1];
			System.arraycopy(paths, 0, tmp, 0, paths.length);
			tmp[paths.length] = s;
			field.set(null, tmp);
		} catch (IllegalAccessException e) {
			System.out.println("Failed to get permissions to set library path");
		} catch (NoSuchFieldException e) {
			System.out
					.println("Failed to get field handle to set library path");
		}
	}

	/**
	 * 将字符串str截取到len长度返回，<br />
	 * 返回的符串长度一定是len，如果str不够len长，则补空格<br />
	 */
	public static String formatString2Length(String str, int len) {
		if (str == null)
			return Tools.makeChars(len, ' ');
		else if (len < 1)
			return "";

		byte[] bStr = str.replaceAll("—", "-").getBytes();
		if (len >= bStr.length)
			return Tools.padRight(str, len, ' ');

		String cStr = new String(bStr, 0, len);
		if (!str.contains(cStr)) {
			return new String(bStr, 0, len - 1) + ' ';
		} else {
			return cStr;
		}
	}

	/**
	 * 当str等于"true"(不区分大小写)返回true，否则返回false
	 */
	public static boolean str2Boolean(String str) {
		return "true".equalsIgnoreCase(str);
	}

	/**
	 * Object转成boolean
	 */
	public static boolean toBoolean(Object bool) {
		if (bool == null)
			return false;
		return "true".equalsIgnoreCase(bool.toString());
	}

	/**
	 * 当字符串要用来拼接成JSON格式的字符时，需要用这个函数来过滤一遍<br />
	 * 处理如下：<br />
	 * 1. 双引号(")转换成：\"<br />
	 * 2. 去掉换行符(\r)<br />
	 * 3. 回车符(\n)转换成：\\n
	 */
	public static String str2Json(String str) {
		return str.replaceAll("\"", "\\\"").replaceAll("\r", "")
				.replaceAll("\n", "\\n");
	}

	public static String gbk2utf8(String chenese)
			throws UnsupportedEncodingException {
		char c[] = chenese.toCharArray();
		byte[] fullByte = new byte[3 * c.length];
		for (int i = 0; i < c.length; i++) {
			int m = (int) c[i];
			String word = Integer.toBinaryString(m);
			StringBuffer sb = new StringBuffer();
			int len = 16 - word.length();
			// 补零
			for (int j = 0; j < len; j++) {
				sb.append("0");
			}
			sb.append(word);
			sb.insert(0, "1110");
			sb.insert(8, "10");
			sb.insert(16, "10");

			String s1 = sb.substring(0, 8);
			String s2 = sb.substring(8, 16);
			String s3 = sb.substring(16);

			byte b0 = Integer.valueOf(s1, 2).byteValue();
			byte b1 = Integer.valueOf(s2, 2).byteValue();
			byte b2 = Integer.valueOf(s3, 2).byteValue();
			byte[] bf = new byte[3];
			bf[0] = b0;
			fullByte[i * 3] = bf[0];
			bf[1] = b1;
			fullByte[i * 3 + 1] = bf[1];
			bf[2] = b2;
			fullByte[i * 3 + 2] = bf[2];

		}
		return new String(fullByte, "UTF-8");
	}

	/**
	 * 查找str在字符串数组strs中最后出现的索引位置
	 * 
	 * @param start
	 *            从start索引位置开始往前查找
	 */
	public static int findLastIndex(String[] strs, String str, int start) {
		for (int i = strs.length - 1; i >= start; i--) {
			if (str.equals(strs[i])) {
				return i;
			}
		}
		return -1;
	}

	/**
	 * 查找str在字符串数组strs中的索引位置
	 * 
	 * @param start
	 *            从start索引位置开始查找
	 */
	public static int findIndex(String[] strs, String str, int start) {
		for (int i = start; i < strs.length; i++) {
			if (str.equals(strs[i])) {
				return i;
			}
		}
		return -1;
	}

	/**
	 * * 将客户端参数值中的String值转换成系统编码字符串返回，<br />
	 * 如果val不是String类型则返回val本身<br />
	 * 通常用get方式传递的参数的中文都需要用这个方法转换才能正常显示
	 * 
	 * @param val
	 *            需要转的值
	 * @return
	 */
	public static Object string2SysCharset(Object val) {
		return string2SysCharset(val, defaultCharset);
	}

	/**
	 * * 将客户端参数值中的String值转换成系统编码字符串返回，<br />
	 * 如果val不是String类型则返回val本身<br />
	 * 通常用get方式传递的参数的中文都需要用这个方法转换才能正常显示
	 * 
	 * @param val
	 *            需要转的值
	 * @param charset
	 *            转换编码集
	 * @return
	 */
	public static Object string2SysCharset(Object val, String charset) {
		if (val.getClass().isArray()) {
			Object[] vals = (Object[]) val;
			for (int i = 0; i < vals.length; i++) {
				vals[i] = string2SysCharset(vals[i], charset);// 转换String值编码
			}
		}
		if (val.getClass().equals(String.class)) {
			try {
				return new String(((String) val).getBytes("ISO8859-1"), charset);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return val;
	}

	/**
	 * 如果string!=null则返回trim后的string值，如果string==null则返回""<br />
	 * 此方法不返回null
	 */
	public static String trimString(String string) {
		if (string == null)
			return "";
		else
			return string.trim();
	}

	/**
	 * 如果string!=null则返回trim后的string值，如果string==null则返回""<br />
	 * 此方法不返回null
	 */
	public static String trimString(Object obj) {
		if (obj == null)
			return "";
		else
			return obj.toString().trim();
	}

	/**
	 * 数字格式化实例
	 **/
	private static NumberFormat NUMBER_FORMAT = NumberFormat.getInstance();

	/**
	 * 金额数字添加千分号输出
	 * 
	 * @param money
	 * @return
	 */
	public static String moneyStr(String money) {
		return NUMBER_FORMAT.format(str2BigDecimal(money));
	}

	/**
	 * 金额数字添加千分号输出
	 * 
	 * @param money
	 * @return
	 */
	public static String moneyStr(Double money) {
		return NUMBER_FORMAT.format(money);
	}

	/**
	 * 金额数字添加千分号输出
	 * 
	 * @param money
	 * @return
	 */
	public static String moneyStr(BigDecimal money) {
		return NUMBER_FORMAT.format(money);
	}

	/**
	 * 把数字字符转成中文数字返回
	 * 
	 * @param num
	 * @return
	 */
	private static String gbDigit(char num) {
		return digit[num - 48];
	}

	private static final String[] digit = { "零", "壹", "贰", "叁", "肆", "伍", "陆",
			"柒", "捌", "玖" };
	private static final String[] fraction = { "角", "分" };
	private static final String[] digit_unit1 = { "", "拾", "佰", "仟" };
	private static final String[] digit_unit2 = { "元", "万", "亿" };

	/**
	 * 金额数字转成中文大写输出
	 * 
	 * @param money
	 * @return
	 */
	public static String moneyGb(String money) {
		StringBuffer sb_f = new StringBuffer();// 整数部分
		StringBuffer sb_b = new StringBuffer();// 小数部分

		char[] mchr = money.toCharArray();

		int idx = money.indexOf('.');
		if (idx >= 0 && idx < mchr.length - 1) {// 处理小数部分
			for (int i = 0; i < 2; i++) {
				if (i + idx + 1 >= mchr.length)
					break;
				char c = mchr[i + idx + 1];
				if (c == '0')
					continue;
				sb_b.append(gbDigit(c)).append(fraction[i]);
			}
		}

		if (idx == -1)// 没有小数
			idx = mchr.length;
		for (int i = 0, un1 = 0, un2 = 0; i < idx; i++) {
			char c = mchr[i];

			un1 = (idx - i + 3) % digit_unit1.length;
			un2 = (int) Math.floor((idx - i) / digit_unit1.length);

			if (c == '0') {
				if (sb_f.length() > 0
						&& sb_f.lastIndexOf("零") != sb_f.length() - 1)
					sb_f.append(gbDigit(c));
			} else
				sb_f.append(gbDigit(c) + digit_unit1[un1]);

			if (sb_f.length() > 0 && un1 == 0) {
				if (sb_f.lastIndexOf("零") == sb_f.length() - 1)
					sb_f.replace(sb_f.length() - 1, sb_f.length(),
							digit_unit2[un2]);
				else
					sb_f.append(digit_unit2[un2]);
			}
		}

		if (sb_f.length() == 0)
			sb_f.append("零元");

		if (sb_b.length() == 0)
			sb_b.append("整");
		return sb_f.append(sb_b).toString();
	}

	/**
	 * 将18位身份证号降位转成15位返回<br />
	 * 此函数是直接将多余的位数删除后返回，如果输入的id_code不是18位，则直接返回id_code本身
	 */
	public static String id18To15(String id_code) {
		if (Tools.strIsEmpty(id_code))// 输入字符为空则返回空字符
			return "";

		if (id_code.length() != 18)// 输入字符不是18位则返回原字符串
			return id_code;

		StringBuffer sb = new StringBuffer(id_code);
		sb.replace(17, 18, "");// 删除校验位
		sb.replace(6, 8, "");// 删除年份的前两位
		return sb.toString();
	}

	public static String sqlOrgnoToID(String colname) {
		// String dbtype =
		// SysSql.getDBType(CustomerContextHolder.getCustomerType());

		/**
		 * select $orgid{a.orgno} from sys_user a select (select orgid from
		 * SYS_ORG where orgno=a.orgno) from sys_user a select * from sys_user
		 * where orgid like
		 */
		String sql = "(select orgid from sys_org where orgno=" + colname + ")";
		return sql;

	}

	/**
	 * 返回obj是否存在于arr数组中
	 * 
	 * @param arr
	 * @param obj
	 * @return
	 */
	public static boolean inArray(Object[] arr, Object obj) {
		for (Object o : arr) {
			if (o.equals(obj))
				return true;
		}
		return false;
	}

	/**
	 * 返回六位数的纯数字验证码
	 * 
	 * @return
	 */
	public static String numbercheckcode() {
		char[] chars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		String res = "";
		for (int i = 0; i < 6; i++) {
			int id = (int) Math.ceil(Math.random() * 10);
			res += chars[id];
		}
		return res;
	}

	/**
	 * 返回四位数的验证码
	 * 
	 * @return
	 */
	public static String verification() {
		char[] chars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
				'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		String res = "";
		for (int i = 0; i < 4; i++) {
			int id = (int) Math.ceil(Math.random() * 35);
			res += chars[id];
		}
		return res;
	}

	/**
	 * object 转 bigDecimal
	 * 
	 * @param value
	 * @return
	 */
	public static BigDecimal getBigDecimal(Object value) {
		BigDecimal ret = null;
		if (value != null) {
			if (value instanceof BigDecimal) {
				ret = (BigDecimal) value;
			} else if (value instanceof String) {
				ret = new BigDecimal((String) value);
			} else if (value instanceof BigInteger) {
				ret = new BigDecimal((BigInteger) value);
			} else if (value instanceof Number) {
				ret = new BigDecimal(((Number) value).doubleValue());
			} else {
				throw new ClassCastException("Not possible to coerce [" + value
						+ "] from class " + value.getClass()
						+ " into a BigDecimal.");
			}
		}
		return ret;
	}
	/**
	 * 获取指定长度的随机数字字符串
	 * 
	 * @param n
	 *            字符串的长度
	 * @param sp
	 *            每个数字之间的分割符
	 * @return
	 */
	public static String genRandom(int n, String sp) {
		sp = sp == null ? "" : sp;
		Random rand = new Random();
		String result = "";
		for (int i = 0; i < n; i++) {
			Float f = rand.nextFloat() * 10;
			if (i > 0)
				result += sp;
			result += f.intValue();
		}
		return result;
	}

	/**
	 * 获取UUID 字符串
	 * 
	 * @return
	 */
	public synchronized static String getUUIDStr() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static void main(String[] args) {
		// System.out.println(moneyStr("123456789.89"));
		// System.out.println(moneyStr(123456789.89));
		// System.out.println(moneyStr(new BigDecimal(123456789.89)));

		System.out.println(id18To15("440301198110201234"));

		System.out.println("1001001.01: " + moneyGb("1001001.01"));
		System.out.println("100010001.10: " + moneyGb("100010001.10"));
		System.out.println("0010123012.3: " + moneyGb("0010123012.3"));
		System.out.println("0100345600.12: " + moneyGb("0100345600.12"));
		System.out.println("1234567.89: " + moneyGb("1234567.89"));
		System.out.println("123456789.00: " + moneyGb("123456789.00"));
		System.out.println("1234567.: " + moneyGb("1234567."));
		System.out.println(".89: " + moneyGb(".89"));
		System.out.println("12345600: " + moneyGb("12345600"));
		System.out.println("0.089: " + moneyGb("0.089"));
		System.out.println("300000000.00: " + moneyGb("300000000.00"));
		System.out
				.println(Tools
						.urlDecode("%E7%99%BB%E5%BD%95%E5%90%8D%E7%A7%B0%E4%B8%8D%E5%AD%98%E5%9C%A8%E6%88%96%E5%AF%86%E7%A0%81%E9%94%99%E8%AF%AF"));
		System.out
				.println("%C3%A6%C2%82%C2%A8%C3%A9%C2%9C%C2%80%C3%A8%C2%A6%C2%81%C3%A7%C2%99%C2%BB%C3%A5%C2%BD%C2%95%C3%A4%C2%BB%C2%A5%C3%A5%C2%90%C2%8E%C3%A6%C2%89%C2%8D%C3%A8%C2%83%C2%BD%C3%A8%C2%BF%C2%9B%C3%A8%C2%A1%C2%8C%C3%A6%C2%93%C2%8D%C3%A4%C2%BD%C2%9C");

	}

}
