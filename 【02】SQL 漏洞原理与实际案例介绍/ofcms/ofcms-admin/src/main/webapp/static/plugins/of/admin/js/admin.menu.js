/**
 * 菜单配置
 * 
 * @author: OF
 * @version 1.0.0
 */
layui.define(['element',"admin.config","admin.common"], function(exports){
	
	var menuConfig = {
			dataType : "server" , //获取数据方式，local本地获取，server 服务端获取
			loadUrl : $.result(adminConfig,"global.servletUrl") + "system/menu/getMenu.json", //加载数据地址
			rootMenuId : 0, //根目录菜单id
			defaultSelectTopMenuId : "1", //默认选中头部菜单id
			defaultSelectLeftMenuId : "11", //默认选中左边菜单id
			menuIdField : "menu_id", //菜单id
			menuNameField : "name", //菜单名称
			menuIconField : "icon" , //菜单图标，图标必须用css
			menuHrefField : "url" , //菜单链接
			parentMenuIdField : "parent_id" ,//父菜单id
			data : [
		 ] //本地数据
	};
	
	var element = layui.element,
	adminCommon = layui['admin.common'],
	adminConfig = layui['admin.config'],
	statusName = $.result(adminConfig,"global.result.statusName","code"),
	msgName = $.result(adminConfig,"global.result.msgName","msg"),
	dataStatus = $.result(adminConfig,"global.result.dataStatus");
    dataName = $.result(adminConfig,"global.result.dataName","data"),
	AdminMenu = function (){
		
	};
	
	
	AdminMenu.prototype.render = function(){
		
		this.loadData();
		
		this.showMenu();
	};
	
	/**
	 * 加载数据
	 */
	AdminMenu.prototype.loadData = function(){
		
		if(menuConfig.dataType == "server"){//服务端拉取数据
			
			var url = menuConfig.loadUrl;
			if($.isEmpty(url)){
				adminCommon.errorMsg("未配置请求地址！");
				return;
			}
			
			adminCommon.invoke(url,{},function(data){
  			if(data[statusName] == dataStatus)
  			{
  				menuConfig.data = JSON.parse($.result(data,dataName));
  			}
  			else
  			{
  				//提示错误消息
  				adminCommon.errorMsg(data[msgName]);
  			}
  		},false);
			
		}
	}
	
	
	/**
	 * 获取图标
	 */
	AdminMenu.prototype.getIcon = function(menuIcon){
		
		if(!$.isEmpty(menuIcon)){
			
			if(menuIcon.indexOf("<i") == 0){
				return menuIcon;
			}else if (menuIcon.indexOf("&#") == 0){
				return '<i class="layui-icon">'+menuIcon+'</i>';
			}else if (menuIcon.indexOf("fa-") == 0){
				return '<i class="fa '+menuIcon+'"></i>';
			}else {
				return '<i class="'+menuIcon+'"></i>';
			}
		}
		return "";
	};
	/**
	 * 清空菜单
	 */
	AdminMenu.prototype.cleanMenu = function(){
		$("#adminLeftMenu").html("");
		$("#adminLeftMenu").html("");
	}
	/**
	 * 显示菜单
	 */
	AdminMenu.prototype.showMenu = function(){
		var thisMenu = this;
		var data = menuConfig.data;
		if(!$.isEmpty(data)){
			var _index = 0;
			//显示顶部一级菜单
			var adminTopMenuElem = $("#adminTopMenu");
			var adminLeftMenu = $("#adminLeftMenu");
			$.each(data,function(i,v){
				if(menuConfig.rootMenuId === v[menuConfig.parentMenuIdField]){
					var topStr = '<li class="layui-nav-item';
					/*if(!$.isEmpty(menuConfig.defaultSelectTopMenuId) && menuConfig.defaultSelectTopMenuId == v[menuConfig.menuIdField]){//默认选中处理
						topStr += ' layui-this';
					}*/
					if($.isEmpty(menuConfig.defaultSelectTopMenuId) && _index === 0){//为空默认选中第一个
						topStr += ' layui-this';
					}else if(!$.isEmpty(menuConfig.defaultSelectTopMenuId) && menuConfig.defaultSelectTopMenuId == v[menuConfig.menuIdField]){//默认选中处理
						topStr += ' layui-this';
					}
					_index ++ ;
					
					topStr += '" dataPid="'+v[menuConfig.menuIdField]+'"><a href="javascript:;">'+thisMenu.getIcon(v[menuConfig.menuIconField])+' <cite>'+v[menuConfig.menuNameField]+'</cite></a></li>';
					adminTopMenuElem.append(topStr);
					var index = 0 ;
					//显示二级菜单，循环判断是否有子栏目
					$.each(data,function(i2,v2){
						if(v[menuConfig.menuIdField] === v2[menuConfig.parentMenuIdField]){
							//默认第一个打开
							var menuRow = '<li class="layui-nav-item';
							if(!$.isEmpty(menuConfig.defaultSelectLeftMenuId) && index === 0 ){//默认选中处理
//								menuRow += ' layui-this';
								menuRow += ' layui-nav-itemed';//默认展开二级菜单
							}
							index = index +1;
							//显示三级菜单，循环判断是否有子栏目
							var menuRow3 = "";
							$.each(data,function(i3,v3){
								if(v2[menuConfig.menuIdField] === v3[menuConfig.parentMenuIdField]){
									if($.isEmpty(menuRow3)){
										menuRow3 = '<dl class="layui-nav-child">';
									}
									menuRow3 += '<dd';
								 	if(!$.isEmpty(menuConfig.defaultSelectLeftMenuId) && menuConfig.defaultSelectLeftMenuId == v3[menuConfig.menuIdField]){//默认选中处理
										menuRow3 += ' class="layui-this"';
										menuRow += ' layui-nav-itemed';//默认展开二级菜单
									} 
									
									menuRow3 += ' lay-id="'+v3[menuConfig.menuIdField]+'"><a href="javascript:;" menuId="'+v3[menuConfig.menuIdField]+'" ';
									if(v3['type'] == '3'){
										menuRow3 += 'dataUrl='+v3[menuConfig.menuHrefField]+'">';
									}else{
										menuRow3 += 'dataUrl="f.html?p='+v3[menuConfig.menuHrefField]+'">';
										
									}
									
							       menuRow3 +=thisMenu.getIcon(v3[menuConfig.menuIconField])+' <cite>'+v3[menuConfig.menuNameField]+'</cite></a></dd>';
									
								}
								
							});
							
							menuRow += '" lay-id="'+v2[menuConfig.menuIdField]+'" dataPid="'+v2[menuConfig.parentMenuIdField]+'" style="display: none;"><a href="javascript:;" menuId="'+v2[menuConfig.menuIdField]+'" dataUrl="'+v2[menuConfig.menuHrefField]+'">'+thisMenu.getIcon(v2[menuConfig.menuIconField])+' <cite>'+v2[menuConfig.menuNameField]+'</cite></a>';
							
							
							if(!$.isEmpty(menuRow3)){
								menuRow3 += '</dl>';
								
								menuRow += menuRow3;
							}
							
							menuRow += '</li>';
							
							adminLeftMenu.append(menuRow);
						}
						
					});
					
				}
			});
		}
		element.render("nav");
	};
	
	var adminMenu = new AdminMenu();
	exports("admin.menu",adminMenu);
});

