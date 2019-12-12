<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>JEESNS后台管理首页 - ${SITE_NAME} - JEESNS后台管理系统 - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/res/common/css/font-awesome.min.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/AdminLTE.css" rel="stylesheet">
    <link href="${basePath}/res/manage/css/skins/_all-skins.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src="${basePath}/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/manage/js/app.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content">
            <div class="box-body">
                <div class="row">
                    <div class="alert alert-info alert-dismissible">
                        感谢您使用JEESNS，JEESNS正在不断完善中，可以向我们提出宝贵的建议或意见，JEESNS的成长需要大家的支持。
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="box box-primary">
                        <div class="box-body">
                            <p>
                                感谢您使用JEESNS，JEESNS是一款基于JAVA企业级平台研发的社交管理系统，
                                依托企业级JAVA的高效、安全、稳定等优势，开创国内JAVA版开源SNS先河。
                                数据库使用MYSQL，全部源代码开放，官方网址：
                                <a href="http://www.jeesns.cn" target="_blank">www.jeesns.cn</a>。
                            </p>
                            <p>
                                <a class="btn btn-success"
                                   href="http://wpa.qq.com/msgrd?v=3&uin=582866070&site=qq&menu=yes" target="_blank">
                                    <i class="fa fa-qq"> </i> 联系我
                                </a>
                                <a class="btn btn-white btn-bitbucket" href="http://www.jeesns.cn" target="_blank">
                                    <i class="fa fa-home"></i> 访问官网
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="box box-primary">
                        <div class="box-body">
                            <p>
                                技术支持：<a href="http://www.lxinet.com">凌夕网络（www.lxinet.com）</a><br/>
                                产品交流：<a href="http://www.jeesns.cn">JEESNS社区（www.jeesns.cn）</a><br/>
                                服务器赞助：<a href="http://www.919dns.com">919数据中心（www.919dns.com）</a><br/>
                                QQ交流群：280062708<br/>
                                商业授权QQ：582866070
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="col-sm-6">
                                <p>JAVA版本:${javaVersion}</p>
                                <p>MYSQL版本:${mysqlVersion}</p>
                                <p>WEB服务器:${webVersion}</p>
                                <p>CPU个数:${cpu}</p>
                                <p>虚拟机内存总量:${totalMemory}</p>
                                <p>虚拟机空闲内存量:${freeMemory}</p>
                                <p>虚拟机使用的最大内存量:${maxMemory}</p>
                            </div>
                            <div class="col-sm-6">
                                <p>客户端IP:${clientIP}</p>
                                <p>服务器IP:${serverIP}</p>
                                <p>操作系统:${osName}</p>
                                <p>用户主目录:${userHome}</p>
                                <p>工作目录:${userDir}</p>
                                <p>系统目录:${webRootPath}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-body">
                            <p>系统支持:${systemName}</p>
                            <p>当前版本:${systemVersion}</p>
                            <p>当前版本更新时间:${systemUpdateTime}</p>
                            <p>最新版本:<span class="lastSystemVersion"></span> &nbsp;&nbsp;
                                <a href="http://www.jeesns.cn" target="_blank">官网查看</a></p>
                            <p>最新版本更新时间:<span class="lastSystemUpdateTime"></span></p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h5 class="box-title">二次开发</h5>
                        </div>
                        <div class="box-body">
                            <p>我们提供基于JEESNS的二次开发、模板定制服务，具体费用请联系我们。</p>
                            <p>同时，我们也提供以下服务：</p>
                            <ol>
                                <li>网站定制开发</li>
                                <li>仿站服务</li>
                                <li>APP开发</li>
                                <li>微信开发等</li>
                                <li>......</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h5 class="box-title">商业授权说明</h5>
                        </div>
                        <div class="box-body">
                            <p>商业授权后我可以获得什么？</p>
                            <ol>
                                <li>可以用于商业网站</li>
                                <li>可以去除Powered by JEESNS</li>
                                <li>获得更多功能；</li>
                                <li>意见或建议优先考虑；</li>
                                <li>提供技术服务支持；</li>
                                <li>……</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h5 class="box-title">更新日志</h5>
                        </div>
                        <div class="box-body">
                            <div class="panel-body">
                                <div class="panel-group" id="version">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v13">v1.3</a><code class="pull-right">2018.08.03</code>
                                            </h5>
                                        </div>
                                        <div id="v13" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>修复：发送私信和获取私信列表异常问题</li>
                                                        <li>修复：修复在小分辨率的屏幕下，图库页面打开图片详情，关闭按钮无法找到问题</li>
                                                        <li>修复：修复前台右上角鼠标放在用户名上自动显示下拉菜单，鼠标去选择菜单时，会自动消失情况</li>
                                                        <li>修复：修复项目如果不是部署在根目录下进行访问，@用户名 的时候，进入用户详情页面的链接错误</li>
                                                        <li>修复：修复项目如果不是部署在根目录下进行访问，群组帖子进行置顶、设置精华等操作链接无效问题</li>
                                                        <li>修复：修复群组页面和首页中群组帖子数量统计问题</li>
                                                        <li>修复：修复XSS脚本注入漏洞</li>
                                                        <li>修复：修复群组默认分类删除提示请求失败的问题</li>
                                                        <li>修复：修复修改帖子报错问题</li>
                                                        <li>修复：修复异常拦截问题</li>
                                                        <li>优化：底层代码、异常信息、提示信息代码进行重构</li>
                                                        <li>优化：优化前后台用户操作体验</li>
                                                        <li>增加：增加微博、群组可以自定义访问路径功能</li>
                                                        <li>增加：增加群组分类功能</li>
                                                        <li>增加：增加群组帖子分类功能</li>
                                                        <li>增加：会员关注实体增加ID</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v121">v1.2.1</a><code class="pull-right">2017.12.04</code>
                                            </h5>
                                        </div>
                                        <div id="v121" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>修复：如果项目部署部署在根目录，首页群组链接出错问题</li>
                                                        <li>修复：修复后台查看版本更新日志折叠问题</li>
                                                        <li>优化：取消访问不存在的页数时显示最后一页的数据</li>
                                                        <li>优化：优化文章查询字段</li>
                                                        <li>优化：上传图片生成缩略图算法</li>
                                                        <li>优化：统一脚本和文档的路径</li>
                                                        <li>优化：优化后台操作提示</li>
                                                        <li>增加：图库模块</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v120">v1.2.0-正式版</a><code class="pull-right">2017.10.31</code>
                                            </h5>
                                        </div>
                                        <div id="v120" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>修复：发布微博提示undefined</li>
                                                        <li>修复：微博不显示图片的问题</li>
                                                        <li>修复：在windows系统下微博emoji不能显示问题</li>
                                                        <li>修复：如果应用部署在子目录下，如/jeesns，使用富文本编辑器上传图片时，图片无法显示问题，临时修复方法</li>
                                                        <li>修复：微博列表右边热门微博显示跟最新微博内容一样的问题</li>
                                                        <li>修复：文章列表右边热门文章显示跟最新文章一样的问题</li>
                                                        <li>增加：微博点赞、微博回复、文章回复、文章喜欢、群组帖子回复、群组帖子喜欢发送系统消息通知</li>
                                                        <li>增加：微博发表、微博评论、文章发布、文章评论、群组发帖、群组帖子回复@用户发送系统通知功能</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v120rc3">v1.2.0-RC3</a><code class="pull-right">2017.10.16</code>
                                            </h5>
                                        </div>
                                        <div id="v120rc3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>修复：后台审核文章时提示非法操作</li>
                                                        <li>修复：后台修改系统信息时不会马上生效，需要重启Tomcat的问题</li>
                                                        <li>修复：在前台文章列表，如果选择栏目，下一页之后，栏目会失效</li>
                                                        <li>修复：富文本编辑器图片上传功能</li>
                                                        <li>修复：新注册会员激活功能无法使用问题</li>
                                                        <li>修复：邮件发送失败问题</li>
                                                        <li>修复：重置密码问题</li>
                                                        <li>修复：后台会员列表搜索和下一页异常</li>
                                                        <li>修复：发帖跳转错误页面失败问题</li>
                                                        <li>修复：修改头像不能马上生效问题</li>
                                                        <li>修复：后台广告列表开始时间和添加时间显示错误</li>
                                                        <li>优化：前台LOGO位置</li>
                                                        <li>优化：首页和会员中心头部界面</li>
                                                        <li>优化：审核帖子页面增加返回群组链接</li>
                                                        <li>优化：删除微博列表下用管理员身份访问时的删除链接，需要删除微博直接进入到详情删除</li>
                                                        <li>优化：删除富文本编辑器上传图片界面预览窗口的英文说明</li>
                                                        <li>优化：文章列表页面</li>
                                                        <li>优化：上传图片功能</li>
                                                        <li>优化：管理后台登录页面修改</li>
                                                        <li>增加：文章详情页面增加作者基本信息</li>
                                                        <li>增加：新私信提醒功能</li>
                                                        <li>增加：文章搜索功能</li>
                                                        <li>增加：帖子加精、置顶功能</li>
                                                        <li>增加：广告模块</li>
                                                        <li>增加：友情链接模块</li>
                                                        <li>增加：友情链接模块</li>
                                                        <li>增加：友情链接模块</li>
                                                        <li>增加：增加微博评论引用回复功能</li>
                                                        <li>增加：增加群组帖子评论引用回复功能</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v120rc2">v1.2.0-RC2</a><code class="pull-right">2017.8.2</code>
                                            </h5>
                                        </div>
                                        <div id="v120rc2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>修复帖子页面头像不显示问题</li>
                                                        <li>修复管理员在前台登录后，点击右上角的`管理`出现404问题</li>
                                                        <li>在帖子详情页面不能显示群组logo</li>
                                                        <li>点击首页帖子链接进入到文章详情问题</li>
                                                        <li>出现异常时，跳转到异常页面，报错找不到error.ftl文件</li>
                                                        <li>未登录情况下进入帖子页面出现异常</li>
                                                        <li>修改配置静态资源文件所在目录</li>
                                                        <li>刚申请的群组发帖出现异常</li>
                                                        <li>在帖子页面，点击右边发帖，会进入发布文章页面</li>
                                                        <li>优化文章投稿功能，如果文章需要审核，投稿成功后自动跳转到文章列表页面，避免投稿成功跳转到异常页面</li>
                                                        <li>优化帖子发布，如果帖子需要审核，自动跳转到群组详情页面，如果不需要审核，自动跳转到帖子页面</li>
                                                        <li>在微博列表、详情页面，管理员或者作者本人点击删除链接时，增加确认删除提示</li>
                                                        <li>在帖子详情页面删除帖子后，自动跳到群组详情页面</li>
                                                        <li>微博列表，热门微博删除的时候，没有先弹出提示</li>
                                                        <li>在帖子详情页面群组名字增加链接</li>
                                                        <li>在帖子详情页面增加判断是否已关注群组</li>
                                                        <li>在帖子列表、帖子详情页面，增加置顶、精华标识</li>
                                                        <li>统一系统配置</li>
                                                        <li>去掉打印查询语句功能</li>
                                                        <li>文章列表页面优化</li>
                                                        <li>在群组审核帖子页面，增加审核、删除帖子功能</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v102">v1.0.2</a><code class="pull-right">2017.4.17</code>
                                            </h5>
                                        </div>
                                        <div id="v102" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>优化微博、文章、帖子图片裁剪功能</li>
                                                        <li>优化配置文件</li>
                                                        <li>XSS攻击处理优化</li>
                                                        <li>系统设置增加统计代码、版权说明、备案号</li>
                                                        <li>修复群组发帖缩略图上传失败问题</li>
                                                        <li>修复多次运行积分规则SQL导致ID不一致问题</li>
                                                        <li>修复Emoji偶尔抽风不能用问题</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v101">v1.0.1</a><code class="pull-right">2017.4.10</code>
                                            </h5>
                                        </div>
                                        <div id="v101" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>增加会员积分功能</li>
                                                        <li>XSS攻击处理</li>
                                                        <li>增加判断，访问未审核的文章详情页面时，提示文章不存在</li>
                                                        <li>修复在文章、帖子、微博评论中点击评论人的头像或者姓名不会调整到会员主页</li>
                                                        <li>修复管理员admin账号在后台无法登录情况</li>
                                                        <li>提交表单成功后，增加等待跳转时加载的图标</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v10">v1.0</a><code class="pull-right">2017.3.14</code>
                                            </h5>
                                        </div>
                                        <div id="v10" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>增加后台管理员授权与取消功能</li>
                                                        <li>增加私信模块</li>
                                                        <li>解决在微博页面，左侧微博点赞过后，左侧展示列表小手会变黑，但是右侧热门出小手依然是白色</li>
                                                        <li>修复后台添加栏目、文章成功后，提示页面找不到问题</li>
                                                        <li>增加后台登录页面</li>
                                                        <li>优化选择图片速度慢的问题</li>
                                                        <li>增加动态功能</li>
                                                        <li>优化微博图片展示、优化文章、帖子上传缩略图功能</li>
                                                        <li>微博增加发布图片功能</li>
                                                        <li>修复编辑文章和帖子失败问题</li>
                                                        <li>增加会员登录后自动跳转到前操作页面</li>
                                                        <li>修复项目如果部署到子目录下，退出或跳到登录页面出现404问题</li>
                                                        <li>解决微博内容换行后加入emoji表情无效问题</li>
                                                        <li>界面优化、修复手机访问无法点击问题</li>
                                                        <li>修复后台修改会员密码页面样式问题</li>
                                                        <li>修复偶尔用户权限判断错误问题</li>
                                                        <li>优化会员主页、增加查看粉丝、关注、文章、群贴、微博、关注的群组功能</li>
                                                        <li>优化分页查询功能，解决部分分页出现异常情况</li>
                                                        <li>增加404、500异常页面处理</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v08">v0.8</a><code class="pull-right">2017.2.17</code>
                                            </h5>
                                        </div>
                                        <div id="v08" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>后台界面全新升级</li>
                                                        <li>后台增加微博搜索功能</li>
                                                        <li>增加了会员操作日志、会员动态</li>
                                                        <li>微博、微博评论增加@会员功能</li>
                                                        <li>群组帖子增加置顶、精华功能</li>
                                                        <li>限制微博输入内如字数、输入内容时字数统计</li>
                                                        <li>微博增加Emoji表情</li>
                                                        <li>增加微博、文章、群组帖子喜欢、点赞功能，</li>
                                                        <li>修复会员修改头像时会把系统默认头像文件删除了</li>
                                                        <li>删除文章、帖子、微博时删除相应的评论</li>
                                                        <li>解决查看会员信息时会员信息显示错误</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v05">v0.5</a><code class="pull-right">2017.2.7</code>
                                            </h5>
                                        </div>
                                        <div id="v05" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">此版本是一个预览版本，让我们共同期待1.0版的到来</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<#include "/manage/common/footer.ftl"/>
</div>
<script>
    $(document).ready(function () {
        $.getJSON("http://www.jeesns.cn/newVersion?callback=?", function(result){
            $(".lastSystemVersion").html(result.LAST_SYSTEM_VERSION);
            $(".lastSystemUpdateTime").html(result.LAST_SYSTEM_UPDATE_TIME);
        });
    });
</script>
</body>
</html>
