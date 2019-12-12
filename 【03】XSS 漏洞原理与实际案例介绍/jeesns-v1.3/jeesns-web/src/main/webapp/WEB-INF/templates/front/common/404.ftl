<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>页面找不到 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <style type="text/css">
        *{margin:0;padding:0;list-style-type:none;}
        a,img{border:0;}
        body{background: #d2f5f1}
        .mianBox{width: 100%;margin: 0 auto;position: relative;overflow: hidden;}
        .mianBox >img{position: absolute}
        .yun0{right: -140px;top: 30px;webkit-animation: cloudLarge 105s infinite;-moz-animation: cloudLarge 105s infinite;-o-animation: cloudLarge 105s infinite;animation: cloudLarge 105s infinite;}
        .yun1{left: 5%;top: 48%;-webkit-animation: cloudSmall 105s infinite;-moz-animation: cloudSmall 105s infinite;-o-animation: cloudSmall 105s infinite;animation: cloudSmall 105s infinite;}
        .yun2{left: 16%;top: 35%;-webkit-animation: cloudMedium 105s infinite;-moz-animation: cloudMedium 105s infinite;-o-animation: cloudMedium 105s infinite;animation: cloudMedium 105s infinite;}
        .san{left: 10%;top: 20%;-webkit-animation:dn400 3s 0s ease both;-moz-animation:dn400 3s 0s ease both;animation:dn400 3s 0s ease both;}
        .bird{left: 27%;top: 15%;-webkit-animation: flying 3s infinite;-moz-animation: flying 3s infinite;-o-animation: flying 3s infinite;animation: flying 3s infinite;}
        .tipInfo{position:absolute;z-index:99;margin-left:150px;border: 4px solid #c0ece7;border-color: rgba(192,237,232,07);border-radius:5px;derbackground:#c0ece7;background: rgba(192,237,232,07);width: 360px}
        .tipInfo .in{background: #fff;padding: 0 10%}
        .tipInfo .in h2{line-height:50px;font-size: 30px;color: #e94c3c;border-bottom: 1px dashed #aacdd5;padding: 18px 0}
        .tipInfo .in p{padding:20px 0 10px 0;text-align: center;color: #289575}
        .tipInfo .in p span{margin:0 10px}
        .tipInfo .in p span a{color:#e94c3c;margin: 0 10px}
        .tipInfo .in .desc{overflow: hidden;font-size: 14px;color: #2b2b2b;padding: 0 10%}
        .tipInfo .in .desc h3{font-weight: normal;padding: 20px 0 5px 0}
        .tipInfo .in .desc li{margin-left: 5px;padding: 5px 0;padding-left: 8px;*padding-left: 20px;}
        @-webkit-keyframes cloudLarge{0%{right: -140px;}
            100%{right: 118%;}}
        @-moz-keyframes cloudLarge{0%{right: -140px;}
            100%{right: 118%;}}
        @-o-keyframes cloudLarge{0%{right: -140px;}
            100%{right: 118%;}}
        @keyframes cloudLarge{0%{right: -140px;}
            100%{right: 118%;}}
        @-webkit-keyframes cloudSmall{0%{left: 5%;}
            100%{left: 108%;}}
        @-moz-keyframes cloudSmall{0%{left: 5%;}
            100%{left: 105%;}}
        @-o-keyframes cloudSmall{0%{left: 5%;}
            100%{left: 105%;}}
        @keyframes cloudSmall{0%{left: 5%;}
            100%{left: 105%;}}
        @-webkit-keyframes cloudMedium{0%{left: 16%;}
            100%{left: -18%;}}
        @-moz-keyframes cloudMedium{0%{left: 16%;}
            100%{left: -18%;}}
        @-o-keyframes cloudMedium{0%{left: 16%;}
            100%{left: -18%;}}
        @keyframes cloudMedium{0%{left: 16%;}
            100%{left: -18%;}}
        @-webkit-keyframes light{0%{opacity: 0;}
            100%{opacity: 100;}}
        @-moz-keyframes light{0%{opacity: 0;}
            100%{opacity: 100;}}
        @-o-keyframes light{0%{opacity: 0;}
            100%{opacity: 100;}}
        @keyframes light{0%{opacity: 0;}
            100%{opacity: 100;}}
        @-webkit-keyframes hide{0%{opacity: 100;}
            100%{opacity: 0;}}
        @-moz-keyframes hide{0%{opacity: 100;}
            100%{opacity: 0;}}
        @-o-keyframes hide{0%{opacity: 100;}
            100%{opacity: 0;}}
        @keyframes hide{0%{opacity: 100;}
            100%{opacity: 0;}}
        @keyframes flying{0%{margin-top: 0px;}
            50%{margin-top: 6px;}
            100%{margin-top: 0px;}}
        @-webkit-keyframes flying{0%{margin-top: 0px;}
            50%{margin-top: 6px;}
            100%{margin-top: 0px;}}
        @-moz-keyframes flying{0%{margin-top: 0px;}
            50%{margin-top: 6px;}
            100%{margin-top: 0px;}}
        @-o-keyframes flying{0%{margin-top: 0px;}
            50%{margin-top: 6px;}
            100%{margin-top: 0px;}}
        @keyframes flying{0%{margin-top: 0px;}
            50%{margin-top: 6px;}
            100%{margin-top: 0px;}}
        @-webkit-keyframes flying{0%{margin-top: 0px;}
            50%{margin-top: 6px;}
            100%{margin-top: 0px;}}
        @-moz-keyframes flying{0%{margin-top: 0px;}
            50%{margin-top: 6px;}
            100%{margin-top: 0px;}}
        @-o-keyframes flying{0%{margin-top: 0px;}
            50%{margin-top: 6px;}
            100%{margin-top: 0px;}}
        @-webkit-keyframes down900{0%{opacity:0;-webkit-transform:translate(0,0);}
            100%{opacity:1;-webkit-transform:translate(900,900);}}
        @-moz-keyframes down900{0%{opacity:0;-moz-transform:translate(0,0);}
            100%{opacity:1;-moz-transform:translate(900,900);}}
        @-o-keyframes down900{0%{opacity:0;-o-transform:translate(0,0);}
            100%{opacity:1;-o-transform:translate(900,900);}}
        @keyframes down900{0%{opacity:0;transform:translate(0,0);}
            100%{opacity:1;transform:translate(900,900);}}
        @-webkit-keyframes dn400{0%{opacity:0;-webkit-transform:translateY(-400px);}
            100%{opacity:1;-webkit-transform:translateY(0);}}
        @-moz-keyframes dn400{0%{opacity:0;-moz-transform:translateY(-400px);}
            100%{opacity:1;-moz-transform:translateY(0);}}
        @-o-keyframes dn400{0%{opacity:0;-o-transform:translateY(-400px);}
            100%{opacity:1;-o-transform:translateY(0);}}
        @keyframes dn400{0%{opacity:0;transform:translateY(-400px);}
            100%{opacity:1;transform:translateY(0);}}

    </style>
    <script>
        $(function() {
            var h = $(window).height();
            $('body').height(h);
            $('.mianBox').height(h);
            centerWindow(".tipInfo");
        });

        //2.将盒子方法放入这个方，方便法统一调用
        function centerWindow(a) {
            center(a);
            //自适应窗口
            $(window).bind('scroll resize',
                    function() {
                        center(a);
                    });
        }

        //1.居中方法，传入需要剧中的标签
        function center(a) {
            var wWidth = $(window).width();
            var wHeight = $(window).height();
            var boxWidth = $(a).width();
            var boxHeight = $(a).height();
            var scrollTop = $(window).scrollTop();
            var scrollLeft = $(window).scrollLeft();
            var top = scrollTop + (wHeight - boxHeight) / 2;
            var left = scrollLeft + (wWidth - boxWidth) / 2;
            $(a).css({
                "top": top,
                "left": left
            });
        }
    </script>
</head>
<body>
<div class="mianBox">
    <img src="${basePath}/res/common/images/yun0.png" alt="" class="yun yun0" />
    <img src="${basePath}/res/common/images/yun1.png" alt="" class="yun yun1" />
    <img src="${basePath}/res/common/images/yun2.png" alt="" class="yun yun2" />
    <img src="${basePath}/res/common/images/bird.png" alt="" class="bird" />
    <img src="${basePath}/res/common/images/san.png" alt="" class="san" />
    <div class="tipInfo">
        <div class="in">
            <div class="textThis">
                <h2>
                    抱歉，您访问的页面找不到
                </h2>
                <p><span>自动<a id="href" href="${basePath}/">返回首页</a></span><span>等待<b id="wait">20</b>秒</span></p>
                <p><span><a href="javascript:history.go(-1);">返回上一页面</a></span></p>
                <script type="text/javascript">
                    $(function() {
                        var wait = document.getElementById('wait');
                        var href = document.getElementById('href').href;
                        var interval = setInterval(function() {
                            var time = --wait.innerHTML;
                            if (time <= 0) {
                                location.href = href;
                                clearInterval(interval);
                            }
                            ;
                        }, 1000);
                    })();
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>