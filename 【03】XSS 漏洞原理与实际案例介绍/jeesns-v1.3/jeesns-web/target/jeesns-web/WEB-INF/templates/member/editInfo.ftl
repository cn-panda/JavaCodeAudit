<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改资料 - ${SITE_NAME} - Powered By JEESNS</title>
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
    <script src="${basePath}/res/plugins/My97DatePicker/WdatePicker.js"></script>
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
                        <h3><i class="icon-list-ul"></i> 修改资料</h3>
                    </header>
                    <ul class="nav nav-tabs m-t-10">
                        <li class="active"><a data-tab href="#tabContent1">基本资料</a></li>
                        <li><a data-tab href="#tabContent2">个人资料</a></li>
                    </ul>
                    <div class="tab-content m-t-10">
                        <div class="tab-pane active" id="tabContent1">
                            <form class="form-horizontal m-t jeesns_form" action="${basePath}/member/editBaseInfo" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">登录账号：</label>
                                    <div class="col-sm-8">
                                    ${loginUser.email}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">昵称：</label>
                                    <div class="col-sm-8">
                                        <input id="name" name="name" class="form-control" type="text"
                                               data-type="require" value="${loginUser.name!''}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别：</label>
                                    <div class="col-sm-8">
                                        <label><input type="radio" value="保密" name="sex"
                                                          <#if loginUser.sex=='' || loginUser.sex==null || loginUser.sex=='保密'>checked</#if>/>
                                            <i></i> 保密</label>
                                        <label><input type="radio" value="男" name="sex"
                                                          <#if loginUser.sex=='男'>checked</#if>> <i></i>
                                            男</label>
                                        <label><input type="radio" value="女" name="sex"
                                                          <#if loginUser.sex=='女'>checked</#if>> <i></i>
                                            女</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">个人说明：</label>
                                    <div class="col-sm-8">
                                                    <textarea id="introduce" name="introduce" class="form-control"
                                                              type="text" data-type="require"
                                                              cols="5">${loginUser.introduce!''}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <input type="submit" class="btn btn-primary block full-width m-b"
                                               value="修改">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane" id="tabContent2">
                            <form class="form-horizontal m-t jeesns_form"
                                  action="${basePath}/member/editOtherInfo" method="post">
                                <input name="id" class="form-control" type="hidden" dataType=""
                                       value="${loginUser.id}">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">生日：</label>
                                    <div class="col-sm-8">
                                        <input id="birthday" name="birthday" type="text" class="form-control"
                                               value="${loginUser.birthday}" onClick="WdatePicker()"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">QQ：</label>
                                    <div class="col-sm-8">
                                        <input id="qq" name="qq" class="form-control" type="text"
                                               dataType="" value="${loginUser.qq!''}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">微信：</label>
                                    <div class="col-sm-8">
                                        <input id="wechat" name="wechat" class="form-control" type="text"
                                               dataType="" value="${loginUser.wechat!''}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">联系电话：</label>
                                    <div class="col-sm-8">
                                        <input id="contactPhone" name="contactPhone" class="form-control"
                                               type="text" dataType="" value="${loginUser.contactPhone!''}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">联系邮箱：</label>
                                    <div class="col-sm-8">
                                        <input id="contactEmail" name="contactEmail" class="form-control"
                                               type="text" dataType="" value="${loginUser.contactEmail!''}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">个人网站：</label>
                                    <div class="col-sm-8">
                                        <input id="website" name="website" class="form-control" type="text"
                                               dataType="" value="${loginUser.website!''}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <input type="submit"
                                               class="btn btn-primary block full-width m-b jeesns-submit"
                                               value="修改">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
<script type="text/javascript">
    $('#birthday').datetimepicker();
</script>
</body>
</html>