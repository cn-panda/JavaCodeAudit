<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>粉丝 - ${group.name} - ${GROUP_ALIAS} - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
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
<div class="wrapper wrapper-content blog">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div class="ibox float-e-margins">
                    <ol class="breadcrumb">
                        <li><a href="${basePath}/">首页</a></li>
                        <li><a href="${groupPath}/">群组</a></li>
                        <li><a href="${groupPath}/detail/${group.id}">${group.name}</a></li>
                        <li class="active">粉丝</li>
                    </ol>
                    <div class="ibox float-e-margins">
                        <div>
                            <div class="ibox-title">
                                <h5>粉丝(${model.data?size})</h5>
                            </div>
                            <div class="ibox-content profile-content">
                            <#list model.data as groupFans>
                                <div class="group-fans">
                                    <a href="${basePath}/u/${groupFans.member.id}" target="_blank">
                                        <div class="group-fans-avatar">
                                            <img class="img-circle" src="${basePath}${groupFans.member.avatar}" width="60px" height="60px"/>
                                        </div>
                                        <div class="group-fans-name text-center">
                                        ${groupFans.member.name}
                                        </div>
                                    </a>
                                </div>
                            </#list>
                                <div class="box-footer clearfix">
                                    <ul class="pagination pagination-sm no-margin pull-right"
                                        url="${groupPath}/fans/${group.id}"
                                        currentPage="${model.page.pageNo}"
                                        pageCount="${model.page.totalPage}">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        简介
                    </div>
                    <div class="ibox-content profile-element group">
                        <div class="group-logo">
                            <a href="${groupPath}/detail/${group.id}"><img alt="${group.name}" src="${basePath}${group.logo}" width="80px" height="80px"/></a>
                        </div>
                        <div class="group-detail">
                            <p><a href="${groupPath}/detail/${group.id}"><strong>${group.name}</strong></a></p>
                            <p>${model.data?size}关注</p>
                            <p><a href="${basePath}/u/${group.creatorMember.id}">${group.creatorMember.name}</a> 创建于${group.createTime?string("yyyy-MM-dd")}</p>
                        </div>
                        <div class="text-left">
                        ${group.introduce!''}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "/${frontTemplate}/common/footer.ftl"/>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>