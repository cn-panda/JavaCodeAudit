<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>相册 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <script type="text/javascript">
        var basePath = "${basePath}";
    </script>
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/front/js/jeesns.js"></script>
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<#include "/member/common/topInfo.ftl"/>
<div class="container white-bg">
    <div class="main-content">
        <div class="row">
            <div class="no-border">
                <div class="panel-heading">
                    相册列表
                    <span class="pull-right">
                        <a class="btn btn-primary m-t-n4" href="${basePath}/member/picture/addAlbum" target="_jeesnsOpen" height="360px">新建相册</a>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="cards">
                    <#list model.data as pictureAlbum>
                        <div class="col-md-4 col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="albumPic">
                                    <a class="picLink" href="${basePath}/member/picture/list/${pictureAlbum.memberId}-${pictureAlbum.id}">
                                        <#if pictureAlbum.juri == 0>
                                            <img src="${basePath}${pictureAlbum.cover}" class="pic">
                                        <#else>
                                            <img src="${basePath}/res/common/images/lock_album.png" class="pic">
                                        </#if>
                                    </a>
                                </div>
                                 <#if pictureAlbum.description??>
                                            <div class="caption">${pictureAlbum.description}</div>
                                 </#if>
                                <div class="card-heading"><strong>${pictureAlbum.name}</strong></div>
                                <div class="card-actions">
                                    <div class="pull-right text-danger"><i class="icon-heart-empty"></i> ${pictureAlbum.favorCount} 人喜欢</div>
                                </div>
                            </div>
                        </div>
                    </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>
</html>