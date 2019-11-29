/**
 * datagrid工具
 * @author: OF
 * @version 1.0.0
 */
layui.define(["admin.common","table",'laypage','admin.config','form','admin.buttion'], function(exports){
  var adminCommon = layui['admin.common'],
  table = layui.table,
  form = layui.form,
  laypage = layui.laypage,
  adminConfig = layui['admin.config'],
  adminButtion = layui['admin.buttion'],
  statusName = $.result(adminConfig,"global.result.statusName","errorNo"),
  msgName = $.result(adminConfig,"global.result.msgName","errorInfo"),
  dataName = $.result(adminConfig,"global.result.dataName","results.data"),
  dataStatus = $.result(adminConfig,"global.result.dataStatus");
  defaultLimit = $.result(adminConfig,"global.page.limit",20),//默认分页数量
  defaultLimits = $.result(adminConfig,"global.page.limits",[10,20,30,50,100]),//默认每页数据选择项
  loadDataType = $.result(adminConfig,"global.loadDataType","0");
  datagridSubmitType = $.result(adminConfig,"global.datagridSubmitType","1");
  AdminDatagrid = function (){
  };
  
  AdminDatagrid.prototype.render = function(options,params){
  	this.config = {
      id:"",//form表单id
      elem:null,//form对象
      fsSortType : $.result(adminConfig,"global.page.sortType"),//排序方式，1 异步排序
      clickCallBack:null //点击回调函数
    }
  	
    var thisDatagrid = this;
    $.extend(true, thisDatagrid.config, options);
    
    if($.isEmpty(thisDatagrid.config.id)){
    	adminCommon.warnMsg("表格id不能为空!");
      return;
    }
    
    if(!$.isEmpty(thisDatagrid.config.id)){
      thisDatagrid.config.elem = $("#"+thisDatagrid.config.id);
    }
    
    thisDatagrid.loadDatagrid(params);
    return thisDatagrid;
  };
      
      
    
  /**
   * 加载datagrid
   */
  AdminDatagrid.prototype.loadDatagrid = function(params){
	  var thisDatagrid = this;
	  var _table = $(thisDatagrid.config.elem);
	  var tableId = _table.attr("id");
	  if($.isEmpty(tableId)){
	  	adminCommon.errorMsg("表格id未配置!");
      return ;
	  }
	  
	  if(tableId != _table.attr("lay-filter")){
	  	adminCommon.errorMsg("表格id和lay-filter不一致!");
      return ;
	  }
	  
	  //判断模式
	  var urlParam = adminCommon.getUrlParam();
		var _mode = urlParam["_mode"];
		if(!$.isEmpty(_mode)){
			if("readonly" == _mode){//只读
				//设置只读
				_table.attr("isLoad","1");
				$("button.fsNew,button.fsEdit").hide();
			}else if("add" == _mode){//新增
				_table.attr("isLoad","0");
				$("button.fsEdit").hide();
				$("button:not(.fsEdit)").show();
			}else if("edit" == _mode){//编辑
				_table.attr("isLoad","1");
				$("button.fsAdd").hide();
				$("button:not(.fsAdd)").show();
			}
		}
	  
	  //获取table属性
	  var defaultForm = _table.attr("defaultForm");//查询条件formid
	  
	  if($.isEmpty(defaultForm)){
      defaultForm = "query_form";
	  }
	  
	  //获取查询表单的参数
	  var formData = $("#"+defaultForm).getFormData(true);
	  if(!$.isEmpty(params)){
	  	$.extend(formData, params);
	  }
	  
	  var inputs = _table.attr("inputs");//参数
	  if(!$.isEmpty(inputs)){
	  	var param = adminCommon.getParamByInputs(inputs,urlParam);
	  	$.extend(formData, param);
	  }
	  
	  if(!$.isEmpty(_table.attr("sortType"))){
	  	thisDatagrid.config.fsSortType = _table.attr("sortType");
	  }
	  
	  var funcNo = _table.attr("funcNo");//地址
	  
	  var isPage = _table.attr("isPage");//是否分页
	  
	  var height = _table.attr("height");//高度
	  if($.isEmpty(height)){
      height = "full-130";
	  }
	  
	  var pageSize = _table.attr("pageSize");//每页数量
	  if($.isEmpty(pageSize)){
      pageSize = defaultLimit;
	  }
	  
	  var url = _table.attr("url");//请求url
	  if($.isEmpty(url)){
      url = "/fsbus/" + funcNo;
	  }
	  var servletUrl = $.result(adminConfig,"global.servletUrl");
	  if(!$.isEmpty(servletUrl)){
      url = servletUrl + url;
	  }
	  
	  var isLoad =  _table.attr("isLoad");//是否自动加载数据，1 :默认加载，0 ：不加载
	  if(isLoad != "0"){
	  	isLoad = "1";
	  }
	  var datagridCols = _table.getDatagridCols();
	  
	  var _cols = datagridCols["colsArr"];
	  
	  thisDatagrid.formatDataQuery(datagridCols["formatArr"]);
	  
	  //执行渲染
	  thisDatagrid.datagrid = table.render({
	    id:tableId,
	    elem: "#"+tableId, //指定原始表格元素选择器（推荐id选择器）
	    url:url,
	    fsSortType : thisDatagrid.config.fsSortType,
	    where : formData, //增加条件
	    page: isPage == "1",
	    method : "POST",
//	    skin : 'row',
	    height: height, //容器高度
	    limits: defaultLimits,//每页数据选择项
	    limit: defaultLimit ,//默认采用50
	    cols:  _cols,
	    clickCallBack: thisDatagrid.config.clickCallBack,
	    data: [],
	    isLoad : isLoad,
	    request: {
        pageName: $.result(adminConfig,"global.page.request.pageName","pageNum"), //页码的参数名称，默认：pageNum
        limitName: $.result(adminConfig,"global.page.request.limitName","pageSize") //每页数据量的参数名，默认：pageSize
	    },
	    response: {
	      statusName:$.result(adminConfig,"global.statusName","code") //数据状态的字段名称，默认：code
	      ,statusCode: '200' //成功的状态码，默认：0
	      ,msgName: $.result(adminConfig,"global.msgName","msg") //状态信息的字段名称，默认：msg
	      ,countName: $.result(adminConfig,"global.page.response.countName","total_rows")  //数据总数的字段名称，默认：total_rows
	      ,dataName: $.result(adminConfig,"global.dataName","data") //数据列表的字段名称，默认：data
	    }
	  });
	  
	  if(thisDatagrid.config.fsSortType == "1"){
	  	table.on('sort('+tableId+')', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
	  		thisDatagrid.sort(obj);
	  	});
	  }
      
  };
  
  /**
   * 格式化数据查询
   */
  AdminDatagrid.prototype.formatDataQuery = function(formatArr){
  	if(!$.isEmpty(formatArr)){
  		$.each(formatArr,function(index,dict){
  			var dictType = dict['dict_type'];
  			dict = dict['dict'];
  		    if($.isEmpty(dict)){
  		    	return false;
  		    }
  		    //如果是字典从后台获取
  		    if(!$.isEmpty(dictType) &&　dictType === "dict" ){
  		    	var dataParam = {'dict_value':dict}; 
  		    	adminCommon.invoke($.result(adminConfig,"global.dictUrl"), dataParam, function(data) {
  					if (data[statusName] == dataStatus) {
  						var list = $.result(data, dataName);
  						layui.sykDict[dict]={
  								'labelField':$.result(adminConfig,"global.result.labelField","name"),
  								'valueField':$.result(adminConfig,"global.result.valueField","code"),
  								formatType : "local",
  								data:list
  						}
  					} else {
  						// 提示错误消息
  						adminCommon.errorMsg(data[msgName]);
  					}
  				});
  		    	return false;
  		    }
  		    
  			var elem = layui.sykDict[dict];
  			
  			if($.isEmpty(elem)){
  				return false;
  			}
  			
  			var formatType = elem["formatType"];//格式化类型
  			
  			if(formatType == "server"){
  				var url = elem["loadUrl"];//请求url
  				
  				if(!$.isEmpty(url)){
  					
  					var inputs =elem["inputs"];
  					var param = {};//参数
  					if(!$.isEmpty(inputs))
  					{
  						var inputArr = inputs.split(',');
  						$.each(inputArr,function(i,v) {
  							var paramArr = v.split(':',2);
  							if(!$.isEmpty(paramArr[0]))
  							{
  								param[paramArr[0]] = paramArr[1];
  							}
  						});
  						
  					}
  					
  					adminCommon.invoke(url,param,function(result){
  						if(result[statusName] == dataStatus)
  						{
  							var list = $.result(result,dataName);
  							elem["data"]=list;
  						}
  						else
  						{
  							//提示错误消息
  							adminCommon.errorMsg(result[msgName]);
  						}
  					},false);
  				}
  			}
  			
  		});
  	}
  };
      
  /**
   * 刷新
   */
  AdminDatagrid.prototype.refresh = function(){
    if(!$.isEmpty(this.datagrid)){
        this.datagrid.refresh();
//        this.datagrid.reload();
    }
  };
  
  /**
   * 排序
   */
  AdminDatagrid.prototype.sort = function(obj){
    if(!$.isEmpty(this.datagrid)){
        this.datagrid.sort(obj);
    }
  };
      
      
  /**
   * 选中的数据
   */
  AdminDatagrid.prototype.getCheckData = function(){
    var tableId = this.config.id;
    return table.checkStatus(tableId).data;
  };

  /**
   * 查询
   */
  AdminDatagrid.prototype.query = function(param){
    if(!$.isEmpty(this.datagrid)){
      this.datagrid.query(param);
    }
  };
      
  /**
   * 新增行
   */
  AdminDatagrid.prototype.addRow = function(param){
    if(!$.isEmpty(this.datagrid)){
      this.datagrid.addRow(param);
    }
  };
  
  
  /**
   * 重新load
   */
  AdminDatagrid.prototype.reload = function(param){
    if(!$.isEmpty(this.datagrid)){
  		var options = {where:param};
      this.datagrid.reload(options);
    }
  };
  
  /**
   * 刷新静态表格数据
   */
  AdminDatagrid.prototype.refreshStatic = function(){
    if(!$.isEmpty(this.datagrid)){
      this.datagrid.refreshStatic();
    }
  };
  
  /**
   * 获取数据
   */
  AdminDatagrid.prototype.getData = function(){
    if(!$.isEmpty(this.datagrid)){
    	if(datagridSubmitType == "2"){
    		var arr = new Array(); 
    		var data = this.datagrid.getData();
    		if(!$.isEmpty(data)){
    			$.each(data,function(i,row){
    				if($.isEmpty(row["fsType"])){
      				row["fsType"] = "edit";
      			}
    				arr.push(row);
    			}); 
    		}
    		if(!$.isEmpty(this.data)){
    			$.each(this.data,function(i,row){
    				arr.push(row);
    			});
    		}
    		return arr;
    	}
    	else{
    		return this.datagrid.getData();
    	}
    	
    }
  };
	
  /**
   * 绑定工具条{
   * 增加、删除、详情事件
   * }
   */
  AdminDatagrid.prototype.bindDatagridTool = function(getDatagrid){
    var thisDatagrid = this;
    var _table = $(thisDatagrid.config.elem);
    var tableId = _table.attr("id");
    //监听工具条
    table.on("tool("+tableId+")", function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
      var data = obj.data; //获得当前行数据
      var layEvent = obj.event; //获得 lay-event 对应的值
      var tr = obj.tr; //获得当前行 tr 的DOM对象
      
      var _this = $(this);
      
      switch(layEvent){
      	case "submit" :
      		 //提交
        	function submitForm(){
        	var funcNO = _this.attr("funcNo");
            var url = _this.attr("url");//请求url
            if($.isEmpty(funcNO) && $.isEmpty(url)){
            	adminCommon.warnMsg("请求地址为空！");
              return;
            }
            if($.isEmpty(url)){
              url = "/fsbus/" + funcNo;
            }
            //获取参数
            var inputs = _this.attr("inputs");
            var param = {};//参数
            if(!$.isEmpty(inputs)){
              param = adminCommon.getParamByInputs(inputs,data);
            }
            //请求数据
            adminCommon.invoke(url,param,function(data)
            {
              if(data[statusName] ==dataStatus)
              {
              	adminCommon.setRefreshTable("1");
              	if(!$.isEmpty(getDatagrid(tableId))){
              		 getDatagrid(tableId).refresh();
              	}
                adminCommon.successMsg('操作成功!');
              }
              else
              {
                //提示错误消息
              	adminCommon.errorMsg(data[msgName]);
              }
            });
        	}
        	
        	
          if("1" == _this.attr("isConfirm"))
          {
            var confirmMsg = _this.attr("confirmMsg");
            if($.isEmpty(confirmMsg))
            {
              confirmMsg="是否确定操作选中的数据?";
            }
            
            adminCommon.confirm("提示", confirmMsg, function(index)
            {
              layer.close(index);
              submitForm();
            });
          }else{
          	submitForm();
          }
				  break;
      	case "top" :
      		 //打开新窗口
          var _url = _this.attr("topUrl");
          if($.isEmpty(_url))
          {
          	adminCommon.warnMsg("url地址为空！");
            return false;
          }
          
          var inputs = _this.attr("inputs");
          
          if(!$.isEmpty(inputs))
          {
            _url = adminCommon.getUrlByInputs(_url,inputs,data);
            
            //处理数据缓存
            if(loadDataType == "1"){
            	var uuid = $.uuid();
            	_url += "&_fsUuid="+uuid;
            	//缓存选中的数据
            	$.setSessionStorage(uuid,JSON.stringify(data));
            }
          }
          
          //弹出的方式
          var _mode = _this.attr("topMode");
          if(!$.isEmpty(_mode)){
          	if(_url.indexOf('?') == -1)
    				{
    					_url +="?";
    				}else{
    					_url +="&";
    				}
          	_url += "_mode="+_mode;
          }
          var _title = _this.attr("topTitle");
          var _width = _this.attr("topWidth");
          var _height = _this.attr("topHeight");
          var isMaximize = _this.attr("isMaximize");
          
          adminCommon.open(_title,_width,_height,_url,function(){
          	if(adminCommon.isRefreshTable())
            {
          		if(!$.isEmpty(getDatagrid(tableId))){
          			getDatagrid(tableId).refresh();
          		}
            }
    			},isMaximize);
        
				  break;
      	case "delRow" :
      		
      		function submit(){
      			var fsType = obj.data["fsType"];
      		
	      		//删除前，记录删除的数据
	      		if(datagridSubmitType == "2" && ($.isEmpty(fsType) || fsType == "edit")){
	      			if($.isEmpty(thisDatagrid["data"])){
	      				thisDatagrid["data"] = new Array();
	      			}
	      			obj.data["fsType"] = "del";
	      			thisDatagrid["data"].push(obj.data);
	      		}
	      		//删除行
	      		obj.del();
	        	thisDatagrid.refreshStatic();
	      	}
      		
	    		 if("1" == _this.attr("isConfirm"))
	         {
	           var confirmMsg = _this.attr("confirmMsg");
	           if($.isEmpty(confirmMsg))
	           {
	             confirmMsg="是否确定操作选中的数据?";
	           }
	           
	           adminCommon.confirm("提示", confirmMsg, function(index)
	           {
	             layer.close(index);
	             submit();
	           });
	         }else{
	         	submit();
	         }
      		
			 break;
      	default:
      		if(!$.isEmpty(layEvent)){
      			try {
      				
      				if(!$.isEmpty(adminButtion[layEvent])){
      					//执行
      					adminButtion[layEvent](_this,obj.data,getDatagrid(tableId));
      				}else{
      					layui.buttion[layEvent](_this,obj.data,getDatagrid(tableId));
      				}
      				
				 } catch (e) {
					 console.error(e);
				 }
      		}
      	break;
      	}
    });
    
  };
      
  var adminDatagrid = new AdminDatagrid();
  exports("admin.datagrid",adminDatagrid);

});