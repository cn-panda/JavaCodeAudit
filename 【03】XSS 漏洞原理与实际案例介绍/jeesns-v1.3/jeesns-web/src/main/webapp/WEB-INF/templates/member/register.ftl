<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会员注册 - ${SITE_NAME} - Powered By JEESNS</title>
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
    <script>
        var _success = function () {
            window.location.href = '${basePath}/member/login';
        }
    </script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="wrapper wrapper-content">
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 white-bg m-b-10 p-20">
                <header class="m-b-50">
                    <h1> 欢迎加入${SITE_NAME}</h1>
                </header>
                <form class="form-horizontal jeesns_form" action="${basePath}/member/register" method="post"
                      callback="_success">
                    <input type="hidden" name="redirectUrl" value="${redirectUrl}">
                    <div class="form-group m-b-30">
                        <label class="col-sm-3">用户名</label>
                        <div class="col-md-8 col-sm-10">
                            <input type="text" name="name" class="form-control" placeholder="用户名" data-type="require">
                        </div>
                    </div>
                    <div class="form-group m-b-30">
                        <label class="col-sm-3">邮箱</label>
                        <div class="col-md-8 col-sm-10">
                            <input type="email" name="email" class="form-control" placeholder="邮箱" data-type="require,email">
                        </div>
                    </div>
                    <div class="form-group m-b-30">
                        <label class="col-sm-3">密码</label>
                        <div class="col-md-8 col-sm-10">
                            <input type="password" id="password" class="form-control" name="password" placeholder="密码" data-type="require">
                        </div>
                    </div>
                    <div class="form-group m-b-30">
                        <label class="col-sm-3">确认密码</label>
                        <div class="col-md-8 col-sm-10">
                            <input type="password" name="repassword" class="form-control" placeholder="确认密码" data-type="require" data-rule="equal[password]">
                        </div>
                    </div>
                    <div class="form-group m-b-20">
                        <label class="col-sm-3"></label>
                        <div class="col-md-8 col-sm-10">
                            <button type="submit" class="btn btn-primary btn-block">注册</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <p class="text-muted text-center">
                            <a href="forgetpwd">忘记密码?</a> |
                            <a href="login">我要登录</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>

</html>
