package com.ofsoft.cms.core.utils;

import java.util.Calendar;
import java.util.Collection;
import java.util.regex.Pattern;

public class ValidateUtil {
	/** 字符串缺省状态 */
	private static final boolean DEFAULT_EMPTY_OK = false;

	/** 数字chars */
	private static final String DIGITS = "0123456789";

	/** 小写字母chars */
	public static final String LETTERS_LOWERCASE = "abcdefghijklmnopqrstuvwxyz";

	/** 小写字母chars + 数字 */
	public static final String LETTERS_LOWERCASE_DIGITS = LETTERS_LOWERCASE
			+ DIGITS;

	/** 大写字母chars */
	public static final String LETTERS_UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

	/** 大写字母chars + 数字 */
	public static final String LETTERS_UPPERCASE_DIGITS = LETTERS_UPPERCASE
			+ DIGITS;

	/** 全部字母chars */
	public static final String LETTERS = LETTERS_LOWERCASE + LETTERS_UPPERCASE;

	/** 全部字母数字 */
	public static final String LETTERS_DIGITS = LETTERS + DIGITS;

	/** 空白的chars (包括空格,\t,\n,\r) */
	private static final String WHITE_SPACE = " \t\n\r";

	/** 小数点 */
	private static final String DECIMAL_POING_DELIMITER = ".";

	/** 电话号码里允许的不是数字的chars ,两边括号,横线,空格 */
	private static final String PHONE_NUMBER_DELIMITERS = "()- ";

	/** 全球电话号码允许"+"号的chars */
	private static final String VALID_PHONE_CHARS_WORLD = "+" + DIGITS
			+ PHONE_NUMBER_DELIMITERS;

	/** 手机号码允许"+"号和数字,但只允许第一个字符是+号,验证是检查是否第一个是,如果是去除再验证 */
	private static final String VALID_MSISDN_CHARS = DIGITS;

	/** 手机号码允许的最大长度 */
	private static final int VALID_MSISDN_MAXLEN = 21;

	/** 手机号码允许的最小长度 */
	private static final int VALID_MSISDN_MINLEN = 11;

	/** 定义12月份对应的天数 */
	private static final int[] DAYS_IN_MONTH = { 31, 29, 31, 30, 31, 30, 31,
			31, 30, 31, 30, 31 };

	/** 检查两个对象是否相等 */
	public static boolean isEqual(Object obj, Object obj2) {
		return (obj == null) ? (obj2 == null) : obj.equals(obj2);
	}

	/** 检查字符串是否为空 */
	public static boolean isEmpty(Object obj) {
		if (obj == null)
			return true;

		if (obj instanceof String)
			return isEmpty((String) obj);

		return false;
	}

	/** 检查字符串是否为空 */
	public static boolean isEmpty(String s) {
		return ((s == null) || (s.trim().length() == 0));
	}

	/** 检查集合是否为空 */
	public static boolean isEmpty(Collection<?> c) {
		return ((c == null) || (c.size() == 0));
	}

	/** 检查字符串是否不为空 */
	public static boolean isNotEmpty(String s) {
		return ((s != null) && (s.trim().length() > 0));
	}

	/** 检查集合是否不为空 */
	public static boolean isNotEmpty(Collection<?> c) {
		return ((c != null) && (c.size() > 0));
	}

	/**
	 * 如果s中存在c,则返回true,否则返回false
	 */
	public static boolean isCharInString(char c, String s) {
		return (s.indexOf(c) != -1);
	}

	/** 检查字符是否是大写字母,(注:A-Z之间) */
	public static boolean isLetterUppercase(char c) {
		return LETTERS_UPPERCASE.indexOf(c) != -1;
	}

	/** 检查字符是否是大写字母加数字,(注:A-Z,0-9之间) */
	public static boolean isLetterUppercaseDigits(char c) {
		return LETTERS_UPPERCASE_DIGITS.indexOf(c) != -1;
	}

	/** 检查字符是否是小写字母,(注:a-z之间) */
	public static boolean isLetterLowercase(char c) {
		return LETTERS_LOWERCASE.indexOf(c) != -1;
	}

	/** 检查字符是否是小写字母加数字,(注:a-z,0-9之间) */
	public static boolean isLetterLowercaseDigits(char c) {
		return LETTERS_LOWERCASE_DIGITS.indexOf(c) != -1;
	}

	/** 检查字符是否是字母,(注:a-z,A-Z之间) */
	public static boolean isLetter(char c) {
		return LETTERS.indexOf(c) != -1;
	}

	/** 检查字符是否是数字 */
	public static boolean isDigit(char c) {
		return DIGITS.indexOf(c) != -1;
	}

	/** 检查字符是否是数字或字母 */
	public static boolean isLetterOrDigit(char c) {
		return LETTERS_DIGITS.indexOf(c) != -1;
	}

	/**
	 * 1\如果字符串为空或全是whitespace中的值则返回true,存在一个不是则返回false 2\见whitespace定义
	 * whitespace = " \t\n\r";(空格,\t,\n,\r)
	 */
	public static boolean isWhitespace(String s) {
		if (isEmpty(s))
			return true;

		// 逐个字符检查,如果发现一个不是whitespace,则返回false
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (WHITE_SPACE.indexOf(c) == -1)
				return false;
		}

		return true;
	}

	/** 检查是否是指定的长度，注:当s=null || s="",min=0时为true */
	public static boolean isLen(String s, int min, int max) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		return (s.length() >= min && s.length() <= max);
	}

	/** 检查是否GBK编码长度，数据库一般是一个汉字两个字节 */
	public static boolean isByteLen(String s, int min, int max) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		int len = 0;
		try {
			len = s.getBytes("GBK").length;
		} catch (Exception e) {
			len = s.getBytes().length;
		}
		return (len >= min && len <= max);
	}

	/** 检查是否指定编码长度，UTF-8是一个汉字3个字节，GBK是两个 */
	public static boolean isByteLen(String s, int min, int max, String encoding) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		int len = 0;
		try {
			len = s.getBytes(encoding).length;
		} catch (Exception e) {
			len = s.getBytes().length;
		}
		return (len >= min && len <= max);
	}

	/** 检查是否是整型 */
	public static boolean isInteger(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		// 逐个检查,如果出现一个字符不是数字则返回false
		for (int i = 0; i < s.length(); i++) {
			if (!isDigit(s.charAt(i)))
				return false;
		}

		return true;
	}

	/** 检查是否是带符号的整型(允许第一个字符为"+,-",不接受浮点".",指数"E"等 */
	public static boolean isSignedInteger(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		try {
			Integer.parseInt(s);

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/** 检查是否是带符号的长整型(允许第一个字符为"+,-",不接受浮点".",指数"E"等 */
	public static boolean isSignedLong(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		try {
			Long.parseLong(s);

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/** 检查是否是一个正整数 */
	public static boolean isPositiveInteger(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		try {
			long temp = Long.parseLong(s);

			if (temp > 0)
				return true;
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	/** 检查是否是一个非负整数 */
	public static boolean isNonnegativeInteger(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		try {
			int temp = Integer.parseInt(s);

			if (temp >= 0)
				return true;
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	/** 检查是否是一个负整数 */
	public static boolean isNegativeInteger(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		try {
			int temp = Integer.parseInt(s);

			if (temp < 0)
				return true;
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	/** 检查是否是一个非正整数 */
	public static boolean isNonpositiveInteger(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		try {
			int temp = Integer.parseInt(s);

			if (temp <= 0)
				return true;
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	/** 检查字符串是否是整型,且在a,b之间,>=a,<=b */
	public static boolean isIntegerInRange(String s, int a, int b) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		if (!isSignedInteger(s))
			return false;

		int num = Integer.parseInt(s);

		return ((num >= a) && (num <= b));
	}

	/** 检查字符串是否是正整型,且在a,b之间,>=a,<=b */
	public static boolean isIntegerInRangeLen(String s, int a, int b) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		if (!isInteger(s))
			return false;

		return ((s.length() >= a) && (s.length() <= b));
	}

	/** 是否是Unicode码 */
	public static final boolean isUnicode(String str) {
		if (isEmpty(str))
			return false;

		int len = str.length();
		for (int i = 0; i < len; i++) {
			if ((int) str.charAt(i) > 128)
				return true;
		}
		if (str.length() == 1) {
			if (((int) str.charAt(0)) > 128)
				return true;
		}
		return false;

	}

	/** 检查是否是一个无符号的浮点型,不支持指点E */
	public static boolean isFloat(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		if (s.startsWith(DECIMAL_POING_DELIMITER))
			return false;

		// 只允许一个点.
		boolean seenDecimalPoint = false;

		// 逐个字符检查
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (isDigit(c))
				continue;

			if (c == DECIMAL_POING_DELIMITER.charAt(0)) {
				if (!seenDecimalPoint) {
					seenDecimalPoint = true;
					continue;
				}
			}

			return false;
		}

		return true;
	}

	/** 检查是否是一个允许符号的浮点型,允许符号"+","-" */
	public static boolean isSignedFloat(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		try {
			float temp = Float.parseFloat(s);

			if (temp <= 0)
				return true;

			return false;
		} catch (Exception e) {
			return false;
		}
	}

	/** 检查是否是一个允许符号的双精度浮点型,允许符号"+","-" */
	public static boolean isSignedDouble(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		try {
			Double.parseDouble(s);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/** 检查字符串是否都是由字母组成 */
	public static boolean isAlphabetic(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!isLetter(c))
				return false;
		}

		return true;
	}

	/** 检查字符串是否都是由小写字母组成 */
	public static boolean isAlphabeticLowercase(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!isLetterLowercase(c))
				return false;
		}

		return true;
	}

	/** 检查字符串是否都是由大写字母组成 */
	public static boolean isAlphabeticUppercase(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!isLetterUppercase(c))
				return false;
		}

		return true;
	}

	/** 检查字符串是否都是由字母组成且长度在min,max范围内 */
	public static boolean isAlphabeticLen(String s, int min, int max) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		if (!isAlphabetic(s))
			return false;

		if (s.length() < min || s.length() > max)
			return false;

		return true;
	}

	/** 检查字符串是否都是由小写字母组成且长度在min,max范围内 */
	public static boolean isAlphabeticLowercaseLen(String s, int min, int max) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		if (!isAlphabeticLowercase(s))
			return false;

		if (s.length() < min || s.length() > max)
			return false;

		return true;
	}

	/** 检查字符串是否都是由大字母组成且长度在min,max范围内 */
	public static boolean isAlphabeticUpperLen(String s, int min, int max) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		if (!isAlphabeticUppercase(s))
			return false;

		if (s.length() < min || s.length() > max)
			return false;

		return true;
	}

	/** 检查字符串是否都是由字母或数字组成 */
	public static boolean isAlphanumeric(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!isLetterOrDigit(c))
				return false;
		}

		return true;
	}

	/** 检查字符串是否都是由字母或数字组成且长度在min,max范围内 */
	public static boolean isAlphanumericLen(String s, int min, int max) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		if (!isAlphanumeric(s))
			return false;

		if (s.length() < min || s.length() > max)
			return false;

		return true;
	}

	/** 检查字符串是否都是由大写字母或数字组成 */
	public static boolean isAlphaUpperNumeric(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!isLetterUppercaseDigits(c))
				return false;
		}

		return true;
	}

	/** 检查字符串是否都是由大写字母或数字组成 */
	public static boolean isAlphaLowerNumeric(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!isLetterLowercaseDigits(c))
				return false;
		}

		return true;
	}

	/** 检查字符串是否都是由大写字母或数字组成 */
	public static boolean isAlphaUpperNumericLen(String s, int min, int max) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		if (!isAlphaUpperNumeric(s))
			return false;

		if (s.length() < min || s.length() > max)
			return false;

		return true;
	}

	/** 检查字符串是否都是由小写字母或数字组成 */
	public static boolean isAlphaLowerNumericLen(String s, int min, int max) {
		if (isEmpty(s))
			return min == 0 ? true : false;

		if (!isAlphaLowerNumeric(s))
			return false;

		if (s.length() < min || s.length() > max)
			return false;

		return true;
	}

	/** 检查字符串是否正确的邮政编码 */
	public static boolean isZipCode(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		if (s.length() != 6 || !isInteger(s))
			return false;

		return true;
	}

	public static boolean isMoneyTwoRadix(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		// 去除负号
		if (s.startsWith("-"))
			s = s.substring(1);

		int ind = s.indexOf(".");
		if (ind == -1)
			return isInteger(s);// 如果没有点号，则判断是否是整数

		if (ind == 0)
			return false;

		String integer = s.substring(0, ind);
		String radix = s.substring(ind + 1);
		if (!isInteger(integer) || !isIntegerInRangeLen(radix, 2, 2))
			return false;// 如果整数部分不是整数，小数部分不是整数，或小数部分不是两位

		return true;
	}

	/** 检查字符串是否正确的邮件地址(注:要求存在@字符,且不是出现在第一个,最后一个位置,现在不检查是否存在".") */
	public static boolean isEmail(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		if (isWhitespace(s))
			return false;

		int indexLeft = s.indexOf('@');
		int indexRight = s.lastIndexOf('@');

		// 如果不存在@,或不止一个,或第一个,或最后一个
		if (indexLeft < 1 || indexLeft != indexRight || indexLeft == s.length())
			return false;

		return true;
	}

	/** 检查是否是正确的年 */
	public static boolean isYear(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		if (!isNonnegativeInteger(s))
			return false;

		return ((s.length() == 2) || (s.length() == 4));
	}

	/** 判断是否是周末 yyyy-MM-dd */
	public static boolean isWeekend(String date) {
		Calendar calendar = DateTimeUtil.toCalendar(date + " 00:00:01");
		return calendar.get(Calendar.DAY_OF_WEEK) == 1;
	}

	/** 判断是否季度末 yyyy-MM-dd */
	public static boolean isMonthQuarter(String date) {
		if (!isDate(date))
			return false;

		String year = date.substring(0, 4);
		String month = date.substring(5, 7);
		String day = date.substring(8);

		if (!isMonthLastDay(year, month, day))
			return false;

		if (month.equals("03") || month.equals("06") || month.equals("09")
				|| month.equals("12"))
			return true;

		return false;
	}

	/** 判断是否年末 yyyy-MM-dd */
	public static boolean isYearLastDay(String date) {
		if (!isDate(date))
			return false;

		String year = date.substring(0, 4);
		String month = date.substring(5, 7);
		String day = date.substring(8);

		if (!isMonthLastDay(year, month, day))
			return false;

		if (month.equals("12"))
			return true;

		return false;
	}

	/** 检查是否是正确的月 */
	public static boolean isMonth(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		return isIntegerInRange(s, 1, 12);
	}

	/** 检查是否是正确的日 */
	public static boolean isDay(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		return isIntegerInRange(s, 1, 31);
	}

	/** 检查是否闰年 */
	public static boolean isLeapYear(int year) {
		return (year % 4 == 0) && ((!(year % 100 == 0)) || (year % 400 == 0));
	}

	/** 检查是否是月末 yyyy-MM-dd HH:mm:ss */
	public static boolean isMonthLastDay(String date) {
		if (!isDate(date))
			return false;

		String year = date.substring(0, 4);
		String month = date.substring(5, 7);
		String day = date.substring(8);
		return isMonthLastDay(year, month, day);
	}

	/** 检查是否是月末 */
	public static boolean isMonthLastDay(String year, String month, String day) {
		if (!isDate(year, month, day))
			return false;

		int yearInt = Integer.parseInt(year);
		int monthInt = Integer.parseInt(month);
		int dayInt = Integer.parseInt(day);
		return isMonthLastDay(yearInt, monthInt, dayInt);
	}

	/** 检查是否是月末 */
	public static boolean isMonthLastDay(int year, int month, int day) {
		if (year < 1000 || year > 9999 || month > 12 || month < 1 || day > 31
				|| day < 1)
			return false;

		switch (month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			return day == 31;
		case 4:
		case 6:
		case 9:
		case 11:
			return day == 30;
		default:// 2月
			boolean isLeapYear = ValidateUtil.isLeapYear(year);
			return isLeapYear ? day == 29 : day == 28;
		}
	}

	/** 检查是否是正确的时 */
	public static boolean isHour(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		return isIntegerInRange(s, 0, 23);
	}

	/** 检查是否是正确的分 */
	public static boolean isMinute(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;
		return isIntegerInRange(s, 0, 59);
	}

	/** 检查是否是正确的秒 */
	public static boolean isSecond(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;
		return isIntegerInRange(s, 0, 59);
	}

	/** 检查是否是正确的日期 */
	public static boolean isDate(String year, String month, String day) {
		if (!(isYear(year) && isMonth(month) && isDay(day)))
			return false;

		int intYear = Integer.parseInt(year);
		int intMonth = Integer.parseInt(month);
		int intDay = Integer.parseInt(day);

		if (intDay > DAYS_IN_MONTH[intMonth - 1])
			return false;

		if ((intMonth == 2) && (intDay > (isLeapYear(intYear) ? 29 : 28)))
			return false;

		return true;
	}

	/** 检查是否是正确的日期 */
	public static boolean isDate(String date) {
		if (isEmpty(date))
			return DEFAULT_EMPTY_OK;

		if (date.length() != 10)
			return DEFAULT_EMPTY_OK;

		int dateSlash1 = date.indexOf("-");
		int dateSlash2 = date.lastIndexOf("-");

		if (dateSlash1 <= 0 || dateSlash1 == dateSlash2)
			return false;

		String year = date.substring(0, dateSlash1);
		String month = date.substring(dateSlash1 + 1, dateSlash2);
		String day = date.substring(dateSlash2 + 1);

		return isDate(year, month, day);
	}

	/** 判断是不是指定的时间格式 */
	public static boolean isDateTime(String datetime) {
		if (isEmpty(datetime))
			return false;

		datetime = datetime.trim();
		String[] strs = datetime.split(" ");
		if (strs.length != 2)
			return false;

		return isDate(strs[0]) && isTime(strs[1]);
	}

	/** 判断是不是指定的时间格式, spe为日期分隔符 */
	public static boolean isDateTime(String datetime, String spe) {
		if (isEmpty(datetime))
			return false;

		datetime = datetime.trim();
		String[] strs = datetime.split(" ");
		if (strs.length != 2)
			return false;

		return isDate(strs[0].replaceAll(spe, "-")) && isTime(strs[1]);
	}

	/** 检查是否是西方正确的日期 */
	public static boolean isEnglishDate(String date) {
		if (isEmpty(date))
			return DEFAULT_EMPTY_OK;

		int dateSlash1 = date.indexOf("/");
		int dateSlash2 = date.lastIndexOf("/");

		if (dateSlash1 <= 0 || dateSlash1 == dateSlash2)
			return false;

		String month = date.substring(0, dateSlash1);
		String day = date.substring(dateSlash1 + 1, dateSlash2);
		String year = date.substring(dateSlash2 + 1);

		return isDate(year, month, day);
	}

	/** 检查是否是日期比今天大 */
	public static boolean isDateAfterToday(String date) {
		if (isDate(date))
			return DEFAULT_EMPTY_OK;

		java.util.Date passed = DateTimeUtil.toDate(date, "00:00:00");
		java.util.Date now = DateTimeUtil.nowDate();

		return passed.after(now);
	}

	/** 检查是否是正确的时间 */
	public static boolean isTime(String hour, String minute, String second) {
		if (isHour(hour) && isMinute(minute) && isSecond(second))
			return true;

		return false;
	}

	/** 检查是否是正确的时间 */
	public static boolean isTime(String time) {
		if (isEmpty(time))
			return DEFAULT_EMPTY_OK;

		int timeColon1 = time.indexOf(":");
		int timeColon2 = time.lastIndexOf(":");

		if (timeColon1 <= 0 || timeColon1 == timeColon2)
			return false;

		String hour = time.substring(0, timeColon1);
		String minute = time.substring(timeColon1 + 1, timeColon2);
		String second = time.substring(timeColon2 + 1);

		return isTime(hour, minute, second);
	}

	/** 检查是否是正确的电话号码 */
	public static boolean isPhone(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		// 逐个字符检查,如果发现一个不是whitespace,则返回false
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!isCharInString(c, VALID_PHONE_CHARS_WORLD))
				return false;
		}

		return true;
	}

	/** 检查是否是正确的手机号码 */
	public static boolean isMsisdn(String s) {
		if (isEmpty(s))
			return DEFAULT_EMPTY_OK;

		// 如果第一个是+号,则去除
		if (s.charAt(0) == '+')
			s = s.substring(1);

		if (s.length() > VALID_MSISDN_MAXLEN
				|| s.length() < VALID_MSISDN_MINLEN)
			return false;

		// 逐个字符检查,如果发现一个不是VALID_MSISDN_CHARS,则返回false
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!isCharInString(c, VALID_MSISDN_CHARS))
				return false;
		}

		return true;
	}

	/**
	 * 判断号码是否符合配置文件所设条件
	 * 
	 * @param phone
	 *            号码字符串
	 * @oaram prefixs 固定前三个的前缀,如135,136,159等,多个用逗号隔开
	 * @return boolean =true 是手机号码,=false 非手机号码
	 */
	public static boolean isMsisdn11(String phone, String prefixs) {
		if (!isIntegerInRangeLen(phone, 11, 11))
			return false;

		String[] prefixArr = prefixs.split(",");
		for (int i = 0; i < prefixArr.length; i++) {
			if (phone.startsWith(prefixArr[i]))
				return true;
		}

		return false;
	}

	/**
	 * 判断号码是否符合配置文件所设条件
	 * 
	 * @param phone
	 *            号码字符串
	 * @param prefixs
	 *            前缀数组，如135,137,+86,0086,17951135等,多个用逗号隔开
	 * @return boolean =true 是手机号码,=false 非手机号码
	 */
	public static boolean isMsisdn21(String phone, String prefixs) {
		if (!isMsisdn(phone))
			return false;

		String[] prefixArr = prefixs.split(",");
		for (int i = 0; i < prefixArr.length; i++) {
			if (phone.length() != prefixArr[i].length() + 8)
				continue;

			if (phone.startsWith(prefixArr[i]))
				return true;
		}

		return false;
	}

	/** 检查是否是IP地址,ip为空返回false; */
	public static boolean isIP(String ip) {
		return isIP(ip, false);
	}

	/** 检查是否是IP地址 */
	public static boolean isIP(String ip, boolean allowEmpty) {
		if (isEmpty(ip))
			return allowEmpty;

		try {
			int ind1 = ip.indexOf('.');
			if (ind1 == -1)
				return false;

			String str1 = ip.substring(0, ind1);
			if (!ValidateUtil.isIntegerInRange(str1, 0, 255))
				return false;

			int ind2 = ip.indexOf('.', ind1 + 1);
			if (ind2 == -1)
				return false;

			String str2 = ip.substring(ind1 + 1, ind2);
			if (!ValidateUtil.isIntegerInRange(str2, 0, 255))
				return false;

			int ind3 = ip.indexOf('.', ind2 + 1);
			if (ind3 == -1)
				return false;

			String str3 = ip.substring(ind2 + 1, ind3);
			if (!ValidateUtil.isIntegerInRange(str3, 0, 255))
				return false;

			String str4 = ip.substring(ind3 + 1);
			if (!ValidateUtil.isIntegerInRange(str4, 0, 255))
				return false;
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	/** 检查是否是macAddress,macAddress为空返回false; */
	public static boolean isMacAddress(String macAddress) {
		return isMacAddress(macAddress, false);
	}

	/** 检查是否是IP地址 */
	public static boolean isMacAddress(String macAddress, boolean allowEmpty) {
		if (isEmpty(macAddress))
			return allowEmpty;

		return isRegExp(
				macAddress,
				"^[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}$");
	}

	/** 检查是否邮编 */
	public static boolean isPostalCode(String s) {
		if (!isInteger(s) || s.trim().length() != 6)
			return false;

		return true;
	}

	/** 检查是否在指定的字符串内 */
	public static boolean isScope(String s, String scope) {
		if (ValidateUtil.isEmpty(s))
			return ValidateUtil.DEFAULT_EMPTY_OK;

		// 逐个字符检查,如果发现一个不是specifyStr,则返回false
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);

			if (!ValidateUtil.isCharInString(c, scope))
				return false;
		}

		return true;
	}

	/** 检查value是否符合指定的pattern */
	public static boolean isRegExp(String value, String regExp) {
		if (regExp.startsWith("/"))
			regExp = regExp.substring(1);
		if (regExp.endsWith("/"))
			regExp = regExp.substring(0, regExp.length() - 1);
		return Pattern.matches(regExp, value);
	}

	/** 检查src是否包含字符串数组任何一个 */
	public static boolean isStrContainStrArr(String src, String[] strs) {
		for (String str : strs) {
			if (src.contains(str.trim()))
				return true;
		}

		return false;
	}

	/** 检查src是否包含字符串数组任何一个 */
	public static boolean isStrContainStrArr(String src, String strArr,
			String delm) {
		return isStrContainStrArr(src, strArr.split(delm));
	}
}
