<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${SITE_NAME} - ${SITE_SEO_TITLE} - Powered By JEESNS</title>
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
<div class="container">
    <div class="main-content m-t-10">
        <div class="row">
            <div class="col-md-8">
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        推荐阅读
                    </div>
                    <div class="panel-body">
                        <div class="items">
                        <@cms_article_list cid=0 num=20 thumbnail=1; article>
                            <#list articleList as article>
                                <div class="item">
                                    <div class="item-content article">
                                        <div class="media pull-left">
                                        <#if article.thumbnail??>
                                            <a href="${basePath}/article/detail/${article.id}">
                                                <img src="${basePath}${article.thumbnail}" alt="${article.title}" height="150px" width="220px">
                                            </a>
                                        </#if>
                                        </div>
                                        <div class="item-heading">
                                            <h3><a class="title" href="${basePath}/article/detail/${article.id}">${article.title}</a></h3>
                                        </div>
                                        <div class="text word-break">
                                            ${article.description}
                                        </div>
                                        <div class="item-footer">
                                            <i class="icon-eye-open"></i> ${article.viewCount} &nbsp;
                                            <span class="text-muted">${article.createTime?string('yyyy-MM-dd HH:mm')}</span>
                                            <a href="${basePath}/article/list?cid=${article.articleCate.id}">
                                                <div class="pull-right label label-success">
                                                    ${article.articleCate.name}
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </@cms_article_list>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        微博
                    </div>
                    <div class="panel-body article-hot-list">
                        <ul>
                        <@wb_weibo_list num=20 day=0; weibo>
                            <#list weiboList as weibo>
                                <div class="comment">
                                    <a href="${basePath}/u/${weibo.member.id}" class="avatar" target="_blank">
                                        <img src="${basePath}${weibo.member.avatar!''}"
                                             class="icon-camera-retro icon-2x">
                                    </a>
                                    <div class="content">
                                        <div class="pull-right text-muted timeago" datetime="${weibo.createTime?string('yyyy-MM-dd HH:mm:ss')}"></div>
                                        <div>
                                            <a href="${basePath}/u/${weibo.member.id}" target="_blank">
                                                <strong>${weibo.member.name}</strong>
                                            </a>
                                        </div>
                                        <div class="text">
                                            <div class="emoji-render-content">${weibo.content}</div>
                                        </div>
                                        <div class="actions">
                                            (<#if weibo.isFavor==0>
                                            <a class="text-primary weibo-favor" weibo-id="${weibo.id}">
                                                <i class="icon-thumbs-o-up"></i> ${weibo.favor}</a>
                                        <#else>
                                            <a class="text-success weibo-favor" weibo-id="${weibo.id}">
                                                <i class="icon-thumbs-up"></i> ${weibo.favor}</a>
                                        </#if>
                                            <a href="${weiboPath}/detail/${weibo.id}"><i class="icon-chat"></i> ${weibo.commentCount}</a>
                                            <a href="${weiboPath}/detail/${weibo.id}">查看详情</a>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </@wb_weibo_list>
                        </ul>
                    </div>
                </div>
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        最新帖子
                    </div>
                    <div class="panel-body">
                        <div class="items">
                            <div class="row">
                                <div class="article-hot-list">
                                    <ul>
                                    <@group_topic_list cid=0 num=20 day=0; groupTopic>
                                        <#list groupTopicList as groupTopic>
                                            <li><i class="main-text-color"></i> <a href="${groupPath}/topic/${groupTopic.id}">
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
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-12">
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        推荐群组
                        <span class="pull-right">
                            <a class="btn btn-primary m-t-n4" href="${groupPath}/">查看更多</a>
                        </span>
                    </div>
                    <div class="panel-body">
                        <div class="items">
                            <div class="col-md-12 group-list">
                            <@group_list status=1 num=8; group>
                                <#list groupList as group>
                                    <div class="col-md-3">
                                        <div class="group-detail">
                                            <div class="group-logo">
                                                <a href="${groupPath}/detail/${group.id}">
                                                    <img alt="image" class="img-rounded" src="${basePath}${group.logo}" width="100px" height="100px">
                                                </a>
                                            </div>
                                            <div class="group-info">
                                                <h4><strong><a href="${groupPath}/detail/${group.id}">${group.name}</a></strong></h4>
                                                <p class="text-muted">
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
                                </#list>
                            </@group_list>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        友情链接
                        <span class="pull-right">
                            <a class="btn btn-primary m-t-n4" href="${basePath}/link">查看更多</a>
                        </span>
                    </div>
                    <div class="panel-body friend-link">
                        <ul>
                        <#list linkModel.data as link>
                            <li><a href="${link.url}" target="_blank">${link.name}</a></li>
                        </#list>
                        </ul>
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