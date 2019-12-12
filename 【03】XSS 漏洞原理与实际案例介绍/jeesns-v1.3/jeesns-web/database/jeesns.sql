##开始创建表
CREATE TABLE `tbl_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `log` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '状态，0正常，1禁用',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tbl_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT '0' COMMENT '分组ID',
  `name` varchar(50) DEFAULT NULL COMMENT '会员名称',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `phone` varchar(11) DEFAULT '' COMMENT '手机号码',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `regip` varchar(15) DEFAULT '' COMMENT '注册IP',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  `curr_login_time` datetime DEFAULT NULL COMMENT '本次登录时间',
  `curr_login_ip` varchar(15) DEFAULT NULL COMMENT '本次登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '上次登录IP',
  `update_time` datetime DEFAULT NULL COMMENT '更新资料时间',
  `money` double(11,2) DEFAULT '0.00' COMMENT '金额',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `is_active` int(1) DEFAULT '0' COMMENT '是否已激活，0未激活，1已激活',
  `status` int(2) DEFAULT '0' COMMENT '-1禁用，0启用',
  `birthday` varchar(10) DEFAULT NULL COMMENT '生日',
  `addprovince` varchar(20) DEFAULT '' COMMENT '居住省份',
  `addcity` varchar(20) DEFAULT '' COMMENT '居住城市',
  `addarea` varchar(20) DEFAULT '' COMMENT '居住地区',
  `address` varchar(50) DEFAULT '' COMMENT '居住地址',
  `qq` varchar(15) DEFAULT '' COMMENT 'QQ',
  `wechat` varchar(20) DEFAULT '' COMMENT '微信',
  `contact_phone` varchar(11) DEFAULT '' COMMENT '联系手机号',
  `contact_email` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `website` varchar(50) DEFAULT '' COMMENT '个人网站',
  `introduce` varchar(255) DEFAULT '' COMMENT '个人介绍',
  `is_admin` int(11) DEFAULT '0' COMMENT '是否管理员，0不是，1是普通管理员，2是超级管理员',
  `follows` INT(11) DEFAULT '0' comment '关注会员数量',
  `fans` INT(11) DEFAULT '0' comment '粉丝数量',
  `member_level_id` INT(11) DEFAULT '1' comment '会员等级ID',
  `is_vip` INT(11) DEFAULT '0' comment '0普通会员，1VIP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '0',
  `foreign_id` int(11) DEFAULT '0',
  `action_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` int(11) DEFAULT '0' COMMENT '发布类型，1是普通文章，2是群组文章',
  `title` varchar(255) DEFAULT NULL COMMENT '文档标题',
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `description` varchar(255) DEFAULT NULL COMMENT '描述说明',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键词',
  `view_rank` int(11) DEFAULT '0' COMMENT '浏览权限，0不限制，1会员',
  `view_count` int(11) DEFAULT '0' COMMENT '浏览次数',
  `writer` varchar(30) DEFAULT '' COMMENT '作者',
  `source` varchar(30) DEFAULT '' COMMENT '来源',
  `pub_time` datetime DEFAULT NULL COMMENT '发布日期',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `last_reply` datetime DEFAULT NULL COMMENT '最后回复时间',
  `can_reply` int(1) DEFAULT '0' COMMENT '是否可以回复，0可以回复，1不可以回复',
  `good_num` int(11) DEFAULT '0' COMMENT '点赞数量',
  `bad_num` int(11) DEFAULT '0' COMMENT '踩数量',
  `check_admin` int(11) DEFAULT '0' COMMENT '审核管理员id',
  `content` text COMMENT '内容',
  `favor` int(11) DEFAULT '0' COMMENT '喜欢、点赞',
  PRIMARY KEY (`archive_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_archive_favor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `archive_id` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_archive_id_member_id` (`archive_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_time` datetime DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL COMMENT '栏目ID',
  `archive_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `status` int(11) DEFAULT '0' COMMENT '状态，0未审核，1已审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT '0' COMMENT '上级类目ID，顶级栏目为0',
  `name` varchar(30) DEFAULT NULL COMMENT '栏目名称',
  `status` int(1) DEFAULT '0' COMMENT '0正常，1隐藏',
  `sort` int(11) DEFAULT '50' COMMENT '排序，越大越靠前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_config` (
  `jkey` varchar(100) NOT NULL DEFAULT '',
  `jvalue` varchar(500) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`jkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `tbl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '群组名字',
  `logo` varchar(255) DEFAULT NULL COMMENT '群组logo',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `managers` varchar(200) DEFAULT NULL COMMENT '管理员',
  `tags` varchar(100) DEFAULT NULL COMMENT '标签',
  `introduce` varchar(255) DEFAULT NULL COMMENT '介绍',
  `can_post` int(11) DEFAULT '0' COMMENT '是否能发帖，0不可以，1可以',
  `topic_review` int(11) DEFAULT '0' COMMENT '帖子是否需要审核，0不需要，1需要',
  `status` int(11) DEFAULT '0' COMMENT '0未审核，1已审核，-1审核不通过',
  `type_id` int(11) DEFAULT null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_group_fans` (
  `create_time` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  UNIQUE KEY `uk_group_id_member_id` (`group_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_group_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_time` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `archive_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '状态，0未审核，1已审核',
  `is_essence` int(11) DEFAULT '0' COMMENT '精华，0不加精，1加精',
  `is_top` int(11) DEFAULT '0' COMMENT '置顶，0不置顶，1置顶，2超级置顶',
  `type_id` int(11) DEFAULT null COMMENT '帖子分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_group_topic_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `group_topic_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_member_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `follow_who` int(11) DEFAULT '0',
  `who_follow` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_follow_who_who_follow` (`follow_who`,`who_follow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_memgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isadmin` int(1) DEFAULT '0' COMMENT '是否是管理组，0不是，1是',
  `name` varchar(50) DEFAULT '' COMMENT '分组名称',
  `fid` int(11) DEFAULT '0' COMMENT '上级分组ID，默认0，0是顶级分组',
  `rankid` int(11) DEFAULT '0' COMMENT '权限ID，0-99是会员权限，100以上是管理员权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_validate_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `email` varchar(32) NOT NULL DEFAULT '',
  `code` varchar(50) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '0',
  `type` int(1) DEFAULT '0' COMMENT '1是重置密码，2会员激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_weibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` int(11) DEFAULT '0' COMMENT '0为普通文本,1为图片',
  `content` varchar(1000) DEFAULT NULL,
  `favor` int(11) DEFAULT '0' COMMENT '赞',
  `status` tinyint(11) DEFAULT '0' COMMENT '0未审核，1已审核，-1审核不通过',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_weibo_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `weibo_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) COMMENT '评论的id',
  `content` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0正常，1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_weibo_favor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `weibo_id` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_weibo_id_member_id` (`weibo_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_picture` (
  `picture_id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` INT(11),
  `type` INT(11) NOT NULL COMMENT '1是文章图片，2是微博图片，3是群组帖子图片',
  `foreign_id` INT(11) COMMENT '外键ID',
  `path` VARCHAR(255) NOT NULL COMMENT '图片路径',
  `thumbnail_path` VARCHAR(255) COMMENT '缩略图',
  `small_path` VARCHAR(255) COMMENT '按比例缩小的图片',
  `md5` VARCHAR(32) NOT NULL,
  `width` INT(11) DEFAULT '0',
  `height` INT(11) DEFAULT '0',
  `description` VARCHAR(1000),
  `comment_count` INT(11) DEFAULT '0',
  `favor_count` INT(11) DEFAULT '0',
  `album_id` INT(11),
  PRIMARY KEY (picture_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_message` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `from_member_id` INT(11) DEFAULT '0',
  `to_member_id` INT(11) DEFAULT '0',
  `content` TEXT,
  `url` VARCHAR(255),
  `app_tag` INT(11),
  `type` INT(11),
  `relate_key_id` INT(11),
  `member_id` INT(11),
  `description` VARCHAR(500),
  `isread` INT(1) DEFAULT '0' COMMENT '是否已读，0未读，1已读',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


##积分规则表
CREATE TABLE `tbl_score_rule` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` VARCHAR(30) DEFAULT '0' COMMENT '规则名称',
  `score` INT(11) DEFAULT '0' COMMENT '变化积分',
  `remark` VARCHAR(255) COMMENT '说明',
  `type` VARCHAR(10) DEFAULT 'unlimite' COMMENT '奖励次数类型，day每天一次，week每周一次，month每月一次，year每年一次，one只有一次，unlimite不限次数',
  `status` INT(11) DEFAULT '1' COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

##积分明细表
CREATE TABLE `tbl_score_detail` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` INT(11) DEFAULT '0' COMMENT '会员ID',
  `type` INT(11) DEFAULT '0' COMMENT '类型，0是普通积分增加，1是奖励，2是撤销奖励',
  `score` INT(11) DEFAULT '0' COMMENT '变化积分',
  `balance` INT(11) DEFAULT '0' COMMENT '账户剩余积分',
  `remark` VARCHAR(255) COMMENT '说明',
  `foreign_id` INT(11) DEFAULT '0' COMMENT '外键ID',
  `score_rule_id` INT(11) DEFAULT '0' COMMENT '积分规则ID',
  `status` INT(11) DEFAULT '1' COMMENT '状态，1是成功，0是取消',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

##会员登录TOKEN表
CREATE TABLE `tbl_member_token` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` INT(11) DEFAULT '0' COMMENT '会员ID',
  `token` VARCHAR(32) DEFAULT '',
  `expire_time` datetime,
  `status` INT(11) DEFAULT '0' COMMENT '状态，0是正常，1是失效',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


##广告表
CREATE TABLE `tbl_ads` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `type` INT(11) NOT NULL COMMENT '1是图片链接，2是文字链接，3是代码',
  `name` VARCHAR(100) COMMENT '广告名称',
  `start_time` datetime ,
  `end_time` datetime ,
  `content` VARCHAR(1000) NOT NULL COMMENT '内容，如果是图片链接，该内容为图片地址，如果是文字链接，改内容是文字描述信息，如果是代码，改内容是广告代码',
  `link` VARCHAR(255) COMMENT '链接，图片链接和文字链接类型时才有效',
  `status` INT(1) DEFAULT '0' COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


##友情链接表
CREATE TABLE `tbl_link` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` VARCHAR(100) COMMENT '网站名称',
  `url` VARCHAR(255) COMMENT '网址',
  `sort` INT(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越靠前',
  `recomment` INT(11) NOT NULL DEFAULT '0' COMMENT '推荐，0不推荐，1推荐',
  `status` INT(1) DEFAULT '0' COMMENT '状态，0禁用，1启用',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_picture_album` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `member_id` INT(11),
  `comment_count` INT(11) DEFAULT '0',
  `favor_count` INT(11) DEFAULT '0',
  `name` VARCHAR (32),
  `description` VARCHAR (255),
  `juri` INT(11) DEFAULT '0' COMMENT '权限，0所有人可以查看，1是相互关注的人可以查看，2是仅自己可以查看',
  `cover` VARCHAR(255),
  `type` INT(1) DEFAULT '0' COMMENT '0是普通相册，2是微博配图，5是头像相册',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_picture_album_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` INT(11),
  `picture_album_id` INT(11),
  `content` VARCHAR (1000),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_picture_album_favor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `picture_album_id` int(11),
  `member_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_picture_album_id_member_id` (`picture_album_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `func_type` INT (11),
  `name` VARCHAR (32),
  `refer_count` INT (11) DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_picture_tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `picture_id` INT (11),
  `tag_id` INT (11),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_picture_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` INT(11),
  `picture_id` INT(11),
  `content` VARCHAR (1000),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_picture_favor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `picture_id` int(11),
  `member_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_picture_album_id_member_id` (`picture_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_group_topic_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `group_id` INT(11),
  `name` VARCHAR (32),
  `juri` INT(11) DEFAULT '0' COMMENT '权限，0所有人发布，1是管理员才可以发布',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_group_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` VARCHAR (32),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_checkin` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `member_id` INT(11),
  `continue_day` INT(11),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_weibo_topic` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(255),
  `count` INT(11) DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_member_level` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(255),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `tbl_action_log` ADD CONSTRAINT `fk_action_log_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_action_log` ADD CONSTRAINT `fk_action_log_action` FOREIGN KEY (`action_id`) REFERENCES `tbl_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_archive_favor` ADD CONSTRAINT `fk_archive_favor_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_archive_favor` ADD CONSTRAINT `fk_archive_favor_archive` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_article` ADD CONSTRAINT `fk_article_archive` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_article` ADD CONSTRAINT `fk_article_cate` FOREIGN KEY (`cate_id`) REFERENCES `tbl_article_cate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_article_comment` ADD CONSTRAINT `fk_article_comment_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_article_comment` ADD CONSTRAINT `fk_article_comment_article` FOREIGN KEY (`article_id`) REFERENCES `tbl_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_group` ADD CONSTRAINT `fk_group_member` FOREIGN KEY (`creator`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_weibo` ADD CONSTRAINT `fk_weibo_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_group_topic` ADD CONSTRAINT `fk_group_topic_group` FOREIGN KEY (`group_id`) REFERENCES `tbl_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_group_topic` ADD CONSTRAINT `fk_group_topic_archive` FOREIGN KEY (`archive_id`) REFERENCES `tbl_archive` (`archive_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_group_fans` ADD CONSTRAINT `fk_group_fans_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_group_fans` ADD CONSTRAINT `fk_group_fans_group` FOREIGN KEY (`group_id`) REFERENCES `tbl_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_group_topic_comment` ADD CONSTRAINT `fk_group_topic_comment_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_group_topic_comment` ADD CONSTRAINT `fk_group_topic_comment_group_topic` FOREIGN KEY (`group_topic_id`) REFERENCES `tbl_group_topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_member_fans` ADD CONSTRAINT `fk_member_fans_follow_who` FOREIGN KEY (`follow_who`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_member_fans` ADD CONSTRAINT `fk_member_fans_who_follow` FOREIGN KEY (`who_follow`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_weibo_comment` ADD CONSTRAINT `fk_weibo_comment_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_weibo_comment` ADD CONSTRAINT `fk_weibo_comment_weibo` FOREIGN KEY (`weibo_id`) REFERENCES `tbl_weibo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_weibo_favor` ADD CONSTRAINT `fk_weibo_favor_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_weibo_favor` ADD CONSTRAINT `fk_weibo_favor_weibo` FOREIGN KEY (`weibo_id`) REFERENCES `tbl_weibo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_message` ADD CONSTRAINT `fk_message_from_member` FOREIGN KEY (`from_member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_message` ADD CONSTRAINT `fk_message_to_member` FOREIGN KEY (`to_member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_score_detail` ADD CONSTRAINT `fk_score_detail_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_score_detail` ADD CONSTRAINT `fk_score_detail_score_rule` FOREIGN KEY (`score_rule_id`) REFERENCES `tbl_score_rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_member_token` ADD CONSTRAINT `fk_member_token_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_message` ADD CONSTRAINT `fk_message_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_picture_comment` ADD CONSTRAINT `fk_picture_comment_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_picture_comment` ADD CONSTRAINT `fk_picture_comment_picture` FOREIGN KEY (`picture_id`) REFERENCES `tbl_picture` (`picture_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_picture_favor` ADD CONSTRAINT `fk_picture_favor_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_picture_favor` ADD CONSTRAINT `fk_picture_favor_picture` FOREIGN KEY (`picture_id`) REFERENCES `tbl_picture` (`picture_id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `tbl_group_topic` ADD CONSTRAINT `fk_group_topic_type` FOREIGN KEY (`type_id`) REFERENCES `tbl_group_topic_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tbl_group` ADD CONSTRAINT `fk_group_type` FOREIGN KEY (`type_id`) REFERENCES `tbl_group_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `tbl_checkin` ADD CONSTRAINT `fk_checkin_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;





##数据
INSERT INTO `tbl_config` (`jkey`, `jvalue`, `description`)
VALUES
  ('cms_post','1','cms会员文章投稿，0关闭，1开启'),
  ('cms_post_review','0','cms投稿审核，0需要审核，1不需要审核'),
  ('group_alias','群组','群组别名'),
  ('group_apply','1','群组是否可以申请，0不可以，1可以'),
  ('group_apply_review','0','群组申请是否需要审核，0需要审核，1不需要审核'),
  ('member_email_valid','0','邮箱验证，0不需要验证，1需要验证'),
  ('member_login_open','1','会员登录开关，0关闭，1开启'),
  ('member_register_open','1','会员注册开关，0关闭，1开启'),
  ('site_description','JEESNS是一款基于JAVA企业级平台研发的社交管理系统，依托企业级JAVA的高效、安全、稳定等优势，开创国内JAVA版开源SNS先河。','网站描述'),
  ('site_domain','http://www.jeesns.cn/','网站域名'),
  ('site_keys','jeesns,sns,java','网站关键词'),
  ('site_logo','/res/common/images/logo.png','网站LOGO'),
  ('site_name','JEESNS','网站名称'),
  ('site_send_email_account','','发送邮箱账号'),
  ('site_send_email_password','','发送邮箱密码'),
  ('site_send_email_smtp','','发送邮箱SMTP服务器地址'),
  ('site_seo_title','又一个JEESNS社区','SEO标题'),
  ('site_icp','闽ICP备12013573号','备案号'),
  ('site_copyright','Copyright © 2012 - 2017.','版权说明'),
  ('site_tongji','<script>var _hmt = _hmt || [];(function() {var hm = document.createElement("script");hm.src = "https://hm.baidu.com/hm.js?6e79d941db914e4195f4a839b06f2567";var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(hm, s);})();</script>','统计代码'),
  ('weibo_alias','微博','微博别名'),
  ('weibo_post','1','微博发布，0不可以发布，1可以发布'),
  ('weibo_post_maxcontent','140','微博内容字数');


INSERT INTO `tbl_member` (`id`, `group_id`, `name`, `email`, `phone`, `password`, `sex`, `avatar`, `create_time`, `regip`, `login_count`, `curr_login_time`, `curr_login_ip`, `last_login_time`, `last_login_ip`, `update_time`, `money`, `score`, `is_active`, `status`, `birthday`, `addprovince`, `addcity`, `addarea`, `address`, `qq`, `wechat`, `contact_phone`, `contact_email`, `website`, `introduce`, `is_admin`)
VALUES
  (1,0,'admin','admin@jeesns.cn','13800138000','56b0436e6dd61a1f5f6a636cdf790eee','女','/res/common/images/default-avatar.png',now(),'',0,now(),'127.0.0.1',now(),'127.0.0.1',NULL,0.00,0,1,0,'1971-12-20','','','','','8888888','admin','13800138000','admin@jeesns.cn','www.jeesns.cn','',2);

INSERT INTO tbl_action(id, create_time, name, log, status, update_time) VALUES
  (1,now(),'会员注册','注册了账号',0,now()),
  (2,now(),'会员登录','登录了账号',0,now()),
  (3,now(),'修改密码','修改了密码',0,now()),
  (4,now(),'找回密码','找回了密码',0,now()),
  (5,now(),'登录失败','登录失败',0,now()),
  (3001,now(),'删除微博','删除了微博',0,now()),
  (3002,now(),'删除微博评论','删除了微博评论',0,now()),
  (3003,now(),'删除群组','删除了群组',0,now()),
  (3004,now(),'删除群组帖子','删除了帖子',0,now()),
  (3005,now(),'删除群组帖子评论','删除了帖子评论',0,now()),
  (3006,now(),'删除文章','删除文章',0,now()),
  (3007,now(),'删除文章评论','删除了文章评论',0,now()),
  (10001,now(),'发布微博','发布了微博',0,now()),
  (10002,now(),'群组发帖','发布了群组帖子',0,now()),
  (10003,now(),'发布文章','发布了文章',0,now()),
  (10004,now(),'签到','签到',0,now());


INSERT INTO tbl_score_rule(id,create_time,update_time,name,score,remark,type,status) VALUES
  (1,now(),now(),'注册奖励',100,'注册奖励','one',1),
  (2,now(),now(),'邮箱认证',1,'邮箱认证奖励积分，只有一次','one',1),
  (3,now(),now(),'每天登陆奖励',1,'每天登陆奖励积分，一天仅限一次','day',1),
  (4,now(),now(),'文章投稿',1,'文章投稿奖励积分，如需审核，审核之后奖励','unlimite',1),
  (5,now(),now(),'文章评论',1,'评论文章奖励积分','unlimite',1),
  (6,now(),now(),'文章收到喜欢',1,'文章收到喜欢，作者奖励积分','unlimite',1),
  (7,now(),now(),'发布微博',1,'发布微博奖励积分','unlimite',1),
  (8,now(),now(),'评论微博',1,'评论微博奖励积分','unlimite',1),
  (9,now(),now(),'微博收到点赞',1,'微博收到点赞，作者奖励积分','unlimite',1),
  (10,now(),now(),'申请群组',-10,'申请群组扣除/奖励积分，如需要扣除积分，请填写负数','unlimite',1),
  (11,now(),now(),'群组发帖',1,'群组发帖奖励积分，如需审核，审核之后奖励','unlimite',1),
  (12,now(),now(),'群组帖子评论',1,'群组帖子评论奖励积分','unlimite',1),
  (13,now(),now(),'群组帖子收到喜欢',1,'群组帖子收到喜欢奖励积分','unlimite',1),
  (14,now(),now(),'签到',1,'签到奖励','day',1);

INSERT INTO `tbl_group_type` values (1,now(),'默认分类');

INSERT INTO tbl_member_level(id, create_time, name) VALUES (1,now(),'普通会员');