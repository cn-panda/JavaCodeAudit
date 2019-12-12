<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${WEIBO_ALIAS}中心 - ${topicName} - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/emoji/css/emoji.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/gallery/css/blueimp-gallery.min.css" rel="stylesheet">
    <script type="text/javascript">
        var basePath = "${basePath}";
        var weiboPath = "${weiboPath}";
        var uploadServer = "${basePath}/uploadImage";
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
    <script src="${basePath}/res/front/js/weibo.js"></script>
    <script src="${basePath}/res/plugins/emoji/js/underscore-min.js"></script>
    <script src="${basePath}/res/plugins/emoji/js/editor.js"></script>
    <script src="${basePath}/res/plugins/emoji/js/emojis.js"></script>
    <script src="${basePath}/res/plugins/js-emoji/emoji.js"></script>
    <script src="${basePath}/res/common/js/jquery.timeago.js"></script>
    <script src="${basePath}/res/plugins/webuploader/webuploader.min.js"></script>
    <script src="${basePath}/res/plugins/gallery/js/jquery.blueimp-gallery.min.js"></script>
    <script src="${basePath}/res/plugins/webuploader/weiboUpload.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-8 white-bg m-b-10">
                <div class="items weibo-post-area">
                    <h2>#${topicName}#</h2>
                    <form class="form-horizontal m-t jeesns_form" action="${weiboPath}/publish" method="post" callback="reload">
                        <p>
                            <textarea cols="5" class="form-control area emoji-render-input" name="content" id="weibo-content"
                                      maxlength="${WEIBO_POST_MAXCONTENT}">#${topicName}#</textarea>
                            <input type="hidden" name="pictures" id="weibo-pictures">
                        </p>
                        <div class="row emoji-container" id="emoji">
                            <i class="icon-smile emoji-tbtn"></i>
                            <span class="pull-right p-r-10">
                                 <span id="weibo-words" class="mg-r-5">0/${WEIBO_POST_MAXCONTENT}</span>
                                <input type="submit" value="发布" class="btn btn-primary">
                            </span>
                            <a href="javascript:void(0)" class="weibo-picture"><i class="icon-picture"></i></a>
                        </div>
                    </form>
                    <div class="weibo-picture-area" style="display: none;">
                        <div id="picUploader">
                            <div class="queueList">
                                <div id="dndArea" class="placeholder">
                                    <div id="filePicker" class="webuploader-container">
                                        <div class="webuploader-pick">选择图片</div>
                                        <div id="rt_rt_1bah3ovvi6on19tej9785o1tam1"
                                             style="width: 168px; height: 44px; overflow: hidden; bottom: auto; right: auto;">
                                            <input type="file" name="file" class="webuploader-element-invisible"
                                                   multiple="multiple" accept="image/*">
                                            <label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
                                        </div>
                                    </div>
                                    <p>或将照片拖到这里，最多可选9张</p>
                                </div>
                                <ul class="filelist"></ul>
                            </div>
                            <div class="statusBar" style="display:none;">
                                <div class="progress" style="display: none;">
                                    <span class="text">0%</span>
                                    <span class="percentage" style="width: 0%;"></span>
                                </div>
                                <div class="info">共0张（0B），已上传0张</div>
                                <div class="btns">
                                    <div id="filePicker2" class="webuploader-container">
                                        <div class="webuploader-pick">继续添加</div>
                                        <div id="rt_rt_1bah3ovvs1r4u1i88td912et1d006"
                                             style="position: absolute; top: 0px; left: 0px; width: 1px; height: 1px; overflow: hidden;">
                                            <input type="file" name="file" class="webuploader-element-invisible"
                                                   multiple="multiple" accept="image/*"><label
                                                style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
                                        </div>
                                    </div>
                                    <div class="uploadBtn state-pedding">开始上传</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="items" id="data-list">
                <#list model.data as weibo>
                    <div class="comment">
                        <a href="${basePath}/u/${weibo.member.id}" class="avatar" target="_blank">
                            <img src="${basePath}${weibo.member.avatar!''}" class="icon-camera-retro icon-2x">
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
                                <div class="lightBoxGallery">
                                    <#list weibo.pictures as picture>
                                        <a href="${basePath}${picture.path}" title="${weibo.member.name}"
                                           data-gallery=""><img src="${basePath}${picture.thumbnailPath}"/></a>
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
                            <div class="actions">
                                <#if weibo.isFavor==0>
                                <a class="text-primary weibo-favor" weibo-id="${weibo.id}" href="javascript:void(0);">
                                    <i class="icon-thumbs-o-up"></i> ${weibo.favor}</a>
                            <#else>
                                <a class="text-success weibo-favor" weibo-id="${weibo.id}" href="javascript:void(0);">
                                    <i class="icon-thumbs-up"></i> ${weibo.favor}</a>
                            </#if>
                                <a href="${weiboPath}/detail/${weibo.id}"><i class="icon-chat"></i> ${weibo.commentCount}</a>
                                <a href="${weiboPath}/detail/${weibo.id}">查看详情</a>
                            </div>
                        </div>
                    </div>
                </#list>
                </div>
                <ul class="pager pagination pagination-sm no-margin pull-right"
                    url="${weiboPath}/list"
                    currentPage="${model.page.pageNo}"
                    pageCount="${model.page.totalPage}">
                </ul>
            </div>
            <div class="col-md-4 float-left">
                <@ads id=1>
                    <#include "/tp/ad.ftl"/>
                </@ads>
                <div class="panel">
                    <div class="panel-heading">
                        热门微博
                    </div>
                    <div class="panel-body article-hot-list">
                        <ul>
                        <@wb_weibo_list sort='favor' num=10 day=30; weibo>
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
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
        $(".weibo-favor").click(function () {
            weibo.favor($(this), "${basePath}")
        });
        $('#emoji').emoji({
            insertAfter: function (item) {
                $('#weibo-content').insertContent(':' + item.name + ':')
            }
        }, "${basePath}");
        $(".weibo-picture").click(function () {
            var weiboPictureArea = $(".weibo-picture-area");
            if (weiboPictureArea.is(':hidden')) {
                weiboPictureArea.show();
                $.getScript("${basePath}/res/plugins/webuploader/weiboUpload.js");
            } else {
                weiboPictureArea.hide();
            }
        });
    });
</script>
</body>
</html>