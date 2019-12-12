<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>动态 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <script>
        var basePath = "${basePath}";
    </script>
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
    <script src="${basePath}/res/modules/mem.js"></script>
    <script src="${basePath}/res/plugins/js-emoji/emoji.js"></script>
    <script src="${basePath}/res/common/js/jquery.timeago.js"></script>
</head>

<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-12 white-bg m-b-10">
                <div class="items">
                <#list model.data as actionLog>
                    <div class="comment">
                        <a href="${basePath}/u/${actionLog.member.id}" class="avatar" target="_blank">
                            <img src="${basePath}${actionLog.member.avatar!''}" class="icon-camera-retro icon-2x">
                        </a>
                        <div class="content">
                            <div class="pull-right text-muted timeago" datetime="${actionLog.createTime?string('yyyy-MM-dd HH:mm:ss')}"></div>
                            <div>
                                <a href="${basePath}/u/${actionLog.member.id}" target="_blank">
                                    <strong><a href="${basePath}/u/${actionLog.member.id}">${actionLog.member.name}</a> </strong>于${actionLog.createTime?string('yyyy-MM-dd HH:mm')}${actionLog.action.log}：<br/>
                                </a>
                            </div>
                            <div class="text emoji-render-content">
                                <#if actionLog.type==1>
                                    <a href="${basePath}/article/detail/${actionLog.foreignId}"
                                       target="_blank">${actionLog.remark}</a>
                                <#elseif actionLog.type==2>
                                    <p>${actionLog.remark}</p>
                                    <a href="${weiboPath}/detail/${actionLog.foreignId}"
                                       target="_blank">查看</a>
                                <#elseif actionLog.type==4>
                                    <a href="${groupPath}/topic/${actionLog.foreignId}"
                                       target="_blank">${actionLog.remark}</a>
                                </#if>
                            </div>
                        </div>
                    </div>
                </#list>
                </div>
                <ul class="pager pagination pagination-sm no-margin pull-right"
                    url="${basePath}/action/list"
                    currentPage="${model.page.pageNo}"
                    pageCount="${model.page.totalPage}">
                </ul>
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