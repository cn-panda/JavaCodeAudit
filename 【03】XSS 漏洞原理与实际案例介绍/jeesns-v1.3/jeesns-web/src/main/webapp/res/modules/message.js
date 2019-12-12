var memberid = -1;
var memberName = "";
var contactsPageNo = 1;
var contactsTotalPage = 1;
var messagePageNo = 1;
var messageTotalPage = 1;
$(document).ready(function () {
    listContactMembers();
    $(".sendMessage").on("click", function () {
        if(memberid == -1){
            jeesnsDialog.errorTips("请先选择发送的对象");
            return;
        }
        var content = $("#content").val();
        if (content == "") {
            jeesnsDialog.errorTips("请输入私信内容");
            return;
        }
        $.ajax({
            url: base + "/member/sendMessage",
            type: "post",
            data: {
                memberId:memberid,
                content: content
            },
            cache: false,
            dataType: "json",
            timeout: 5000,
            beforeSend: function () {
                index = jeesnsDialog.loading();
            },
            error: function () {
                jeesnsDialog.close(index);
                jeesnsDialog.errorTips("请求失败")
            },
            success: function (res) {
                jeesnsDialog.close(index);
                if (res.code == 0) {
                    jeesnsDialog.successTips(res.message);
                    messageRecords(1,1);
                    $("#content").val("");
                } else {
                    jeesnsDialog.errorTips(res.message);
                }
            }
        });
    });
    //每10s定时刷新数据
    setInterval("listContactMembers(1)",20000);
    setInterval(function () {
        if ($(".chat-discussion")[0].scrollHeight - $(".chat-discussion")[0].scrollTop < 1000){
            //只有聊天记录滚动到底部的时候，才执行定时刷新聊天记录操作
            messageRecords(1,1);
        }
    }, 10000)
});

function getMessageRecords(member_id,member_name) {
    if(member_id != memberid){
        $(".chat-discussion-content").html("");
    }
    memberid = member_id;
    memberName = member_name;
    messageRecords(1,1)
}

//获取信息
function messageRecords(autoScroll,regain) {
    //重新获取，页数置为1
    if(regain == 1){
        messagePageNo = 1;
    }
    $("#user-name").text(memberName);
    if(memberid > -1){
        $.ajax({
            url: base + "/member/messageRecords/"+memberid,
            type: "get",
            data: {
                pageNo : messagePageNo,
                pageSize : 50
            },
            cache: false,
            dataType: "json",
            timeout: 5000,
            error: function () {
                jeesnsDialog.errorTips("私信记录获取失败，请刷新重试")
            },
            success: function (res) {
                //重新获取联系人列表
                listContactMembers(1);
                if (res.code == 0) {
                    var html = "";
                    if(res.data.length == 0){
                        $(".no-message").show();
                    }else {
                        $(".no-message").hide();
                    }
                    for (var i=res.data.length-1;i>=0;i--){
                        var message = res.data[i];
                        messageTotalPage = res.page.totalPage;
                        var lr = "left";
                        if(loginMemberId == message.fromMember.id) {
                            lr = "right";
                        }
                        html += "<div class=\"chat-message "+lr+"\">";
                        html += "<a href=\""+base +"/u/"+message.fromMember.id+"\" target='_blank'><img class=\"message-avatar\" src=\"" + base + message.fromMember.avatar+"\"></a>";
                        html += "<div class=\"message\">";
                        html += "<a href=\""+base+"/u/"+message.fromMember.id+"\" class='message-author' target='_blank'>"+message.fromMember.name+"</a>";
                        html += "<span class=\"message-date\"> "+formatDateTime(message.createTime)+" </span>";
                        html += "<span class=\"message-content\">";
                        html += message.content;
                        html += "</span></div></div>";
                    }
                    //获取旧的div高度
                    var oldHeight = $(".chat-discussion")[0].scrollHeight;
                    //重新获取用html
                    if(regain == 1){
                        $(".chat-discussion-content").html(html);
                    }else {
                        $(".chat-discussion-content").prepend(html);
                    }
                    if(messagePageNo >= messageTotalPage){
                        messagePageNo = messageTotalPage;
                        $(".message-load-more-a").html("已全部加载");
                    }else {
                        $(".message-load-more-a").html("加载更多...");
                    }
                    if(messageTotalPage == 1){
                        $(".message-load-more-a").css("display","none");
                    }else {
                        $(".message-load-more-a").css("display","inline");
                    }
                    if(autoScroll == 1){
                        $(".chat-discussion").scrollTop($(".chat-discussion")[0].scrollHeight);
                    }else {
                        //旧的div高度高于420，说明有滚动过，可能获取到了第二页的数据，将滚动条保持在原来的位置
                        if(oldHeight > 420){
                            $(".chat-discussion").scrollTop($(".chat-discussion")[0].scrollHeight - oldHeight);
                        }
                    }
                }
            }
        });
    }
}

//获取联系人
function listContactMembers(autoRefresh) {
    if(autoRefresh == 1){
        contactsPageNo = 1;
    }
    $.ajax({
        url: base + "/member/listContactMembers",
        type: "get",
        data: {
            pageNo : contactsPageNo,
            pageSize : 50
        },
        cache: false,
        dataType: "json",
        timeout: 5000,
        error: function () {
            jeesnsDialog.errorTips("联系人获取失败，请刷新重试")
        },
        success: function (res) {
            if (res.code == 0) {
                var html = "";
                contactsTotalPage = res.page.totalPage;
                for (var i=0;i<res.data.length;i++){
                    var member = res.data[i];
                    var unreadNum = member.messages.length;
                    var unreadNumHtml = "";
                    if(unreadNum > 0){
                        unreadNumHtml = " (<span class='text-red'>"+unreadNum+"</span>)";
                    }
                    html += "<div class=\"chat-user\">";
                    html += "<img class=\"chat-avatar\" src=\"" + base +member.avatar+"\">";
                    html += "<div class=\"chat-user-name\">";
                    html += "<a href=\"javascript:void(0)\" onclick=\"getMessageRecords("+member.id+",'"+member.name+"')\" class=\"message-user-name\" data='"+member.id+"'>"+member.name+ unreadNumHtml + "</a>";
                    html += "</div></div>";
                }
                if(autoRefresh == 1){
                    $("#users-list").html(html);
                }else {
                    $("#users-list").append(html);
                }
                if(contactsPageNo >= contactsTotalPage){
                    contactsPageNo = contactsTotalPage;
                    $(".contacts-load-more-a").html("已全部加载")
                }
                if($("#users-list")[0].scrollHeight < 520){
                    $(".contacts-load-more-a").css("display","none");
                }else {
                    $(".contacts-load-more-a").css("display","inline");
                }

            }
        }
    });
}

//联系人加载更多
function contactsLoadMore() {
    if(contactsPageNo < contactsTotalPage){
        contactsPageNo ++;
        listContactMembers();
    }
}

//信息加载更多
function messageLoadMore() {
    if(messagePageNo < messageTotalPage){
        messagePageNo ++;
        messageRecords(0,0);
    }
}
function formatDateTime(nS) {
    return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');
}