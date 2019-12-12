<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article.title} - ${article.articleCate.name} - ${SITE_NAME} - Powered By JEESNS</title>
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
    <script src="${basePath}/res/front/js/jeesns.js"></script>
    <script>
        var base = "${basePath}";
        var articleId = ${article.id};
        function deleteSuccess() {
            window.location.href = "${basePath}/article/list";
        }
    </script>
    <script src="${basePath}/res/front/js/cms.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-8">
                <article class="article article-detail">
                    <header>
                        <h1 class="text-center">${article.title}</h1>
                        <span class="dl-inline">
                            <dt></dt>
                            <dd>
                                <a href="${basePath}/article/list?cid=${article.articleCate.id}">
                                    <span class="label label-warning"><i
                                            class="icon icon-list-ul"></i> ${article.articleCate.name}</span>
                                </a>
                                <span class="label label-danger"><i
                                        class="icon-eye-open"></i> ${article.viewCount}</span>
                                <i class="icon icon-time"></i> ${article.createTime?string('yyyy-MM-dd HH:mm')}
                            </dd>
                            <dt></dt>
                            <dd class="pull-right">
                            <#if loginUser?? && (loginUser.id == article.memberId || loginUser.isAdmin &gt; 0)>
                                <div class="dropdown dropdown-hover">
                                    <button class="btn" type="button" data-toggle="dropdown">操作 <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <#if loginUser.id == article.memberId>
                                            <li><a href="${basePath}/article/edit/${article.id}">编辑</a></li>
                                        </#if>
                                        <li><a href="${basePath}/article/delete/${article.id}" confirm="确定要删除文章吗？" target="_jeesnsLink" callback="deleteSuccess">删除</a></li>

                                    </ul>
                                </div>
                            </#if>
                            </dd>
                        </span>
                    </header>
                    <@ads id=2>
                        <#include "/tp/ad.ftl"/>
                    </@ads>
                    <section class="content">
                        ${article.content}
                    </section>
                    <div class="text-center">
                    <#if article.isFavor == 0>
                        <a class="btn btn-danger btn-article-favor btn-article-unfavor article-favor" href="javascript:void(0)" article-id="${article.id}">
                            <i class="icon-heart-empty"></i> 喜欢 | ${article.favor}
                        </a>
                    <#else>
                        <a class="btn btn-danger btn-article-favor article-favor" href="javascript:void(0)" article-id="${article.id}">
                            <i class="icon-heart"></i> 喜欢 | ${article.favor}
                        </a>
                    </#if>
                </article>
                <@ads id=2>
                    <#include "/tp/ad.ftl"/>
                </@ads>
                <div class="comments panel">
                    <div class="panel-heading">文章评论</div>
                    <header>
                        <div class="reply-form">
                            <form class="form-horizontal jeesns_form" action="${basePath}/article/comment/${article.id}"
                                  method="post" callback="reload">
                                <div class="form-group">
                                    <textarea name="content" class="form-control new-comment-text" rows="2"
                                              placeholder="撰写评论..."></textarea>
                                </div>
                                <div class="form-group comment-user">
                                    <input type="submit" value="评论"
                                           class="pull-right btn btn-primary mg-t-10 jeesns-submit">
                                </div>
                            </form>
                        </div>
                    </header>
                    <section class="comments-list" id="commentList">

                    </section>
                    <button class="btn btn-primary btn-block m" id="moreComment" style="display: none"><i
                            class="fa fa-arrow-down"></i> 加载更多
                    </button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel">
                    <div class="panel-body weibo-author">
                        <div class="avatar">
                            <a href="${basePath}/u/${article.member.id}" target="_blank">
                                <img alt="image" class="img-circle mg-l-30" src="${basePath}${article.member.avatar}"/></a>
                        </div>
                        <div class="name">
                            <a href="${basePath}/u/${article.member.id}"
                               target="_blank">${article.member.name}</a>
                        </div>
                        <div class="info">
                            <p>
                                <a href="${basePath}/u/${article.member.id}/home/follows">${article.member.follows}
                                    关注</a> /
                                <a href="${basePath}/u/${article.member.id}/home/fans">${article.member.fans}
                                    粉丝</a>
                            </p>
                            <p>
                            ${article.member.introduce}
                            </p>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        文章栏目
                    </div>
                    <div class="panel-body">
                        <a href="${basePath}/article/list" class="btn btn-primary">全部</a>
                    <#list articleCateList as articleCate>
                        <a href="${basePath}/article/list?cid=${articleCate.id}"
                           class="btn btn-primary">${articleCate.name}</a>
                    </#list>
                    </div>
                </div>
                <@ads id=1>
                    <#include "/tp/ad.ftl"/>
                </@ads>
                <div class="panel">
                    <div class="panel-heading">
                        最新文章
                    </div>
                    <div class="panel-body article-hot-list">
                        <ul>
                        <@cms_article_list cid=0 sort='id' num=10; article>
                            <#list articleList as article>
                                <li><i class="icon-hand-right main-text-color"></i> <a
                                        href="${basePath}/article/detail/${article.id}">${article.title}</a></li>
                            </#list>
                        </@cms_article_list>
                        </ul>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        热门文章
                    </div>
                    <div class="panel-body article-hot-list">
                        <ul>
                        <@cms_article_list cid=0 sort='view-count' num=10 day=30; article>
                            <#list articleList as article>
                                <li><i class="icon-hand-right main-text-color"></i> <a
                                        href="${basePath}/article/detail/${article.id}">${article.title}</a></li>
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
<script>
    $(document).ready(function () {
        var pageNo = 1;
        cms.commentList(articleId, pageNo);
        $("#moreComment").click(function () {
            pageNo++;
            cms.commentList(articleId, pageNo);
        });
        $(".article-favor").click(function () {
            cms.favor($(this), "${basePath}")
        });
    });
</script>
</body>
</html>