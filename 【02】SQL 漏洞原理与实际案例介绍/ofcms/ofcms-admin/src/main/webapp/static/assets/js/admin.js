/**
 * 前端核心库
 * 
 * @author OF
 * @date 2018年01月03日
 * @versin 1.0.0
 * @description
 */
var admin = function() {
	var o = {};
	// 版本
	o.version = "1.0.0";
	o.config = {
		envDev : true,
		ajax : {
			type : "POST",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			beforeSend : "处理中",
			error : "网络异常稍后重试!",
			success : "处理成功!"
		}
	};
/*
 * try { if (tools != undefined) o.tools = tools; } catch (e) { o.tools = {}; }
 * try { if (utile != undefined) o.utile = utile; } catch (e) { o.utile = {}; }
 */

	o.alert = function(msg) {
		alert(msg);
	}
	o.fn = o.__proto__  = {
		alertMsg :function(msg) {
			alert(msg);
		}
	};
	return o;
}();
window.admin = admin;
window.s === undefined && (window.s = admin)
