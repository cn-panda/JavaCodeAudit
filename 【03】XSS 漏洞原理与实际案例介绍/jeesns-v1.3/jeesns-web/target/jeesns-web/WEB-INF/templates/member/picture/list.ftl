<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图片 - ${SITE_NAME} - Powered By JEESNS</title>
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
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
    <script>
        var basePath = "${basePath}";
    </script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-9 white-bg">
                <div class="panel-heading">
                    <a href="${basePath}/member/picture/album">${pictureAlbum.member.name}相册</a> > ${pictureAlbum.name}
                    <span class="pull-right">
                        <a class="btn btn-primary m-t-n4" href="${basePath}/member/picture/uploadPic?albumId=${pictureAlbum.id}" target="_jeesnsOpen" height="400px" width="1200px">上传图片</a>
                    </span>
                </div>
                <div class="cards">
                    <#list model.data as picture>
                    <div class="col-md-4 col-sm-6 col-lg-3">
                        <div class="card">
                            <div class="albumPic">
                                <a class="picLink" href="${basePath}/picture/detail/${picture.pictureId}" class="picture" target="_jeesnsOpen" title="" height="90%" width="90%">
                                    <img src="${basePath}${picture.smallPath}" class="pic">
                                </a>
                            </div>
                            <div class="card-actions m-t-10">
                                <div class="text-danger"><i class="icon-heart-empty"></i> ${picture.favorCount} 人喜欢</div>
                            </div>
                        </div>
                    </div>
                    </#list>
                </div>
                <ul class="pager pagination pagination-sm no-margin pull-right"
                    url="${basePath}/member/picture/list/${pictureAlbum.member.id}-${pictureAlbum.id}"
                    currentPage="${model.page.pageNo}"
                    pageCount="${model.page.totalPage}">
                </ul>
            </div>
            <div class="col-md-3">
                <div class="panel">
                    <div class="panel-body weibo-author">
                        <div class="avatar">
                            <a href="${basePath}/u/${pictureAlbum.member.id}" target="_blank">
                                <img alt="image" class="img-circle mg-l-30" src="${basePath}${pictureAlbum.member.avatar}"/></a>
                        </div>
                        <div class="name">
                            <a href="${basePath}/u/${pictureAlbum.member.id}"
                               target="_blank">${pictureAlbum.member.name}</a>
                        </div>
                        <div class="info">
                            <p>
                                <a href="${basePath}/u/${pictureAlbum.member.id}/home/follows">${pictureAlbum.member.follows}
                                    关注</a> /
                                <a href="${basePath}/u/${pictureAlbum.member.id}/home/fans">${pictureAlbum.member.fans}
                                    粉丝</a>
                            </p>
                            <p>
                            ${pictureAlbum.member.introduce}
                            </p>
                            <p><strong>${pictureAlbum.name}(${model.page.totalCount})</strong></p>
                            <div class="card"><img src="${basePath}${pictureAlbum.cover}" width="240px" height="140px"></div>
                        </div>
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