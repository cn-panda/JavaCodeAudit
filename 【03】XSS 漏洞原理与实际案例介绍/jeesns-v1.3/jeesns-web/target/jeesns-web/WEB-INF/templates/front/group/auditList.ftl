<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>审核帖子 - ${group.name} - ${GROUP_ALIAS} - ${SITE_NAME} - Powered By JEESNS</title>
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
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-8">
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        审核帖子
                    </div>
                    <div class="panel-body">
                        <div class="items">
                        <#list model.data as topic>
                            <div class="item">
                                <div class="item-content">
                                    <div class="media pull-left">
                                        <a href="${basePath}/u/${topic.member.id}">
                                        <img src="${basePath}${topic.member.avatar}" class="img-circle"
                                             alt="${topic.member.name}" width="50px" height="50px">
                                        </a>
                                    </div>
                                    <div class="text">
                                        <p>
                                        <h4><a href="${groupPath}/topic/${topic.id}">${topic.title}</a></h4>
                                        </p>
                                        <p>
                                            <a href="${groupPath}/topic/${topic.id}" class="text-muted"><i
                                                    class="icon-comments"></i> ${topic.viewCount}</a> &nbsp;
                                            <span class="text-muted">${topic.createTime?string('yyyy-MM-dd HH:mm')}</span>
                                            <a href="${groupPath}/audit/${topic.id}" class="btn-link" target="_jeesnsLink" confirm="确定审核通过该帖子吗？" callback="reload">
                                                <span class="label label-badge label-info">审核</span>
                                            </a>
                                            <a href="${groupPath}/delete/${topic.id}" class="btn-link" target="_jeesnsLink" confirm="确定要删除该帖子吗？" callback="reload">
                                                <span class="label label-badge label-danger">删除</span>
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </#list>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-4">
                <div class="group white-bg">
                    <div class="group-logo">
                        <a href="${groupPath}/detail/${group.id}">
                            <img alt="${group.name}" src="${basePath}${group.logo}" width="80px" height="80px"/>
                        </a>
                    </div>
                    <div class="group-detail">
                        <p>
                            <span>
                                <a href="${groupPath}/detail/${group.id}"><strong>${group.name}</strong></a>
                            </span>
                        </p>
                        <p><a href="${basePath}/u/${group.creatorMember.id}">${group.creatorMember.name}</a>
                            创建于${group.createTime?string("yyyy-MM-dd")}</p>
                    </div>
                    <div class="group-introduce">
                    ${group.introduce!''}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>
</html>