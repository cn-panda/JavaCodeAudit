<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>上传图片 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <script type="text/javascript">
        var basePath = "${basePath}";
        var albumId = ${albumId};
        var memberId = ${loginUser.id};
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
    <script src="${basePath}/res/plugins/webuploader/webuploader.min.js"></script>
    <script src="${basePath}/res/plugins/webuploader/pictureUpload.js"></script>
</head>
<body class="gray-bg">
<div class="container">
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
                <p>或将照片拖到这里，最多可选30张</p>
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
</body>
</html>