<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <base href="<%=basePath%>">

    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="cn" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta name="viewport" content="width=device-width, initial-scale=0.9">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>XSS - 测试</title>
</head>
<style>


<br>



* {
	padding: 0;
	margin: 0;
}

body {
	text-align: center;
    background-size: 100% !important;
    background-repeat: no-repeat;
 	background-color: #ffffff;

}





#search_input {
	width: 90%;
	height: 40px;
	background-color: transparent;
	border: none;
	outline: 0;
	font-size: 16px;
	color: #A593E0;
	padding: 0 10px;
	border-radius: 50px
}



.search_part {
	margin-bottom: 5px;
	margin-top: 15px;
}



.search_bar span {
	display: block;
	font-size: 12px;
	overflow: hidden;
	padding-left: 2px;
	margin-right: 42px;
	vertical-align: middle;
}
.search_bar span i {
	display:none;
	float: right;
	width: 35px;
	height: 40px;
	background-size: 16px;
}
.search_bar .si {
	margin: 0 38px 0 10px;
}

/*搜索建议条*/
#suggest {
	position: absolute;
	left: -1px;
	right: -1px;
	top: 40px;
	border:1px solid #ccc;
	background: #fff;
	line-height: 40px;
}
#suggest li {
	border-bottom: 1px solid #ccc;
	text-align: left;
	padding-left: 16px;
}
#suggest li:active {
	background: #F0F0F0;
}
#suggest li b {
	float: right;
	width: 44px;
	height: 40px;
	background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAI5JREFUSEtjZCACLF261J6RkbELpPT///9l0dHRB4nQRlgJ0ODny5Yt+w/CIDZhHUSqgBkKo4nURljZqMHwMBohQQFK/ECvnkT3LgX8kyAzGZATPwWGgTMPSiYCGvyEWgYiGfyEAcjxoKaroWZ5EM52QBUjJLkRExajQUH7Qgg5E4HYxMQLUWpgmYiUxA8AOdLMz+iDKvIAAAAASUVORK5CYII=) no-repeat scroll center center #fff;
	background-size: 11px;
}
#suggest .close {
	text-align: right;
	font-size: 14px;
	color: #888;
	padding-right: 12px;
}


.search_bar {
	box-shadow: 0 0 5px rgba(70,70,40,.255);
	-webkit-animation: fadeIn 2.5s;
	animation: fadeIn 2.5s;
	background-color:  rgba(255,255,255,.0);
	border-radius: 3px;
	display: table;
	vertical-align: middle;
	width: 85%;
	height: 20px;
	max-width: 400px;
	margin: 10px auto;
	position: relative;
	z-index: 10;
}



#search_submit {
	outline: 0;
	height: 40px;
	float: right;
	color: #4a4266;
	font-size: 18px;
	font-weight: 500;
	border: none;
	background-color: transparent;
	padding: 0 13px 0 13px
}

#content {
	width: 100%;
	text-align: center;
	padding-top: 0px;
	padding-bottom: 0px;
}



.box {
	-webkit-animation: fadeInDown 1s;
	animation: fadeInDown 1s;
	position: relative;
	display: inline-block;
	width: 70px;
	border: 0;
}


.box a {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
}


.url {
	color: #4a4266;
	height: 1.5em;
	line-height: 1.5em;
	width: 72px;
	font-size: 0.75em;
	white-space: nowrap;
	overflow: hidden;
	margin: auto;
	-webkit-border-top-right-radius: 5px;
	-webkit-border-bottom-right-radius: 5px;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	-ms-text-overflow: ellipsis;
	padding-top: 0px;
	padding-bottom: 8px;
}



.icon {
	width: 3em;
	height: 3em;
	max-width: 72px;
}

#app-items {
	width: 100%;
	max-width: 400px;
	margin: 0px auto;
	text-align: center;
	background-color: #fff;
	padding-top: 0px;
	padding-bottom: 15px;
}

.title {
    background-color: #fffffff;
    font-size: 16px;
    height: 30px;
    line-height: 30px;
    padding: 0 10px 0 20px;
    color: #4a4266;

}

#yiyan {
	width: 100%;
	max-width: 400px;
	margin: 0px auto;
	text-align: center;
	background-color: #fff;
	padding-top: 0px;
	padding-bottom: 15px;
}

.shuxing {
    color: #4a4266;
    font-size: 12px;
    height: 30px;
    line-height: 20px;
    padding: 0 10px 0 20px;
}


@-webkit-keyframes flipInX {
	0% {
		-webkit-transform: perspective(400px) rotateX(90deg);
		transform: perspective(400px) rotateX(90deg);
		opacity: 0
	}

	40% {
		-webkit-transform: perspective(400px) rotateX(-10deg);
		transform: perspective(400px) rotateX(-10deg)
	}

	70% {
		-webkit-transform: perspective(400px) rotateX(10deg);
		transform: perspective(400px) rotateX(10deg)
	}

	100% {
		-webkit-transform: perspective(400px) rotateX(0);
		transform: perspective(400px) rotateX(0);
		opacity: 1
	}
}

@keyframes flipInX {
	0% {
		-webkit-transform: perspective(400px) rotateX(90deg);
		-ms-transform: perspective(400px) rotateX(90deg);
		transform: perspective(400px) rotateX(90deg);
		opacity: 0
	}

	40% {
		-webkit-transform: perspective(400px) rotateX(-10deg);
		-ms-transform: perspective(400px) rotateX(-10deg);
		transform: perspective(400px) rotateX(-10deg)
	}

	70% {
		-webkit-transform: perspective(400px) rotateX(10deg);
		-ms-transform: perspective(400px) rotateX(10deg);
		transform: perspective(400px) rotateX(10deg)
	}

	100% {
		-webkit-transform: perspective(400px) rotateX(0);
		-ms-transform: perspective(400px) rotateX(0);
		transform: perspective(400px) rotateX(0);
		opacity: 1
	}
}

@-webkit-keyframes fadeIn {
	0% {
		opacity: 0
	}

	100% {
		opacity: 1
	}
}

@keyframes fadeIn {
	0% {
		opacity: 0
	}

	100% {
		opacity: 1
	}
}

@-webkit-keyframes fadeInDown {
	0% {
		opacity: 0;
		-webkit-transform: translateY(-20px);
		transform: translateY(-20px)
	}

	100% {
		opacity: 1;
		-webkit-transform: translateY(0);
		transform: translateY(0)
	}
}

@keyframes fadeInDown {
	0% {
		opacity: 0;
		-webkit-transform: translateY(-20px);
		-ms-transform: translateY(-20px);
		transform: translateY(-20px)
	}

	100% {
		opacity: 1;
		-webkit-transform: translateY(0);
		-ms-transform: translateY(0);
		transform: translateY(0)
	}
}
 @media screen and (min-width:1025px){
	body {

	text-align: center;
   
 /*可换上面的图片地址*/
    background-size: 100% !important;
    background-repeat: no-repeat;
 	background-color: #ffffff;
  /*可删上面的固定句语*/
}
	}

</style>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
	<noscript> 
<iframe src="*.htm"></iframe> 
</noscript> 

<div id="content">
<br />
<div class="search_part">
<br /><br /><br /><br /><br /><br /><br /><br /><br />
<form id="msg" action="search" method="get" class="search_bar">
<input type="submit" id="search_submit" value="☯" >
<div class="si">
<input name="msg" class="search" type="text" value="" onkeyup="get_suggest()" onfocus="get_suggest()" onpaste="get_suggest()" autocomplete="off" id="search_input" placeholder="✎...  请输入要查询的内容～" >
</div>

</form>
</div>
<br />
</div>
</body>
</html>
    