/**
 * Created by zchuanzhao on 2016/12/21.
 */
var cms = {
    commentList : function (articleId,pageNo) {
        $.ajax({
            url : base+"/article/commentList/"+articleId+".json?pageNo="+pageNo,
            type : "get",
            dataType: "json",
            success : function (json) {
                var data = json.data;
                var html = "";
                for(var i=0;i<data.length;i++){
                    html += "<div class=\"comment\">" +
                        "<a href=\""+base+"/u/"+data[i].member.id+"\" class=\"avatar\">" +
                        "<img src=\""+base+data[i].member.avatar+"\" class=\"icon-4x\"></a><div class=\"content\">" +
                        "<div class=\"pull-right text-muted\">"+data[i].createTime+"</div><div>" +
                        "<a href=\""+base+"/u/"+data[i].member.id+"\"><strong>"+data[i].member.name+"</strong></a></div>" +
                        "<div class=\"text\">"+data[i].content+"</div>" +
                        "</div></div>";
                }
                pageNo = json.page.pageNo;
                if(json.page.totalPage<=pageNo){
                    $("#moreComment").hide();
                }else {
                    $("#moreComment").show();
                }
                $("#commentList").append(html);
            }
        });
    },
    favor : function (_this,base) {
        var articleId = _this.attr("article-id");
        $.ajax({
            url: base + "/article/favor/" + articleId,
            type: "get",
            dataType: "json",
            timeout: 5000,
            success: function (res) {
                if (res.code < 0) {
                    jeesnsDialog.errorTips(res.message);
                } else {
                    if (res.code == 0) {
                        _this.html("<i class='icon-heart'></i> 喜欢 | " + res.data);
                        _this.removeClass("btn-article-unfavor")
                    } else {
                        _this.html("<i class='icon-heart-empty'></i> 喜欢 | " + res.data);
                        _this.addClass("btn-article-unfavor");
                    }
                }
            }
        });
    }
}
