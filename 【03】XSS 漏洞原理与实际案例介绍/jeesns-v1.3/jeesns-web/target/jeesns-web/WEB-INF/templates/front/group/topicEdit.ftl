<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改帖子 - ${SITE_NAME} - Powered By JEESNS</title>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/front/js/jeesns.js"></script>
    <script src="${basePath}/res/plugins/webuploader/webuploader.min.js"></script>
    <script src="${basePath}/res/plugins/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        var basePath = "${basePath}";
        var uploadServer = "${basePath}/uploadImage";
        $(function () {
            CKEDITOR.replace('content');
        });
        function _success() {
            window.location.href = "${groupPath}/topic/${groupTopic.id}";
        }
    </script>
    <script src="${basePath}/res/plugins/webuploader/upload.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-12 article-detail">
                <form class="form-horizontal jeesns_form" role="form" action="${groupPath}/topicUpdate" method="post" onsubmit="ckUpdate();" callback="_success">
                    <input type="hidden" class="form-control" name="id" value="${groupTopic.id}">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title" name="title" placeholder="标题" data-type="require" value="${groupTopic.title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">帖子分类</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="typeId">
                                <option value="" <#if groupTopic.typeId == null>selected</#if>>不选择分类</option>
                                <#list groupTopicTypeList as groupTopicType>
                                <option value="${groupTopicType.id}" <#if groupTopic.typeId == groupTopicType.id>selected</#if>>${groupTopicType.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">缩略图</label>
                        <div class="col-sm-10">
                            <div id="uploader">
                                <!--用来存放文件信息-->
                                <input type="hidden" id="thumbnail" name="thumbnail" value="${groupTopic.thumbnail}">
                                <div id="preview" class="uploader-list">
                                <#if groupTopic.thumbnail??>
                                    <img src="${basePath}${groupTopic.thumbnail}" width="100px" height="100px"/>
                                </#if>
                                </div>
                                <div id="imagesList" class="uploader-list"></div>
                                <h4 class="info"></h4>
                                <p class="state"></p>
                                <div class="btns">
                                    <div id="picker">选择文件</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-1 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea class="ckeditor" cols="80" id="content" name="content" rows="3">${groupTopic.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                            <a class="btn btn-default" href="${groupPath}/detail/${groupTopic.group.id}">返回</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>
</html>