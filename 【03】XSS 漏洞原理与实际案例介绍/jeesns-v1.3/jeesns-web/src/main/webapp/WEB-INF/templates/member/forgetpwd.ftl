<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>忘记密码 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
</head>

<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="wrapper wrapper-content">
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 white-bg m-b-20 p-20">
                <header class="m-b-50">
                    <h1> 忘记密码</h1>
                </header>
                <form class="form-horizontal jeesns_form" action="${basePath}/member/forgetpwd" method="post" callback="reload">
                    <div class="form-group m-b-30">
                        <label class="col-sm-3">用户名</label>
                        <div class="col-md-8 col-sm-10">
                            <input type="text" class="form-control" name="name" placeholder="用户名"
                                   data-type="require">
                        </div>
                    </div>
                    <div class="form-group m-b-30">
                        <label class="col-sm-3">邮箱</label>
                        <div class="col-md-8 col-sm-10">
                             <input type="email" class="form-control" name="email" placeholder="邮箱" data-type="require,email">
                        </div>
                    </div>
                    <div class="form-group m-b-30">
                        <label class="col-sm-3"></label>
                        <div class="col-md-8 col-sm-10">
                            <button type="submit" class="btn btn-primary btn-block m-t-10">找回密码</button>
                        </div>
                    </div>
                    <div class="form-group m-b-90">
                        <p class="text-muted text-center">
                            <a href="login">我要登录</a> |
                            <a href="register">我要注册</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
<script>
    $(document).ready(function () {
        $("#getValidCodeBtn").click(function () {
            var index;
            var _this = this;
            $(_this).attr("disabled","disabled");
            $.ajax({
                url:"${basePath}/member/sendEmailActiveValidCode",
                type:"get",
                dataType:"json",
                beforeSend: function(){
                    index = jeesnsDialog.loading();
                },
                error: function(){
                    jeesnsDialog.close(index);
                    jeesnsDialog.errorTips("请求失败");
                },
                success:function(res){
                    jeesnsDialog.close(index);
                    if(res.code == 0){
                        jeesnsDialog.successTips(res.message);
                    }else {
                        jeesnsDialog.errorTips(res.message);
                    }
                    window.sendSmsID;
                    window.curCount = 60;//当前剩余秒数
                    $(_this).attr("disabled", "true");
                    $(_this).html(window.curCount + "秒");
                    window.sendSmsID = window.setInterval(function() {
                        if (window.curCount == 1) {
                            window.clearInterval(window.sendSmsID);//停止计时器
                            $(_this).removeAttr("disabled");//启用按钮
                            $(_this).html("获取验证码");
                        }else {
                            window.curCount--;
                            $(_this).html(window.curCount + "秒");
                        }
                    }, 1000);
                }
            });
        });
    });
</script>
</body>
</html>
