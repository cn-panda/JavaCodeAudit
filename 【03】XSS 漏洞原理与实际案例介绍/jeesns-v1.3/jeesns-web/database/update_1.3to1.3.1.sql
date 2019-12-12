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

ALTER TABLE `tbl_weibo` ADD COLUMN `topic_id` INT DEFAULT '0';


CREATE TABLE `tbl_member_level` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(255),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `tbl_member` ADD COLUMN `member_level_id` INT DEFAULT '1';
ALTER TABLE `tbl_member` ADD COLUMN `is_vip` INT DEFAULT '0';

INSERT INTO tbl_member_level(id, create_time, name) VALUES (1,now(),'普通会员');



ALTER TABLE `tbl_checkin` ADD CONSTRAINT `fk_checkin_member` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

INSERT INTO tbl_action(id, create_time, name, log, status, update_time) VALUES (10004,now(),'签到','签到',0,now());

INSERT INTO tbl_score_rule(id,create_time,update_time,name,score,remark,type,status) VALUES (14,now(),now(),'签到',1,'签到奖励','day',1);



