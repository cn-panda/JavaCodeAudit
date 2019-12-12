<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${member.name}主页 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/gallery/css/blueimp-gallery.min.css" rel="stylesheet">

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
    <script src="${basePath}/res/modules/mem.js"></script>
    <script src="${basePath}/res/plugins/emoji/js/emojis.js"></script>
    <script src="${basePath}/res/plugins/gallery/js/jquery.blueimp-gallery.min.js"></script>
</head>

<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="wrapper wrapper-content">
    <div class="member-banner" style="background-image: url(${basePath}/res/common/images/member_banner.png);">
        <div class="attempts"></div>
        <div class="container">
            <div class="container content">
                <div class="left">
                    <div class="avatar">
                        <img src="${basePath}${member.avatar}" class="img-circle" width="80px" height="80px"/>
                    </div>
                    <div class="info">
                        <div class="name">
                        ${member.name}
                        <#if member.sex=='女'>
                            <span class="sex"><i class="fa fa-venus"></i></span>
                        <#elseif member.sex=='男'>
                            <span class="sex"><i class="fa fa-mars"></i></span>
                        <#else>
                            <span class="sex"><i class="fa fa-intersex"></i></span>
                        </#if>
                            <span class="label label-danger" style="font-size: 12px;">${member.memberLevel.name}</span>
                        </div>
                        <p>${member.website}</p>
                        <p>${member.introduce}</p>
                        <p class="operator">
                            <a class="label label-primary member-follows" member-id="${member.id}">
                                <i class="fa fa-heart-o"></i> 关注
                            </a>
                        </p>
                    </div>
                </div>
                <div class="right">
                    <div class="follows">
                        <span>关注</span>
                        <a href="${basePath}/u/${member.id}/home/follows">${member.follows}</a>
                    </div>
                    <div class="fans">
                        <span>粉丝</span>
                        <a href="${basePath}/u/${member.id}/home/fans">${member.fans}</a>
                    </div>
                    <div class="follows">
                        <span>积分</span>
                        <a href="${basePath}/member/scoreDetail/list">${member.score}</a>
                    </div>
                    <div class="login-info">
                        加入时间:${member.createTime?string('yyyy-MM-dd')}
                        最近登录:<#if member.currLoginTime??>${member.currLoginTime?string('yyyy-MM-dd')}<#else>未登陆过</#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row m-t-10">
            <div class="col-sm-2">
                <ul class="list-group">
                    <li class="list-group-item"><a href="${basePath}/u/${member.id}">动态</a></li>
                    <li class="list-group-item"><a href="${basePath}/picture/album/${member.id}">相册</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${member.id}/home/fans">粉丝</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${member.id}/home/follows">关注</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${member.id}/home/article">文章</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${member.id}/home/groupTopic">群帖</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${member.id}/home/weibo">微博</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${member.id}/home/group">关注群组</a></li>
                </ul>
            </div>
            <div class="col-sm-10 white-bg">
                <div class="list list-condensed">
                    <header>
                        <h3><i class="icon-list-ul"></i>
                        <#if type=="article">
                                        文章
                        <#elseif type=="groupTopic">
                                        群贴
                        <#elseif type=="weibo">
                                        微博
                        <#elseif type=="groupTopic">
                                        群贴
                        <#elseif type=="fans">
                                        粉丝
                        <#elseif type=="follows">
                                        关注
                        <#elseif type=="group">
                                        关注群组
                        </#if>
                        </h3>
                    </header>
                    <div class="items items-hover">
                         <#if type=="article">
                             <#list model.data as article>
                             <div class="item">
                                 <div class="item-heading">
                                     <div class="pull-right"><span
                                             class="text-muted">${article.createTime?string('yyyy-MM-dd HH:mm')}</span>
                                     </div>
                                     <h4>
                                         <a href="${basePath}/article/detail/${article.id}" class="btn-link">
                                             ${article.title}
                                         </a>
                                     </h4>
                                 </div>
                             </div>
                             </#list>
                             <ul class="pager pagination pagination-sm no-margin pull-right"
                                 url="${basePath}/u/${member.id}/home/article"
                                 currentPage="${model.page.pageNo}"
                                 pageCount="${model.page.totalPage}">
                             </ul>
                         <#elseif type=="groupTopic">
                             <#list model.data as groupTopic>
                             <div class="item">
                                 <div class="item-heading">
                                     <div class="pull-right"><span
                                             class="text-muted">${groupTopic.createTime?string('yyyy-MM-dd HH:mm')}</span>
                                     </div>
                                     <h4>
                                         <a href="${groupPath}/topic/${groupTopic.id}" class="btn-link">
                                             ${groupTopic.title}
                                         </a>
                                     </h4>
                                 </div>
                             </div>
                             </#list>
                        <ul class="pager pagination pagination-sm no-margin pull-right"
                            url="${basePath}/u/${member.id}/home/groupTopic"
                            currentPage="${model.page.pageNo}"
                            pageCount="${model.page.totalPage}">
                        </ul>
                         <#elseif type=="weibo">
                             <#list model.data as weibo>
                            <div class="item">
                                <div class="item-heading">
                                    <h4>
                                        <a href="${basePath}/u/${weibo.member.id}"><strong>${weibo.member.name}</strong></a>
                                    </h4>
                                </div>
                                <div class="item-content">
                                    <div class="text">
                                        <p>${weibo.content}</p>
                                        <div class="lightBoxGallery">
                                                        <#list weibo.pictures as picture>
                                                            <a href="${basePath}${picture.path}"
                                                               title="${weibo.member.name}" data-gallery=""><img
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
                                    </div>
                                    <div class="pull-left">
                                        <span class="text-muted">${weibo.createTime?string('yyyy-MM-dd HH:mm:ss')} （<a href="${weiboPath}/detail/${weibo.id}">评论:${weibo.commentCount}</a>）</span>
                                    </div>
                                </div>
                            </div>
                             </#list>
                          <ul class="pager pagination pagination-sm no-margin pull-right"
                              url="${basePath}/u/${member.id}/home/weibo"
                              currentPage="${model.page.pageNo}"
                              pageCount="${model.page.totalPage}">
                          </ul>
                         <#elseif type=="group">
                             <#list model.data as groupFans>

                             <div class="item">
                                 <div class="item-heading">
                                     <h4>
                                         <a href="${groupPath}/detail/${groupFans.group.id}">${groupFans.group.name}</a>
                                     </h4>
                                 </div>
                                 <div class="item-content">
                                     <div class="text">
                                         <p>${groupFans.group.introduce}</p>
                                         <small class="text-muted">${groupFans.group.topicCount}篇文章
                                             · ${groupFans.group.fansCount}人关注
                                         </small>
                                     </div>
                                 </div>
                             </div>
                             </#list>
                            <ul class="pager pagination pagination-sm no-margin pull-right"
                                url="${basePath}/u/${member.id}/home/group"
                                currentPage="${model.page.pageNo}"
                                pageCount="${model.page.totalPage}">
                            </ul>
                         <#elseif type=="follows">
                             <#list model.data as memberFans>
                             <div class="item">
                                 <div class="item-heading">
                                     <h4>
                                         <a href="${basePath}/u/${memberFans.followWhoMember.id}">${memberFans.followWhoMember.name}</a>
                                     </h4>
                                 </div>
                                 <div class="item-content">
                                     <div class="text">
                                         <p>${memberFans.followWhoMember.introduce}</p>
                                         <small class="text-muted">${memberFans.followWhoMember.follows}关注
                                             · ${memberFans.followWhoMember.fans}粉丝
                                         </small>
                                     </div>
                                 </div>
                             </div>
                             </#list>
                            <ul class="pager pagination pagination-sm no-margin pull-right"
                                url="${basePath}/u/${member.id}/home/follows"
                                currentPage="${model.page.pageNo}"
                                pageCount="${model.page.totalPage}">
                            </ul>
                         <#elseif type=="fans">
                             <#list model.data as memberFans>
                             <div class="item">
                                 <div class="item-heading">
                                     <h4>
                                         <a href="${basePath}/u/${memberFans.whoFollowMember.id}">${memberFans.whoFollowMember.name}</a>
                                     </h4>
                                 </div>
                                 <div class="item-content">
                                     <div class="text">
                                         <p>${memberFans.whoFollowMember.introduce}</p>
                                         <small class="text-muted">${memberFans.whoFollowMember.follows}关注
                                             · ${memberFans.whoFollowMember.fans}粉丝
                                         </small>
                                     </div>
                                 </div>
                             </div>
                             </#list>
                            <ul class="pager pagination pagination-sm no-margin pull-right"
                                url="${basePath}/u/${member.id}/home/fans"
                                currentPage="${model.page.pageNo}"
                                pageCount="${model.page.totalPage}">
                            </ul>
                         </#if>

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
            mem.isFollowed(${member.id}, "${basePath}");
            $(".member-follows").click(function () {
                mem.follows($(this), "${basePath}")
            });
        });
    </script>
</body>
</html>