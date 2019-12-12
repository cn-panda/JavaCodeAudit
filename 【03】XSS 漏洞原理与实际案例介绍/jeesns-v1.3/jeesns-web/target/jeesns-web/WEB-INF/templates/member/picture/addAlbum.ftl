<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新建相册 - ${SITE_NAME} - Powered By JEESNS</title>
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
</head>
<body>
<div class="container">
    <form class="form-horizontal jeesns_form" role="form" action="${basePath}/member/picture/saveAlbum" method="post" callback="reload">
        <div class="form-group">
            <label class="col-sm-1 control-label">相册名称</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="title" name="name" placeholder="相册名称" data-type="require">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">相册描述</label>
            <div class="col-sm-8">
                <textarea class="form-control" rows="3" name="description" alt="相册描述" data-type="require"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">设置权限</label>谁可以看到这个相册？
            <div class="col-sm-8">
                <div class="radio">
                    <label>
                        <input type="radio" name="juri" value="0" checked> 所有人
                    </label>
                    <label>
                        <input type="radio" name="juri" value="1"> 相互关注的人
                    </label>
                    <label>
                        <input type="radio" name="juri" value="2"> 仅自己
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
                <button type="submit" class="btn btn-info jeesns-submit">保存</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>