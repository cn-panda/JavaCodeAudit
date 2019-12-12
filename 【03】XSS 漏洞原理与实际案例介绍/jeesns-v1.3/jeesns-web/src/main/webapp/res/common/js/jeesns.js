/**
 * Created by zchuanzhao on 2016/10/13.
 */
$(function () {
    jeesns.submitForm();
    jeesns.jeesnsLink();
    jeesnsDialog.message();
});

var reload = function () {
    location.reload();
}

var parentReload = function () {
    parent.location.reload()
}

var jeesns = {
    reg_rule : {
        'selected'   :    /.+/,
        'require'    :    /.+/,
        'email'      :    /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
        'url'        :    /^http|https:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
        'currency'   :    /^\d+(\.\d+)?$/,
        'number'     :    /^\d+$/,
        'zip'        :    /^\d{6}$/,
        'integer'    :    /^[-\+]?\d+$/,
        'double'     :    /^[-\+]?\d+(\.\d+)?$/,
        'letter'     :    /^[A-Za-z]+$/
    },
    reg_rule_msg : {
        'selected'   :    "必须选择",
        'require'    :    "不能为空",
        'email'      :    "格式不正确",
        'url'        :    "格式不正确",
        'currency'   :    /^\d+(\.\d+)?$/,
        'number'     :    "必须为正整数",
        'zip'        :    "必须为6个数字",
        'integer'    :    "必须为整数",
        'double'     :    "必须为数字",
        'letter'     :    "必须为字母"
    },

    getOptions : function(callback){
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
                $(":submit").removeAttr("disabled");
                if (res.code >= 0){
                    if (res.message){
                        if (callback) {
                            localStorage.setItem("message",res.message)
                        }else {
                            jeesnsDialog.successTips(res.message);
                        }
                    }
                    if (callback) {
                        var json = JSON.stringify(res);
                        eval(callback+"('"+json+"')");
                    }
                }else {
                    jeesnsDialog.errorTips(res.message);
                }
            }
        };
        return options;
    },
    submitForm : function(form){
        if(arguments[0]){//如果传入了form，马上对form进行ajax提交
            var form = typeof(form)=='object' ? $(form) : $('#'+form);
            if(jeesns.checkForm(form)==false) return false;
            var options = getOptions();
            form.ajaxSubmit(options);
        }else{//否则，对标志有class="jeesns_form"的表单进行ajax提交的绑定操作
            $('.jeesns_form').bind('submit',function(){
                var form = $(this);
                var callback = form.attr("callback");
                if(jeesns.checkForm(form)==false) return false;
                var options = jeesns.getOptions(callback);
                form.ajaxSubmit(options);
                return false;
            });
        }
    },

    checkForm : function(form){
        var check = true;
        form.find("input,textarea,select,redio,checkbox").each(function(){
            var val = $.trim($(this).val());
            var rule = $(this).attr('data-rule');
            var type = $(this).attr('data-type');
            if(type != "" && type != undefined){
                var alt = $(this).attr('alt');
                if(alt == "" || alt == undefined){
                    alt = $(this).attr("placeholder");
                }
                if(alt == undefined){
                    alt = "";
                }
                if(rule != "" && rule != undefined){
                    if(rule.indexOf("equal") != -1){
                        var equalid = rule.substring(rule.indexOf("[")+1,rule.indexOf("]"));
                        var equalValue = $("#"+equalid).val();
                        if(val != equalValue){
                            jeesnsDialog.errorTips(alt);
                            $(this).focus();
                            check = false;
                            return false;
                        }
                    }
                }

                if(type.indexOf(",") != -1){
                    var types = type.split(",");
                    for (var i=0;i<types.length;i++){
                        type = types[i];
                        if(!jeesns.reg_rule[type].test(val)){
                            jeesnsDialog.errorTips(alt+jeesns.reg_rule_msg[type]);
                            $(this).focus();
                            check = false;
                            return false;
                        }
                    }
                }else{
                    if(!jeesns.reg_rule[type].test(val)){
                        jeesnsDialog.errorTips(alt+jeesns.reg_rule_msg[type]);
                        $(this).focus();
                        check = false;
                        return false;
                    }
                }
            }
        });
        return check;
    },

    jeesnsLink : function (){
        $('a[target="_jeesnsLink"]').on('click',function() {
            var url = $(this).attr('href');
            var title = $(this).attr('confirm');
            var callback = $(this).attr('callback');
            if (title) {
                jeesnsDialog.confirm(title, function () {
                    jeesns.jeesnsAjax(url,"GET",null,callback);
                });
            }else {
                jeesns.jeesnsAjax(url,"GET",null,callback);
            }
            return false;
        });

        $('a[target="_jeesnsOpen"]').on('click',function() {
            var url = $(this).attr('href');
            var title = $(this).attr('title');
            var width = $(this).attr('width');
            var height = $(this).attr('height');
            if(width == undefined || width == ""){
                width = "500px";
            }
            if(height == undefined || height == ""){
                height = "300px";
            }
            jeesnsDialog.open(url,title,width,height);
            return false;
        });
    },

    jeesnsAjax : function(url,type,data,callback){
        console.log(callback);
        var index;
        $.ajax({
            url: url,
            type: type,
            data: data,
            cache: false,
            dataType: "json",
            timeout: 20000,
            beforeSend: function(){
                index = jeesnsDialog.loading();
            },
            error: function(){
                jeesnsDialog.close(index);
                jeesnsDialog.errorTips("请求失败")
            },
            success:function(res){
                jeesnsDialog.close(index);
                if (res.code >= 0){
                    if (res.message){
                        if (callback) {
                            localStorage.setItem("message",res.message)
                        }else {
                            jeesnsDialog.successTips(res.message);
                        }
                    }
                    if (callback) {
                        var json = JSON.stringify(res);
                        eval(callback+"('"+json+"')");
                    }
                }else {
                    jeesnsDialog.errorTips(res.message);
                }
            }
        });
    }
};

var jeesnsDialog = {
    loading : function () {
        //加载层
        return parent.layer.load(0);
    },

    close : function (index) {
        parent.layer.close(index);
    },

    closeAll : function () {
        parent.layer.closeAll();
    },

    alert : function(msg) {
        parent.layer.alert(msg);
    },

    confirm : function(msg,confirmFun) {
        parent.layer.confirm(msg, function(){
            confirmFun();
        }, function(){

        });
    },

    tips : function(msg){
        parent.layer.msg(msg);
    },

    tips : function(msg,type){
        if(type == "error"){
            parent.layer.msg(msg, {icon: 5});
        }else if(type == "success"){
            parent.layer.msg(msg, {icon: 6});
        }else{
            parent.layer.msg(msg);
        }
    },

    errorTips : function(msg) {
        jeesnsDialog.tips(msg,"error");
    },

    successTips : function(msg) {
        jeesnsDialog.tips(msg, "success");
    },

    open : function (url,title,width,height) {
        layer.open({
            title: title,
            type: 2,
            area: [width,height],
            fix: true,
            maxmin: false,
            content: url,
            scrollbar: false
        });
    },
    message: function () {
        if (localStorage.message != undefined){
            jeesnsDialog.successTips(localStorage.message);
            localStorage.removeItem("message");
        }
    }
};


function ckUpdate() {
    for (instance in CKEDITOR.instances)
        CKEDITOR.instances[instance].updateElement();
}