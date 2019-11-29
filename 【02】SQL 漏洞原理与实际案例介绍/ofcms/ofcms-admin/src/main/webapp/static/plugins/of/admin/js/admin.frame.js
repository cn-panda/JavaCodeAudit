/**
 * 通用框架
 * 
 * @author: OF
 * @version 1.0.0
 */
layui.use(['admin.form','admin.datagrid','admin.tree','admin.common','element'], function(){
	var adminForm = layui['admin.form'],
	adminDatagrid = layui['admin.datagrid'],
	adminTree = layui['admin.tree'],
	element = layui.element;
	adminCommon = layui['admin.common'];
	/********* form 表单处理   start *************/
	var formDoms =$("form");
	  
	if(formDoms.length>0){//如果没有查到form，自动关闭
    $(formDoms).each(function (index, domEle) { 
    	adminForm.render({elem:$(this)});
    });
	}
	/********* form 表单处理   end *************/
	
	/********* tree 处理   start *************/
	
	var trees = {};
	
	var treeDoms = $("ul.adminTree");
	if(treeDoms.length>0){
    $(treeDoms).each(function(i){
        var treeId=$(this).attr("id");
        var funcNo = $(this).attr("funcNo");
        var url = $(this).attr("url");
        trees[treeId] = adminTree.render({id:treeId,funcNo:funcNo,url:url,clickCallback:clickCallback});
      });
    //绑定按钮事件
    adminCommon.buttionEvent("tree",getTree);
	}
	
	function getTree(treeId){
    if($.isEmpty(trees)){
    	adminCommon.warnMsg("未配置tree！");
      return;
    }
    if($.isEmpty(treeId)){
      treeId = "treeDemo";
    }
    return trees[treeId];
  }
		
  /**
   * 树点击回调
   */
  function clickCallback(e,treeId, treeNode) {
  	
  	var _this = $("#"+treeId);
    var tableId = _this.attr("tableId");
    
    if($.isEmpty(tableId)){
    	tableId = _this.attr("datagridId");
    }
    
    if($.isEmpty(tableId)){
    	return;
    }
      
    //获取表格对应的查询form
    var defaultForm = $("#"+tableId).attr("defaultForm");
    if($.isEmpty(defaultForm)){
      defaultForm = "query_form";
    }
    var inputs = _this.attr("inputs");
    if(!$.isEmpty(inputs))
    {
      //获取值存入form表单
      var param = adminCommon.getParamByInputs(inputs,treeNode);
      $("#"+defaultForm).setFormData(param);
    }
    if(!$.isEmpty(datagrids) && !$.isEmpty(datagrids[tableId])){
      datagrids[tableId].query($("#"+defaultForm).getFormData());
    }
      
  }
  /********* tree 处理   end *************/
	
	
	/********* datagrid 处理   start *************/
  var tabs = $("table.adminDatagrid");
  var datagrids= {};//datagrid集合
  if(tabs.length > 0){
    $(tabs).each(function(){
      var tableId=$(this).attr("id");
      if(!$.isEmpty(datagrids[tableId])){
      	return;
      }
      var clickRenderTable = $(this).attr("clickRenderTable");//点击需要渲染的tableid
      var clickCallBack;//点击事件
  	  if(!$.isEmpty(clickRenderTable)){
  	  	var defaultForm= $("#"+clickRenderTable).attr("defaultForm");//默认form表单id
  	  	var clickRenderTableInputs = $(this).attr("clickRenderTableInputs");//点击需要传入的参数信息
  	  	clickCallBack = function(data){
  	  		//获取参数
  	  		var formData = adminCommon.getParamByInputs(clickRenderTableInputs,data);
  	  		//点击后，为查询form表单赋值
  	  		if(!$.isEmpty(defaultForm)){
  	  			$("#"+defaultForm).setFormData(formData);
  	  		}
	  			datagrids[clickRenderTable].reload(formData);
  	  	}
  	  }
          
      var datagrid = adminDatagrid.render({id:tableId,clickCallBack:clickCallBack});
      datagrid.bindDatagridTool(getDatagrid);
      if(tabs.length==1){
      	datagrids[tableId] = datagrid;
      }else{
      	//深度拷贝对象
      	datagrids[tableId] = $.extend(true,{},datagrid);
      }
    });
    adminCommon.buttionEvent("datagrid",getDatagrid);
  }else{
    //按钮绑定
  	adminCommon.buttionEvent("datagrid");
  }
  
  function getDatagrid(tableId){
    if($.isEmpty(tableId)){
      tableId = "adminDatagrid";
    }
    if($.isEmpty(datagrids)){
    	adminCommon.warnMsg("未配置datagrid！");
      return;
    }
    return datagrids[tableId];
  }
  /********* datagrid 处理   end *************/
	
});