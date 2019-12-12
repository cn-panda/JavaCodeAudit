var weibo = {
    favor: function (_this, basePath) {
        var weiboId = _this.attr("weibo-id");
        $.ajax({
            url: weiboPath + "/favor/" + weiboId,
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
    },
    commentList: function (weiboId, pageNo) {
        $.ajax({
            url: weiboPath + "/commentList/" + weiboId + ".json?pageNo=" + pageNo,
            type: "get",
            dataType: "json",
            success: function (json) {
                var data = json.data;
                var html = "";
                for (var i = 0; i < data.length; i++) {
                    html += "<div class=\"comment\">" +
                        "<a href=\"" + basePath + "/u/" + data[i].member.id + "\" class=\"avatar\">" +
                        "<img src=\"" + basePath + data[i].member.avatar + "\" class=\"icon-4x\"></a><div class=\"content\">" +
                        "<div class=\"pull-right text-muted\">" + data[i].createTime + "</div><div>" +
                        "<a href=\"" + basePath + "/u/" + data[i].member.id + "\"><strong>" + data[i].member.name + "</strong></a>" +
                        "&nbsp;<span class=\"label label-danger\">" + data[i].member.memberLevel.name + "</span></div>" +
                        "<div class=\"text\">";
                    var weiboComment = data[i].weiboComment;
                    if (weiboComment != null){
                        html += "<pre><code><p>引用“<a href='"+basePath+"/u/"+weiboComment.member.id+"'>"+weiboComment.member.name+"</a>”的评论</p>"+weiboComment.content+"</code></pre>";
                    }
                    html += data[i].content + "<div class='pull-right'><a href='javascript:weibo.commentReply("+data[i].id+")'>回复</a></div></div>" +
                        "<form class=\"form-horizontal jeesns_form\" action=\""+weiboPath+"/comment/"+weiboId+"\" method=\"post\" id='comment-form-"+data[i].id+"' style='display: none;' callback='reload'>" +
                        "<div class=\"form-group\"><input type='hidden' name='weiboCommentId' value='"+data[i].id+"'/>" +
                        "<textarea name=\"content\" class=\"form-control weibo-comment-content\" rows=\"2\" id=\""+data[i].id+"\" maxlength=\""+weiboPostMaxcontent+"\"></textarea></div>" +
                        "<div class=\"form-group comment-user\"><span class=\"mg-r-5 weibo-words-"+data[i].id+"\">0/"+weiboPostMaxcontent+"</span>" +
                        "<input type=\"submit\" value=\"回复\" class=\"pull-right btn btn-primary mg-t-10 jeesns-submit\"></div></form></div></div>";
                }
                pageNo = json.page.pageNo;
                if (json.page.totalPage <= pageNo) {
                    $("#moreComment").hide();
                } else {
                    $("#moreComment").show();
                }
                $("#commentList").append(html);
                $('.jeesns_form').unbind();
                jeesns.submitForm();
                $(".weibo-comment-content").bind('input propertychange focus blur', function () {
                    var $this = $(this);
                    var _val = $this.val();
                    var _id = $this.attr("id");
                    var maxlength = $this.attr("maxlength");
                    $(".weibo-words-"+_id).text(_val.length + "/" + maxlength);
                    if (_val.length > maxlength) {
                        $this.val(inputBeforeContent);
                    } else {
                        inputBeforeContent = _val;
                    }
                });
            }
        });
    },
    commentReply: function (id) {
        $('#comment-form-'+id).toggle();
        $('#'+id).focus();
    }
}
$(document).ready(function () {
    //输入前内容
    var inputBeforeContent = "";
    $("#weibo-content").bind('input propertychange focus blur', function () {
        var $this = $(this);
        var _val = $this.val();
        var maxlength = $this.attr("maxlength");
        $("#weibo-words").text(_val.length + "/" + maxlength);
        if (_val.length > maxlength) {
            $this.val(inputBeforeContent);
        } else {
            inputBeforeContent = _val;
        }
    });
});

