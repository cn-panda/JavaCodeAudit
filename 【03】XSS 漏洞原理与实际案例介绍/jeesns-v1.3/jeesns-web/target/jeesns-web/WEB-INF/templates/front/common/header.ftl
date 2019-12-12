<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header m-navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">JEESNS</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand jeesns-logo" href="${basePath}/"><img src="${basePath}${SITE_LOGO}" height="50px"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${basePath}/">首页</a></li>
                <li><a href="${basePath}/article/list">文章</a></li>
                <li><a href="${weiboPath}/list">${WEIBO_ALIAS}</a></li>
                <li><a href="${groupPath}/">${GROUP_ALIAS}</a></li>
                <li><a href="${basePath}/action/list">动态</a></li>
                <li><a href="${basePath}/picture/">图库</a></li>
                <li><a href="${basePath}/checkin/">签到</a></li>
            </ul>
            <ul class="nav navbar-top-links navbar-right">
                <div class="nav navbar-nav navbar-nav-right">
                <#if loginUser == null>
                    <li><a href="${basePath}/member/login">登录</a></li>
                    <li><a href="${basePath}/member/register">注册</a></li>
                <#else>
                <li class="dropdown">
                    <a href="${basePath}/member/" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${basePath}${loginUser.avatar}" class="img-circle" width="25px" height="25px" style="margin-top: 1px;margin-right:5px;"/>
                            ${loginUser.name}<span class="label label-danger">${loginUser.memberLevel.name}</span>
                            <#if unReadMessageNum+systemUnReadMessageNum &gt; 0><i class="icon-comments"></i></#if>
                        <b class="caret"></b>
                    </a>

                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${basePath}/member/">个人中心</a></li>
                        <li><a href="${basePath}/member/systemMessage">系统信息 ${(systemUnReadMessageNum > 0)?string("("+systemUnReadMessageNum+")","")}</a></li>
                        <li><a href="${basePath}/member/message">私信 ${(unReadMessageNum > 0)?string("("+unReadMessageNum+")","")}</a></li>
                        <li><a href="${basePath}/member/editInfo">设置</a></li>
                            <#if loginUser?? && loginUser.isAdmin &gt; 0>
                                <li><a href="${managePath}/" target="_blank">管理</a></li>
                            </#if>
                        <li class="divider"></li>
                        <li><a href="${basePath}/member/logout">退出</a></li>
                    </ul>
                </li>
                </#if>
                </div>
            </ul>
        </div>
    </div>
</nav>