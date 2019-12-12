<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改广告 - ${SITE_NAME} - JEESNS后台管理系统 - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/AdminLTE.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/skins/_all-skins.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/iCheck/all.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/manage/js/app.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script src="${basePath}/res/plugins/My97DatePicker/WdatePicker.js"></script>
    <script src="${basePath}/res/plugins/iCheck/icheck.js"></script>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/ads/update" method="post" callback="parentReload">
                    <input type="hidden" name="id" value="${ads.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" data-type="require" value="${ads.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">类型</label>
                        <div class="form-group">
                            <div class="col-sm-8">
                                <label onclick="typeClick(this)" type="1"><input type="radio" value="1" name="type" class="flat-red" <#if ads.type==1>checked</#if>>图片链接</label>
                                <label onclick="typeClick(this)" type="2"><input type="radio" value="2" name="type" class="flat-red" <#if ads.type==2>checked</#if>>文字链接</label>
                                <label onclick="typeClick(this)" type="3"><input type="radio" value="3" name="type" class="flat-red" <#if ads.type==3>checked</#if>>代码广告</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" id="contentName">图片地址</label>
                        <div class="col-sm-8">
                            <textarea rows="3" class="form-control" id="content" name="content" data-type="require">${ads.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group" id="linkDiv" style="<#if ads.type == 3>display:none</#if>">
                        <label class="col-sm-2 control-label">链接</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="link" name="link" data-type="" value="${ads.link}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" readonly id="startTime" name="startDateTime" data-type="require" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${ads.startTime?string("yyyy-MM-dd HH:mm:ss")}" style="background-color: #fff;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" readonly id="endTime" name="endDateTime" data-type="require" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${ads.endTime?string("yyyy-MM-dd HH:mm:ss")}" style="background-color: #fff;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="status" data-type="selected">
                                <option value="0" <#if ads.status==0>selected</#if>>禁用</option>
                                <option value="1" <#if ads.status==1>selected</#if>>启用</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
<script>
    $(document).ready(function () {
        $('input[type="radio"].flat-red').iCheck({
            radioClass: 'iradio_flat-green'
        });

    })
    function typeClick(_this) {
        var type = $(_this).attr("type");
        if (type == 1){
            $("#contentName").html("图片地址");
            $("#linkDiv").css("display","block");
        }else if (type == 2){
            $("#contentName").html("文字");
            $("#linkDiv").css("display","block");
        }else if (type == 3){
            $("#contentName").html("代码");
            $("#linkDiv").css("display","none");
        }
    }
</script>
</body>
</html>