<div class="member-banner" style="background-image: url(${basePath}/res/common/images/member_banner.png);">
    <div class="attempts"></div>
    <div class="container">
        <div class="container content">
            <div class="left">
                <div class="avatar">
                    <img src="${basePath}${loginUser.avatar}" class="img-circle" width="80px" height="80px"/>
                </div>
                <div class="info">
                    <div class="name">
                    ${loginUser.name}
                    <#if loginUser.sex=='女'>
                        <span class="sex"><i class="fa fa-venus"></i></span>
                    <#elseif loginUser.sex=='男'>
                        <span class="sex"><i class="fa fa-mars"></i></span>
                    <#else>
                        <span class="sex"><i class="fa fa-intersex"></i></span>
                    </#if>
                    </div>
                    <p><a href="${loginUser.website}" target="_blank">${loginUser.website}</a></p>
                    <p>${loginUser.introduce}</p>
                    <p class="operator">
                        <a class="btn btn-info btn-outline member-follows" href="${basePath}/member/">
                            <i class="fa fa-home"></i> 个人中心
                        </a>
                    </p>
                </div>
            </div>
            <div class="right">
                <div class="follows">
                    <span>关注</span>
                    <a href="${basePath}/u/${loginUser.id}/home/follows">${loginUser.follows}</a>
                </div>
                <div class="fans">
                    <span>粉丝</span>
                    <a href="${basePath}/u/${loginUser.id}/home/fans">${loginUser.fans}</a>
                </div>
                <div class="follows">
                    <span>积分</span>
                    <a href="${basePath}/member/scoreDetail/list">${loginUser.score}</a>
                </div>
                <div class="login-info">
                    加入时间:${loginUser.createTime?string('yyyy-MM-dd')}
                    最近登录:<#if loginUser.currLoginTime??>${loginUser.currLoginTime?string('yyyy-MM-dd')}<#else>未登陆过</#if>

                </div>
            </div>
        </div>
    </div>
</div>