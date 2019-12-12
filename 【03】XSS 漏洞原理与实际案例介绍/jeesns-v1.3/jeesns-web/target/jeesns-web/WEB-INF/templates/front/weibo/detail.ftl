<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${weibo.member.name}${WEIBO_ALIAS} - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/gallery/css/blueimp-gallery.min.css" rel="stylesheet">
    <script>
        var basePath = "${basePath}";
        var weiboPath = "${weiboPath}";
        var weiboId = ${weibo.id};
        var weiboPostMaxcontent = ${WEIBO_POST_MAXCONTENT};
        function deleteSuccess() {
            window.location.href = "../list"
        }
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
    <script src="${basePath}/res/plugins/js-emoji/emoji.js"></script>
    <script src="${basePath}/res/common/js/jquery.timeago.js"></script>
    <script src="${basePath}/res/plugins/gallery/js/jquery.blueimp-gallery.min.js"></script>
    <script src="${basePath}/res/front/js/weibo.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-8">
                <article class="article weibo-detail">
                    <section class="content">
                        <div class="avatar">
                            <img alt="image" class="img-circle mg-l-30" src="${basePath}${weibo.member.avatar}"/>
                        </div>
                        <div class="name">
                        ${weibo.member.name}
                            <span class="label label-danger">${weibo.member.memberLevel.name}</span>
                        </div>
                        <div class="emoji-render-content">${weibo.content}</div>
                        <div class="lightBoxGallery">
                        <#list weibo.pictures as picture>
                            <a href="${basePath}${picture.path}" title="${weibo.member.name}" data-gallery=""><img
                                    src="${basePath}${picture.thumbnailPath}"/></a>
                        </#list>
                            <div id="blueimp-gallery" class="blueimp-gallery">
                                <div class="slides"></div>
                                <h3 class="title"></h3>
                                <a class="prev">‹</a>
                                <a class="next">›</a>
                                <a class="close">×</a>
                                <a class="play-pause"></a>
                                <ol class="indicator"></ol>
                            </div>
                        </div>
                    </section>
                    <hr>
                    <div class="info">
                        <div class="left timeago" datetime="${weibo.createTime?string("yyyy-MM-dd HH:mm:ss")}"></div>
                        <div class="right">
                        <#if weibo.isFavor==0>
                            <a class="text-primary weibo-favor" weibo-id="${weibo.id}"><i
                                    class="icon icon-thumbs-o-up"></i> ${weibo.favor}</a>
                        <#else>
                            <a class="text-success weibo-favor" weibo-id="${weibo.id}"><i
                                    class="icon icon-thumbs-up"></i> ${weibo.favor}</a>
                        </#if>
                        <#if loginUser?? && (loginUser.id == weibo.member.id || loginUser.isAdmin &gt; 0)>
                            <a href="${weiboPath}/delete/${weibo.id}" target="_jeesnsLink" confirm="确定要删除微博吗？" callback="deleteSuccess">删除</a>
                        </#if>
                        </div>
                    </div>
                </article>
                <@ads id=2>
                    <#include "/tp/ad.ftl"/>
                </@ads>
                <div class="comments panel">
                    <div class="panel-heading">评论(${weibo.commentCount})</div>
                    <header>
                        <div class="reply-form">
                            <form class="form-horizontal jeesns_form" action="${weiboPath}/comment/${weibo.id}" method="post" callback="reload">
                                <div class="form-group">
                                    <textarea name="content" class="form-control new-comment-text" rows="2" id="weibo-content" maxlength="${WEIBO_POST_MAXCONTENT}"></textarea>
                                </div>
                                <div class="form-group comment-user">
                                    <span id="weibo-words" class="mg-r-5">0/${WEIBO_POST_MAXCONTENT}</span>
                                    <input type="submit" value="评论" class="pull-right btn btn-primary mg-t-10 jeesns-submit">
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
                <@ads id=1>
                    <#include "/tp/ad.ftl"/>
                </@ads>
                <div class="panel">
                    <div class="panel-body weibo-author">
                        <div class="avatar">
                            <img alt="image" class="img-circle mg-l-30" src="${basePath}${weibo.member.avatar}"/>
                        </div>
                        <div class="name">
                            ${weibo.member.name}
                        </div>
                        <div class="info">
                            <p>
                                <a href="${basePath}/u/${weibo.member.id}/home/follows">${weibo.member.follows} 关注</a> /
                                <a href="${basePath}/u/${weibo.member.id}/home/fans">${weibo.member.fans} 粉丝</a>
                            </p>
                            <p>
                            ${weibo.member.introduce}
                            </p>
                        </div>
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
        weibo.commentList(weiboId, pageNo);
        $("#moreComment").click(function () {
            pageNo++;
            weibo.commentList(weiboId, pageNo);
        });
        $(".weibo-favor").click(function () {
            weibo.favor($(this), "${basePath}")
        });
    });
</script>
</body>
</html>