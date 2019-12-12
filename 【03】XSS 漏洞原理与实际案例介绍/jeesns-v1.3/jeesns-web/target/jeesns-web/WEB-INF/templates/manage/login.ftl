<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <title>JEESNS后台管理系统登录 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${basePath}/res/manage/css/effect.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/layer/skin/layer.css" rel="stylesheet">
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/common/js/bootstrap.min.js"></script>
    <script src="${basePath}/res/manage/js/app.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src='${basePath}/res/manage/js/jquery-ui.min.js'></script>
    <script src='${basePath}/res/manage/js/stopExecutionOnTimeout.js'></script>
    <script src="${basePath}/res/manage/js/Particleground.js"></script>
    <script src="${basePath}/res/manage/js/jquery.mockjax.js"></script>
</head>
<body>
<div class='login'>
    <div class='login_title'>
        <span>JEESNS管理员登录</span>
    </div>
    <div class='login_fields'>
        <div class='login_fields_user'>
            <div class='icon'>
                <img alt="" src='${basePath}/res/manage/images/user_icon_copy.png'>
            </div>
            <input name="name" placeholder='用户名' maxlength="32" type='text' autocomplete="off"/>
            <div class='validation'>
                <img alt="" src='${basePath}/res/manage/images/tick.png'>
            </div>
        </div>
        <div class='login_fields_password'>
            <div class='icon'>
                <img alt="" src='${basePath}/res/manage/images/lock_icon_copy.png'>
            </div>
            <input name="password" placeholder='密码' maxlength="32" type='text' autocomplete="off">
            <div class='validation'>
                <img alt="" src='${basePath}/res/manage/images/tick.png'>
            </div>
        </div>
        <div class='login_fields_submit'>
            <input type='button' value='登录'>
        </div>
    </div>
    <div class='success'>
    </div>
    <div class='disclaimer'>
        <p>欢迎登陆JEESNS后台管理系统 <a href="../">返回首页</a></p>
        <p>Powered By <a href="http://www.jeesns.cn" target="_blank">JEESNS</a> CopyRight © 2012-2017</p>
    </div>
</div>
<div class='authent'>
    <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <p>认证中...</p>
</div>
<div class="OverWindows"></div>

<script>
    $(document).keypress(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $('input[type="button"]').click();
        }
    });
    //粒子背景特效
    $('body').particleground({
        dotColor: '#E8DFE8',
        lineColor: '#133b88'
    });
    $('input[name="password"]').focus(function () {
        $(this).attr('type', 'password');
    });
    $('input[type="text"]').focus(function () {
        $(this).prev().animate({'opacity': '1'}, 200);
    });
    $('input[type="text"],input[type="password"]').blur(function () {
        $(this).prev().animate({'opacity': '.5'}, 200);
    });
    $('input[name="name"],input[name="password"]').keyup(function () {
        var Len = $(this).val().length;
        if (!$(this).val() == '' && Len >= 5) {
            $(this).next().animate({
                'opacity': '1',
                'right': '30'
            }, 200);
        } else {
            $(this).next().animate({
                'opacity': '0',
                'right': '20'
            }, 200);
        }
    });

    //非空验证
    $('input[type="button"]').click(function () {
        var name = $('input[name="name"]').val();
        var password = $('input[name="password"]').val();
        if (name == '') {
            layer.msg("请输入您的账号！");
        } else if (password == '') {
            layer.msg("请输入您的密码！");
        } else {
            //认证中..
            $('.login').addClass('tilt'); //倾斜特效
            setTimeout(function () {
                $('.login').addClass('tilttwo'); //平移特效
            }, 300);
            setTimeout(function () {
                $('.authent').show().animate({right: -320}, {
                    easing: 'easeOutQuint',
                    duration: 600,
                    queue: false
                });
                $('.authent').animate({opacity: 1}, {
                    duration: 200,
                    queue: false
                }).addClass('visible');
            }, 500);

            //登陆
            var jsonData = {name: name, password: password};
            var url = "${managePath}/login";
            ajaxPost(url, jsonData,
                    function () {
                        //ajax加载中
                    },
                    function (data) {
                        //ajax返回
                        //认证完成
                        setTimeout(function () {
                            $('.authent').show().animate({right: 90}, {
                                easing: 'easeOutQuint',
                                duration: 600,
                                queue: false
                            });
                            $('.authent').animate({opacity: 0}, {
                                duration: 200,
                                queue: false
                            }).addClass('visible');
                            $('.login').removeClass('tilttwo'); //平移特效
                        }, 2000);
                        setTimeout(function () {
                            $('.authent').hide();
                            $('.login').removeClass('tilt');
                            if (data.code >= 0) {
                                //登录成功
                                $('.login div').fadeOut(100);
                                $('.success').fadeIn(1000);
                                $('.success').html(data.message+"，页面跳转中，请稍后...");
                                //跳转操作
                                setTimeout("window.location.href='"+data.url+"'",2000);
                            } else {
                                layer.msg(data.message);
                            }
                        }, 2400);
                    })
        }
    })

    //Ajax提交
    function ajaxPost(url,jsonData,lodingFun,returnFun) {
        $.ajax({
            type: "post",
            url: url,
            data: jsonData,
            dataType: 'json',
            async: 'false',
            beforeSend: lodingFun,
            error: function () {
                layer.msg("请求失败！");
            },
            success: returnFun
        });
    }
</script>
</body>
</html>

