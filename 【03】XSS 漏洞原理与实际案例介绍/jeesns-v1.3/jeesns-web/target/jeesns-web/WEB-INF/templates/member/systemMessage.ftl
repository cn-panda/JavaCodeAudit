<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统消息 - ${SITE_NAME} - Powered By JEESNS</title>
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
<div class="wrapper wrapper-content">
    <div class="member-banner" style="background-image: url(${basePath}/res/common/images/member_banner.png);">
        <div class="attempts"></div>
        <div class="container">
            <div class="container content">
                <div class="left">
                    <div class="avatar">
                        <img src="${basePath}${loginUser.avatar}" class="img-circle" width="80px" height="80px"/>
                    </div>
                    <div class="info">
                        <div class="name">
                        ${loginUser.name}
                        <#if loginUser.sex=='女'>
                            <span class="sex"><i class="fa fa-venus"></i></span>
                        <#elseif loginUser.sex=='男'>
                            <span class="sex"><i class="fa fa-mars"></i></span>
                        <#else>
                            <span class="sex"><i class="fa fa-intersex"></i></span>
                        </#if>
                        </div>
                        <p>${loginUser.website}</p>
                        <p>${loginUser.introduce}</p>
                        <p class="operator">
                            <a class="btn btn-info btn-outline member-follows" href="${basePath}/member/editInfo">
                                <i class="fa fa-edit"></i> 编辑个人资料
                            </a>
                        </p>
                    </div>
                </div>
                <div class="right">
                    <div class="follows">
                        <span>关注</span>
                        <a href="${basePath}/u/${loginUser.id}/home/follows">${loginUser.follows}</a>
                    </div>
                    <div class="fans">
                        <span>粉丝</span>
                        <a href="${basePath}/u/${loginUser.id}/home/fans">${loginUser.fans}</a>
                    </div>
                    <div class="follows">
                        <span>积分</span>
                        <a href="${basePath}/member/scoreDetail/list">${loginUser.score}</a>
                    </div>
                    <div class="login-info">
                        加入时间:${loginUser.createTime?string('yyyy-MM-dd')}
                        最近登录:<#if loginUser.currLoginTime??>${loginUser.currLoginTime?string('yyyy-MM-dd')}<#else>未登陆过</#if>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row m-t-10">
            <div class="col-sm-2">
                <ul class="list-group">
                    <li class="list-group-item"><a href="${basePath}/member/message">私信</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${loginUser.id}">动态</a></li>
                    <li class="list-group-item"><a href="${basePath}/member/picture/album">相册</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${loginUser.id}/home/fans">粉丝</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${loginUser.id}/home/follows">关注</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${loginUser.id}/home/article">文章</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${loginUser.id}/home/groupTopic">群帖</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${loginUser.id}/home/weibo">微博</a></li>
                    <li class="list-group-item"><a href="${basePath}/u/${loginUser.id}/home/group">关注群组</a></li>
                </ul>
            </div>
            <div class="col-sm-10 white-bg">
                <div class="list list-condensed">
                    <header>
                        <h3><i class="icon-list-ul"></i> 系统消息</h3>
                    </header>
                    <div class="items items-hover">
                        <#list messageModel.data as message>

                        <div class="item">
                            <div class="item-heading">
                                <div class="pull-right"><span class="text-muted">${message.createTime?string('yyyy-MM-dd HH:mm:ss')}</span></div>
                                <h4><a href="${basePath}/u/${message.member.id}"><strong>@${message.member.name} </strong></a>：${message.content}</h4>
                            </div>
                            <div class="item-content">
                                <div class="text">
                                    ${message.description}
                                </div>
                            </div>
                        </div>
                        </#list>
                        <ul class="pager pagination pagination-sm no-margin pull-right"
                            url="${basePath}/member/"
                            currentPage="${messageModel.page.pageNo}"
                            pageCount="${messageModel.page.totalPage}">
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