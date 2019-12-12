<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>签到 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <script>
        var basePath = "${basePath}";
    </script>
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
    <script>
        function checkin(){
            localStorage.setItem("message","签到成功");
            window.location.reload();
        }
    </script>
</head>

<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-9 white-bg">
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        今日签到
                    </div>
                    <div class="panel-body">
                        <div class="items">
                            <#list model.data as checkin>
                                <div class="comment">
                                    <a href="${basePath}/u/${checkin.member.id}" class="avatar" target="_blank">
                                        <img src="${basePath}${checkin.member.avatar!''}"
                                             class="icon-camera-retro icon-2x">
                                    </a>
                                    <div class="content m-t-10">
                                        <div class="pull-right text-muted">${checkin.createTime?string('MM-dd HH:mm')}</div>
                                        <div>
                                            <a href="${basePath}/u/${checkin.member.id}" target="_blank">
                                                <strong><a href="${basePath}/u/${checkin.member.id}">${checkin.member.name}</a> </strong>
                                            </a>
                                            <p><span class="label label-danger">${checkin.member.memberLevel.name}</span></p>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </div>
                    </div>
                    <ul class="pager pagination pagination-sm no-margin pull-right"
                        url="${basePath}/checkin/"
                        currentPage="${model.page.pageNo}"
                        pageCount="${model.page.totalPage}">
                </div>
            </div>
            <div class="col-md-3">
                <a  class="btn btn-block btn-primary" href="${basePath}/checkin/save" target="_jeesnsLink" callback="checkin">签到</a>
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        连续签到排行
                    </div>
                    <div class="panel-body">
                        <div class="items">
                            <#list todayContinueList as checkin>
                                <div class="comment">
                                    <a href="${basePath}/u/${checkin.member.id}" class="avatar" target="_blank">
                                        <img src="${basePath}${checkin.member.avatar!''}"
                                             class="icon-camera-retro icon-2x">
                                    </a>
                                    <div class="content m-t-10">
                                        <div>
                                            <a href="${basePath}/u/${checkin.member.id}" target="_blank">
                                                <strong><a href="${basePath}/u/${checkin.member.id}">${checkin.member.name}</a> </strong>
                                            </a>
                                        </div>
                                        <div class="text">连续签到 ${checkin.continueDay} 天</div>
                                    </div>
                                </div>
                            </#list>
                        </div>
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