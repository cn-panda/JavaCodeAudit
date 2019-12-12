<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no">
    <title>${picture.member.name}的图片 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <style>
        html, body {margin: 0px;height: 100%;}
    </style>
    <script>
        var basePath = "${basePath}";
        var pageNo = 1;
        var pictureId = ${picture.pictureId};
    </script>
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/jquery.masonry.min.js"></script>
    <script src="${basePath}/res/front/js/jeesns.js"></script>
    <script src="${basePath}/res/front/js/picture.js"></script>
</head>

<body>
<div class="picture-detail">
    <div class="show-picture">
        <div class="pic">
            <img src="${basePath}${picture.path}">
        </div>
    </div>
    <div class="show-info">
        <div class="member-info">
            <div class="avatar">
                <a href="${basePath}/u/${picture.member.id}" target="_blank">
                    <img alt="image" class="img-circle mg-l-30" src="${basePath}${picture.member.avatar}"/>
                </a>
            </div>
            <div class="name">
                <strong><a href="${basePath}/u/${picture.member.id}" target="_blank">${picture.member.name}</a></strong>
                <p>上传于${picture.createTime?string("yyyy年MM月dd HH:mm")}</p>
            </div>
        </div>
        <div class="description emoji-render-content">${picture.description}</div>
        <div class="right">
            <a class="text-primary picture-favor" data-id="${picture.pictureId}">
                <i class="icon icon-thumbs<#if picture.isFavor==0>-o</#if>-up"></i> ${picture.favorCount}
            </a>
        </div>
        <form class="form-horizontal m-t" id="comment_form"
              action="${basePath}/picture/comment/${picture.pictureId}" method="post">
            <textarea cols="5" class="form-control area emoji-render-input" name="content" id="content"></textarea>
            <div class="row emoji-container" id="emoji">
                <span class="pull-right p-r-10">
                    <input type="submit" value="评论" class="btn btn-primary">
                </span>
            </div>
        </form>
        <div class="comment-list"></div>
        <div class="more-comment"></div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        picture.commentList();
    })
</script>
</body>
</html>