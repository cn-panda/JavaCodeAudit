<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><#if articleCate??>${articleCate.name}<#else>文章列表</#if> - ${SITE_NAME} - Powered By JEESNS</title>
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
            <div class="col-md-8 white-bg">
                <div class="items">
                    <#list model.data as article>
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
                        <ul class="pager pagination pagination-sm no-margin pull-right"
                            url="${basePath}/article/list?<#if articleCate??>cid=${articleCate.id}&</#if>key="
                            currentPage="${model.page.pageNo}"
                            pageCount="${model.page.totalPage}">
                        </ul>
                </div>
            </div>
            <div class="col-md-4 float-left">
                <form action="${basePath}/article/list" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" name="key">
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="submit"><i class="icon-search"></i></button>
                        </span>
                    </div>
                </form>
                <div class="panel">
                    <div class="panel-heading">
                        文章栏目
                        <span class="pull-right">
                            <a class="btn btn-primary m-t-n4" href="${basePath}/article/add">发布文章</a>
                        </span>
                    </div>
                    <div class="panel-body">
                        <a href="${basePath}/article/list" class="btn btn-primary">全部</a>
                        <#list articleCateList as articleCate>
                            <a href="${basePath}/article/list?cid=${articleCate.id}" class="btn btn-primary">${articleCate.name}</a>
                        </#list>
                    </div>
                </div>
                <@ads id=1>
                    <#include "/tp/ad.ftl"/>
                </@ads>
                <div class="panel">
                    <div class="panel-heading">
                        热门文章
                    </div>
                    <div class="panel-body article-hot-list">
                        <ul>
                        <@cms_article_list cid=0 sort='view_count' num=10 day=30; article>
                            <#list articleList as article>
                                <li><i class="icon-hand-right main-text-color"></i> <a href="${basePath}/article/detail/${article.id}">${article.title}</a></li>
                            </#list>
                        </@cms_article_list>
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