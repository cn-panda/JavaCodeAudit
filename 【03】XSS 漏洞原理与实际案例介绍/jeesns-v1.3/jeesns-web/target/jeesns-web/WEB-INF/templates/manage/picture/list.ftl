<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图片管理 - ${SITE_NAME} - JEESNS后台管理系统 - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/AdminLTE.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/skins/_all-skins.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
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
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>图片管理</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">图片管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">

                        </div>
                        <div class="box-body no-padding">
                            <ul class="mailbox-attachments clearfix">
                                <#list model.data as picture>
                                    <li>
                                        <span class="mailbox-attachment-icon has-img">
                                            <img src="${basePath}${picture.smallPath}" title="${picture.description}" style="max-width: 100%;height: 160px;">
                                        </span>
                                        <div class="mailbox-attachment-info">
                                            <a href="${basePath}/u/${picture.member.id}" target="_blank">${picture.member.name}</a>
                                            <#if picture.isFavor==0>
                                                <a class="text-primary picture-favor" data-id="${picture.pictureId}"><i
                                                        class="fa fa-thumbs-o-up"></i> ${picture.favorCount}</a>
                                            <#else>
                                                <a class="text-success picture-favor" data-id="${picture.pictureId}"><i
                                                        class="fa fa-thumbs-up"></i> ${picture.favorCount}</a>
                                            </#if>
                                            <p><span class="sp2">${picture.createTime?string("yyyy-MM-dd HH:mm:ss")}</span></p>
                                            <span class="mailbox-attachment-size">
                                                 <a class="marg-l-5" target="_jeesnsLink" href="${managePath}/picture/delete/${picture.pictureId}" confirm="确定要删除图片吗？" callback="reload">
                                                    <span class="label label-danger"><i class="fa fa-trash red"></i></span>
                                                </a>
                                            </span>
                                        </div>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                        <div class="box-footer">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/picture/list"
                                currentPage="${model.page.pageNo}"
                                pageCount="${model.page.totalPage}">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<#include "/manage/common/footer.ftl"/>
</div>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>

