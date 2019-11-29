/**
 * @Description: 入口
 * @Copyright: 2017 www.fallsea.com Inc. All rights reserved.
 * @author: fallsea
 * @version 1.6.3
 * @License：MIT
 */
layui.config({
  base : "/ofcms-admin/static/plugins/syk/front/js/",//设定扩展的Layui模块的所在目录，一般用于外部模块扩展
	version : '1.6.3'
});

layui.utile={};
/**
 * 转义字典工具
 */
layui.utile.toDict = function(dict,value){
	var data = layui.sykDict[dict];
	var _value = "";
	if(!$.isEmpty(data) && !$.isEmpty(dict) && !$.isEmpty(value) && !$.isEmpty(data["labelField"]) && !$.isEmpty(data["valueField"])){
		
		var labelField = data["labelField"];
		var valueField = data["valueField"];
		
		var list=data["data"];
		
		//分割方式，默认,
		var spaceMode = data["spaceMode"];
		if($.isEmpty(spaceMode)){
			spaceMode=",";
		}
		
		if($.isNumeric(value)){
			analysis(value);
		}else if($.type(value) == "string"){
			//value 多个,分割，循环处理
			$.each(value.split(','),function(i,e){
				analysis(e);
			});
		}
		
		function analysis(value){
			$.each(list,function(index,elem){
				if(elem[valueField] == value){
					if(!$.isEmpty(_value)){
						_value += spaceMode;
					}
					if(!$.isEmpty(elem[labelField])){
						var css = elem["css"];//样式处理
						var style = elem["style"];
						if(!$.isEmpty(css) || !$.isEmpty(style)){
							_value += "<span class=\""+css+"\" style=\""+style+"\">"+elem[labelField]+"</span>";
						}else{
							_value += elem[labelField];
						}
					}
					return false;
				}
			});
		}
		
		return _value;
	}
	return _value;
};

//jquery 插件
(function($){
	
	/**
   * 获取token信息
   */
  var getToken = function ()
  {
  	var _csrf_code=$('meta[name="_csrf_code"]').attr("content");
    var _csrf_name=$('meta[name="_csrf_name"]').attr("content");
    var token = {};
    token[_csrf_name] = _csrf_code;
    return token;
  };
    
	$.ajaxSetup({
		  headers : getToken(),
      type: 'POST',
      async: true,
      dataType : "json",
      timeout : 30000 
	 });
	
	/**
	 * 获取form表单数据
	 */
	$.fn.getFormData = function (isValid) {
	  var fieldElem = $(this).find('input,select,textarea'); //获取所有表单域
	  var data ={};
	  layui.each(fieldElem, function(index, item){
      if(!item.name) return;
      if(/^checkbox|radio$/.test(item.type) && !item.checked) return;
      var value = item.value;
      if(item.type == "checkbox"){//如果多选
      	if(data[item.name]){
      		value = data[item.name] + "," + value;
      	}
      }
      if(isValid)
      {
    	 //如果为true,只需要处理有数据的值
    	 if(!$.isEmpty(value))
       {
    		 data[item.name] = value;
       }
      }
      else
      {
    	  data[item.name] = value;
      }
    });
    return data;
  };
  
  /**
   * 设置form表单值
   */
  $.fn.setFormData = function (data) {
  	if(!$.isEmpty(data))
  	{
  		$(this)[0].reset();
  		$(this).autofill(data);
  	}
  };
    
  /**
   * 获取datagrid 列集合
   */
  $.fn.getDatagridCols = function () {
  	
  	var colArr = new Array();
  	var colsArr = new Array();
  	var formatArr = new Array();//需要格式化的集合
  	var datagrid_cols = $(this).next(".fsDatagridCols");
  	if(!$.isEmpty(datagrid_cols))
  	{
  		var data = {};
  		$.each(datagrid_cols.children(),function(i, n){
				var _this = $(this);
				
				var type = _this.attr("type");
				
				if(!$.isEmpty(type) && type == "br"){//换行
					colArr.push(colsArr);
					colsArr = new Array();
					data = {};
					return true;
				}
	  			
				var toolbar = _this.attr("toolbar");
				var col = {};
				
				if(!$.isEmpty(_this.attr("align"))){
					col["align"] = _this.attr("align");
				}
				if(!$.isEmpty(_this.attr("fixed"))){
					col["fixed"] = _this.attr("fixed");
				}
				if(!$.isEmpty(_this.attr("style"))){
  				col["style"] = _this.attr("style");
  			}
    			
  			if(!$.isEmpty(_this.attr("colspan"))){
  				col["colspan"] = _this.attr("colspan");
  			}
  			if(!$.isEmpty(_this.attr("rowspan"))){
  				col["rowspan"] = _this.attr("rowspan");
  			}
  			
				if($.isEmpty(toolbar)){//普通列
					var field = _this.attr("field");
	  			var title = _this.attr("title");
	  			var width = _this.attr("width");
	  			var sort = _this.attr("sort");
	  			var templet = _this.attr("templet");
	  			var checkbox = _this.attr("checkbox");
	    			
	  			if(!$.isEmpty(type)){
	  				col["type"] = type;
	  			}
	  			
	  			if(!$.isEmpty(field)){
	  				col["field"] = field;
	  			}
	  			if(!$.isEmpty(title)){
	  				col["title"] = title;
	  			}
	  			if(!$.isEmpty(width)){
	  				col["width"] = width;
	  			}
	  			if(!$.isEmpty(sort)){
	  				col["sort"] = sort;
	  			}
	  			if(!$.isEmpty(templet)){
	  				col["templet"] = templet;
	  			}
	  			if(!$.isEmpty(checkbox)){
	  				col["checkbox"] = checkbox;
	  			}
	  			
	  			
	  			if(!$.isEmpty(_this.attr("LAY_CHECKED"))){
	  				col["LAY_CHECKED"] = _this.attr("LAY_CHECKED");
	  			}
	  			if(!$.isEmpty(_this.attr("edit"))){
	  				col["edit"] = _this.attr("edit");
	  			}
	  			if(!$.isEmpty(_this.attr("event"))){
	  				col["event"] = _this.attr("event");
	  			}
	  			
	  			var dict = _this.attr("dict");
	  			
	  			if(!$.isEmpty(dict)){
	  				
	  				formatArr.push(dict);
	  				
	  				//自定义模板
	  				col["templet"] = "<div>{{ layui.fsUtil.toDict('"+dict+"',d."+field+") }}</div>";
	  				
	  			}
	  			colsArr.push(col);
	      			
				}else {//工具条
					col["toolbar"] = toolbar;
					var width = _this.attr("width");
					if(!$.isEmpty(width)){
	  				col["width"] = width;
	  			}
					var title = _this.attr("title");
					if(!$.isEmpty(title)){
	  				col["title"] = title;
	  			}
					colsArr.push(col);
				}
  		});
  		colArr.push(colsArr);
  	}
  	data["colsArr"] = colArr;
  	data["formatArr"] = formatArr;
  	return data;
  };
  
  $.fn.autofill = function(data, options) {
		var settings = {
				findbyname: true,
				restrict: true
			},
			self = this;
			
		if ( options ) {
			$.extend( settings, options );
		}
		
		return this.each(function() {
			$.each( data, function(k, v) {
				var selector, elt;
				if ( settings.findbyname ) { // by name
					selector = '[name="'+k+'"]';
					elt = ( settings.restrict ) ? self.find( selector ) : $( selector );
					
					if ( elt.length == 1 ) {
						elt.val( ( elt.attr("type") == "checkbox" ) ? [v] : v );
					} else if ( elt.length > 1 ) {
						if(elt.attr("type") == "checkbox"){
							if(v){
								elt.val(v.split(','));
							}
						}else{
							elt.val([v]);
						}
					} else {
						selector = '[name="'+k+'[]"]';
						elt = ( settings.restrict ) ? self.find( selector ) : $( selector );
						elt.each(function(){
							$(this).val(v);
						});
					}
					
				} else { // by id
					
					selector = '#'+k;
					elt = ( settings.restrict ) ? self.find( selector ) : $( selector );
					
					if ( elt.length == 1 ) {
						elt.val( ( elt.attr("type") == "checkbox" ) ? [v] : v );
					} else {
						var radiofound = false;
						
						// radio
						elt = ( settings.restrict ) ? self.find( 'input:radio[name="'+k+'"]' ) : $( 'input:radio[name="'+k+'"]' );
						elt.each(function(){
							radiofound = true;
							if ( this.value == v ) { this.checked = true; }
						});
						// multi checkbox
						if ( !radiofound ) {
							elt = ( settings.restrict ) ? self.find( 'input:checkbox[name="'+k+'[]"]' ) : $( 'input:checkbox[name="'+k+'[]"]' );
							elt.each(function(){
								$(this).val(v);
							});
						}
					}
				}
			});
		});
	};
  
  $.extend({
  	//非空判断
  	isEmpty: function(value) {
  		if (value === null || value == undefined || value === '') { 
  			return true;
  		}
  		return false;
    },
    //获取对象指
    result: function(object, path, defaultValue) {
    	var value = "";
  		if(!$.isEmpty(object) && $.isObject(object) && !$.isEmpty(path)){
  			var paths = path.split('.');
  			var length = paths.length;
  			$.each(paths,function(i,v){
  				object = object[v];
  				if(length-1 == i){
						value = object;
					}
  				if(!$.isObject(object)){
  					return false;
  				}
  			})
  			
  		}
  		
  		if($.isEmpty(value) && !$.isEmpty(defaultValue)){
  			value = defaultValue;
  		}
  		return value;
    },
    //判断是否obj对象
    isObject : function(value) {
      var type = typeof value;
      return value != null && (type == 'object' || type == 'function');
    },
    //是否以某个字符开头
    startsWith : function(value,target){
    	return value.indexOf(target) == 0;
    },
    //设置sessionStorage
    setSessionStorage:function(key, data){
    	sessionStorage.setItem(key, data);
    },
    //获取sessionStorage
    getSessionStorage:function(key){
    	return sessionStorage.getItem(key) == null ? "" : sessionStorage.getItem(key);
    },
    //删除sessionStorage
    removeSessionStorage:function(key){
    	sessionStorage.removeItem(key);
    },
    //清除sessionStorage
    clearSessionStorage:function(){
    	sessionStorage.clear();
    },
    uuid : function(){
  		return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		    var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
		    return v.toString(16);
  		});
    }
  });

}(jQuery));