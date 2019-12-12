<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${member.name}的相册 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <script type="text/javascript">
        var basePath = "${basePath}";
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
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
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
<div class="container white-bg">
    <div class="main-content">
        <div class="row">
            <div class="no-border">
                <div class="panel-heading">
                ${member.name}的相册列表
                </div>
                <div class="panel-body">
                    <div class="cards">
                    <#list model.data as pictureAlbum>
                        <div class="col-md-4 col-sm-6 col-lg-3">
                            <div class="card">
                                <div class="albumPic">
                                    <a class="picLink" href="${basePath}/picture/list/${pictureAlbum.memberId}-${pictureAlbum.id}">
                                        <#if pictureAlbum.juri == 0>
                                            <img src="${basePath}${pictureAlbum.cover}" class="pic">
                                        <#else>
                                            <img src="${basePath}/res/common/images/lock_album.png" class="pic">
                                        </#if>
                                        <#if pictureAlbum.description??>
                                            <div class="caption">${pictureAlbum.description}</div>
                                        </#if>
                                    </a>
                                </div>
                                <div class="card-heading"><strong>${pictureAlbum.name}</strong></div>
                                <div class="card-actions">
                                    <div class="pull-right text-danger"><i class="icon-heart-empty"></i> ${pictureAlbum.favorCount} 人喜欢</div>
                                </div>
                            </div>
                        </div>
                    </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>
</html>