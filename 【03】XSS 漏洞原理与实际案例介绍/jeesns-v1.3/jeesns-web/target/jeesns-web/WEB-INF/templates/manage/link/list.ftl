<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>友情链接管理 - ${SITE_NAME} - JEESNS后台管理系统 - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/AdminLTE.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/skins/_all-skins.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/manage/js/app.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>友情链接管理</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">友情链接管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a href="${managePath}/link/add" target="_jeesnsOpen"
                                   title="添加友情链接" width="800px" height="500px">
                                    <span class="label label-info">添加</span>
                                </a>
                            </h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 10px">#</th>
                                    <th>网站名称</th>
                                    <th>网址</th>
                                    <th>序号</th>
                                    <th>推荐</th>
                                    <th>状态</th>
                                    <th>添加时间</th>
                                    <th width="150px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as link>
                                <tr>
                                    <td>${link.id}</td>
                                    <td><a href="${link.url}" target="_blank">${link.name}</a></td>
                                    <td><a href="${link.url}" target="_blank">${link.url}</a></td>
                                    <td>${link.sort}</td>
                                    <td>
                                        <#if link.recomment=0>
                                            <span class="label label-danger">不推荐</span>
                                        <#else>
                                            <span class="label label-success">推荐</span>
                                        </#if>
                                    </td>
                                    <td>
                                        <#if link.status=0>
                                        <a class="marg-l-5" target="_jeesnsLink" href="${managePath}/link/enable/${link.id}" confirm="确定要启用友情链接吗？" callback="reload">
                                            <span class="label label-danger">禁用</span>
                                        </a>
                                        <#else>
                                        <a class="marg-l-5" target="_jeesnsLink" href="${managePath}/link/enable/${link.id}" confirm="确定要禁用友情链接吗？" callback="reload">
                                            <span class="label label-success">启用</span>
                                        </a>
                                        </#if>
                                    </td>
                                    <td>${link.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <a href="${managePath}/link/edit/${link.id}" target="_jeesnsOpen"
                                           title="修改友情链接" width="800px" height="500px">
                                            <span class="label label-info">修改</span>
                                        </a>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="${managePath}/link/delete/${link.id}" confirm="确定要删除友情链接吗？" callback="reload">
                                            <span class="label label-danger"><i class="fa fa-trash red"></i></span>
                                        </a>
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/link/list"
                                currentPage="${model.page.pageNo}"
                                pageCount="${model.page.totalPage}">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<#include "/manage/common/footer.ftl"/>
</div>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>

