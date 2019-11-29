/**
 * 按钮组件
 * 
 * @author: OF
 * @version 1.0.0
 */
layui.define([], function(exports) {
	var AdminButtion = function() {

	};
	AdminButtion.prototype.test = function(elem, data, datagrid) {
		alert("测试自定义按钮" + JSON.stringify(data));
	}
	var adminButtion = new AdminButtion();
	exports('admin.buttion', adminButtion);
});