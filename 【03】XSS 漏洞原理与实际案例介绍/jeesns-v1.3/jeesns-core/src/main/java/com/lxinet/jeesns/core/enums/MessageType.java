package com.lxinet.jeesns.core.enums;

public enum  MessageType {
    CMS_ARTICLE_REFER("在文章提到你了。",10001),
    CMS_ARTICLE_LIKE("喜欢你的文章。",10003),
    CMS_ARTICLE_DELETE("删除了你的文章。",10004),

    CMS_ARTICLR_REPLY("评论了你的文章。",11001),
    CMS_ARTICLE_COMMENT_REFER("在文章评论提到你了。",11002),

    WEIBO_REFER("在微博提到了你。", 20001),
    WEIBO_ZAN("赞了你的微博。", 20003),
    WEIBO_DELETE("删除了你的微博。", 20004),

    WEIBO_REPLY("评论了你的微博。", 21001),
    WEIBO_COMMENT_REFER("在微博评论提到你了。", 21002),

    WEIBO_REPLY_REPLY("回复了你的微博评论。", 22001),

    GROUP_TOPIC_REFER("在群组帖子提到你了。", 31001),
    GROUP_TOPIC_LIKE("喜欢你的群组帖子。", 31003),
    GROUP_TOPIC_TOP("置顶了你的群组帖子。", 31004),
    GROUP_TOPIC_SUPER_TOP("超级置顶了你的群组帖子。", 31005),
    GROUP_TOPIC_ESSENCE("将你的群组帖子设为精华。", 31006),
    GROUP_TOPIC_DELETE("删除了你的群组帖子。", 31007),

    GROUP_TOPIC_REPLY("评论了你的群组帖子。", 32001),
    GROUP_TOPIC_COMMENT_REFER("在群组帖子评论提到你了。", 32002),

    GROUP_TOPIC_REPLY_REPLY("回复了你的群组帖子评论。", 33001),

    PICTURE_REFER("在图片中提到你了。", 40001),
    PICTURE_ZAN("赞了你的图片。", 40002),
    PICTURE_REPLY("评论了你的图片。", 41001),
    PICTURE_COMMENT_REFER("在图片评论提到你了。", 41002);

    private String content;
    private int code;

    MessageType(String content, int code) {
        this.content = content;
        this.code = code;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
