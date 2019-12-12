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


ALTER TABLE `tbl_picture` ADD COLUMN `comment_count` INT DEFAULT '0';
ALTER TABLE `tbl_picture` ADD COLUMN `favor_count` INT DEFAULT '0';
ALTER TABLE `tbl_picture` ADD COLUMN `small_path` VARCHAR(255);
ALTER TABLE `tbl_picture` ADD COLUMN `album_id` INT(11);
UPDATE tbl_picture SET type = 2 where type = 3;
UPDATE tbl_picture SET small_path = thumbnail_path where small_path IS NULL;
DELETE FROM tbl_picture where foreign_id=0;
UPDATE tbl_picture set member_id=(SELECT member_id FROM tbl_weibo WHERE id = foreign_id),description=(SELECT content FROM tbl_weibo WHERE id = foreign_id);


DROP PROCEDURE IF EXISTS proc_picture_album;
DELIMITER ;;
CREATE PROCEDURE proc_picture_album()
  BEGIN
    DECLARE Done INT DEFAULT 0;
    DECLARE memberid INT;
    DECLARE rs CURSOR FOR SELECT id FROM tbl_member;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET Done = 1;
    OPEN rs;
    FETCH NEXT FROM rs INTO memberid;
    REPEAT
      IF NOT Done THEN
        insert into tbl_picture_album(id,create_time,update_time,member_id,name,juri,type,cover)
        values(memberid,now(),now(),memberid,"微博配图",0,2,"/res/common/images/empty_album.png");
        update tbl_picture set album_id=memberid where member_id=memberid;
      END IF;
      FETCH NEXT FROM rs INTO memberid;
    UNTIL Done END REPEAT;
    CLOSE rs;
  end;;
DELIMITER ;
call proc_picture_album()

