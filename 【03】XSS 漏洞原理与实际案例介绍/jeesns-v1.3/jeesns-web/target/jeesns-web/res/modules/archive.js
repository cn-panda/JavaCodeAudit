var archive = {
    favor : function (_this,base) {
        var archiveId = _this.attr("archive-id");
        $.ajax({
            url: base + "/archive/favor/" + archiveId,
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
