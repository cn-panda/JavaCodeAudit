/**
 * 商品发布-选择分类
 * author:OF
 * date: 2018-04-28
 **/
/*定义三级分类数据*/
var expressP, expressC, expressD, expressArea, areaCont;
var arrow = " <font>&gt;</font> ";
/*初始化一级目录*/
function intProvince() {
    var data = {'up_column_id': '0'};
    //请求一级目录
    utile.ajaxSubmit({
        "url": webrootAdmin + "/cms/column/query.json",
        "data": data, 'layer': false
    }, function (result) {
        var areaCont = "";
        $.each(result.data, function (index, value) {
            areaCont += '<li class=catid' + value.column_id + ' onClick="selectP(' + value.column_id +','+ value.form_id+');"><a href="javascript:void(0)">' + value.column_name + '</a></li>';
        });
        $("#sort1").html(areaCont);
    })
}
intProvince();

/*选择一级目录*/
function selectP(p,formId) {
    var areaCont = "";
    var data = {'up_column_id': p};
    utile.ajaxSubmit({
        "url": webrootAdmin + "/cms/column/query.json",
        "data": data, 'layer': false
    }, function (result) {
        $.each(result.data, function (index, value) {
            areaCont += '<li class=catid' + value.column_id + ' onClick="selectC(' + value.column_id +','+ value.form_id+');"><a href="javascript:void(0)">' + value.column_name + '</a></li>';
        });
        if (areaCont != '') {
            $("#sort2").html(areaCont).show();
        } else {
            $("#sort2").html('').hide();
        }
        $("#sort3").hide();
        $("#sort1 .catid" + p).addClass("active").siblings("li").removeClass("active");
        expressP = $("#sort1 .catid" + p).text();
        $("#selectedSort").html(expressP);
        //$("#releaseBtn").removeAttr("disabled");
        $("#releaseBtn").removeClass('layui-btn-disabled');
        $("#releaseBtn").attr('href', 'cms/content/add.html?form_id=' +formId + '&column_id=' + p + '&column_name=' + expressP);
    })

}

/*选择二级目录*/
function selectC(p,formId) {
    areaCont = "";
    expressC = "";
    var data = {'up_column_id': p};
    utile.ajaxSubmit({
        "url": webrootAdmin + "/cms/column/query.json",
        "data": data, 'layer': false
    }, function (result) {
        $.each(result.data, function (index, value) {
            areaCont += '<li class=catid' + value.column_id + ' onClick="selectD(' + value.column_id +','+ value.form_id+');"><a href="javascript:void(0)">' + value.column_name + '</a></li>';
        });
        if (areaCont != '') {
            $("#sort3").html(areaCont).show();
        } else {
            $("#sort3").html('').hide();
        }
        $("#sort2 .catid" + p).addClass("active").siblings("li").removeClass("active");
        var data = $("#sort2 .catid" + p).text();
        expressC = expressP + arrow + data;
        $("#selectedSort").html(expressC);
        $("#releaseBtn").attr('href', 'cms/content/add.html?form_id=' +formId + '&column_id=' + p + '&column_name=' + data);
    })
}

/*选择三级目录*/
function selectD(p, formId) {
    $("#sort3 .catid" + p).addClass("active").siblings("li").removeClass("active");
    var data = $("#sort3 .catid" + p).text();
    expressD = expressC + arrow + data;
    $("#selectedSort").html(expressD);
    $("#releaseBtn").attr('href', 'cms/content/add.html?form_id=' +formId + '&column_id=' + p + '&column_name=' + data);
}

/*点击下一步*/
$("#releaseBtn").click(function () {
    var releaseS = $(this).prop("disabled");
    if (releaseS == false) {//未被禁用
        //location.href = "商品发布-详细信息.html";//跳转到下一页
    }
});
