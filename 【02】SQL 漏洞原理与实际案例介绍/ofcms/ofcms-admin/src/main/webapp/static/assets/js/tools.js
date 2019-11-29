/**
 * 前端工具库
 * 
 * @author OF
 * @date 2018年01月03日
 * @versin 0.0.1
 * @description
 */
!function (){
	tools = {};
	// 取得url中传来的参数值
	tools.getUrlValue = function(name) {
		var search = window.location.search;
		if(search.length > 1) {
			search = search.substring(1);
		} else {
			return "";
		}
		var strs = search.split('&');
		for(var i = 0; i < strs.length; i++) {
			var str = strs[i];
			var sts = str.split('=');
			if(sts.length > 1 && sts[0] == name) {
				return sts[1];
			}
		}
	};
	// url编码字符串
	tools.urlEncode = function(url) {
		return encodeURIComponent(url);
	};

	// url解码字符串
	tools.urlDecode = function(url) {
		return decodeURIComponent(url);
	};

	/**
	 * 错误提示
	 * 
	 * @param msg
	 *            消息
	 * @param time
	 *            时间 毫秒
	 */
	tools.alertError = function alertError(msg,offset, time) {
		if (time == '' || typeof (time) == "undefined") {
			time = 2000;
		}
		if (offset == '' || typeof (offset) == "undefined") {
			offset = '200px';
		}
		tools.alertMsg(msg,2,offset,time);
	}
	/**
	 * 成功消息提示
	 * 
	 * @param msg
	 *            消息
	 * @param time
	 *            时间 毫秒
	 */
	tools.alertSuccess = function (msg, offset,time) {
		if (time == '' || typeof (time) == "undefined") {
			time = 1000;
		}
		if (offset == '' || typeof (offset) == "undefined") {
			offset = '200px';
		}
		tools.alertMsg(msg,1,offset,time);
	}

	/**
	 * 消息提示
	 * 
	 * @param msg
	 *            消息
	 * @param time
	 *            时间 毫秒
	 */
	tools.alertMsg = function (msg,icon,offset,time) {
		if (time == '' || typeof (time) == "undefined") {
			time = 2000;
		}
		if (icon == '' || typeof (icon) == "undefined") {
			icon = 0;
		}
		if (offset == '' || typeof (offset) == "undefined") {
			offset = '200px';
		}
		layer.msg(msg, {
			icon : icon,
			offset : offset,
			time : time
		});
	}


	/**
	 * 日期格式化
	 * 
	 * @param fmt
	 *            格式yyyy-MM-dd var time1 = new Date().Format("yyyy-MM-dd"); var
	 *            time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
	 * @returns
	 */
	Date.prototype.Format = function(fmt) {
		var o = {
			"M+": this.getMonth() + 1, // 月份
			"d+": this.getDate(), // 日
			"h+": this.getHours(), // 小时
			"m+": this.getMinutes(), // 分
			"s+": this.getSeconds(), // 秒
			"q+": Math.floor((this.getMonth() + 3) / 3), // 季度
			"S": this.getMilliseconds()
			// 毫秒
		};
		if(/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
		for(var k in o)
			if(new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) :
					(("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	}
	/**
	 * 验证是不是数字
	 */
	tools.isNumber = function(oNum) {
		if(!oNum)
			return false;
		var strP = /^\d+(\.\d+)?$/;
		if(!strP.test(oNum))
			return false;
		try {
			if(parseFloat(oNum) != oNum)
				return false;
		} catch(ex) {
			return false;
		}
		return true;
	};
	/**
	 * 校验日期是否正确
	 */
	tools.isValidDate = function(v) {
		if(v.length == 8) {
			v = v.substr(0, 4) + '-' + v.substr(4, 2) + '-' + v.substr(6, 2);
		}
		var r = v.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
		if(r == null) {
			return false;
		}
		var d = new Date(r[1], r[3] - 1, r[4]);
		return(d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d
			.getDate() == r[4]);
	};
	/**
	 * 校验邮箱是否正确
	 */
	tools.isEmail = function(mailAddress) {
		var patterns = new RegExp(
			"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
		if(!patterns.test(mailAddress)) {
			return "电子邮箱格式不正确";
		}
		return true;
	};

	/**
	 * 判断身份证号码格式函数 公民身份号码是特征组合码， 排列顺序从左至右依次为：六位数字地址码，八位数字出生日期码，三位数字顺序码和一位数字校验码
	 */
	tools.isChinaIDCard = function(StrNo) {
		StrNo = StrNo.toString();
		if(StrNo.length == 15) {
			if(!Tools.isValidDate("19" + StrNo.substr(6, 2) + StrNo.substr(8, 2) +
					StrNo.substr(10, 2))) {
				return '身份证号码错误：出生日期不正确';
			}
		} else if(StrNo.length == 18) {
			if(!Tools.isValidDate(StrNo.substr(6, 4) + StrNo.substr(10, 2) +
					StrNo.substr(12, 2))) {
				return '身份证号码错误：出生日期不正确';
			}
		} else {
			return '身份证号码必须为15位或者18位';
		}

		if(StrNo.length == 18) {
			var a, b, c;
			if(!Tools.isNumber(StrNo.substr(0, 17))) {
				return '身份证号码错误：前17位不能含有英文字母';
			}
			a = parseInt(StrNo.substr(0, 1)) * 7 + parseInt(StrNo.substr(1, 1)) * 9 +
				parseInt(StrNo.substr(2, 1)) * 10;
			a = a + parseInt(StrNo.substr(3, 1)) * 5 + parseInt(StrNo.substr(4, 1)) *
				8 + parseInt(StrNo.substr(5, 1)) * 4;
			a = a + parseInt(StrNo.substr(6, 1)) * 2 + parseInt(StrNo.substr(7, 1)) *
				1 + parseInt(StrNo.substr(8, 1)) * 6;
			a = a + parseInt(StrNo.substr(9, 1)) * 3 +
				parseInt(StrNo.substr(10, 1)) * 7 +
				parseInt(StrNo.substr(11, 1)) * 9;
			a = a + parseInt(StrNo.substr(12, 1)) * 10 +
				parseInt(StrNo.substr(13, 1)) * 5 +
				parseInt(StrNo.substr(14, 1)) * 8;
			a = a + parseInt(StrNo.substr(15, 1)) * 4 +
				parseInt(StrNo.substr(16, 1)) * 2;
			b = a % 11;
			if(b == 2) { // 最后一位为校验位
				c = StrNo.substr(17, 1).toUpperCase(); // 转为大写X
			} else {
				c = parseInt(StrNo.substr(17, 1));
			}
			switch(b) {
				case 0:
					if(c != 1) {
						return '身份证号码校验位错'; /* ：最后一位应该为：1'; */
					}
					break;
				case 1:
					if(c != 0) {
						return '身份证号码校验位错'; /* ：最后一位应该为：0"; */
					}
					break;
				case 2:
					if(c != "X") {
						return '身份证号码校验位错'; /* ：最后一位应该为：X"; */
					}
					break;
				case 3:
					if(c != 9) {
						return '身份证号码校验位错'; /* ：最后一位应该为：9"; */
					}
					break;
				case 4:
					if(c != 8) {
						return '身份证号码校验位错'; /* ：最后一位应该为：8"; */
					}
					break;
				case 5:
					if(c != 7) {
						return '身份证号码校验位错'; /* ：最后一位应该为：7"; */
					}
					break;
				case 6:
					if(c != 6) {
						return '身份证号码校验位错'; /* ：最后一位应该为：6"; */
					}
					break;
				case 7:
					if(c != 5) {
						return '身份证号码校验位错'; /* 最后一位应该为：5"; */
					}
					break;
				case 8:
					if(c != 4) {
						return '身份证号码校验位错'; /* ：最后一位应该为：4"; */
					}
					break;
				case 9:
					if(c != 3) {
						return '身份证号码校验位错'; /* ：最后一位应该为：3"; */
					}
					break;
				case 10:
					if(c != 2) {
						return '身份证号码校验位错'; /* ：最后一位应该为：2"; */
					}
			}
		} else { // 15位身份证号
			if(!Tools.isNumber(StrNo)) {
				return '身份证号码错误：前15位不能含有英文字母';
			}
		}
		return true;
	};

	/**
	 * 将form表单中的数据转换成String 类型的JSON数据
	 * 
	 * @param {}
	 *            form
	 * @return {}
	 */
	tools.form2Json = function(form) {
		var jsonBuilder = "";
		var json = {};

		$("select", form).each(function() {
			var elementName = $(this).attr("name");
			var elementVal = $(this).val();

			if(elementName != undefined && elementName != "") {
				var array = elementName.split(".");
				for(var i = 1; i < array.length; i++) {
					var tmpArray = Array();
					tmpArray.push("json");
					for(var j = 0; j < i; j++) {
						tmpArray.push(array[j]);
					}
					var evalString = tmpArray.join(".");
					if(!eval(evalString)) {
						eval(evalString + "={};");
					}
				}
				eval("json." + elementName + "='" + elementVal + "';");
			} else {
				eval("json." + elementName + "='" + elementVal + "';");
			}
		});

		$("textarea", form).each(
			function() {
				var elementName = $(this).attr("name");
				var elementVal = $(this).val();

				if(elementName != undefined && elementName != "" &&
					elementName.indexOf('.') >= 0) {
					var array = elementName.split(".");
					for(var i = 1; i < array.length; i++) {
						var tmpArray = Array();
						tmpArray.push("json");
						for(var j = 0; j < i; j++) {
							tmpArray.push(array[j]);
						}
						var evalString = tmpArray.join(".");
						if(!eval(evalString)) {
							eval(evalString + "={};");
						}
					}
					eval("json." + elementName + "='" + elementVal + "';");
				} else {
					eval("json." + elementName + "='" + elementVal + "';");
				}
			});

		$(":input ", form).each(
			function() { // 很好说了就是去循环我们取得的数组对象
				var elementName = $(this).attr("name");
				var flag = false;
				if($(this).attr("type") == "hidden" ||
					$(this).attr("type") == "text") {
					var elementVal = $(this).val();
					flag = true;
				} else if($(this).attr("type") == "radio" &&
					$(this).attr("checked") == "checked") {
					var elementVal = $(this).val();
					flag = true;
				} else if($(this).attr("type") == "password") {
					var elementVal = $(this).val();
					flag = true;
				} else {
					flag = false;
				}
				if(flag) {
					if(elementName != undefined && elementName != "") {
						var array = elementName.split(".");
						for(var i = 1; i < array.length; i++) {
							var tmpArray = Array();
							tmpArray.push("json");
							for(var j = 0; j < i; j++) {
								tmpArray.push(array[j]);
							}
							var evalString = tmpArray.join(".");
							if(!eval(evalString)) {
								eval(evalString + "={};");
							}
						}
						// eval("json." + elementName + "='" + elementVal +
						// "';");

						json[elementName] = elementVal;

					}
				}
			});

		return json;
	};

	/**
	 * 手机号验证
	 */
	tools.checkPhone = function(el) {
		var phone = $(el).val();
		if(!(/^1[34578]\d{9}$/.test(phone))) {
			return false;
		}
		return true;
	}
	/**
	 * 手机号验证
	 */
	tools.checkMobile = function(phone) {
		if(!(/^1[34578]\d{9}$/.test(phone))) {
			return false;
		}
		return true;
	}
	return admin.tools = tools;
}(window);
