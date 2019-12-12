<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>帖子分类管理 - ${group.name} - ${GROUP_ALIAS} - ${SITE_NAME} - Powered By JEESNS</title>
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
                        帖子分类管理
                        <a href="${groupPath}/topicTypeAdd/${group.id}" target="_jeesnsOpen" title="添加帖子分类">添加</a>
                    </div>
                    <div class="panel-body">
                        <div class="items">

                            <table class="table">
                                <thead>
                                <tr>
                                    <th>分类名称</th>
                                    <th width="100px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list list as topicType>
                                <tr>
                                    <td>${topicType.name}</td>
                                    <td>
                                        <a href="${groupPath}/topicTypeEdit/${topicType.id}" target="_jeesnsOpen" title="编辑帖子分类">编辑</a>
                                        <a href="${groupPath}/topicTypeDelete/${topicType.id}" target="_jeesnsLink" title="编辑帖子分类" confirm="确定要删除该分类吗？" callback="reload">删除</a>
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
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