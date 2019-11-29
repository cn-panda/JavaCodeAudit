/**
 * form表单工具
 * 
 * @author: OF
 * @version 1.0.0
 */
layui.define(['layer',"admin.common","form",'laydate',"admin.config",'layedit'], function(exports){
  var layer = layui.layer,
  adminCommon = layui['admin.common'],
  laydate = layui.laydate,
  adminConfig = layui['admin.config'],
  layedit = layui.layedit,
  form = layui.form,
  statusName = $.result(adminConfig,"global.result.statusName","errorNo"),
  msgName = $.result(adminConfig,"global.result.msgName","errorInfo"),
  dataName = $.result(adminConfig,"global.result.dataName","results.data"),
  dataStatus = $.result(adminConfig,"global.result.dataStatus");
  loadDataType = $.result(adminConfig,"global.loadDataType","0");
  selectVals = {},//下拉框默认值
  AdminForm = function (){
		this.config = {
			id:"",//form表单id
			elem:null//form对象
		}
	};
	
	var layEdits = {};
	
	AdminForm.prototype.render = function(options){
		var thisForm = this;
    $.extend(true, thisForm.config, options);
    
    if($.isEmpty(thisForm.config.id) && $.isEmpty(thisForm.config.elem)){
    	adminCommon.warnMsg("form选择器不能为空!");
    	return;
    }
	    
    if(!$.isEmpty(thisForm.config.id)){
      thisForm.config.elem = $("#"+thisForm.config.id);
    }
    
    thisForm.loadFormData();
    
    thisForm.renderDate();
    
    thisForm.renderLayedit();
    
    thisForm.bindButtionSubmit();
    
    thisForm.bindSwitch();
    
    thisForm.bindCheckbox();
    
    return thisForm;
	};
	
	//渲染日期控件绑定
	AdminForm.prototype.renderDate = function(){
    var thisForm = this;
		$(thisForm.config.elem).find("input.sykDate").each(function(){
		  var options = {};
		  var _this = $(this);
		  var dateRange = _this.attr("dateRange");//区间选择，true
		  var dateType = _this.attr("dateType");//控件选择类型
		  var dateFormat = _this.attr("dateFormat");//自定义格式
		  var dateMin = _this.attr("dateMin");//最大值
		  var dateMax = _this.attr("dateMax");//最小值
		  options["elem"] = this; //指定元素;
		  if(dateRange=="true"){
			  options["range"] = true;
		  }
		  if(!$.isEmpty(dateType)){
			  options["type"] = dateType;
		  }
		  if(!$.isEmpty(dateFormat)){
			  options["format"] = dateFormat;
		  }
		  var value = _this.val();//默认值
		  if(!$.isEmpty(value)){
			  options["value"] = value;
		  }
		  if(!$.isEmpty(dateMin)){
			  options["min"] = dateMin;
		  }
		  if(!$.isEmpty(dateMax)){
			  options["max"] = dateMax;
		  }
		  laydate.render(options);
	  });
	};
	
	/**
	 * 渲染lay编辑器
	 */
	AdminForm.prototype.renderLayedit = function(){
		 var thisForm = this;
		//lay编辑器设置
    layedit.set({
      uploadImage: {
        url: $.result(adminConfig,"global.servletUrl")+$.result(adminConfig,"global.editUrl") //接口url
        ,type: 'post' //默认post
      }
    });
    $(thisForm.config.elem).find("textarea.sykLayedit").each(function(){
    	var _this = $(this);
    	var id = _this.attr("id");
    	var name = _this.attr("name");
    	var _height = _this.attr("height");
    	if(!$.isEmpty(id) && !$.isEmpty(name)){
    		layEdits[name]=layedit.build(id,{
    			height: _height
    		}); //建立编辑器
    	}
    });
	};
	
	/**
	 * 渲染全部下拉框
	 */
	AdminForm.prototype.renderSelectAll = function(){
		var thisForm = this;
		 
	  $(thisForm.config.elem).find("select.sykSelect").each(function(){
	   	var _this = $(this);
	   	thisForm.renderSelect(_this);
	  });
	};
	
	/**
	 * 渲染下拉框
	 */
	AdminForm.prototype.renderSelect = function(_this,b,value){
		var thisForm = this;
   	thisForm.loadSelectData(_this,b,value);
   	//绑定选择器
   	var childrenSelectId = _this.attr("childrenSelectId");
   	var lay_filter = _this.attr("lay-filter");
   	if(!$.isEmpty(childrenSelectId) && !$.isEmpty(lay_filter)){
   		form.on('select('+lay_filter+')', function(data){
   			//如果选择项为空，清空所有的子选择项
   			thisForm.cleanSelectData(_this);
   			if(!$.isEmpty(data.value)){
   				thisForm.renderSelect($("#"+childrenSelectId),true,data.value);
   			}
   			//是否需要name值
   			var selectName = $(data.elem).attr("select_name");
   			if(selectName != undefined && selectName=="true"){
   				$("input[name="+childrenSelectId+"]").val($(data.elem).find("option:selected").text());
   			}
   		});
   		
   	}
   	
   	form.render("select"); //更新全部
	};
	
	/**
	 * 清空下拉框
	 */
	AdminForm.prototype.cleanSelectData =function(_this){
		var childrenSelectId = _this.attr("childrenSelectId");
		if($.isEmpty(childrenSelectId)){
			return;
		}
		var _childerThis = $("#"+childrenSelectId);
		if(_childerThis.length==0){
			return;
		}
		var addNull = _childerThis.attr("addNull");//是否显示空值，1 显示
		_childerThis.empty();//清空
    if(addNull == "1"){
    	_childerThis.append("<option></option>");
    }
    form.render("select"); //更新全部
    
    this.cleanSelectData(_childerThis);//递推处理子选择器
	};
	
	/**
	 * 加载下拉框数据
	 */
	AdminForm.prototype.loadSelectData =function(_this,b,value){
		var thisForm = this;
		
		var addNull = _this.attr("addNull");//是否显示空值，1 显示
    var isLoad = _this.attr("isLoad");//是否自动加载，1 是
    _this.empty();//清空
    if(addNull == "1"){
    	_this.append("<option></option>");
    }
    var dictType = _this.attr("dict_type");
    var dict = _this.attr("dict");
    if($.isEmpty(dict)){
    	return false;
    }
    //如果是字典从后台获取
    if(!$.isEmpty(dictType) &&　dictType === "dict" ){
    	var dataParam = {'dict_value':dict}; 
    	adminCommon.invoke($.result(adminConfig,"global.dictUrl"), dataParam, function(data) {
			if (data[statusName] == dataStatus) {
				var list = $.result(data, dataName);
				thisForm.selectDataRender(_this,
						$.result(adminConfig,"global.result.labelField","name") , $.result(adminConfig,"global.result.valueField","code"), list);
			} else {
				// 提示错误消息
				adminCommon.errorMsg(data[msgName]);
			}
		});
    	return false;
    }
    //如果是字典从后台获取
    if(!$.isEmpty(dictType) &&　dictType === "data" ){
    	var sqlid = _this.attr("sqlid");
    	if($.isEmpty(sqlid)){
        	return false;
        }
    	var dataParam = {'dict_value':dict,'sqlid':sqlid}; 
    	
    	adminCommon.invoke($.result(adminConfig,"global.comnQuery"), dataParam, function(data) {
			if (data[statusName] == dataStatus) {
				var list = $.result(data, dataName);
				thisForm.selectDataRender(_this,
						$.result(adminConfig,"global.result.labelField","name") , $.result(adminConfig,"global.result.valueField","code"), list);
			} else {
				// 提示错误消息
				adminCommon.errorMsg(data[msgName]);
			}
		});
    	return false;
    }
    
    var dictObj = layui.sykDict[dict];
    
    if($.isEmpty(dictObj)){
    	return false;
    }
    
    var labelField = dictObj["labelField"];
		var valueField = dictObj["valueField"];
		
    var formatType = dictObj["formatType"];//格式化类型
    if($.isEmpty(formatType) || formatType == "server"){
    	var funcNo = dictObj["loadFuncNo"];
    	var url = dictObj["action"];//请求url
    	var sqlid = dictObj["sqlid"];//请求接口服务
    	var inputs = dictObj["inputs"];
    	var param = {};//参数
    	if(!$.isEmpty(inputs))
    	{
    		var inputArr = inputs.split(',');
    		$.each(inputArr,function(i,v) {
    			var paramArr = v.split(':',2);
    			if(!$.isEmpty(paramArr[0]))
    			{
    				//获取参数值，如果值为空，获取选中行数据
    				var _vaule = paramArr[1];
    				if($.isEmpty(_vaule))
    				{
    					_vaule = value;
    				}else if($.startsWith(_vaule,"#")){
    					_vaule = $(_vaule).val();
	          }
    				param[paramArr[0]] = _vaule;
    			}
    		});
    		
    	}
    	//判断请求地址是否为空
    	if($.isEmpty(url)){
    		//获取默认配置中的请求地址
    		url = $.result(adminConfig,"global.comnQuery")+"?sqlid=" + sqlid;
    	}else{
    		//拼接
    		url = url + "?sqlid=" + sqlid;
    	}
	    if (!$.isEmpty(url) && (isLoad != "0" || b)) {
			adminCommon.invoke(url, param, function(data) {
				if (data[statusName] == dataStatus) {
					var list = $.result(data, dataName);
					thisForm.selectDataRender(_this,
							labelField, valueField, list);
				} else {
					// 提示错误消息
					adminCommon.errorMsg(data[msgName]);
				}
			});
    	}
    }else if(formatType == "local"){
    	
  		var list = dictObj["data"];
  		thisForm.selectDataRender(_this,labelField,valueField,list);
    }
    
	};
	
	/**
	 * select数据渲染
	 */
	AdminForm.prototype.selectDataRender = function(_this,labelField,valueField,list){
		var thisForm = this;
		
		$(list).each(function(i,v){
			var option="<option value=\""+v[valueField]+"\">"+v[labelField]+"</option>";
			_this.append(option);
		});
		
		//默认值
		var defaultValue = selectVals[_this.attr("name")];
		if(!$.isEmpty(defaultValue)){
			_this.val(defaultValue);
			//如果有子联动，继续渲染
			var childrenSelectId = _this.attr("childrenSelectId");
			if(!$.isEmpty(childrenSelectId)){
				thisForm.renderSelect($("#"+childrenSelectId),true,defaultValue);
			}
			
		}
		form.render("select"); //更新全部
	};
	
	/**
	 * 自动填充form表单数据
	 */
	AdminForm.prototype.loadFormData = function(){
    var thisForm = this;
		//参数处理，如果有参数，自动填充form表单
		var urlParam = adminCommon.getUrlParam();
		
		var formDom = $(thisForm.config.elem);
		
		//判断模式
		var _mode = urlParam["_mode"];
		if(!$.isEmpty(_mode)){
			delete urlParam["_mode"];
			formDom.append("<input type=\"hidden\" name=\"_mode\" value=\""+_mode+"\"/>");
			
			if("readonly" == _mode){//只读
				formDom.attr("isLoad","1");
				//隐藏所有的非关闭按钮
				formDom.find("button").each(function(i,e){
					var _function = $(e).attr("function");
					if("close" != _function){
						 $(e).hide();
					}else{
						$(e).show();
					}
				});
				//设置只读
				formDom.find("input").addClass("layui-disabled").attr("disabled","disabled");
				formDom.find("select,textarea").attr("disabled","disabled");
			}else if("add" == _mode){//新增
				formDom.attr("isLoad","0");
				formDom.find("button.fsEdit").hide();
				formDom.find("button:not(.fsEdit)").show();
				//只读处理
				formDom.find("input.fsAddReadonly").addClass("layui-disabled").attr("disabled","disabled");
				formDom.find("select.fsAddReadonly,textarea.fsAddReadonly").attr("disabled","disabled");
			}else if("edit" == _mode){//编辑
				formDom.attr("isLoad","1");
				formDom.find("button.fsAdd").hide();
				formDom.find("button:not(.fsAdd)").show();
				//只读处理
				formDom.find("input.fsEditReadonly").addClass("layui-disabled").attr("disabled","disabled");
				formDom.find("select.fsEditReadonly,textarea.fsEditReadonly").attr("disabled","disabled");
			}
			
		}
		
		if(!$.isEmpty(urlParam)){
			$(thisForm.config.elem).setFormData(urlParam);
		}
		
		//如果isLoad =1 并且地址不为空，查询
		var _fsUuid = urlParam["_fsUuid"];
		if(!$.isEmpty(_fsUuid)){
			delete urlParam["_fsUuid"];
		}
		if(formDom.attr("isLoad") == "1")
		{
			
			//从缓存中获取
			if(loadDataType == "1" && $.isEmpty(formDom.attr("loadFuncNo")) && $.isEmpty(formDom.attr("loadUrl"))){
				if(!$.isEmpty(_fsUuid)){
					var formDataStr =$.getSessionStorage(_fsUuid);
					if(!$.isEmpty(formDataStr)){
						showData(JSON.parse(formDataStr));
					}
				}else{
					adminCommon.errorMsg("唯一标识获取失败!");
				}
				
			}else if(!$.isEmpty(formDom.attr("loadFuncNo")) || !$.isEmpty(formDom.attr("loadUrl"))){
				//如果配置异步地址，默认加载异步地址
				var funcNo = formDom.attr("loadFuncNo");
		    var url = formDom.attr("loadUrl");//请求url
	      if($.isEmpty(url)){
	        url = "/fsbus/" + funcNo;
	      }
	      adminCommon.invoke(url,urlParam,function(data){
					if(data[statusName] == dataStatus)
			  	{
						var formData = $.result(data,dataName);
						showData(formData);
			  	}
			  	else
			  	{
			  		//提示错误消息
			  		adminCommon.errorMsg(data[msgName]);
			  	}
			  },false);
				
			}
			  
	  }else{
	  	thisForm.renderSelectAll();
	  }
		if(!$.isEmpty(_fsUuid)){
			//删除
			$.removeSessionStorage(_fsUuid);
			
		}
	//显示数据
	function showData(formData){
		if($.isEmpty(formData)){
			adminCommon.errorMsg("记录不存在!");
			return;
		}
		formDom.setFormData(formData);
		form.render(); //更新全部
		
		//联动下拉框处理，
		//1.先把联动下拉框数据缓存
		//2.异步加载完后，赋值
		$(thisForm.config.elem).find("select.sykSelect").each(function(){
			var _name = $(this).attr("name");
			selectVals[_name] = formData[_name];
		});
		
		$(thisForm.config.elem).find("select.sykSelect").each(function(){
			var selectDom = $(this);
			if(selectDom.attr("isLoad") != "0"){//一级下拉
				thisForm.renderSelect(selectDom);
			}
		});
	}
		  
 };
  
 
  
	/**
	 * 绑定提交按钮
	 */
	AdminForm.prototype.bindButtionSubmit = function(){
    var thisForm = this;
    $(thisForm.config.elem).find("button").each(function(){
      var lay_filter = $(this).attr("lay-filter");
      /**监听新增提交*/
      form.on("submit("+lay_filter+")", function (data) {
          
        if("1" == $(this).attr("isVerifyPwd"))//是否验证密码
        {
          //弹出密码提示
          layer.prompt({title: '输入验证密码，并确认', formType: 1}, function(pass, index){
            layer.close(index);
            data.field["loginPassword"] = pass;
            thisForm.submitForm(data.field,$(this));
          });
        }
        else
        {
          thisForm.submitForm(data.field,$(this));
        }
        return false;
      });
    });
	}

	
	function comnSubmit(_this,obj) {
		var sqlid =$(obj.elem).attr("sqlid");
		
		var url = $(obj.elem).attr("url");// 请求url
		if ($.isEmpty(sqlid) && $.isEmpty(url)) {
			adminCommon.warnMsg("请求地址为空！");
			return;
		}
		//判断请求地址是否为空
    	if($.isEmpty(url)){
    		//获取默认配置中的请求地址
    		url = $.result(adminConfig,"global.comnUpate")+"?sqlid=" + sqlid;
    	}else{
    		//拼接
    		url = url;
    	}
    	
		// 获取参数
		var id = _this.value;
		var name = _this.name;
		var value ;
		if(obj.elem.checked == true){
			value = '1';
		}else{
			value = '0';
		}
		var param = {'id':id};// 参数
		   param [name] =  value;
		// 请求数据
		adminCommon.invoke(url, param, function(data) {
			if (data[statusName] == dataStatus) {
				adminCommon.successMsg('操作成功!');
			} else {
				// 提示错误消息
				adminCommon.errorMsg(data[msgName]);
			}
		});
}
	/**
	 * 绑定Switch
	 */
	AdminForm.prototype.bindSwitch = function(){
		var thisForm = this;
		 var switchs = $(thisForm.config.elem).attr("switch-filter");
		 //switchs不为空时处理
		 if(switchs!= undefined){
		 var switchsArr = switchs.split(',');
			 $.each(switchsArr,function(i,v) {
				//监听性别操作
				  form.on("switch("+v+")", function(obj){
					  comnSubmit(this,obj);
				  });
			});
	   }
		 /**
		  * 解决关闭时不提交数据
		  */
		 $(thisForm.config.elem).find("input[type='checkbox']").each(function(){
			 var lay_filter = $(this).attr("name");
			 if(lay_filter!= undefined && lay_filter != ''){
				 //初始化值
				 var value = $(this).attr("checkbox_value");
				 if(value!= undefined && value != ''){
					var value = value.split('|');
				 	$(this).attr('type', 'hidden').val(this.checked ? value[0] : value[1]);
				 }else{
					 $(this).attr('type', 'hidden').val(this.checked ? 1 : 0);
				 }
				 //事件处理
			     form.on("switch("+lay_filter+")", function (data) {
			    	 if(value!= undefined && value != ''){
							 $(data.elem).attr('type', 'hidden').val(this.checked ? value[0] : value[1]);
						 }else{
							 $(data.elem).attr('type', 'hidden').val(this.checked ? 1 : 0);
						 }
			 	 })
			 }
		 });
	}
	
	/**
	 * 绑定checkbox
	 */
	AdminForm.prototype.bindCheckbox = function(){
		var thisForm = this;
		 var checkbox = $(thisForm.config.elem).attr("checkbox-filter");
		 if(checkbox!= undefined){
			var checkboxArr = checkbox.split(',');
			$.each(checkboxArr,function(i,v) {
				 //监听锁定操作
				  form.on('checkbox('+v+')', function(obj){
					  comnSubmit(this,obj);
				  });
			});
		 }
	}
	
	/**
	 * form表单格式验证
	 */
	if(!$.isEmpty(adminConfig["verify"])){
    form.verify(adminConfig["verify"]); 
	}
    
  /**
   * 表单提交请求
   * 
   */
	AdminForm.prototype.submitForm = function(param,_this){
    var url = _this.attr("url");//请求url
  	var funcNo = _this.attr("funcNo");
  	if($.isEmpty(funcNo) && $.isEmpty(url)){
  		adminCommon.warnMsg('请求地址为空!');
  		return;
  	}
  	if($.isEmpty(url)){
      url = "/fsbus/" + funcNo;
    }
  	
  	//处理layedit编辑器内容
  	$.each(layEdits, function(key, val) {
  		param[key] = layedit.getContent(val);
  	});
  	
  	//调用公共请求方法
  	adminCommon.invoke(url,param,function(data)
		{
    	if(data[statusName] == dataStatus)
    	{
    		adminCommon.successMsg('操作成功!');
    		adminCommon.setRefreshTable("1");
    		
    		//是否自动关闭，默认是
    		if(_this.attr("isClose") != "0"){
    			parent.layer.close(parent.layer.getFrameIndex(window.name));
    		}
    	}
    	else
    	{
    		//提示错误消息
    		adminCommon.errorMsg(data[msgName]);
    	}
		},false);
  };
  
  var adminForm = new AdminForm();
    //绑定按钮
	exports("admin.form",adminForm);
});