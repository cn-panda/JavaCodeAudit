/**
 * 主页面
 * 
 * @author: OF
 * @version 1.0.0
 */
layui.use(['layim','admin.menu','layer','admin.tab','admin.common'], function(){
	var adminTab = layui['admin.tab'],
	layim = layui.layim,
    adminCommon = layui['admin.common'],
	adminMenu = layui['admin.menu'];
	
	adminMenu.render();
	
	//初始化显示菜单
	showMenu($("#adminTopMenu li.layui-this").attr("dataPid"));

	if (window.attachEvent) {
	  window.attachEvent("hashchange", hashChanged);
	} else if (window.addEventListener) {
		window.addEventListener("hashchange", hashChanged, false);
	}
	
	hashChanged();
	
	function hashChanged(){
		//获取路由信息
		var hash = window.location.hash;
		if(!$.isEmpty(hash) && hash.length>1){
			var menuId = hash.substring(1);
			//获取layId
			var dom = $('#fsLeftMenu a[menuId="'+ menuId +'"]').parent();
			if(dom.length>0){
				adminTab.add(dom);
				adminTab.menuSelectCss(dom.attr("lay-id"));
				
			}
		}
	}
	
	
	$("#adminTopMenu li").bind("click",function(){
		var dataPid = $(this).attr("dataPid");
		showMenu(dataPid);
	});
	
	
	//显示菜单
	function showMenu(dataPid){
		if(!$.isEmpty(dataPid)){
			$('#adminLeftMenu>li').hide();
			$('#adminLeftMenu>li[dataPid="'+ dataPid +'"]').show();
		}
	}
	
	//渲染tab
	adminTab.render();
	
	//新增tab
	function addTab(title,dataUrl,layId){
		adminTab.add(title,dataUrl,layId);
	}
	
	//手机设备的简单适配
	var treeMobile = $('.site-tree-mobile'),
		shadeMobile = $('.site-mobile-shade')

	treeMobile.on('click', function(){
		$('body').addClass('site-mobile');
	});

	shadeMobile.on('click', function(){
		$('body').removeClass('site-mobile');
	});
    $(".open").on("click",	function() {
        var _this =  $(this);
        var _url = _this.attr("topUrl");
        if ($.isEmpty(_url)) {
            adminCommon.warnMsg("url地址为空！");
            return false;
        }
        var _title = _this.attr("topTitle");
        var _width = _this.attr("topWidth");
        var _height = _this.attr("topHeight");
        var isMaximize = _this.attr("isMaximize");
        adminCommon.open(_title, _width, _height, _url, null, isMaximize);

    })

    //菜单绑定
	
	$(".sykSwitchMenu").on("click",function(){
		if($(this).find("i.fa-outdent").length>0){
			$(this).find("i").removeClass("fa-outdent").addClass("fa-indent");
		}else{
			$(this).find("i").removeClass("fa-indent").addClass("fa-outdent");
		}
	 	$(".layui-layout-admin").toggleClass("showMenu");
	});
	/**
	 * 左侧菜单点再关闭其它
	 */
	$(".layui-side .layui-nav-item").click(function(){
        $(".layui-side .layui-nav-item").removeClass("layui-nav-itemed");
        $(".layui-side .layui-nav-item").removeClass("layui-this");
        if($(this).has('dl').length){//如果有子菜单，显示下拉样式
            $(this).addClass("layui-nav-itemed");
        }else{//如果没有子菜单，显示菜单项样式
            $(this).addClass("layui-this");
        }
    });
    $(".open").on("click",	function() {
        var _this =  $(this);
        var _url = _this.attr("topUrl");
        if ($.isEmpty(_url)) {
            adminCommon.warnMsg("url地址为空！");
            return false;
        }
        var _title = _this.attr("topTitle");
        var _width = _this.attr("topWidth");
        var _height = _this.attr("topHeight");
        var isMaximize = _this.attr("isMaximize");
        adminCommon.open(_title, _width, _height, _url, null, isMaximize);

    })
    /**
	 * 右边菜单
	 */
	$.contextMenu({
    selector: '.layui-tab-title li', 
    callback: function(key, options) {
    	var layId = $(this).attr("lay-id");
    	switch (key) {
				case "close":
					adminTab.del(layId);
					break;
				case "closeOther":
					$(this).parent().children("li").each(function(i,e){
						if($(this).find(".layui-tab-close").is(":visible")){
							var newLayId = $(this).attr("lay-id");
							if(layId != newLayId ){
								adminTab.del(newLayId);
							}
						}
					});
					break;
				case "closeAll":
					$(this).parent().children("li").each(function(i,e){
						if($(this).find(".layui-tab-close").is(":visible")){
							var newLayId = $(this).attr("lay-id");
							adminTab.del(newLayId);
						}
					});
					break;
				case "refresh":
					$(this).parent().children("li").each(function(i,e){
						 var item = $('#main .layui-show').children('iframe');
                         item.attr('src', item.attr('src'));
					});
					break;
				default:
					break;
    	}
    },
    items: {
    	"refresh": {name: "刷新",icon: function(){
    		return 'context-menu-icon context-menu-icon-loading';
    	},disabled: function(){
    		if($(this).find(".layui-tab-close").is(":visible")){
    			return false;
    		}
    		return true; 
    	}},
      "close": {name: "关闭",icon: function(){
        return 'context-menu-icon context-menu-icon-quit';
      },disabled: function(){
      	if($(this).find(".layui-tab-close").is(":visible")){
      		return false;
      	}
      	return true; 
      }},
      "closeOther": {name: "关闭其他",icon: function(){
        return 'context-menu-icon context-menu-icon-quit';
      }},
      "closeAll": {name: "关闭全部",icon: function(){
        return 'context-menu-icon context-menu-icon-quit';
      }}
    }
	});
	
	//修改密码
	$("#password").on("click",function(){
		layer.open({
		  type: 1,
		  area: ['471px', '333px'],
		  shade: true,
		  shadeClose: true,
		  shade: 0.6,
		  title: false, //不显示标题
		  content: "<div><img width='471' height='333'   src='./images/zhifu.png'></div>"
		});
		
	});
    // 判断是否显示锁屏
    if(window.sessionStorage.getItem("isLock") == "true"){
        lockPage();
    }
    //锁屏
    $('#lockScreen').on('click',function lockScreen(){
        window.sessionStorage.setItem("isLock",true);
        lockPage();
    });
    function lockPage() {
        layer.open({
            title : false,
            area: ['1980', '1080'],
            type : 1,
            content : '<div class="admin-header-lock" id="lock-box"><div class="admin-header-lock-img"><img src="'+webroot+'/static/assets/image/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"  class="layui-nav-img userAvatar"></div><div class="input_btn"><input type="password" class="admin-header-lock-input layui-input" autocomplete="off" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd"><button class="layui-btn" id="unlock">解锁</button></div><p>请输入“123456”，否则不会解锁成功哦！！！</p></div>',
            closeBtn : 0,
            shade : 0.9
        })
        $(".admin-header-lock-input").focus();
    }
    // 解锁
    $("body").on("click","#unlock",function(){
        if($(this).siblings(".admin-header-lock-input").val() == ''){
            layer.msg("请输入解锁密码!", {icon: 5,time: 2000,offset: '100px'} );
            $(this).siblings(".admin-header-lock-input").focus();
        }else{
            //验证密码是否正确
            if($(this).siblings(".admin-header-lock-input").val() == "123456"){
                window.sessionStorage.setItem("isLock",false);
                $(this).siblings(".admin-header-lock-input").val('');
                layer.closeAll("page");
            }else{
                layer.msg("密码错误，请重新输入！",{icon: 5,time: 2000,offset: '100px'} );
                $(this).siblings(".admin-header-lock-input").val('').focus();
            }
        }
    });
    $(document).on('keydown', function() {
        if(event.keyCode == 13) {
            $("#unlock").click();
        }
    });

    //打赏作者
    $('#reward').on('click', function() {
        layer.open({
            title: '',
            type: 1,
            area: ['600px', '448px'], //宽高
            content: '<img src="'+webroot +'/static/assets/image/reward.png">'
        });
    });

    //演示自动回复
	  var autoReplay = [
	    '您好，我现在有事不在，一会再和您联系。', 
	    '你没发错吧？face[微笑] ',
	    '洗澡中，请勿打扰，偷窥请购票，个体四十，团体八折，订票电话：一般人我不告诉他！face[哈哈] ',
	    '你好，我是主人的美女秘书，有什么事就跟我说吧，等他回来我会转告他的。face[心] face[心] face[心] ',
	    'face[威武] face[威武] face[威武] face[威武] ',
	    '<（@￣︶￣@）>',
	    '你要和我说话？你真的要和我说话？你确定自己想说吗？你一定非说不可吗？那你说吧，这是自动回复。',
	    'face[黑线]  你慢慢说，别急……',
	    '(*^__^*) face[嘻嘻] ，是贤心吗？'
	  ];
	  
	//基础配置
	/*  layim.config({
	 
	  	init: {
	    url: 'getList.json' //接口地址（返回的数据格式见下文）
	    ,type: 'get' //默认get，一般可不填
	    ,data: {} //额外参数
	  },min:true, title:"我的朋友"
	    //获取群员接口（返回的数据格式见下文）
	    ,members: {
	      url: '' //接口地址（返回的数据格式见下文）
	      ,type: 'get' //默认get，一般可不填
	      ,data: {} //额外参数
	    }
	    
	    //上传图片接口（返回的数据格式见下文），若不开启图片上传，剔除该项即可
	    ,uploadImage: {
	      url: '' //接口地址
	      ,type: 'post' //默认post
	    } 
	    
	    //上传文件接口（返回的数据格式见下文），若不开启文件上传，剔除该项即可
	    ,uploadFile: {
	      url: '' //接口地址
	      ,type: 'post' //默认post
	    }
	    //扩展工具栏，下文会做进一步介绍（如果无需扩展，剔除该项即可）
	    ,tool: [{
	      alias: 'code' //工具别名
	      ,title: '代码' //工具名称
	      ,icon: '&#xe64e;' //工具图标，参考图标文档
	    }]
	    
	    ,msgbox: layui.cache.dir + 'css/modules/layim/html/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
	    ,find: layui.cache.dir + 'css/modules/layim/html/find.html' //发现页面地址，若不开启，剔除该项即可
	    ,chatLog: layui.cache.dir + 'css/modules/layim/html/chatlog.html' //聊天记录页面地址，若不开启，剔除该项即可
	  });*/

});