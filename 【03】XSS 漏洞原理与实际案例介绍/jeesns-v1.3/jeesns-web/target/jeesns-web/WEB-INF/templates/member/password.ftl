<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码 - ${SITE_NAME} - Powered By JEESNS</title>
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
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="wrapper wrapper-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-2">
                <ul class="list-group">
                    <li class="list-group-item"><a href="${basePath}/member/avatar">修改头像</a></li>
                    <li class="list-group-item"><a href="${basePath}/member/editInfo">修改信息</a></li>
                    <li class="list-group-item"><a href="${basePath}/member/password">修改密码</a></li>
                </ul>
            </div>
            <div class="col-sm-10 white-bg p-b-100 m-b-10">
                <div class="list list-condensed">
                    <header>
                        <h3><i class="icon-list-ul"></i> 修改密码</h3>
                    </header>
                    <form class="form-horizontal m-t-100 jeesns_form" action="${basePath}/member/password" method="post" callback="reload">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">旧密码：</label>
                            <div class="col-sm-8">
                                <input id="oldPassword" name="oldPassword" class="form-control" type="password"
                                       data-type="require" alt="密码">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">新密码：</label>
                            <div class="col-sm-8">
                                <input id="newPassword" name="newPassword" class="form-control" type="password"
                                       data-type="require" alt="新密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">确认新密码：</label>
                            <div class="col-sm-8">
                                <input id="renewPassword" name="renewPassword" class="form-control" type="password"
                                       data-type="require" data-rule="equal[newPassword]" alt="两次密码必须一致">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-2">
                                <input type="submit" class="btn btn-primary block full-width m-b jeesns-submit" value="修改密码">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>
</html>
