<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>积分明细 - ${SITE_NAME} - Powered By JEESNS</title>
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
    <div class="container">
        <div class="row">
            <div class="col-sm-12 white-bg">
                <div class="list list-condensed">
                    <header>
                        <h3><i class="icon-list-ul"></i> 积分明细</h3>
                    </header>
                    <div class="items items-hover">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>变动积分</th>
                                <th>备注</th>
                                <th>时间</th>
                            </tr>
                            </thead>
                            <tbody>
                    <#list model.data as scoreDetail>
                    <tr>
                        <td>${scoreDetail.id}</td>
                        <td>${scoreDetail.score}</td>
                        <td>${scoreDetail.remark}</td>
                        <td>${scoreDetail.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                    </tr>
                    </#list>
                            </tbody>
                        </table>
                        <ul class="pager pagination pagination-sm no-margin pull-right"
                            url="${basePath}/member/scoreDetail/list"
                            currentPage="${model.page.pageNo}"
                            pageCount="${model.page.totalPage}">
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
