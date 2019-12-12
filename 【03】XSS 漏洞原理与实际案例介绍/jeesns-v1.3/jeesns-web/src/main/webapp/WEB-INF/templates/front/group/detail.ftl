<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${group.name} - ${GROUP_ALIAS} - ${SITE_NAME} - Powered By JEESNS</title>
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
    <script src="${basePath}/res/common/js/extendPagination.js"></script>
</head>
<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="container">
    <div class="main-content">
        <div class="row">
            <div class="col-md-8">
                <div class="group white-bg">
                    <div class="group-logo">
                        <img alt="${group.name}" src="${basePath}${group.logo}" width="80px" height="80px"/>
                    </div>
                    <div class="group-detail">
                        <p>
                            <span>
                                <strong>${group.name}</strong>
                            </span>
                            <span class="text-right">
                                <#if isfollow == true>
                                    <a title="取消关注" href="${groupPath}/nofollow/${group.id}"
                                       target="_jeesnsLink" callback="reload"><i class="icon-minus"></i> 取消关注</a>
                                <#else>
                                    <a title="添加关注" href="${groupPath}/follow/${group.id}" target="_jeesnsLink" callback="reload"><i
                                            class="icon-plus"></i> 关注</a>
                                </#if>
                                <#if loginUser?? && loginUser.id == group.creator>
                                   . <a href="${groupPath}/edit/${group.id}">编辑</a>
                                </#if>
                                <#if isManager == 1>
                                   . <a href="${groupPath}/auditList/${group.id}">审核帖子</a>
                                </#if>
                                <#if isManager == 1>
                                   . <a href="${groupPath}/topicTypeList/${group.id}">分类管理</a>
                                </#if>
                            </span>
                        </p>
                        <p>${model.page.totalCount}帖子 · ${groupFansList?size}关注</p>
                        <p><a href="${basePath}/u/${group.creatorMember.id}">${group.creatorMember.name}</a>
                            创建于${group.createTime?string("yyyy-MM-dd")}</p>
                    </div>
                    <div class="group-introduce">
                    ${group.introduce!''}
                    </div>
                </div>
                <@ads id=2>
                    <#include "/tp/ad.ftl"/>
                </@ads>
                <div class="panel group-topic-list no-border">
                    <div class="panel-heading">
                        <a href="${groupPath}/detail/${group.id}"><span class="btn btn-info">全部<#if typeId == 0> <span class="label label-dot label-info"></span></#if></span></a> &nbsp;&nbsp;
                        <#list groupTopicTypeList as groupTopicType>
                            <a href="${groupPath}/detail/${group.id}?typeId=${groupTopicType.id}"><span class="btn btn-success">${groupTopicType.name}<#if typeId == groupTopicType.id> <span class="label label-dot label-info"></span></#if></span></button></a>&nbsp;&nbsp;
                        </#list>
                        <span class="pull-right">
                            <a class="btn btn-primary m-t-n4" href="${groupPath}/post/${group.id}">发帖</a>
                        </span>
                    </div>
                    <div class="panel-body">
                        <div class="items">
                        <#list model.data as topic>
                            <div class="item">
                                <div class="item-content">
                                    <div class="media pull-left">
                                        <img src="${basePath}${topic.member.avatar}" class="img-circle"
                                             alt="${topic.member.name}" width="50px" height="50px">
                                    </div>
                                    <div class="text">
                                        <p>
                                        <h4>
                                            <a href="${groupPath}/topic/${topic.id}">${topic.title}</a>
                                        <#if topic.isTop==1>
                                            <span class="label label-badge label-primary">置顶</span>
                                        <#elseif topic.isTop==2>
                                            <span class="label label-badge label-success">超级置顶</span>
                                        </#if>
                                        <#if topic.isEssence==1>
                                            <span class="label label-badge label-danger">精华</span>
                                        </#if>
                                        </h4>
                                        </p>
                                        <p>
                                            <a href="${groupPath}/topic/${topic.id}" class="text-muted"><i
                                                    class="icon-eye-open"></i> ${topic.viewCount}</a> &nbsp;
                                            <span class="text-muted">${topic.createTime?string('yyyy-MM-dd HH:mm')}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </#list>
                        </div>
                    </div>
                    <ul class="pager pagination pagination-sm no-margin pull-right"
                        url="${groupPath}/detail/${group.id}"
                        currentPage="${model.page.pageNo}"
                        pageCount="${model.page.totalPage}">
                    </ul>
                </div>
            </div>
            <div class="col-md-4 float-left">
                <div class="panel group-detail-fans">
                    <div class="panel-heading">
                        粉丝(${groupFansList?size})
                    </div>
                    <div class="panel-body list">
                        <#list groupFansList as groupFans>
                        <div class="fan">
                            <div class="avatar">
                                <a href="${basePath}/u/${groupFans.member.id}" target="_blank">
                                    <img class="img-circle" src="${basePath}${groupFans.member.avatar}" width="50px"
                                         height="50px"/>
                                </a>
                            </div>
                            <div class="name">
                                <a href="${basePath}/u/${groupFans.member.id}" target="_blank">
                                    ${groupFans.member.name}
                                </a>
                            </div>
                        </div>
                        </#list>
                    </div>
                </div>
                <@ads id=1>
                    <#include "/tp/ad.ftl"/>
                </@ads>
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