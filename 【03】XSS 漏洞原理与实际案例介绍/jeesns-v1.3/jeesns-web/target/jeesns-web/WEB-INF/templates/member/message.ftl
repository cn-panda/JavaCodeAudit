<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的私信 - ${SITE_NAME} - Powered By JEESNS</title>
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
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script>
        var loginMemberId = ${loginUser.id};
        var base = "${basePath}";
    </script>
    <script src="${basePath}/res/modules/message.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="wrapper wrapper-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 white-bg">
                <div class="list list-condensed">
                    <header>
                        <h3><i class="icon-list-ul"></i> 私信</h3>
                    </header>
                    <div class="col-md-3">
                        <div class="chat-users">
                            <div class="users-list" id="users-list">

                            </div>
                            <div class="load-more">
                                <a href="javascript:void(0)" class="contacts-load-more-a" onclick="contactsLoadMore()"
                                   style="display: none;">加载更多...</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="chat-discussion">
                            <div class="chat-load-more">
                                <a href="javascript:void(0)" class="message-load-more-a" onclick="messageLoadMore()"
                                   style="display: none;">加载更多...</a>
                            </div>
                            <div class="chat-discussion-content">

                            </div>
                            <div class="no-message"> 暂无聊天记录</div>
                        </div>
                        <div class="send-message-area">
                            <textarea class="form-control message-input" name="content" id="content"></textarea>
                            <button class="btn btn-info pull-right sendMessage">发送</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>
</html>