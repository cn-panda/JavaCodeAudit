var mem = {
    follows : function (_this,base) {
        var memberId = _this.attr("member-id");
        $.ajax({
            url: base+"/member/follows/"+memberId,
            type: "get",
            dataType: "json",
            timeout: 5000,
            success:function(res){
                if(res.code < 0){
                    jeesnsDialog.errorTips(res.message);
                }else {
                    if(res.code == 0){
                        _this.html("<i class='fa fa-heart-o'></i> 关注");
                    }else if(res.code == 1){
                        _this.html("<i class='fa fa-heart-o'></i> 已关注");
                    }
                }
            }
        });
    },
    isFollowed : function (memberId,base) {
        var _this = $(".member-follows");
        $.ajax({
            url: base+"/member/isFollowed/"+memberId,
            type: "get",
            dataType: "json",
            timeout: 5000,
            success:function(res){
                if(res.code == 0){
                    _this.html("<i class='fa fa-heart-o'></i> 关注");
                }else if(res.code == 1){
                    _this.html("<i class='fa fa-heart-o'></i> 已关注");
                }
            }
        });
    }
}