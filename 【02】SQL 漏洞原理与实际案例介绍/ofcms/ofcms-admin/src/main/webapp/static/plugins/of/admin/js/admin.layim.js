
layui.use('layim', function(layim){

	var webSocket = null;
	  if (!window.WebSocket){
	    alert("你的浏览器不支持websocket，请升级到IE10以上浏览器，或者使用谷歌、火狐、360浏览器。");
	  }
	  webSocket = new WebSocket(wsServer);
	  webSocket.onerror = function(event) {
	    alert("websockt连接发生错误，请刷新页面重试!")
	  };
	// 连接成功建立的回调方法
	  webSocket.onopen = function(event) {
	    webSocket.send("_online_user_"+currentId);
	  };
	// 接收到消息的回调方法
	  webSocket.onmessage = function(event) {
	    var res=event.data;
		
		if(res.indexOf("_online_all_status_")>=0){
			var dd = res.substring("_online_all_status_".length);
			setTimeout(function(){updateOnlineStatus(eval('('+dd+')').body.data);},500);
			
		}
		
		if(res.indexOf('_sys_')>=0){//系统通知
			var arra = res.split("_sys_");
	    	var fromId=arra[0];
	    	var contents=arra[1];
            var obj = {
                username: "系统通知"
                ,avatar: 'static/layer-v2.3/layim/layui/images/face/notify.png'
                ,id:fromId
                ,type: 'friend'
                ,content: contents
              }
            layim.getMessage(obj);
            return;
			
		}
	    if(res.indexOf("_msg_")>=0){
	    	var arra = res.split("_msg_");
	    	var fromId=arra[0];
	    	var toId=arra[1];
	    	var content=arra[2];
	    	var avatar=arra[3];
	    	var type=arra[4];
	    	var fromUserName=arra[5];//
	    	var sendtime = arra[6];
	    	 if(sendtime != 'NAN'){//使用历史记录时间
		        layim.getMessage({
		            username: fromUserName
		            ,avatar: avatar
		            ,id: fromId
		            ,type: type
		            ,content: content
		            ,timestamp:parseFloat(sendtime)
		          });
	    	 }else{
	    		 
	    		 layim.getMessage({
			            username: fromUserName
			            ,avatar: avatar
			            ,id: fromId
			            ,type: type
			            ,content: content
			          });
	    	 }
	    }
	  };
	  //发送消息的方法
	  function send(mine,To) {
		webSocket.send(currentId+"_msg_"+To.id+"_msg_"+mine.content+"_msg_"+mine.avatar+"_msg_"+To.type+"_msg_"+currentName+"_msg_NAN");
	  };
	//切换在线状态的方法
	  function setonline() {
		webSocket.send("_online_user_"+currentId);
	  };
	//切换离线状态的方法
	  function sethide() {
		webSocket.send("_leave_user_"+currentId);
	  };
	  
	//更新在线用户信息
	  function updateOnlineStatus(arra)//更新在线用户信息
	  { 
	  	 $("div.layui-layim-main ul.layim-list-friend li ul.layui-layim-list li").each(function(){//状态还原
	  		 if($(this).attr("id")){
		  		 var span = $(this).find("span");
		  		 var text=span.text();
		  		 var name = $(this).attr("id").substring(12);
		  		 if(text.indexOf("(")>=0){
		  			 text = text.substring(0,text.indexOf("("));
		  		 }
		  		 if((','+arra+",").indexOf(','+name+',')>=0){
		  			 
		  			 span.html(text +"(<font color='green'>在线</font>)");
		  			 var $one_li = $(this).parent().find("li:eq(0)");    //  获取<ul>节点中第一个<li>元素节点
		  			 $(this).insertBefore($one_li);    //移动节点
		  		 }else{
		  			 
		  			 span.html(text+"(<font color='color'>离线</font>)");
		  		 }
	  		 }
	  	 });
	  }
	  
  //基础配置
  layim.config({

    //初始化接口
    init: {
	  url: url+'/iim/contact/friend'
      ,data: {}
    }

    //简约模式（不显示主面板）
    //,brief: true

    //查看群员接口
    ,members: {
    	url: url+'/iim/contact/getMembers'
      ,data: {}
    }
    
    ,uploadImage: {
      url: url+'/iim/contact/uploadImage'//（返回的数据格式见下文）
      ,type: 'post' //默认post
    }

    ,uploadFile: {
      url: url+'/iim/contact/uploadFile' //（返回的数据格式见下文）
      ,type: 'post' //默认post
    }
    
    //,skin: ['http://cdn.firstlinkapp.com/upload/2016_4/1461747766565_14690.jpg'] //皮肤
    //,isgroup: false //是否开启群组
    ,chatLog: url+'/iim/chatHistory?userid1='+currentId+"&userid2=" //聊天记录地址
    ,find: './demo/find.html'
    //,copyright: true //是否授权
  });

  /*
  layim.chat({
    name: '在线客服-小苍'
    ,type: 'kefu'
    ,avatar: 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/7f5f6861jw1e8qgp5bmzyj2050050aa8.jpg'
    ,id: -1
  });
  layim.chat({
    name: '在线客服-心心'
    ,type: 'kefu'
    ,avatar: 'http://tva1.sinaimg.cn/crop.219.144.555.555.180/0068iARejw8esk724mra6j30rs0rstap.jpg'
    ,id: -2
  });
  */
  //layim.setChatMin();

  //监听发送消息
  layim.on('sendMessage', function(data){
	  var mine = data.mine; //包含我发送的消息及我的信息
	    var To = data.to; //对方的信息
//	    console.log(mine);
//	    console.log(To);

	    //发送消息到WebSocket服务
	    send(mine,To);
	    
  });

  //监听在线状态的切换事件
  layim.on('online', function(data){
    if(data=="online"){
    	setonline(); //用户上线
    }else{
    	sethide();//用户离线
    }
    
  });


  
  
  //监听收到的聊天消息
  /*
  socket.on('chatMessage', function (res) {
    layim.getMessage({
      username: res.name
      ,avatar: res.avatar
      ,id: res.id
      ,type: res.type
      ,content: res.content
    });
  });
  */

  //layim建立就绪
  layim.on('ready', function(res){
	  
	  //更改签名
          var signObj = $('#layim_user_sign_box');
          signObj.focus(function () {
              signObj.removeClass('layim-sign-hide');
              console.log('准备更改签名');
          });
          signObj.blur(function () {
              console.log('更改签名完毕');
              signObj.addClass('layim-sign-hide');
          });
          //enter提交
          signObj.keydown(function (event) {
              if (event.which == 13) {
                  console.log('按下了Enter提交签名');
                  signObj.addClass('layim-sign-hide');
                  signObj.blur();
                  var value= $("#layim_user_sign_box").val();
                  $.post(url+"/sys/user/saveSign",{'sign':value},function(data){
                	  
                	  top.layer.alert(data.msg, {icon: 1});
                  })
                  
              }
          });
  
//    //添加好友（如果检测到该socket）
//    layim.addList({
//      type: 'group'
//      ,avatar: "http://tva3.sinaimg.cn/crop.64.106.361.361.50/7181dbb3jw8evfbtem8edj20ci0dpq3a.jpg"
//      ,groupname: 'Angular开发'
//      ,id: "12333333"
//      ,members: 0
//    });
//    layim.addList({
//      type: 'friend'
//      ,avatar: "http://tp2.sinaimg.cn/2386568184/180/40050524279/0"
//      ,username: '冲田杏梨'
//      ,groupid: 2
//      ,id: "1233333312121212"
//      ,remark: "本人冲田杏梨将结束AV女优的工作"
//    });
//    
//    //接受消息（如果检测到该socket）
//    setTimeout(function(){
//      //不在好友列表，则为临时会话
//      layim.getMessage({
//        username: "Hi"
//        ,avatar: "http://tva1.sinaimg.cn/crop.7.0.736.736.50/bd986d61jw8f5x8bqtp00j20ku0kgabx.jpg"
//        ,id: "198909151014"
//        ,type: "friend"
//        ,content: "临时："+ new Date().getTime()
//      });
//
//      //在好友列表
//      layim.getMessage({
//        username: "贤心"
//        ,avatar: "http://tp1.sinaimg.cn/1571889140/180/40030060651/1"
//        ,id: "100001"
//        ,type: "friend"
//        ,content: "嗨，你好！欢迎体验LayIM。演示标记："+ new Date().getTime()
//        ,timestamp: new Date().getTime()
//      });
//    }, 1000);
  });

  //监听查看群员
  layim.on('members', function(data){
    console.log(data);
  });
  
  //监听聊天窗口的切换
  layim.on('chatChange', function(data){
    console.log(data);
  });
  
  

});