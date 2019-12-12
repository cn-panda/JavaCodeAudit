CREATE TABLE `tbl_group_topic_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `group_id` INT(11),
  `name` VARCHAR (32),
  `juri` INT(11) DEFAULT '0' COMMENT '权限，0所有人发布，1是管理员才可以发布',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `tbl_group_topic` ADD COLUMN `type_id` INT DEFAULT NULL;
ALTER TABLE `tbl_group_topic` ADD CONSTRAINT `fk_group_topic_type` FOREIGN KEY (`type_id`) REFERENCES `tbl_group_topic_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

CREATE TABLE `tbl_group_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` VARCHAR (32),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `tbl_group` ADD COLUMN `type_id` INT DEFAULT NULL;
ALTER TABLE `tbl_group` ADD CONSTRAINT `fk_group_type` FOREIGN KEY (`type_id`) REFERENCES `tbl_group_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
INSERT INTO `tbl_group_type` values (1,now(),'默认分类');
