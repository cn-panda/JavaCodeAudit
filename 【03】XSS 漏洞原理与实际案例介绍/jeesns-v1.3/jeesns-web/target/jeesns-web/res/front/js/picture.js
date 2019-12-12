var loading = false;
$(document).ready(function () {
    $('#comment_form').bind('submit',function(){
        picture.comment();
        return false;
    });

    $(".show-info").scroll(function(){
        if($(this).get(0).scrollHeight - $(this).height() - $(this).scrollTop() <= 100 && !loading){
            pageNo ++;
            picture.commentList();
            loading = true;
        }
    });
    $(".picture-favor").bind("click",function () {
        picture.favor($(this))
    });
});

var picture = {
    waterfull: function () {
        /*瀑布流开始*/
        var container = $('.waterfull ul');
        var loading = $('#imloading');
        var pageNo = 2;
        // 初始化loading状态
        loading.data("on", true);

        /*判断瀑布流最大布局宽度，最大为1280*/
        function tores() {
            var tmpWid = $(window).width();
            if (tmpWid > 1280) {
                tmpWid = 1280;
            } else {
                var column = Math.floor(tmpWid / 320);
                tmpWid = column * 320;
            }
            $('.waterfull').width(tmpWid);
        }

        tores();
        $(window).resize(function () {
            tores();
        });
        container.imagesLoaded(function () {
            container.masonry({
                columnWidth: 320,
                itemSelector: '.item',
                isFitWidth: true,//是否根据浏览器窗口大小自动适应默认false
                isAnimated: true,//是否采用jquery动画进行重拍版
                isRTL: false,//设置布局的排列方式，即：定位砖块时，是从左向右排列还是从右向左排列。默认值为false，即从左向右
                isResizable: true,//是否自动布局默认true
                animationOptions: {
                    duration: 800,
                    easing: 'easeInOutBack',//如果你引用了jQeasing这里就可以添加对应的动态动画效果，如果没引用删除这行，默认是匀速变化
                    queue: false//是否队列，从一点填充瀑布流
                }
            });
        });
        $(window).scroll(function () {
            if (!loading.data("on")) return;
            // 计算所有瀑布流块中距离顶部最大，进而在滚动条滚动时，来进行ajax请求
            var itemNum = $('#waterfull').find('.item').length;
            var itemArr = [];
            itemArr[0] = $('#waterfull').find('.item').eq(itemNum - 1).offset().top + $('#waterfull').find('.item').eq(itemNum - 1)[0].offsetHeight;
            itemArr[1] = $('#waterfull').find('.item').eq(itemNum - 2).offset().top + $('#waterfull').find('.item').eq(itemNum - 1)[0].offsetHeight;
            itemArr[2] = $('#waterfull').find('.item').eq(itemNum - 3).offset().top + $('#waterfull').find('.item').eq(itemNum - 1)[0].offsetHeight;
            var maxTop = Math.max.apply(null, itemArr);
            if (maxTop < $(window).height() + $(document).scrollTop()) {
                //加载更多数据
                loading.data("on", false).fadeIn(800);
                list();
            }
        });

        function loadImage(url) {
            var img = new Image();
            //创建一个Image对象，实现图片的预下载
            img.src = url;
            if (img.complete) {
                return img.src;
            }
            img.onload = function () {
                return img.src;
            };
        };

        function list() {
            $.ajax({
                url: basePath + '/picture/indexData',
                type: "get",
                data: {pageNo: pageNo},
                cache: false,
                dataType: "json",
                timeout: 20000,
                success: function (res) {
                    var html = "";
                    if (res.data.length > 0) {
                        for (var i = 0; i < res.data.length; i++) {
                            var picture = res.data[i];
                            var zan = "<a class=\"text-primary picture-favor\" data-id=\""+picture.pictureId+"\">";
                            if (picture.isFavor == 0){
                                zan += "<i class=\"icon-thumbs-o-up\"></i> ";
                            }else {
                                zan += "<i class=\"icon-thumbs-up\"></i> ";
                            }
                            zan += picture.favorCount+"</a>";
                            html += "<li class=\"item\"><a href=\""+basePath+"/picture/detail/"+picture.pictureId+"\" class=\"picture\" target=\"_jeesnsOpen\" title=\"\" height=\"680px\" width=\"1200px\"><img src=\""+basePath + picture.path + "\"></a>" +
                                "<p class=\"description\">" + picture.description + "</p><div class=\"qianm clearfloat\"><span class=\"sp1\"><a href='"+basePath+"/u/"+picture.member.id+"' target='_blank'>" +picture.member.name+"</a><b>"+zan+"</b></span>" +
                                "<span class=\"sp2\">" + picture.createTime + "</span></div></li>";
                        }
                        $(html).find('img').each(function (index) {
                            loadImage($(this).attr('src'));
                        })
                        var $newElems = $(html).css({opacity: 0}).appendTo(container);
                        $newElems.imagesLoaded(function () {
                            $newElems.animate({opacity: 1}, 800);
                            container.masonry('appended', $newElems, true);
                            loading.data("on", true).fadeOut();
                        });
                        pageNo++;
                        $('a[target="_jeesnsOpen"]').unbind();
                        jeesns.jeesnsLink();
                        $(".picture-favor").unbind();
                        $(".picture-favor").bind("click",function () {
                            favor($(this))
                        });
                    } else {
                        loading.text('没有更多图片了！');
                    }
                }
            });
        }
        function favor(_this) {
            var pictureId = _this.attr("data-id");
            $.ajax({
                url: basePath + "/picture/favor/" + pictureId,
                type: "get",
                dataType: "json",
                timeout: 5000,
                success: function (res) {
                    if (res.code < 0) {
                        jeesnsDialog.errorTips(res.message);
                    } else {
                        if (res.code == 0) {
                            _this.html("<i class='icon icon-thumbs-up'></i> " + res.data);
                            _this.removeClass("text-primary");
                            _this.addClass("text-success")
                        } else {
                            _this.html("<i class='icon icon-thumbs-o-up'></i> " + res.data);
                            _this.removeClass("text-success");
                            _this.addClass("text-primary")
                        }
                    }
                }
            });
        }
    },
    comment: function () {
        var content = $("#content").val();
        if (content == ""){
            jeesnsDialog.tips("请输入内容");
            return;
        }
        var index;
        var options = {
            dataType : 'json',
            timeout : 20000,
            beforeSubmit : function (){
                $(":submit").attr("disabled","disabled");
                index = jeesnsDialog.loading();
            },
            error:function(){
                jeesnsDialog.close(index);
                $(":submit").removeAttr("disabled");
                jeesnsDialog.tips('请求失败 ！');
            },
            success:function(res){
                jeesnsDialog.close(index);
                if(res.code==0){
                    $("#content").val("");
                    $(":submit").removeAttr("disabled");
                    jeesnsDialog.successTips(res.message);
                    pageNo = 1;
                    picture.commentList();
                }else{
                    $(":submit").removeAttr("disabled");
                    jeesnsDialog.errorTips(res.message);
                }
            }
        };
        var form = $("#comment_form");
        form.ajaxSubmit(options);
    },
    commentList: function () {
        $.ajax({
            url: basePath + "/picture/commentList/" + pictureId + ".json?pageNo=" + pageNo,
            type: "get",
            dataType: "json",
            success: function (json) {
                loading = false;
                var data = json.data;
                if (data.length > 0){
                    var html = "";
                    for (var i = 0; i < data.length; i++) {
                        html += "<div class=\"comment\">" +
                            "<a href=\"" + basePath + "/u/" + data[i].member.id + "\" class=\"avatar\" target='_blank'>" +
                            "<img src=\"" + basePath + data[i].member.avatar + "\" class=\"icon-4x\"></a>" +
                            "<div class=\"content\">" +
                            "<div class=\"pull-right text-muted\">" + data[i].createTime + "</div>" +
                            "<div><a href=\"" + basePath + "/u/" + data[i].member.id + "\" target='_blank'><strong>" + data[i].member.name + "</strong></a></div>" +
                            "<div class=\"text\">"+data[i].content+"</div></div></div>";
                    }
                    pageNo = json.page.pageNo;
                    if (json.page.totalPage <= pageNo) {
                        $(".more-comment").html("全部加载完了");
                        loading = true;
                    }else {
                        $(".more-comment").html("加载中...");
                    }
                    if (pageNo == 1){
                        $(".comment-list").html("");
                    }
                    $(".comment-list").append(html);
                }else {
                    $(".more-comment").html("暂无评论");
                }
            }
        });
    },
    favor: function (_this) {
        var pictureId = _this.attr("data-id");
        $.ajax({
            url: basePath + "/picture/favor/" + pictureId,
            type: "get",
            dataType: "json",
            timeout: 5000,
            success: function (res) {
                if (res.code < 0) {
                    jeesnsDialog.errorTips(res.message);
                } else {
                    if (res.code == 0) {
                        _this.html("<i class='icon icon-thumbs-up'></i> " + res.data);
                        _this.removeClass("text-primary");
                        _this.addClass("text-success")
                    } else {
                        _this.html("<i class='icon icon-thumbs-o-up'></i> " + res.data);
                        _this.removeClass("text-success");
                        _this.addClass("text-primary")
                    }
                }
            }
        });
    }
}