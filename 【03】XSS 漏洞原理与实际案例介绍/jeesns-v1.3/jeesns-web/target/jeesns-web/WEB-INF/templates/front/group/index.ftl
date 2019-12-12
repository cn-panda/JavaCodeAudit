<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${GROUP_ALIAS} - ${SITE_NAME} - Powered By JEESNS</title>
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
        <div class="row white-bg">
            <div class="panel group-topic-list no-border">
                <div class="panel-heading">
                    最新帖子
                    <span class="pull-right">
                    <a class="btn btn-primary m-t-n4" href="${groupPath}/apply">申请</a>
                </span>
                </div>
                <div class="panel-body">
                    <div class="items">
                        <div class="col-md-4">
                            <div class="article-hot-list">
                                <ul>
                                    <@group_topic_list cid=0 num=15 day=0; groupTopic>
                                        <#list groupTopicList as groupTopic>
                                            <li><i class="main-text-color"></i> <a
                                                    href="${groupPath}/topic/${groupTopic.id}">
                                                <#if groupTopic.title?length &gt; 18>
                                                    ${groupTopic.title?substring(0,18)}...
                                                <#else>
                                                    ${groupTopic.title}
                                                </#if>
                                            </a></li>
                                        </#list>
                                    </@group_topic_list>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="items">
                                <@group_topic_list gid=0 num=6 thumbnail=1; groupTopic>
                                    <#list groupTopicList as groupTopic>
                                        <div class="col-md-4">
                                            <div class="item index-article">
                                                <div class="item-content">
                                                    <div class="media">
                                                        <a href="${groupPath}/topic/${groupTopic.id}">
                                                            <img src="${basePath}${groupTopic.thumbnail}"
                                                                 alt="${groupTopic.title}" height="150px" width="100%">
                                                        </a>
                                                    </div>
                                                    <h4>
                                                        <a href="${groupPath}/topic/${groupTopic.id}">${groupTopic.title}</a>
                                                    </h4>
                                                </div>
                                                <div class="item-footer">
                                                    <a href="${groupPath}/topic/${groupTopic.id}" class="text-muted"><i
                                                            class="icon-comments"></i> ${groupTopic.viewCount}</a>
                                                    &nbsp; <span
                                                        class="text-muted">${groupTopic.createTime?string('yyyy-MM-dd HH:mm')}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </#list>
                                </@group_topic_list>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <@group_type_list>
            <#list groupTypeList as groupType>
        <div class="row white-bg group-list">
            <div class="panel-heading" style="margin-bottom: 30px">
                ${groupType.name}
            </div>
        <#list list as group>
            <#if group.typeId == groupType.id>
            <div class="col-md-3">
                <div class="group-detail">
                    <div class="group-logo">
                        <a href="${groupPath}/detail/${group.id}">
                            <img class="img-rounded" src="${basePath}${group.logo}" width="100px" height="100px">
                        </a>
                    </div>
                    <div class="group-info">
                        <h4><strong><a href="${groupPath}/detail/${group.id}">${group.name}</a></strong></h4>
                        <p class="text-muted" title="${group.introduce}">
                            <#if group.introduce?length &gt; 50>
                                ${group.introduce?substring(0,50)}...
                            <#else>
                                ${group.introduce}
                            </#if>
                        </p>
                        <small class="text-muted">${group.topicCount}篇文章 · ${group.fansCount}人关注</small>
                    </div>
                </div>
            </div>
            </#if>
        </#list>
        </div>
            </#list>
        </@group_type_list>
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