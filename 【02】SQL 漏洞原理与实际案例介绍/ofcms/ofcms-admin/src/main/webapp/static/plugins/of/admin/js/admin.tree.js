/**
 * tree工具
 * 
 * @author: OF
 * @version 1.0.0
 */
layui.define(['layer','admin.common','admin.config'], function(exports){
	var layer = layui.layer,
	fsCommon = layui['admin.common'],
	fsConfig = layui['admin.config'],
	statusName = $.result(fsConfig,"global.result.statusName","errorNo"),
	msgName = $.result(fsConfig,"global.result.msgName","errorInfo"),
	dataName = $.result(fsConfig,"global.result.dataName","results.data"),
	dataStatus = $.result(fsConfig,"global.result.dataStatus");
	AdminTree = function (){
		this.config = {
			funcNo : undefined,//地址
			url : undefined,//请求url地址
			id:"",
			autoParam : ["id=parentId"],  //参数
			dataName : "results.data",  //结果集对象
			clickCallback : undefined  //点击回掉函数
		}
	};
	
	
	/**
	 * 渲染tree
	 */
	AdminTree.prototype.render = function(options){
		var _this = this;
    $.extend(true, _this.config, options);
    
    if($.isEmpty(_this.config.id)){
    	fsCommon.warnMsg("id不能为空!");
			return;
    }
    this.queryTree();
    return _this;
	};
	
	//显示树
	AdminTree.prototype.showTree = function(data) {
		var _this = this;
		var funcNo = _this.config.funcNo;

    var url = _this.config.url;//请求url
    
    if($.isEmpty(funcNo) && $.isEmpty(url)){
    	fsCommon.warnMsg("请求地址为空!");
			return;
		}
		if($.isEmpty(url)){
      url = "/fsbus/" + funcNo;
    }
		var servletUrl = $.result(fsConfig,"global.servletUrl");
		if(!$.isEmpty(servletUrl)){
			url = servletUrl + url;
		}
		var setting = {
			view: {
				showLine: false
			},
			async: {
				enable: true,
				url:url,
				autoParam:_this.config.autoParam,
				dataFilter: function ajaxDataFilter(treeId, parentNode, responseData) {
			    if(responseData[statusName] == dataStatus)
					{
			    	return $.result(responseData,_this.config.dataName);
					}
					else
					{
						//提示错误消息
						layer.alert(data[msgName], {icon:0})
					}
			    return responseData;
				}
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: _this.config.clickCallback
			}
		};
		$.fn.zTree.init($("#"+_this.config.id), setting,data);
	};
	
	//查询菜单树列表
	AdminTree.prototype.queryTree = function() {
		var _this = this;
		var funcNo = _this.config.funcNo;
		var url = _this.config.url;//请求url
       
		if($.isEmpty(funcNo) && $.isEmpty(url)){
			fsCommon.warnMsg("请求地址为空!");
			return;
		}
		if($.isEmpty(url)){
			url = "/fsbus/" + funcNo;
		}
		
		fsCommon.invoke(url,{},function(data)
		{
			if(data[statusName] == dataStatus)
			{
				var array = $.result(data,_this.config.dataName);
				if(!$.isArray(array)){
					array = new Array();
				}
				array.push({ id:1, pId:0, name:"根目录", open:true});
				
				_this.showTree(array);
			}
			else
			{
				//提示错误消息
				layer.alert(data[msgName], {icon:0})
			}
		});
	}
  	
	/**
	 * 刷新节点
	 */
	AdminTree.prototype.refresh = function() {
		var _this = this;
		var zTree = $.fn.zTree.getZTreeObj(_this.config.id),
		type = "refresh",
		silent = false,
		nodes = zTree.getSelectedNodes();
		if (nodes.length == 0) {
//			fsCommon.warnMsg("请选择节点刷新");
//			zTree.reAsyncChildNodes(null, type, silent);
			return;
		}
		for (var i=0, l=nodes.length; i<l; i++) {
			if(nodes[i]["isParent"]){
				zTree.reAsyncChildNodes(nodes[i], type, silent);
			}else{
				//刷新父节点
				zTree.reAsyncChildNodes(nodes[i].getParentNode(), type, silent);
			}
		}
	}
	
	
	/**
	 * 获取选中的节点
	 */
	AdminTree.prototype.getCheckData = function() {
		var _this = this;
		var zTree = $.fn.zTree.getZTreeObj(_this.config.id);
		return zTree.getSelectedNodes();
	}
	
	var adminTree = new AdminTree();
	exports("admin.tree",adminTree);
});