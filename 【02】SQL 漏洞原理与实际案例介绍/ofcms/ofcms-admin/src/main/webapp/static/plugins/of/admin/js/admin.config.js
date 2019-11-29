/**
 *  基础配置
 * @author: OF
 * @version 1.0.0
 */
layui.define([], function (exports) {

	var adminConfig = {};
	
	/**
	 * 错误码处理定义
	 */
	adminConfig["filters"] = {
		//配置统一未登录错误码处理
		"-999" : function(result) {
			//未登录，跳转登陆页
			top.window.location.href = adminConfig["global"]["loginUrl"];
		}
	};
	
	/**
	 * 项目中需要调用到的常量、变量这里配置
	 */
	adminConfig["global"] = {
		"servletUrl":webroot+"/admin/", //异步请求地址,本地工程可以不填
		"loginUrl" : "/admin/login.html", //登录url
		"comnQuery" : "comn/service/query.json", //查询接口
		"comnUpate" : "comn/service/update.json", //修改接口
		"editUrl" : "comn/service/editUploadImage.json", //上传附件url
		"uploadUrl" : "comn/service/upload.json", //上传附件url
		"uploadHtmlUrl" : "f.html?p=comn/upload.html", //上传附件html地址，默认/plugins/frame/views/upload.html
		"dictUrl": "system/dict/get.json",//字典请求地址
		"dictSingleUrl": "system/dict/getSingle.json",//字典请求地址
		"loadDataType":"1",//加载数据类型，1：是，0：否，默认0  （编辑或查看是否取缓存数据）
		"datagridSubmitType":"1",//数据表格提交类型，1：原数据提交，2：增删改标签提交（fsType）， 默认1
		"result" : { //响应结果配置
	    "statusName": "code", //数据状态的字段名称，默认：errorNo
	    "labelField": "dict_name", //字典名称
		"valueField": "dict_value",//字典值
	    "msgName": "msg", //状态信息的字段名称，默认：errorInfo
	    "dataName" : "data", //非表格数据的字段名称，默认：results.data
	    "dataStatus" : "200", //非表格数据的字段名称，默认：results.data
		},
		"page" : { //分页配置
			"sortType":"0",//默认排序方式，0：本地排序，1：异步排序，不配置默认为0
			"request": {//请求配置
				"pageName": "pageNum", //页码的参数名称，默认：pageNum
				"limitName": "pageSize" //每页数据量的参数名，默认：pageSize
			},
			"response": {//响应配置
				"countName": "total_rows", //数据总数的字段名称，默认：results.data.total
				"dataName" : "data", //数据列表的字段名称，默认：results.data
				"dataNamePage": "data" //分页数据列表的字段名称，默认：results.data.list
			},
			"limit":10,//每页分页数量。默认10
//			"limits":[10,20,30,50,100]//每页数据选择项，默认[10,20,30,50,100]
		}
	};
	
	/**
	 * 拓展form表单验证规则
	 */
	adminConfig["verify"] = {
		/**
		 * 对比两个值相等
		 */
		"equals" : function(value, item) { // value：表单的值、item：表单的DOM对象
			var equalsId = $(item).attr("equalsId");
			if (_.isEmpty(equalsId)) {
				return '未配置对比id';
			}
			var value2 = $("#" + equalsId).val();

			if (!_.eq(value, value2)) {
				var equalsMsg = $(item).attr("equalsMsg");
				if (_.isEmpty(equalsMsg)) {
					equalsMsg = "值不相等";
				}
				return equalsMsg;
			}
		},
		/**
		 * 用户名验证
		 */
		"username" : [ /^[a-zA-Z]{1}([a-zA-Z0-9]|[_]){2,19}$/, '用户名格式不正确!' ],
		/**
		 * 最小、最大长度判断
		 */
		"length" : function(value, item) { // value：表单的值、item：表单的DOM对象
			var minLength = $(item).attr("minLength");// 最小长度
			var maxLength = $(item).attr("maxLength");// 最大长度
			if (!_.isEmpty(minLength) && !_.eq('0', minLength)
					&& _.gt(minLength, value.length)) {
				return "输入内容小于最小值:" + minLength;
			}
			if (!_.isEmpty(maxLength) && !_.eq('0', maxLength)
					&& _.gt(value.length, maxLength)) {
				return "输入内容大于最小值:" + maxLength;
			}
		},
		// 手机号验证 不空时才验证
		"mobile" : function(value, item) { 
			if (value != "") {
				if(!(/^1\d{10}$/.test(value))) {
					return "请输入正确的手机号";
				}
			}
		},
		// 手机号验证 不空时才验证
		"email" : function(value, item) { 
			if (value != "") {
				if(!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value))) {
					return "邮箱格式不正确";
				}
			}
		},
		// 数字
		'numbers': function(value, item) {
			if (value != "") {
				if (isNaN(value)) return "只能填写数字"
			}
		} 
	};
	exports('admin.config', adminConfig);
});