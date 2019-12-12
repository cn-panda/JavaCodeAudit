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
                    html += "<div class='social-feed-box'><div class='social-avatar'><a href='"+base+"/u/"+data[i].member.id+"' class='pull-left' target='_blank'><img src='"+base+data[i].member.avatar+"'>";
                    html += "</a><div class='media-body'><a href='"+base+"/u/"+data[i].member.id+"' target='_blank'>"+data[i].member.name+"</a><small class='text-muted'>"+data[i].createTime+"</small></div></div><div class='social-body'><p>"+data[i].content+"</p></div></div>";
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
                        _this.html("<i class='fa fa-heart'></i> 喜欢 " + res.data);
                        _this.removeClass("btn-outline")
                    } else {
                        _this.html("<i class='fa fa-heart-o'></i> 喜欢 " + res.data);
                        _this.addClass("btn-outline");
                    }
                }
            }
        });
    }
}
