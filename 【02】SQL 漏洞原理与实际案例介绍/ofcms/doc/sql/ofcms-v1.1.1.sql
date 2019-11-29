/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : ofcms

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2018-09-06 21:53:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for of_cms_access
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_access`;
CREATE TABLE `of_cms_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `access_ip` varchar(20) NOT NULL COMMENT '访问IP',
  `access_entry_page` varchar(400) DEFAULT NULL COMMENT '访问进入页面',
  `access_last_page` varchar(400) DEFAULT NULL COMMENT '访问最后页面',
  `access_date` date DEFAULT NULL COMMENT '访问日期',
  `access_time` time NOT NULL COMMENT '访问时间',
  `access_source` varchar(200) DEFAULT NULL COMMENT '访问来源',
  `access_keyword` varchar(200) DEFAULT NULL COMMENT '访问关键字',
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of of_cms_access
-- ----------------------------
INSERT INTO `of_cms_access` VALUES ('1', '1', '', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '17:33:50', '本站', '');
INSERT INTO `of_cms_access` VALUES ('2', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '17:38:07', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('3', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '17:39:11', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('4', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '17:39:12', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('5', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '17:40:56', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('6', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '17:42:03', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('7', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '17:42:12', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('8', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/about.html', 'http://localhost:8081/ofcms-admin/about.html', '2018-08-29', '17:42:29', 'http://localhost:8081/ofcms-admin/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('9', '2', '127.0.0.1', 'http://127.0.0.1:8081/ofcms-admin/about.html', 'http://127.0.0.1:8081/ofcms-admin/about.html', '2018-08-29', '17:42:58', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('10', '2', '127.0.0.1', 'http://127.0.0.1:8081/ofcms-admin/', 'http://127.0.0.1:8081/ofcms-admin/', '2018-08-29', '17:43:03', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('11', '2', '127.0.0.1', 'http://127.0.0.1:8081/ofcms-admin/about.html', 'http://127.0.0.1:8081/ofcms-admin/about.html', '2018-08-29', '17:44:06', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('12', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/about.html', 'http://localhost:8081/ofcms-admin/about.html', '2018-08-29', '17:44:07', 'http://localhost:8081/ofcms-admin/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('13', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '21:31:40', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('14', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '21:31:43', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('15', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-29', '21:38:01', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('16', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '11:35:28', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('17', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '11:35:30', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('18', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '21:20:54', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('19', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '21:20:55', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('20', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '22:15:21', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('21', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '22:15:22', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('22', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/n', 'http://localhost:8081/ofcms-admin/n', '2018-08-30', '22:15:28', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('23', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '22:21:16', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('24', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '22:21:17', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('25', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '22:29:51', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('26', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '22:29:53', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('27', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '22:39:18', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('28', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '22:57:10', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('29', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '23:58:21', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('30', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-30', '23:58:22', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('31', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-31', '00:08:32', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('32', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-31', '00:08:34', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('33', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-31', '00:17:19', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('34', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-08-31', '00:17:20', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('35', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '09:35:55', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('36', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '09:35:57', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('37', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '09:48:51', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('38', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '09:48:52', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('39', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '09:58:25', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('40', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '09:58:26', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('41', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '11:12:31', 'http://localhost:8081/ofcms-admin/admin/setSite.html?site_id=1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('42', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/contact.html', 'http://localhost:8081/ofcms-admin/contact.html', '2018-09-03', '11:13:20', 'http://localhost:8081/ofcms-admin/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('43', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '11:35:36', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('44', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '11:35:37', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('45', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:14:29', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('46', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:14:32', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('47', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:18:41', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('48', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:30:14', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('49', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/contact.html', 'http://localhost:8081/ofcms-admin/contact.html', '2018-09-03', '20:33:26', 'http://localhost:8081/ofcms-admin/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('50', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/contact.html', 'http://localhost:8081/ofcms-admin/contact.html', '2018-09-03', '20:33:30', 'http://localhost:8081/ofcms-admin/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('51', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:33:31', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('52', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:33:33', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('53', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:33:34', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('54', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:34:45', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('55', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:35:47', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('56', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:35:49', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('57', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:35:49', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('58', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:35:50', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('59', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:36:14', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('60', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:37:38', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('61', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:38:00', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('62', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:39:51', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('63', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:42:04', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('64', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:42:28', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('65', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:45:12', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('66', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:45:56', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('67', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:49:34', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('68', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:49:46', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('69', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:50:23', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('70', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:51:19', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('71', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:51:21', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('72', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:55:19', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('73', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:56:24', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('74', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:56:40', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('75', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:56:51', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('76', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:57:01', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('77', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '20:57:11', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('78', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '21:17:06', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('79', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '21:17:07', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('80', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '21:34:41', 'http://localhost:8081/ofcms-admin/admin/index.html', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('81', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/contact.html', 'http://localhost:8081/ofcms-admin/contact.html', '2018-09-03', '21:34:42', 'http://localhost:8081/ofcms-admin/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('82', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/admin', 'http://localhost:8081/ofcms-admin/admin', '2018-09-03', '22:03:46', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('83', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:04:31', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('84', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:04:32', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('85', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:06:52', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('86', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:06:53', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('87', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:09:16', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('88', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:09:17', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('89', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:15:38', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('90', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:15:39', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('91', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:36:38', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('92', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:36:39', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('93', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:42:29', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('94', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:42:30', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('95', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:43:40', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('96', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-03', '22:43:41', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('97', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '08:37:45', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('98', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '08:37:47', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('99', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '08:44:08', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('100', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '08:44:09', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('101', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '08:46:33', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('102', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '08:46:34', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('103', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '16:46:13', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('104', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '16:46:15', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('105', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-04', '17:45:41', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('106', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-05', '21:23:07', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('107', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-05', '21:23:08', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');
INSERT INTO `of_cms_access` VALUES ('108', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-05', '21:43:45', '本站', 'IntelliJ IDEA/171.4694.23');
INSERT INTO `of_cms_access` VALUES ('109', '1', '127.0.0.1', 'http://localhost:8081/ofcms-admin/', 'http://localhost:8081/ofcms-admin/', '2018-09-05', '21:43:47', '本站', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');

-- ----------------------------
-- Table structure for of_cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_ad`;
CREATE TABLE `of_cms_ad` (
  `ad_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '轮播图图编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `ad_name` varchar(50) NOT NULL COMMENT '轮播图名称',
  `ad_edition` varchar(50) NOT NULL COMMENT '广告版位',
  `ad_image_url` varchar(150) DEFAULT NULL COMMENT '广告图片地址',
  `ad_type` char(1) NOT NULL COMMENT '广告类型:1.图片 2.文件3.代码',
  `ad_jump_url` varchar(50) DEFAULT NULL COMMENT '图片跳转链接地址',
  `request_time` datetime DEFAULT NULL COMMENT '提交日期时间',
  `start_date` datetime DEFAULT NULL COMMENT '展现次数',
  `stop_date` datetime DEFAULT NULL COMMENT '结束日期',
  `sort_order` char(3) DEFAULT NULL COMMENT '显示的顺序',
  `status` char(1) DEFAULT NULL COMMENT '0.删除；1.启用；2.停用',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of of_cms_ad
-- ----------------------------
INSERT INTO `of_cms_ad` VALUES ('1', '1', 'banner1', 'banner', '/upload/image/banner01.png', '1', '#', null, null, null, '1', '1', '');
INSERT INTO `of_cms_ad` VALUES ('2', '1', 'banner2', 'banner', '/upload/image/banner02.png', '1', '#', null, null, null, '2', '1', '');
INSERT INTO `of_cms_ad` VALUES ('3', '1', 'banner3', 'banner', '/upload/image/banner03.png', '1', '#', null, null, null, '3', '1', '');
INSERT INTO `of_cms_ad` VALUES ('4', '1', 'banner4', 'banner', '/upload/image/banner04.png', '1', '#', null, null, null, '4', '1', '');

-- ----------------------------
-- Table structure for of_cms_announce
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_announce`;
CREATE TABLE `of_cms_announce` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `title` varchar(200) NOT NULL COMMENT '公告标题',
  `content` varchar(1024) DEFAULT NULL COMMENT '公告内容',
  `type` char(1) NOT NULL COMMENT '公告类型:1、系统公告 2、通知 3、推广',
  `user_id` varchar(20) DEFAULT NULL COMMENT '发布用户',
  `release_terminal` char(1) NOT NULL COMMENT '发布终端:1、app 2、微信 3、管理台',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sort` char(2) DEFAULT NULL COMMENT '排序 从 10 两位开始',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT NULL COMMENT '1、正常 0、作废',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='站点公告表';

-- ----------------------------
-- Records of of_cms_announce
-- ----------------------------
INSERT INTO `of_cms_announce` VALUES ('1', '1', '重要通知', '系统马上开始升级了。请大家注意。', '1', null, '1', '2018-05-22 22:12:02', '2018-08-09 20:32:50', '1', null, '1');
INSERT INTO `of_cms_announce` VALUES ('2', '1', '公司测试', '<p>公司测试</p>', '1', null, '1', '2018-08-09 17:35:37', null, '2', null, '1');
INSERT INTO `of_cms_announce` VALUES ('3', '1', '公司测试公司测试', '<p>公司测试公司测试公司测试公司测试公司测试公司测试公司测试公司测试</p>', '1', null, '1', '2018-08-09 17:35:45', '2018-08-09 20:32:44', '3', null, '1');
INSERT INTO `of_cms_announce` VALUES ('4', '1', '版本升级通知，1.1正式发布', '<p>版本升级通知，1.1正式发布</p>', '1', null, '1', '2018-08-09 17:35:54', '2018-08-09 20:32:41', '4', null, '1');
INSERT INTO `of_cms_announce` VALUES ('5', '1', '发布模板文档', '<p>发布模板文档</p>', '1', null, '1', '2018-08-09 20:33:33', null, '5', null, '1');

-- ----------------------------
-- Table structure for of_cms_api
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_api`;
CREATE TABLE `of_cms_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '接口编号',
  `api_name` varchar(100) DEFAULT NULL COMMENT '接口名称',
  `api_code` varchar(50) DEFAULT NULL COMMENT '接口代码',
  `api_url` varchar(250) NOT NULL COMMENT '接口地址',
  `limit_call_day` int(10) NOT NULL COMMENT '每日限制调用次数(0无限制)',
  `call_total_count` int(10) DEFAULT NULL COMMENT '总调用次数',
  `call_month_count` int(10) DEFAULT NULL COMMENT '月调用次数',
  `call_week_count` int(10) DEFAULT NULL COMMENT '周调用次数',
  `call_day_count` int(10) DEFAULT NULL COMMENT '日调用次数',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用0、未禁用 1、禁用',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态:0、删除 1、正常 ',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口表';

-- ----------------------------
-- Records of of_cms_api
-- ----------------------------

-- ----------------------------
-- Table structure for of_cms_api_account
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_api_account`;
CREATE TABLE `of_cms_api_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `app_id` varchar(100) DEFAULT NULL COMMENT '应用编号',
  `app_key` varchar(250) DEFAULT NULL COMMENT '应用密钥',
  `aes_key` varchar(250) NOT NULL COMMENT 'AES加解密密钥',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用0、未禁用 1、禁用',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态:0、删除 1、正常 ',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口应用表';

-- ----------------------------
-- Records of of_cms_api_account
-- ----------------------------

-- ----------------------------
-- Table structure for of_cms_bbs
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_bbs`;
CREATE TABLE `of_cms_bbs` (
  `bbs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `title` varchar(50) DEFAULT NULL COMMENT '留言标题',
  `content` varchar(500) NOT NULL COMMENT '留言内容',
  `rev_content` varchar(500) DEFAULT NULL COMMENT '回复内容',
  `mobile` int(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq号',
  `clicks` int(8) DEFAULT NULL COMMENT '点击数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sort` tinyint(2) DEFAULT NULL COMMENT '排序',
  `is_check` tinyint(2) DEFAULT '0' COMMENT '0、未审核 1、审核通过 2、审核不通过',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态:0、删除 1、正常',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`bbs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='留言';

-- ----------------------------
-- Records of of_cms_bbs
-- ----------------------------
INSERT INTO `of_cms_bbs` VALUES ('1', '1', '测试一下，这个功能看可以吗？', '测试一下，这个功能看可以吗？', '22', '1880000002', '1880000002@qq.com', '523321294', '1', '2018-08-21 22:16:55', '2018-08-21 22:37:23', null, '1', '1', null);
INSERT INTO `of_cms_bbs` VALUES ('2', '1', '1', '1', '1', null, null, null, null, null, null, '1', '0', '0', null);
INSERT INTO `of_cms_bbs` VALUES ('3', '1', null, '123456', null, null, null, null, '1', '2018-09-03 22:07:41', null, '1', '0', '1', null);

-- ----------------------------
-- Table structure for of_cms_column
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_column`;
CREATE TABLE `of_cms_column` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `column_code` varchar(20) NOT NULL COMMENT '栏目编码',
  `up_column_id` varchar(20) NOT NULL COMMENT '上级栏目',
  `form_id` int(11) NOT NULL COMMENT '表单编号',
  `column_name` varchar(50) NOT NULL COMMENT '栏目名称',
  `column_english` varchar(50) DEFAULT NULL COMMENT '栏目英文',
  `column_desc` varchar(200) DEFAULT NULL COMMENT '栏目描述',
  `column_content` varchar(2000) DEFAULT NULL COMMENT '栏目内容',
  `column_image` varchar(150) DEFAULT NULL COMMENT '栏目图',
  `template_path` varchar(200) DEFAULT NULL COMMENT '模板路径',
  `content_url` varchar(200) DEFAULT NULL COMMENT '外部链接',
  `title` varchar(150) DEFAULT NULL COMMENT '页面标题',
  `keywords` varchar(150) DEFAULT NULL COMMENT '关键词',
  `description` varchar(200) DEFAULT NULL COMMENT '描述文字',
  `column_index_page` varchar(150) DEFAULT NULL COMMENT '首页',
  `column_list_page` varchar(150) DEFAULT NULL COMMENT '列表页',
  `column_content_page` varchar(150) DEFAULT NULL COMMENT '内容页',
  `is_open` tinyint(2) DEFAULT NULL COMMENT '是否单页 1、是 0、不是',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示 0、未显示 1、栏目页 2、单页',
  `sort` tinyint(3) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `upate_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(2) NOT NULL COMMENT '状态:0、删除 1、正常',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of of_cms_column
-- ----------------------------
INSERT INTO `of_cms_column` VALUES ('1', '2', '首页', '0', '1', '首页', 'index', '首页', null, null, null, null, null, null, null, null, null, null, '0', '1', '1', null, null, '1', null);
INSERT INTO `of_cms_column` VALUES ('2', '1', '关于我们', '0', '1', '关于我们', 'about', '关于我们', '<p>中天网络科技是一家专注于从事网站建设以及企业营销活动策划的创新型互联网服务公司。我们以“创新发展，合作共赢”为经营理念！为企业、政府以及广大互联网用户提供专业的服务和易用的产品。客户包括世界500强企业等实力雄厚的企业。中天科技这个建站品牌已经慢慢深入企业的认识中，建网站，中天科技！在新世纪里，中天网络科技将会在现有的基础上，为客户提供更全面、更优质的电子商务服务，为中国互联网走向世界贡献出自己的微薄之力！</p><p>中天网络科技是一家专注于从事网站建设以及企业营销活动策划的创新型互联网服务公司。我们以“创新发展，合作共赢”为经营理念！为企业、政府以及广大互联网用户提供专业的服务和易用的产品。客户包括世界500强企业等实力雄厚的企业。中天科技这个建站品牌已经慢慢深入企业的认识中，建网站，中天科技！在新世纪里，中天网络科技将会在现有的基础上，为客户提供更全面、更优质的电子商务服务，为中国互联网走向世界贡献出自己的微薄之力</p>', '/upload/image/about.jpg', 'about.html', null, '关于我们', '关于我们', '关于我们', null, null, null, '1', '1', '1', '2018-05-19 11:10:39', '2018-08-17 17:21:27', '1', null);
INSERT INTO `of_cms_column` VALUES ('3', '1', '解决方案', '0', '1', '解决方案', 'product', '解决方案', null, '', '/product', null, null, null, null, null, null, null, '0', '1', '2', '2018-05-19 11:11:19', '2018-06-11 22:05:55', '1', null);
INSERT INTO `of_cms_column` VALUES ('4', '1', '新闻中心', '0', '1', '新闻中心', 'news', '新闻中心', null, '', null, null, null, null, null, null, null, null, '0', '1', '3', '2018-05-19 11:11:48', '2018-05-19 11:14:07', '1', null);
INSERT INTO `of_cms_column` VALUES ('5', '1', '客户案例', '0', '1', '客户案例', 'case', '客户案例', null, '/upload/image/123.jpg', 'case.html', null, null, null, null, null, null, null, '0', '1', '4', '2018-05-19 11:12:21', '2018-08-11 23:35:18', '1', null);
INSERT INTO `of_cms_column` VALUES ('6', '1', '联系我们', '0', '1', '联系我们', 'contact', '联系我们', '<p><b>中天网络科技有限公司</b></p><p>地址:&nbsp;湖南**************号</p><p>座机: +86-0731-8*******8</p><p>手机: +86-1******0</p><p>传真: +86-0731-******08</p><p>邮箱: 15******800@qq.com</p><p>网站: www.ofsoft.cn</p><p><br></p><p><img src=\"http://demo2.jeecms.com/u/cms/www/201803/29132823a0bp.jpg\" alt=\"lxwm.jpg\"></p>', '/upload/image/cantact.jpg', 'contact.html', null, '联系我们', '联系我们', '联系我们', null, null, '', '1', '1', '5', '2018-05-19 11:13:10', '2018-08-17 17:24:18', '1', null);
INSERT INTO `of_cms_column` VALUES ('7', '1', '企业网站', '3', '1', '企业网站', 'qy', '', '<p class=\"one-p\">在巨大的利益诱惑面前，人性是经不起考验的。</p><p class=\"one-p\">　　广东湛江的亿万富豪陈生捐出2亿元，拟建258套别墅赠送乡亲使用。一期建成后村民们却因分配问题矛盾重重导致好事搁浅，有人甚至对别墅恶意破坏。他为此两年都没有回乡过年，因为“一回去每个人都提要求”。</p><p class=\"one-p\">　　此事本已沸沸扬扬，3月28日经京东创始人刘强东微博转发后更是引发舆论强烈关注。AI财经社独家联系到事发地的村长及与陈生熟悉的知情人士，获悉当地镇政府已成立专门工作组争取在一个月内发布别墅分配方案，而陈生此前已经投入逾千万为村里建公共设施，村里有人甚至连平时生病都会打电话向他要钱。</p><p class=\"one-p\">　　258套免费别墅还不够分</p><p class=\"one-p\">　　在2017年胡润百富榜上以48亿元身家排行第891位的陈生，萌发给乡亲们免费修别墅的想法始于2011年。</p><p class=\"one-p\">　　这位出生于广东省湛江市遂溪县官湖村的富豪，当时看到村民住房破落，于是主动提出给常住人口修别墅、给迁出村里但每年回乡探亲的人修公寓居住。村民及村委会自然是一致赞同。据村长陈春强介绍，2013年前后有190多户常驻村民登记，陈生出资2亿元做建设费，其中主体为分两期建设的258套别墅。</p><p class=\"one-p\">　　陈生的计划其实并不只是改善居住环境。2014年他曾对媒体这样畅想：“全村22户，每户送一栋280平方米的别墅，还送5亩荔枝林，每户在新建的生猪养殖场养猪500-1000头，算下来4年后，村民年收入能达到20万元以上，也不用为上学、住房操心。”</p>', '', '', null, '', '', '', null, null, null, '1', '1', '1', '2018-05-21 16:37:13', '2018-08-17 16:40:38', '1', null);
INSERT INTO `of_cms_column` VALUES ('8', '1', '手机网站', '3', '1', '手机网站', 'mobile', '', '<p style=\"text-align: center;\"><img src=\"http://demo2.jeecms.com/u/cms/www/201610/101353469a1k.jpg\" title=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\" alt=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\"></p><p><br></p><p>今年的国庆节注定是个不平凡的节日，北京、广州、深圳、苏州、合肥等20个一二线城市相继出台楼市限购限贷政策，“深八条”、“沪六条”等严厉调控措施相继出笼，犹豫在中国大地上引爆了无数颗原子弹，看得人眼花缭乱、心惊肉跳，让人感受到了中国楼市调控“变脸术”之快、之严。&nbsp;</p><p><br></p><p>社会各界姑且会猜测，这些调控措施付诸实施之后能否成为医治楼市癫狂的灵丹妙药？房地产业服了这些调控药之后是否能走上理性、健康发展轨道？中国民众是否从此不再有楼市猛涨带来的恐慌之虞？回答无疑是否定的。因为这些调控之“药”依然没有摆脱行政窠臼，其结局也就很难跳出行政调控怪圈：“严格管制房价暂时趋缓—放松管制房价暴涨”。也就是说，出台调控措施的这些城市，楼市价格上涨趋势可能暂时会缓一缓，但过后可能又将迎来新一轮量价齐涨周期。因为中国从2005年3月底的“国八条”算起，短短十年间，中国房地产市场虽经历过无数次调控，无论是国务院的各项“通知”，还是九部委、七部委的各种“意见”，都没能阻挡住房价上涨的步伐；不少城市的房价比2005年翻了几番甚至十番都不止。每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。</p><p><br></p><p>这是为什么呢？道理其实很简单，因为我们楼市调控政策存在严重问题：一是没有理顺楼市调控的目的到底是什么，是控制住房价让老百姓买得起房，还是不要过于严厉让房地产开发商能有钱赚和地方财政有收入可进？正因为楼市调控政策总是处于摇摆不定状态，忽而严厉、忽而放松，缺乏长久可持续调控政策措施，让房地产开发商及各级地方政府形成了“耐药性”，使调控功效被抵消。二是没有割断地方政府与房地产业发展之间的各种利益关系，是让楼市调控步入市场运行机制、让市场充分发挥自发调节作用，还是继续伸出行政权力之手来生硬地管制房价或分割利益？由于这种利益关系没理顺，使一些地方政府难下决心认真调控，致使调控政策得不到认真落实走形变样；同时也会更加诱发一些地方政府竭力追求土地财政、推高房价获得足够收入搞高楼房、宽马路等城市形象政绩工程建设，使调控陷入了“死胡同”。三是没有足够底牌或也不愿意拿出有效手段来对冲楼市上涨带来的压力，使楼市调控政策软弱无力。比如保障房、经济适用房等建设速度缓慢、数量严重短缺，把一大批城市中低收入人群也逼向商品房购买行列，更加剧了楼市非理性上涨；也让政府对楼市非正常上涨现象缺乏必要平抑措施，只能望楼市价格上涨兴叹。四是对楼市上涨失控城市政府调控不力、楼市中存在各种违规行为及投机炒作行为缺乏必要法治惩治手段，使楼市失常状况难得到及时扭转。如调控政策出台之后，没有一个地方政府领导因楼市调控措施落实不力受到严肃问责，丢下官帽；没有一个开发商因弄虚作假、违规开发而被罚得倾家荡产；更没有一个楼市投机炒作者被追究刑责入狱。于是地方政府调控措施执行不力已司空见惯，开发商违规行为让人熟视无睹，投机商哄抬房价打乱楼市现象更是让人见怪不怪。</p><p><br></p><p>由此，目前中国一二线城市楼市调控政策不能只求一时轰动效应，而应把追求实实在在的长久调控效果放在首位，推动楼市调控彻底走出“屡涨屡调，屡调屡涨”怪圈：首先，制定富有弹性的楼市调控政策，确立楼市调控近期目标、中期目标和长远目标，分阶段实施，消除狂风暴雨式调控模式；把楼市调控政策制定要交给各级地方政府，建立目标考核责任制，将其纳入施政目标，让民众来打分评价，对民众不满意或房价涨幅过大的地方政府领导实施行政降级、行政记过、诫勉谈话等问责处罚，增强楼市调控政策的严肃性。其次，进一步厘清行政干预与市场调节的界限，确立地方政府在房地产市场中的责任；将房地产市场纳入法治监管轨道，对楼市调控不力的地方政府、违法违规的房地产开发及哄抬房价扰乱楼市秩序的投机商追究刑事责任，增强楼市调控的法治威慑力。再次，应尽快终结土地财政，加快税收制度改革步伐，将中央政府与地方政府事权与财权改革到位，消除地方政府对土地财政的依赖，楼市疯狂暴涨和挤泡沫才真正有希望。</p>', '', '', null, '', '', '', null, null, null, '1', '1', '2', '2018-05-21 16:50:58', '2018-08-17 16:40:34', '1', null);
INSERT INTO `of_cms_column` VALUES ('9', '1', '个人博客', '3', '1', '个人博客', 'blog', '', '<p class=\"one-p\">文章称，美国贸易代表办公室已经把“航空航天、信息和通信技术、机械”列为将要征收关税的行业。预计4月初将公布更多细节，不过白宫已经在一份200页的报告中提到了一些中国企业的名字。根据美方的报告，对美构成“最大威胁”的包括以下这6家中企：</p><p class=\"one-p\">　　美的集团(Midea Group)、中国化工(ChemChina)、中国中车(CRRC Corp)、中国商飞(Comac)和中国航空工业集团(Avic)、清华紫光(Tsinghua Unigroup)。</p><p class=\"one-p\">　　报道称，分析人士认为，这些关税背后隐藏着白宫一个更广泛的目标，即破坏“中国制造2025”(Made in China 2025)战略。对此，白宫高级贸易顾问纳瓦罗更是“直言不讳”,他在接受彭博社采访时称，该清单将主要聚焦“中国政府希望力推的高科技行业”,即“中国制造2025”所确定的行业。</p><p class=\"one-p\">　　针对美国近期在对华经贸问题上采取的一系列举措，中国商务部发言人高峰今日表示,美方的行径开启了非常恶劣的先例,对中国产品征税,这是公然违反世贸组织规则,把多边贸易体制完全抛在脑后,是对多边规则的蔑视和践踏。中方将采取一切适当的措施,坚决捍卫国家和人民的利益。希望美方悬崖勒马,否则我们将奉陪到底!</p>', '', '', null, '解决方案', '解决方案,个人博客', '解决方案-个人博客', null, null, null, '1', '1', '3', '2018-05-21 16:51:23', '2018-08-17 16:40:30', '1', null);
INSERT INTO `of_cms_column` VALUES ('12', '1', '公司新闻', '4', '1', '公司新闻', 'company', '', null, '', 'news/list_company.html', null, null, null, null, null, null, null, '0', '1', '1', '2018-06-06 21:31:35', '2018-08-12 11:07:30', '1', null);
INSERT INTO `of_cms_column` VALUES ('13', '1', '行业新闻 ', '4', '1', '行业新闻 ', 'industry', '', null, '', 'news/list_industry.html', null, null, null, null, null, null, null, '0', '1', '1', '2018-06-06 21:32:04', '2018-08-12 11:07:22', '1', null);
INSERT INTO `of_cms_column` VALUES ('14', '1', '单页测试', '0', '1', '单页测试', 'sing', null, '<p>单页测试单页测试单页测试单页测试单页测试单页测试单页测试</p>', '', '', null, '单页测试', '单页测试', '单页测试', null, null, null, '1', '2', '1', null, '2018-08-17 16:08:48', '1', null);

-- ----------------------------
-- Table structure for of_cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_comment`;
CREATE TABLE `of_cms_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `content_id` int(11) NOT NULL COMMENT '内容编号',
  `comment_type` tinyint(2) DEFAULT '1' COMMENT '评论类型',
  `comment_title` varchar(200) DEFAULT NULL COMMENT '评论标题',
  `comment_url` varchar(250) DEFAULT NULL COMMENT '评论图片',
  `comment_content` varchar(1000) NOT NULL COMMENT '评论内容',
  `comment_name` varchar(20) DEFAULT NULL COMMENT '评论人',
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `comment_ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `check_status` tinyint(2) DEFAULT '0' COMMENT '审核状态0、待审核  1、通过 2、未通过',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态:0、删除 1、正常 2、禁止',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of of_cms_comment
-- ----------------------------
INSERT INTO `of_cms_comment` VALUES ('1', '1', '45', '1', ' 测试', '1', ' 测试 测试 测试 测试 测试', '欧福', '2018-08-21 22:52:25', '127.0.0.1', null, '1', '1', null);

-- ----------------------------
-- Table structure for of_cms_content
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_content`;
CREATE TABLE `of_cms_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内容编号',
  `content_code` varchar(20) DEFAULT NULL COMMENT '内容编码',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `column_id` int(20) DEFAULT NULL COMMENT '栏目编码',
  `form_id` int(11) DEFAULT NULL COMMENT '模型模板',
  `topic_id` int(11) DEFAULT NULL COMMENT '主题编号',
  `template_path` varchar(200) DEFAULT NULL COMMENT '模板路径',
  `content_url` varchar(200) DEFAULT NULL COMMENT '外部链接',
  `title_name` varchar(200) DEFAULT NULL COMMENT '标题名称',
  `title_url` varchar(150) DEFAULT NULL COMMENT '标题图片',
  `annex` varchar(150) DEFAULT NULL COMMENT '附件',
  `title` varchar(150) DEFAULT NULL COMMENT '页面标题',
  `keywords` varchar(150) DEFAULT NULL COMMENT '关键词',
  `description` varchar(200) DEFAULT NULL COMMENT '描述文字',
  `tag` varchar(150) DEFAULT NULL COMMENT 'Tag标签',
  `is_recommend` tinyint(2) DEFAULT NULL COMMENT '是否推荐0、否1、是',
  `is_top` tinyint(2) DEFAULT NULL COMMENT '是否置顶0、否1、是',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否首页显示0、否1、是',
  `clicks` int(8) DEFAULT '0' COMMENT '点击数',
  `create_people` varchar(20) DEFAULT NULL COMMENT '发布人',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `check_status` tinyint(2) DEFAULT NULL COMMENT '审核状态0、待审核  1、通过 2、未通过',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态:0、删除 1、正常 2、回收站',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='内容表';

-- ----------------------------
-- Records of of_cms_content
-- ----------------------------
INSERT INTO `of_cms_content` VALUES ('44', null, '1', '4', '1', null, null, null, '测试一睛', null, null, null, null, null, null, null, null, null, '1', null, null, null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('45', null, '1', '2', '1', null, null, null, '关于我们', null, null, null, null, null, null, null, null, null, '475', 'admin', '2018-06-06 21:22:04', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('46', null, '1', '6', '1', null, null, null, '联系我们', null, null, null, null, null, null, null, null, null, '62', 'admin', '2018-06-06 21:40:05', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('47', null, '1', '12', '1', null, null, null, '公司上市', null, null, null, null, null, null, null, null, null, '55', 'admin', '2018-06-07 22:42:31', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('48', null, '1', '13', '1', null, null, null, '祝贺：SUNYCARE荣获安全教育大奖', null, null, null, null, null, null, null, null, null, '9', 'admin', '2018-06-07 23:39:04', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('49', null, '1', '13', '1', null, null, null, 'Parallels即将亮相2014 Macworld博览会', null, null, null, null, null, null, null, null, null, '5', 'admin', '2018-06-08 00:30:36', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('50', null, '2', '1', '1', null, null, null, '23', null, null, null, null, null, null, null, null, null, '1', 'admin', '2018-07-24 19:24:08', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('51', null, '1', '13', '1', null, null, null, '哪些中国企业会上美国贸易战打击清单', null, null, null, null, null, null, null, null, null, '3', 'admin', '2018-08-09 22:51:03', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('52', null, '1', '13', '1', null, null, null, '富豪捐258套别墅反被围堵提过分要求', null, null, null, null, null, null, null, null, null, '45', 'admin', '2018-08-09 22:51:47', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('53', null, '1', '13', '1', null, null, null, '楼市调控应跳出周期性怪圈', null, null, null, null, null, null, null, null, null, '16', 'admin', '2018-08-09 22:52:30', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('54', null, '1', '5', '1', null, null, null, 'OFCMS容管理系统官网1', null, null, null, null, null, null, null, null, null, '5', 'admin', '2018-08-11 21:10:37', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('55', null, '1', '5', '1', null, null, null, 'OFCMS容管理系统官网2', null, null, null, null, null, null, null, null, null, '3', 'admin', '2018-08-11 21:18:12', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('56', null, '1', '5', '1', null, null, null, 'OFCMS容管理系统官网3', null, null, null, null, null, null, null, null, null, '14', 'admin', '2018-08-11 21:18:37', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('57', null, '1', '5', '1', null, null, null, 'OFCMS容管理系统官网4', null, null, null, null, null, null, null, null, null, '2', 'admin', '2018-08-11 21:18:58', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('58', null, '1', '5', '1', null, null, null, 'OFCMS容管理系统官网5', null, null, null, null, null, null, null, null, null, '4', 'admin', '2018-08-11 21:19:18', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('59', null, '1', '5', '1', null, null, null, 'OFCMS容管理系统官网6', null, null, null, null, null, null, null, null, null, '33', 'admin', '2018-08-11 21:19:36', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('60', null, '1', '5', '1', null, null, null, 'OFCMS容管理系统官网7', null, null, null, null, null, null, null, null, null, '21', 'admin', '2018-08-11 21:19:57', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('61', null, '1', '5', '1', null, null, null, 'OFCMS容管理系统官网8', null, null, null, null, null, null, null, null, null, '4', 'admin', '2018-08-11 21:20:19', null, '1', '1', null);
INSERT INTO `of_cms_content` VALUES ('62', null, '1', '13', '1', '0', null, null, '测试', null, null, null, null, null, null, null, null, null, '0', 'admin', '2018-08-20 17:49:29', null, '1', '2', null);

-- ----------------------------
-- Table structure for of_cms_content_field
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_content_field`;
CREATE TABLE `of_cms_content_field` (
  `field_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字段编号',
  `content_id` int(11) NOT NULL COMMENT '内容编码',
  `form_id` int(11) NOT NULL COMMENT '模型模板',
  `name` varchar(100) NOT NULL COMMENT '字段名称',
  `value` text NOT NULL COMMENT '填写内容',
  `sort` tinyint(2) DEFAULT NULL COMMENT '排序',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COMMENT='内容字段表';

-- ----------------------------
-- Records of of_cms_content_field
-- ----------------------------
INSERT INTO `of_cms_content_field` VALUES ('76', '34', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('77', '34', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('78', '34', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('79', '34', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('80', '34', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('81', '34', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('82', '34', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('83', '34', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('84', '34', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('85', '34', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('86', '34', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('87', '34', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('88', '35', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('89', '35', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('90', '35', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('91', '35', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('92', '35', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('93', '35', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('94', '35', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('95', '35', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('96', '35', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('97', '35', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('98', '35', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('99', '35', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('100', '36', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('101', '36', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('102', '36', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('103', '36', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('104', '36', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('105', '36', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('106', '36', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('107', '36', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('108', '36', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('109', '36', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('110', '36', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('111', '36', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('112', '37', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('113', '37', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('114', '37', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('115', '37', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('116', '37', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('117', '37', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('118', '37', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('119', '37', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('120', '37', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('121', '37', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('122', '37', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('123', '37', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('124', '38', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('125', '38', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('126', '38', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('127', '38', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('128', '38', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('129', '38', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('130', '38', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('131', '38', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('132', '38', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('133', '38', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('134', '38', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('135', '38', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('136', '39', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('137', '39', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('138', '39', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('139', '39', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('140', '39', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('141', '39', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('142', '39', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('143', '39', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('144', '39', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('145', '39', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('146', '39', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('147', '39', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('148', '40', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('149', '40', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('150', '40', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('151', '40', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('152', '40', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('153', '40', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('154', '40', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('155', '40', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('156', '40', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('157', '40', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('158', '40', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('159', '40', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('160', '41', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('161', '41', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('162', '41', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('163', '41', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('164', '41', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('165', '41', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('166', '41', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('167', '41', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('168', '41', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('169', '41', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('170', '41', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('171', '41', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('172', '42', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('173', '42', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('174', '42', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('175', '42', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('176', '42', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('177', '42', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('178', '42', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('179', '42', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('180', '42', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('181', '42', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('182', '42', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('183', '42', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('184', '43', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('185', '43', '1', 'create_time', '2018-05-29 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('186', '43', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('187', '43', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('188', '43', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('189', '43', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('190', '43', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('191', '43', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('192', '43', '1', 'content', '<p style=\"text-align: justify;\">我们往往会将一堆数据分析其成分，然后抽取出结构来对其组织，往往我们碰到的最多的是表结构和其数据，结构定义和数据要分开存放，这里我们首先对其进行结构的定义，接着我们要将每一份数据进行穿针引线，做成一个体系，其实就是一个索引体系，我们要做的就是对其每一个节点的管理。而最后所建立起的索引系统可以作为一个专门的文件来存放(windows系统下面的话请参照<code>C:\\Program Files\\Java\\jdk-9.0.1\\lib\\modules</code>这个文件)，我们的结构定义作为一个专门的jar文件来存放(windows系统下面的话请参照<code>C:\\Program Files\\Java\\jdk-9.0.1\\lib\\jrt-fs.jar</code>)</p><h3 id=\"组织结构定义中基本文件的设计\" style=\"text-align: justify;\"><a href=\"https://muyinchen.github.io/2017/11/12/Refresh%20your%20Java%20skills--%E8%81%8A%E8%81%8AJava9%20%E4%B8%AD%E6%A8%A1%E5%9D%97%E5%8C%96%E6%89%80%E5%9F%BA%E4%BA%8E%E7%9A%84%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%20JRTFS/#%E7%BB%84%E7%BB%87%E7%BB%93%E6%9E%84%E5%AE%9A%E4%B9%89%E4%B8%AD%E5%9F%BA%E6%9C%AC%E6%96%87%E4%BB%B6%E7%9A%84%E8%AE%BE%E8%AE%A1\" class=\"headerlink\" title=\"组织结构定义中基本文件的设计\"></a>组织结构定义中基本文件的设计</h3><p style=\"text-align: justify;\">我们可以参考Linux文件系统，其一个文件应该包含什么样的基本属性:<code>name</code>,可读性，创建时间，最后修改时间，最后访问时间。</p><p style=\"text-align: justify;\">我们把我们的目光转向<code>jdk.internal.jrtfs</code>这个包下。找到<code>jdk.internal.jrtfs.JrtFileAttributes</code>,因为Java9要兼容Java8的东西，所以势必要做两种不一样的考虑，那么此处就应该开始做一个岔路口。里面定义了上面所说的这些基本属性。同样，我们可以看到它是基于树的节点控制来做到的。</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div><div class=\"line\">14</div><div class=\"line\">15</div><div class=\"line\">16</div><div class=\"line\">17</div><div class=\"line\">18</div><div class=\"line\">19</div><div class=\"line\">20</div><div class=\"line\">21</div><div class=\"line\">22</div><div class=\"line\">23</div><div class=\"line\">24</div><div class=\"line\">25</div><div class=\"line\">26</div><div class=\"line\">27</div><div class=\"line\">28</div><div class=\"line\">29</div><div class=\"line\">30</div><div class=\"line\">31</div><div class=\"line\">32</div><div class=\"line\">33</div><div class=\"line\">34</div><div class=\"line\">35</div><div class=\"line\">36</div><div class=\"line\">37</div><div class=\"line\">38</div><div class=\"line\">39</div><div class=\"line\">40</div><div class=\"line\">41</div><div class=\"line\">42</div><div class=\"line\">43</div><div class=\"line\">44</div><div class=\"line\">45</div><div class=\"line\">46</div><div class=\"line\">47</div><div class=\"line\">48</div><div class=\"line\">49</div><div class=\"line\">50</div><div class=\"line\">51</div><div class=\"line\">52</div><div class=\"line\">53</div><div class=\"line\">54</div><div class=\"line\">55</div><div class=\"line\">56</div><div class=\"line\">57</div><div class=\"line\">58</div><div class=\"line\">59</div><div class=\"line\">60</div><div class=\"line\">61</div><div class=\"line\">62</div><div class=\"line\">63</div><div class=\"line\">64</div><div class=\"line\">65</div><div class=\"line\">66</div><div class=\"line\">67</div><div class=\"line\">68</div><div class=\"line\">69</div><div class=\"line\">70</div><div class=\"line\">71</div><div class=\"line\">72</div><div class=\"line\">73</div><div class=\"line\">74</div><div class=\"line\">75</div><div class=\"line\">76</div><div class=\"line\">77</div><div class=\"line\">78</div><div class=\"line\">79</div><div class=\"line\">80</div><div class=\"line\">81</div><div class=\"line\">82</div><div class=\"line\">83</div><div class=\"line\">84</div><div class=\"line\">85</div><div class=\"line\">86</div><div class=\"line\">87</div><div class=\"line\">88</div><div class=\"line\">89</div><div class=\"line\">90</div><div class=\"line\">91</div><div class=\"line\">92</div><div class=\"line\">93</div><div class=\"line\">94</div><div class=\"line\">95</div><div class=\"line\">96</div><div class=\"line\">97</div><div class=\"line\">98</div><div class=\"line\">99</div><div class=\"line\">100</div><div class=\"line\">101</div><div class=\"line\">102</div><div class=\"line\">103</div><div class=\"line\">104</div><div class=\"line\">105</div><div class=\"line\">106</div><div class=\"line\">107</div><div class=\"line\">108</div><div class=\"line\">109</div><div class=\"line\">110</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"comment\">/**</span></div><div class=\"line\"> * File attributes implementation for jrt image file system.</div><div class=\"line\"> *</div><div class=\"line\"> * <span class=\"doctag\">@implNote</span> This class needs to maintain JDK 8 source compatibility.</div><div class=\"line\"> *</div><div class=\"line\"> * It is used internally in the JDK to implement jimage/jrtfs access,</div><div class=\"line\"> * but also compiled and delivered as part of the jrtfs.jar to support access</div><div class=\"line\"> * to the jimage file provided by the shipped JDK by tools running on JDK 8.</div><div class=\"line\"> */</div><div class=\"line\"><span class=\"keyword\">final</span> <span class=\"class\"><span class=\"keyword\">class</span> <span class=\"title\">JrtFileAttributes</span>  <span class=\"keyword\">implements</span> <span class=\"title\">BasicFileAttributes</span> </span>{</div><div class=\"line\"></div><div class=\"line\">    <span class=\"keyword\">private</span> <span class=\"keyword\">final</span> Node node;</div><div class=\"line\"></div><div class=\"line\">    JrtFileAttributes(Node node) {</div><div class=\"line\">        <span class=\"keyword\">this</span>.node = node;</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"comment\">///////// basic attributes ///////////</span></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> FileTime <span class=\"title\">creationTime</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.creationTime();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">boolean</span> <span class=\"title\">isDirectory</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.isDirectory();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">boolean</span> <span class=\"title\">isOther</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> <span class=\"keyword\">false</span>;</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">boolean</span> <span class=\"title\">isRegularFile</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> !isDirectory();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> FileTime <span class=\"title\">lastAccessTime</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.lastAccessTime();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> FileTime <span class=\"title\">lastModifiedTime</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.lastModifiedTime();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">long</span> <span class=\"title\">size</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.size();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">boolean</span> <span class=\"title\">isSymbolicLink</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.isLink();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> Object <span class=\"title\">fileKey</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.resolveLink(<span class=\"keyword\">true</span>);</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"comment\">///////// jrtfs specific attributes ///////////</span></div><div class=\"line\">    <span class=\"comment\">/**</span></div><div class=\"line\">     * Compressed resource file. If not available or not applicable, 0L is</div><div class=\"line\">     * returned.</div><div class=\"line\">     *</div><div class=\"line\">     * <span class=\"doctag\">@return</span> the compressed resource size for compressed resources.</div><div class=\"line\">     */</div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">long</span> <span class=\"title\">compressedSize</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.compressedSize();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"comment\">/**</span></div><div class=\"line\">     * \"file\" extension of a file resource.</div><div class=\"line\">     *</div><div class=\"line\">     * <span class=\"doctag\">@return</span> extension string for the file resource</div><div class=\"line\">     */</div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> String <span class=\"title\">extension</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> node.extension();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">final</span> String <span class=\"title\">toString</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        StringBuilder sb = <span class=\"keyword\">new</span> StringBuilder(<span class=\"number\">1024</span>);</div><div class=\"line\">        <span class=\"keyword\">try</span> (Formatter fm = <span class=\"keyword\">new</span> Formatter(sb)) {</div><div class=\"line\">            <span class=\"keyword\">if</span> (creationTime() != <span class=\"keyword\">null</span>) {</div><div class=\"line\">                fm.format(<span class=\"string\">\"    creationTime    : %tc%n\"</span>, creationTime().toMillis());</div><div class=\"line\">            } <span class=\"keyword\">else</span> {</div><div class=\"line\">                fm.format(<span class=\"string\">\"    creationTime    : null%n\"</span>);</div><div class=\"line\">            }</div><div class=\"line\">            <span class=\"keyword\">if</span> (lastAccessTime() != <span class=\"keyword\">null</span>) {</div><div class=\"line\">                fm.format(<span class=\"string\">\"    lastAccessTime  : %tc%n\"</span>, lastAccessTime().toMillis());</div><div class=\"line\">            } <span class=\"keyword\">else</span> {</div><div class=\"line\">                fm.format(<span class=\"string\">\"    lastAccessTime  : null%n\"</span>);</div><div class=\"line\">            }</div><div class=\"line\">            fm.format(<span class=\"string\">\"    lastModifiedTime: %tc%n\"</span>, lastModifiedTime().toMillis());</div><div class=\"line\">            fm.format(<span class=\"string\">\"    isRegularFile   : %b%n\"</span>, isRegularFile());</div><div class=\"line\">            fm.format(<span class=\"string\">\"    isDirectory     : %b%n\"</span>, isDirectory());</div><div class=\"line\">            fm.format(<span class=\"string\">\"    isSymbolicLink  : %b%n\"</span>, isSymbolicLink());</div><div class=\"line\">            fm.format(<span class=\"string\">\"    isOther         : %b%n\"</span>, isOther());</div><div class=\"line\">            fm.format(<span class=\"string\">\"    fileKey         : %s%n\"</span>, fileKey());</div><div class=\"line\">            fm.format(<span class=\"string\">\"    size            : %d%n\"</span>, size());</div><div class=\"line\">            fm.format(<span class=\"string\">\"    compressedSize  : %d%n\"</span>, compressedSize());</div><div class=\"line\">            fm.format(<span class=\"string\">\"    extension       : %s%n\"</span>, extension());</div><div class=\"line\">        }</div><div class=\"line\">        <span class=\"keyword\">return</span> sb.toString();</div><div class=\"line\">    }</div><div class=\"line\">}</div></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\">这样，我们就可以有组成一个树形文件系统的节点定义了。</p><h3 id=\"文件系统镜像的入口设定\" style=\"text-align: justify;\"><a href=\"https://muyinchen.github.io/2017/11/12/Refresh%20your%20Java%20skills--%E8%81%8A%E8%81%8AJava9%20%E4%B8%AD%E6%A8%A1%E5%9D%97%E5%8C%96%E6%89%80%E5%9F%BA%E4%BA%8E%E7%9A%84%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%20JRTFS/#%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%E9%95%9C%E5%83%8F%E7%9A%84%E5%85%A5%E5%8F%A3%E8%AE%BE%E5%AE%9A\" class=\"headerlink\" title=\"文件系统镜像的入口设定\"></a>文件系统镜像的入口设定</h3><p style=\"text-align: justify;\">接着通过<code>jdk.internal.jrtfs.SystemImage</code>来作为文件系统的加载入口，在初始化这个类的时候，会首先把静态代码块给执行，接着，我们会在<code>jdk.internal.jrtfs.JrtFileSystem</code>&nbsp;其构造函数中发现其调用了<code>SystemImage.open()</code>方法，可以知道其首先会检查<code>C:\\Program Files\\Java\\jdk-9.0.1\\lib\\modules</code>这个文件是否存在，存在，就使用<code>jdk.internal.jimage.ImageReader</code>中的静态内部类<code>jdk.internal.jimage.ImageReader.SharedImageReader</code>来对此文件的进行读取然后建立相应的文件系统镜像:</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div><div class=\"line\">14</div><div class=\"line\">15</div><div class=\"line\">16</div><div class=\"line\">17</div><div class=\"line\">18</div><div class=\"line\">19</div><div class=\"line\">20</div><div class=\"line\">21</div><div class=\"line\">22</div><div class=\"line\">23</div><div class=\"line\">24</div><div class=\"line\">25</div><div class=\"line\">26</div><div class=\"line\">27</div><div class=\"line\">28</div><div class=\"line\">29</div><div class=\"line\">30</div><div class=\"line\">31</div><div class=\"line\">32</div><div class=\"line\">33</div><div class=\"line\">34</div><div class=\"line\">35</div><div class=\"line\">36</div><div class=\"line\">37</div><div class=\"line\">38</div><div class=\"line\">39</div><div class=\"line\">40</div><div class=\"line\">41</div><div class=\"line\">42</div><div class=\"line\">43</div><div class=\"line\">44</div><div class=\"line\">45</div><div class=\"line\">46</div><div class=\"line\">47</div><div class=\"line\">48</div><div class=\"line\">49</div><div class=\"line\">50</div><div class=\"line\">51</div><div class=\"line\">52</div><div class=\"line\">53</div><div class=\"line\">54</div><div class=\"line\">55</div><div class=\"line\">56</div><div class=\"line\">57</div><div class=\"line\">58</div><div class=\"line\">59</div><div class=\"line\">60</div><div class=\"line\">61</div><div class=\"line\">62</div><div class=\"line\">63</div><div class=\"line\">64</div><div class=\"line\">65</div><div class=\"line\">66</div><div class=\"line\">67</div><div class=\"line\">68</div><div class=\"line\">69</div><div class=\"line\">70</div><div class=\"line\">71</div><div class=\"line\">72</div><div class=\"line\">73</div><div class=\"line\">74</div><div class=\"line\">75</div><div class=\"line\">76</div><div class=\"line\">77</div><div class=\"line\">78</div><div class=\"line\">79</div><div class=\"line\">80</div><div class=\"line\">81</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"keyword\">abstract</span> <span class=\"class\"><span class=\"keyword\">class</span> <span class=\"title\">SystemImage</span> </span>{</div><div class=\"line\"></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">abstract</span> Node <span class=\"title\">findNode</span><span class=\"params\">(String path)</span> <span class=\"keyword\">throws</span> IOException</span>;</div><div class=\"line\">    <span class=\"keyword\">abstract</span> <span class=\"keyword\">byte</span>[] getResource(Node node) <span class=\"keyword\">throws</span> IOException;</div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">abstract</span> <span class=\"keyword\">void</span> <span class=\"title\">close</span><span class=\"params\">()</span> <span class=\"keyword\">throws</span> IOException</span>;</div><div class=\"line\"></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">static</span> SystemImage <span class=\"title\">open</span><span class=\"params\">()</span> <span class=\"keyword\">throws</span> IOException </span>{</div><div class=\"line\">        <span class=\"keyword\">if</span> (modulesImageExists) {</div><div class=\"line\">            <span class=\"comment\">// open a .jimage and build directory structure</span></div><div class=\"line\">            <span class=\"keyword\">final</span> ImageReader image = ImageReader.open(moduleImageFile);</div><div class=\"line\">            image.getRootDirectory();</div><div class=\"line\">            <span class=\"keyword\">return</span> <span class=\"keyword\">new</span> SystemImage() {</div><div class=\"line\">                <span class=\"meta\">@Override</span></div><div class=\"line\">                <span class=\"function\">Node <span class=\"title\">findNode</span><span class=\"params\">(String path)</span> <span class=\"keyword\">throws</span> IOException </span>{</div><div class=\"line\">                    <span class=\"keyword\">return</span> image.findNode(path);</div><div class=\"line\">                }</div><div class=\"line\">                <span class=\"meta\">@Override</span></div><div class=\"line\">                <span class=\"keyword\">byte</span>[] getResource(Node node) <span class=\"keyword\">throws</span> IOException {</div><div class=\"line\">                    <span class=\"keyword\">return</span> image.getResource(node);</div><div class=\"line\">                }</div><div class=\"line\">                <span class=\"meta\">@Override</span></div><div class=\"line\">                <span class=\"function\"><span class=\"keyword\">void</span> <span class=\"title\">close</span><span class=\"params\">()</span> <span class=\"keyword\">throws</span> IOException </span>{</div><div class=\"line\">                    image.close();</div><div class=\"line\">                }</div><div class=\"line\">            };</div><div class=\"line\">        }</div><div class=\"line\">        <span class=\"keyword\">if</span> (Files.notExists(explodedModulesDir))</div><div class=\"line\">            <span class=\"keyword\">throw</span> <span class=\"keyword\">new</span> FileSystemNotFoundException(explodedModulesDir.toString());</div><div class=\"line\">        <span class=\"keyword\">return</span> <span class=\"keyword\">new</span> ExplodedImage(explodedModulesDir);</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"keyword\">static</span> <span class=\"keyword\">final</span> String RUNTIME_HOME;</div><div class=\"line\">    <span class=\"comment\">// \"modules\" jimage file Path</span></div><div class=\"line\">    <span class=\"keyword\">final</span> <span class=\"keyword\">static</span> Path moduleImageFile;</div><div class=\"line\">    <span class=\"comment\">// \"modules\" jimage exists or not?</span></div><div class=\"line\">    <span class=\"keyword\">final</span> <span class=\"keyword\">static</span> <span class=\"keyword\">boolean</span> modulesImageExists;</div><div class=\"line\">    <span class=\"comment\">// &lt;JAVA_HOME&gt;/modules directory Path</span></div><div class=\"line\">    <span class=\"keyword\">static</span> <span class=\"keyword\">final</span> Path explodedModulesDir;</div><div class=\"line\"></div><div class=\"line\">    <span class=\"keyword\">static</span> {</div><div class=\"line\">        PrivilegedAction&lt;String&gt; pa = SystemImage::findHome;</div><div class=\"line\">        RUNTIME_HOME = AccessController.doPrivileged(pa);</div><div class=\"line\"></div><div class=\"line\">        FileSystem fs = FileSystems.getDefault();</div><div class=\"line\">        moduleImageFile = fs.getPath(RUNTIME_HOME, <span class=\"string\">\"lib\"</span>, <span class=\"string\">\"modules\"</span>);</div><div class=\"line\">        explodedModulesDir = fs.getPath(RUNTIME_HOME, <span class=\"string\">\"modules\"</span>);</div><div class=\"line\"></div><div class=\"line\">        modulesImageExists = AccessController.doPrivileged(</div><div class=\"line\">            <span class=\"keyword\">new</span> PrivilegedAction&lt;Boolean&gt;() {</div><div class=\"line\">                <span class=\"meta\">@Override</span></div><div class=\"line\">                <span class=\"function\"><span class=\"keyword\">public</span> Boolean <span class=\"title\">run</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">                    <span class=\"keyword\">return</span> Files.isRegularFile(moduleImageFile);</div><div class=\"line\">                }</div><div class=\"line\">            });</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"comment\">/**</span></div><div class=\"line\">     * Returns the appropriate JDK home for this usage of the FileSystemProvider.</div><div class=\"line\">     * When the CodeSource is null (null loader) then jrt:/ is the current runtime,</div><div class=\"line\">     * otherwise the JDK home is located relative to jrt-fs.jar.</div><div class=\"line\">     */</div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">private</span> <span class=\"keyword\">static</span> String <span class=\"title\">findHome</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        CodeSource cs = SystemImage.class.getProtectionDomain().getCodeSource();</div><div class=\"line\">        <span class=\"keyword\">if</span> (cs == <span class=\"keyword\">null</span>)</div><div class=\"line\">            <span class=\"keyword\">return</span> System.getProperty(<span class=\"string\">\"java.home\"</span>);</div><div class=\"line\"></div><div class=\"line\">        <span class=\"comment\">// assume loaded from $TARGETJDK/lib/jrt-fs.jar</span></div><div class=\"line\">        URL url = cs.getLocation();</div><div class=\"line\">        <span class=\"keyword\">if</span> (!url.getProtocol().equalsIgnoreCase(<span class=\"string\">\"file\"</span>))</div><div class=\"line\">            <span class=\"keyword\">throw</span> <span class=\"keyword\">new</span> InternalError(url + <span class=\"string\">\" loaded in unexpected way\"</span>);</div><div class=\"line\">        <span class=\"keyword\">try</span> {</div><div class=\"line\">            Path lib = Paths.get(url.toURI()).getParent();</div><div class=\"line\">            <span class=\"keyword\">if</span> (!lib.getFileName().toString().equals(<span class=\"string\">\"lib\"</span>))</div><div class=\"line\">                <span class=\"keyword\">throw</span> <span class=\"keyword\">new</span> InternalError(url + <span class=\"string\">\" unexpected path\"</span>);</div><div class=\"line\"></div><div class=\"line\">            <span class=\"keyword\">return</span> lib.getParent().toString();</div><div class=\"line\">        } <span class=\"keyword\">catch</span> (URISyntaxException e) {</div><div class=\"line\">            <span class=\"keyword\">throw</span> <span class=\"keyword\">new</span> InternalError(e);</div><div class=\"line\">        }</div><div class=\"line\">    }</div><div class=\"line\">}</div></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\">也就是说，上面这个类的定义，我们可以把启动封装一个open方法，最后在大一统实现文件系统的时候集中调用，每个类做好自己那份事情就好。</p><p style=\"text-align: justify;\"><code>jdk.internal.jrtfs.JrtFileSystem</code>的构造器:</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div><div class=\"line\">14</div><div class=\"line\">15</div><div class=\"line\">16</div><div class=\"line\">17</div><div class=\"line\">18</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"class\"><span class=\"keyword\">class</span> <span class=\"title\">JrtFileSystem</span> <span class=\"keyword\">extends</span> <span class=\"title\">FileSystem</span> </span>{</div><div class=\"line\"></div><div class=\"line\">    <span class=\"keyword\">private</span> <span class=\"keyword\">final</span> JrtFileSystemProvider provider;</div><div class=\"line\">    <span class=\"keyword\">private</span> <span class=\"keyword\">final</span> JrtPath rootPath = <span class=\"keyword\">new</span> JrtPath(<span class=\"keyword\">this</span>, <span class=\"string\">\"/\"</span>);</div><div class=\"line\">    <span class=\"keyword\">private</span> <span class=\"keyword\">volatile</span> <span class=\"keyword\">boolean</span> isOpen;</div><div class=\"line\">    <span class=\"keyword\">private</span> <span class=\"keyword\">volatile</span> <span class=\"keyword\">boolean</span> isClosable;</div><div class=\"line\">    <span class=\"keyword\">private</span> SystemImage image;</div><div class=\"line\"></div><div class=\"line\">    JrtFileSystem(JrtFileSystemProvider provider, Map&lt;String, ?&gt; env)</div><div class=\"line\">            <span class=\"keyword\">throws</span> IOException</div><div class=\"line\">    {</div><div class=\"line\">        <span class=\"keyword\">this</span>.provider = provider;</div><div class=\"line\">        <span class=\"keyword\">this</span>.image = SystemImage.open();  <span class=\"comment\">// open image file</span></div><div class=\"line\">        <span class=\"keyword\">this</span>.isOpen = <span class=\"keyword\">true</span>;</div><div class=\"line\">        <span class=\"keyword\">this</span>.isClosable = env != <span class=\"keyword\">null</span>;</div><div class=\"line\">    }</div><div class=\"line\">...</div><div class=\"line\">}</div></pre></td></tr></tbody></table></figure><h3 id=\"提供结构定义并设定加载文件系统入口\" style=\"text-align: justify;\"><a href=\"https://muyinchen.github.io/2017/11/12/Refresh%20your%20Java%20skills--%E8%81%8A%E8%81%8AJava9%20%E4%B8%AD%E6%A8%A1%E5%9D%97%E5%8C%96%E6%89%80%E5%9F%BA%E4%BA%8E%E7%9A%84%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%20JRTFS/#%E6%8F%90%E4%BE%9B%E7%BB%93%E6%9E%84%E5%AE%9A%E4%B9%89%E5%B9%B6%E8%AE%BE%E5%AE%9A%E5%8A%A0%E8%BD%BD%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%E5%85%A5%E5%8F%A3\" class=\"headerlink\" title=\"提供结构定义并设定加载文件系统入口\"></a>提供结构定义并设定加载文件系统入口</h3><p style=\"text-align: justify;\">通过前面提到的索引数据和结构定义数据分开的可以知道，我们的结构定义也是需要有的，那么，走进<code>jdk.internal.jrtfs.JrtFileSystemProvider</code>来看看其内在乾坤，从下面的源码中可以知道，<code>JrtFileSystemProvider</code>&nbsp;会判断区分当前的环境状态(这里要求必须存在<code>C:\\Program Files\\Java\\jdk-9.0.1\\lib\\jrt-fs.jar</code>)，首先拿到<code>jrt-fs.jar</code>的路径，其实通过<code>URLClassLoader.loadClass(String name, boolean resolve)</code>得到Classloader实例，加载完这些结构定义之后，返回一个<code>FileSystem</code>实例(<code>return new JrtFileSystem(this, env);</code>)</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div><div class=\"line\">14</div><div class=\"line\">15</div><div class=\"line\">16</div><div class=\"line\">17</div><div class=\"line\">18</div><div class=\"line\">19</div><div class=\"line\">20</div><div class=\"line\">21</div><div class=\"line\">22</div><div class=\"line\">23</div><div class=\"line\">24</div><div class=\"line\">25</div><div class=\"line\">26</div><div class=\"line\">27</div><div class=\"line\">28</div><div class=\"line\">29</div><div class=\"line\">30</div><div class=\"line\">31</div><div class=\"line\">32</div><div class=\"line\">33</div><div class=\"line\">34</div><div class=\"line\">35</div><div class=\"line\">36</div><div class=\"line\">37</div><div class=\"line\">38</div><div class=\"line\">39</div><div class=\"line\">40</div><div class=\"line\">41</div><div class=\"line\">42</div><div class=\"line\">43</div><div class=\"line\">44</div><div class=\"line\">45</div><div class=\"line\">46</div><div class=\"line\">47</div><div class=\"line\">48</div><div class=\"line\">49</div><div class=\"line\">50</div><div class=\"line\">51</div><div class=\"line\">52</div><div class=\"line\">53</div><div class=\"line\">54</div><div class=\"line\">55</div><div class=\"line\">56</div><div class=\"line\">57</div><div class=\"line\">58</div><div class=\"line\">59</div><div class=\"line\">60</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"keyword\">public</span> <span class=\"keyword\">final</span> <span class=\"class\"><span class=\"keyword\">class</span> <span class=\"title\">JrtFileSystemProvider</span> <span class=\"keyword\">extends</span> <span class=\"title\">FileSystemProvider</span> </span>{</div><div class=\"line\"></div><div class=\"line\">    <span class=\"keyword\">private</span> <span class=\"keyword\">volatile</span> FileSystem theFileSystem;</div><div class=\"line\"></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"title\">JrtFileSystemProvider</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> String <span class=\"title\">getScheme</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> <span class=\"string\">\"jrt\"</span>;</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"comment\">/**</span></div><div class=\"line\">     * Need RuntimePermission \"accessSystemModules\" to create or get jrt:/</div><div class=\"line\">     */</div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">private</span> <span class=\"keyword\">void</span> <span class=\"title\">checkPermission</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        SecurityManager sm = System.getSecurityManager();</div><div class=\"line\">        <span class=\"keyword\">if</span> (sm != <span class=\"keyword\">null</span>) {</div><div class=\"line\">            RuntimePermission perm = <span class=\"keyword\">new</span> RuntimePermission(<span class=\"string\">\"accessSystemModules\"</span>);</div><div class=\"line\">            sm.checkPermission(perm);</div><div class=\"line\">        }</div><div class=\"line\">    }</div><div class=\"line\">...</div><div class=\"line\">   <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> FileSystem <span class=\"title\">newFileSystem</span><span class=\"params\">(URI uri, Map&lt;String, ?&gt; env)</span></span></div><div class=\"line\">            <span class=\"keyword\">throws</span> IOException {</div><div class=\"line\">        Objects.requireNonNull(env);</div><div class=\"line\">        checkPermission();</div><div class=\"line\">        checkUri(uri);</div><div class=\"line\">        <span class=\"keyword\">if</span> (env.containsKey(<span class=\"string\">\"java.home\"</span>)) {</div><div class=\"line\">            <span class=\"keyword\">return</span> newFileSystem((String)env.get(<span class=\"string\">\"java.home\"</span>), uri, env);</div><div class=\"line\">        } <span class=\"keyword\">else</span> {</div><div class=\"line\">            <span class=\"keyword\">return</span> <span class=\"keyword\">new</span> JrtFileSystem(<span class=\"keyword\">this</span>, env);</div><div class=\"line\">        }</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"keyword\">private</span> <span class=\"keyword\">static</span> <span class=\"keyword\">final</span> String JRT_FS_JAR = <span class=\"string\">\"jrt-fs.jar\"</span>;</div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">private</span> FileSystem <span class=\"title\">newFileSystem</span><span class=\"params\">(String targetHome, URI uri, Map&lt;String, ?&gt; env)</span></span></div><div class=\"line\">            <span class=\"keyword\">throws</span> IOException {</div><div class=\"line\">        Objects.requireNonNull(targetHome);</div><div class=\"line\">        Path jrtfs = FileSystems.getDefault().getPath(targetHome, <span class=\"string\">\"lib\"</span>, JRT_FS_JAR);</div><div class=\"line\">        <span class=\"keyword\">if</span> (Files.notExists(jrtfs)) {</div><div class=\"line\">            <span class=\"keyword\">throw</span> <span class=\"keyword\">new</span> IOException(jrtfs.toString() + <span class=\"string\">\" not exist\"</span>);</div><div class=\"line\">        }</div><div class=\"line\">        Map&lt;String,?&gt; newEnv = <span class=\"keyword\">new</span> HashMap&lt;&gt;(env);</div><div class=\"line\">        newEnv.remove(<span class=\"string\">\"java.home\"</span>);</div><div class=\"line\">        ClassLoader cl = newJrtFsLoader(jrtfs);</div><div class=\"line\">        <span class=\"keyword\">try</span> {</div><div class=\"line\">            Class&lt;?&gt; c = Class.forName(JrtFileSystemProvider.class.getName(), <span class=\"keyword\">false</span>, cl);</div><div class=\"line\">            <span class=\"meta\">@SuppressWarnings</span>(<span class=\"string\">\"deprecation\"</span>)</div><div class=\"line\">            Object tmp = c.newInstance();</div><div class=\"line\">            <span class=\"keyword\">return</span> ((FileSystemProvider)tmp).newFileSystem(uri, newEnv);</div><div class=\"line\">        } <span class=\"keyword\">catch</span> (ClassNotFoundException |</div><div class=\"line\">                 IllegalAccessException |</div><div class=\"line\">                 InstantiationException e) {</div><div class=\"line\">            <span class=\"keyword\">throw</span> <span class=\"keyword\">new</span> IOException(e);</div><div class=\"line\">        }</div><div class=\"line\">    }</div><div class=\"line\">...</div><div class=\"line\">}</div></pre></td></tr></tbody></table></figure><h3 id=\"文件系统路径定义\" style=\"text-align: justify;\"><a href=\"https://muyinchen.github.io/2017/11/12/Refresh%20your%20Java%20skills--%E8%81%8A%E8%81%8AJava9%20%E4%B8%AD%E6%A8%A1%E5%9D%97%E5%8C%96%E6%89%80%E5%9F%BA%E4%BA%8E%E7%9A%84%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%20JRTFS/#%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%E8%B7%AF%E5%BE%84%E5%AE%9A%E4%B9%89\" class=\"headerlink\" title=\"文件系统路径定义\"></a>文件系统路径定义</h3><p style=\"text-align: justify;\">既然是文件系统，路径这块总要有定义的，就好像Linux使用<code>/</code>作为根，对于Jrtfs来说，同样要有相应定义的。<code>jdk.internal.jrtfs.JrtPath</code>&nbsp;就是<code>jrt file systems</code>关于<code>Path</code>的基本实现类。</p><p style=\"text-align: justify;\">作为一个<code>Path</code>其解析的肯定是一个URI字符串路径，对于操作字符串，我们用的比较多的有切分，而且字符串内部用的比较多的同样有<code>offset</code>，和判断<code>/home/abc/ddd</code>一样，我们通过确认<code>/</code>这个约定来对文件系统进行分层，确定父子 关系，就好像我们的<code>/Base/A模块/B模块/C模块</code>,要获取某些操作，我们都需要先对这个路径以<code>/</code>做偏移量操作，以方便快速获取到某模块的名字。而我们的很多方法刚开始都会调用<code>initOffsets();</code>,那我们来看看这个方法的具体操作：</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div><div class=\"line\">14</div><div class=\"line\">15</div><div class=\"line\">16</div><div class=\"line\">17</div><div class=\"line\">18</div><div class=\"line\">19</div><div class=\"line\">20</div><div class=\"line\">21</div><div class=\"line\">22</div><div class=\"line\">23</div><div class=\"line\">24</div><div class=\"line\">25</div><div class=\"line\">26</div><div class=\"line\">27</div><div class=\"line\">28</div><div class=\"line\">29</div><div class=\"line\">30</div><div class=\"line\">31</div><div class=\"line\">32</div><div class=\"line\">33</div><div class=\"line\">34</div><div class=\"line\">35</div><div class=\"line\">36</div><div class=\"line\">37</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"comment\">// create offset list if not already created</span></div><div class=\"line\"><span class=\"comment\">//首先确定`/`的字符数量，来确定模块数量</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">private</span> <span class=\"keyword\">void</span> <span class=\"title\">initOffsets</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">if</span> (<span class=\"keyword\">this</span>.offsets == <span class=\"keyword\">null</span>) {</div><div class=\"line\">            <span class=\"keyword\">int</span> len = path.length();</div><div class=\"line\">            <span class=\"comment\">// count names</span></div><div class=\"line\">            <span class=\"keyword\">int</span> count = <span class=\"number\">0</span>;</div><div class=\"line\">            <span class=\"keyword\">int</span> off = <span class=\"number\">0</span>;</div><div class=\"line\">            <span class=\"keyword\">while</span> (off &lt; len) {</div><div class=\"line\">                <span class=\"keyword\">char</span> c = path.charAt(off++);</div><div class=\"line\">              <span class=\"comment\">//排除多个\"//...\"相连的情况，两个，三个等等，当\"/\"后面是其他的时候，说明就是一个模块</span></div><div class=\"line\">                <span class=\"keyword\">if</span> (c != <span class=\"string\">\'/\'</span>) {</div><div class=\"line\">                    count++;</div><div class=\"line\">                    off = path.indexOf(<span class=\"string\">\'/\'</span>, off);</div><div class=\"line\">                    <span class=\"keyword\">if</span> (off == -<span class=\"number\">1</span>)</div><div class=\"line\">                        <span class=\"keyword\">break</span>;</div><div class=\"line\">                }</div><div class=\"line\">            }</div><div class=\"line\">            <span class=\"comment\">// populate offsets</span></div><div class=\"line\">          <span class=\"comment\">//计算这个模块路径上，每个模块所在的偏移量位置，方便快速拿到</span></div><div class=\"line\">            <span class=\"keyword\">int</span>[] offsets = <span class=\"keyword\">new</span> <span class=\"keyword\">int</span>[count];</div><div class=\"line\">            count = <span class=\"number\">0</span>;</div><div class=\"line\">            off = <span class=\"number\">0</span>;</div><div class=\"line\">            <span class=\"keyword\">while</span> (off &lt; len) {</div><div class=\"line\">                <span class=\"keyword\">char</span> c = path.charAt(off);</div><div class=\"line\">                <span class=\"keyword\">if</span> (c == <span class=\"string\">\'/\'</span>) {</div><div class=\"line\">                    off++;</div><div class=\"line\">                } <span class=\"keyword\">else</span> {</div><div class=\"line\">                    offsets[count++] = off++;</div><div class=\"line\">                    off = path.indexOf(<span class=\"string\">\'/\'</span>, off);</div><div class=\"line\">                    <span class=\"keyword\">if</span> (off == -<span class=\"number\">1</span>)</div><div class=\"line\">                        <span class=\"keyword\">break</span>;</div><div class=\"line\">                }</div><div class=\"line\">            }</div><div class=\"line\">            <span class=\"keyword\">this</span>.offsets = offsets;</div><div class=\"line\">        }</div><div class=\"line\">    }</div></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\">然后再加入一个<code>JrtFileSystem</code>,自然很多事情就可以做到了，此处就不再多说了。</p><h3 id=\"Jrt文件系统的文件存储实现\" style=\"text-align: justify;\"><a href=\"https://muyinchen.github.io/2017/11/12/Refresh%20your%20Java%20skills--%E8%81%8A%E8%81%8AJava9%20%E4%B8%AD%E6%A8%A1%E5%9D%97%E5%8C%96%E6%89%80%E5%9F%BA%E4%BA%8E%E7%9A%84%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%20JRTFS/#Jrt%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%E7%9A%84%E6%96%87%E4%BB%B6%E5%AD%98%E5%82%A8%E5%AE%9E%E7%8E%B0\" class=\"headerlink\" title=\"Jrt文件系统的文件存储实现\"></a>Jrt文件系统的文件存储实现</h3><p style=\"text-align: justify;\">其实<code>Jrt file systems</code>的文件存储实现很简单，可以说没什么内容，因为是内存里建立起来的镜像文件系统，它也只提供了一些基本的约束，如，文件系统应该以什么为开头等等。</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div><div class=\"line\">14</div><div class=\"line\">15</div><div class=\"line\">16</div><div class=\"line\">17</div><div class=\"line\">18</div><div class=\"line\">19</div><div class=\"line\">20</div><div class=\"line\">21</div><div class=\"line\">22</div><div class=\"line\">23</div><div class=\"line\">24</div><div class=\"line\">25</div><div class=\"line\">26</div><div class=\"line\">27</div><div class=\"line\">28</div><div class=\"line\">29</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"keyword\">final</span> <span class=\"class\"><span class=\"keyword\">class</span> <span class=\"title\">JrtFileStore</span> <span class=\"keyword\">extends</span> <span class=\"title\">FileStore</span> </span>{</div><div class=\"line\"></div><div class=\"line\">    <span class=\"keyword\">protected</span> <span class=\"keyword\">final</span> FileSystem jrtfs;</div><div class=\"line\"></div><div class=\"line\">    JrtFileStore(JrtPath jrtPath) {</div><div class=\"line\">        <span class=\"keyword\">this</span>.jrtfs = jrtPath.getFileSystem();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> String <span class=\"title\">name</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> jrtfs.toString()<span class=\"comment\">/*\"jrt:/\"*/</span> + <span class=\"string\">\"/\"</span>;</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> String <span class=\"title\">type</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> <span class=\"string\">\"jrtfs\"</span>;</div><div class=\"line\">    }</div><div class=\"line\">	<span class=\"comment\">//JRT文件系统的话，返回的是true</span></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">boolean</span> <span class=\"title\">isReadOnly</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> jrtfs.isReadOnly();</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">boolean</span> <span class=\"title\">supportsFileAttributeView</span><span class=\"params\">(String name)</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> name.equals(<span class=\"string\">\"basic\"</span>) || name.equals(<span class=\"string\">\"jrt\"</span>);</div><div class=\"line\">    }</div><div class=\"line\">  ...</div><div class=\"line\">}</div></pre></td></tr></tbody></table></figure><h3 id=\"Jrtfs中文件属性视图的设定\" style=\"text-align: justify;\"><a href=\"https://muyinchen.github.io/2017/11/12/Refresh%20your%20Java%20skills--%E8%81%8A%E8%81%8AJava9%20%E4%B8%AD%E6%A8%A1%E5%9D%97%E5%8C%96%E6%89%80%E5%9F%BA%E4%BA%8E%E7%9A%84%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%20JRTFS/#Jrtfs%E4%B8%AD%E6%96%87%E4%BB%B6%E5%B1%9E%E6%80%A7%E8%A7%86%E5%9B%BE%E7%9A%84%E8%AE%BE%E5%AE%9A\" class=\"headerlink\" title=\"Jrtfs中文件属性视图的设定\"></a>Jrtfs中文件属性视图的设定</h3><p style=\"text-align: justify;\">我们在写web项目的时候，往往会使用DTO来展示这些公开的数据，对于文件系统中的文件也是，这就出现了文件属性视图的需求，包括读取和对这些公开属性的设定，比如文件的创建修改时间。</p><p style=\"text-align: justify;\">我们找到<code>java.nio.file.attribute.BasicFileAttributeView</code>这个接口，里面定义了上面所说的这些基本属性。然后我们通过<code>jdk.internal.jrtfs.JrtFileAttributeView</code>来对其进行实现。</p><p style=\"text-align: justify;\">我们可以通过文件系统类的类型是否相等来判断到底是使用老版本的通过classpath来加载的方式，还是通过Jrtfs的方式来加载。请看如下代码:</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"meta\">@SuppressWarnings</span>(<span class=\"string\">\"unchecked\"</span>) <span class=\"comment\">// Cast to V</span></div><div class=\"line\">   <span class=\"keyword\">static</span> &lt;V extends FileAttributeView&gt; <span class=\"function\">V <span class=\"title\">get</span><span class=\"params\">(JrtPath path, Class&lt;V&gt; type, LinkOption... options)</span> </span>{</div><div class=\"line\">       Objects.requireNonNull(type);</div><div class=\"line\">       <span class=\"keyword\">if</span> (type == BasicFileAttributeView.class) {</div><div class=\"line\">           <span class=\"keyword\">return</span> (V) <span class=\"keyword\">new</span> JrtFileAttributeView(path, <span class=\"keyword\">false</span>, options);</div><div class=\"line\">       }</div><div class=\"line\">       <span class=\"keyword\">if</span> (type == JrtFileAttributeView.class) {</div><div class=\"line\">           <span class=\"keyword\">return</span> (V) <span class=\"keyword\">new</span> JrtFileAttributeView(path, <span class=\"keyword\">true</span>, options);</div><div class=\"line\">       }</div><div class=\"line\">       <span class=\"keyword\">return</span> <span class=\"keyword\">null</span>;</div><div class=\"line\">   }</div></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\">也可以通过一个<code>String</code>关键字来判断:</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div><div class=\"line\">14</div><div class=\"line\">15</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"function\"><span class=\"keyword\">static</span> JrtFileAttributeView <span class=\"title\">get</span><span class=\"params\">(JrtPath path, String type, LinkOption... options)</span> </span>{</div><div class=\"line\">        Objects.requireNonNull(type);</div><div class=\"line\">        <span class=\"keyword\">if</span> (type.equals(<span class=\"string\">\"basic\"</span>)) {</div><div class=\"line\">            <span class=\"keyword\">return</span> <span class=\"keyword\">new</span> JrtFileAttributeView(path, <span class=\"keyword\">false</span>, options);</div><div class=\"line\">        }</div><div class=\"line\">        <span class=\"keyword\">if</span> (type.equals(<span class=\"string\">\"jrt\"</span>)) {</div><div class=\"line\">            <span class=\"keyword\">return</span> <span class=\"keyword\">new</span> JrtFileAttributeView(path, <span class=\"keyword\">true</span>, options);</div><div class=\"line\">        }</div><div class=\"line\">        <span class=\"keyword\">return</span> <span class=\"keyword\">null</span>;</div><div class=\"line\">    }</div><div class=\"line\"></div><div class=\"line\">    <span class=\"meta\">@Override</span></div><div class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> String <span class=\"title\">name</span><span class=\"params\">()</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">return</span> isJrtView ? <span class=\"string\">\"jrt\"</span> : <span class=\"string\">\"basic\"</span>;</div><div class=\"line\">    }</div></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\">基本属性的话，首先对所操作属性进行判断了:</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div><div class=\"line\">14</div><div class=\"line\">15</div><div class=\"line\">16</div><div class=\"line\">17</div><div class=\"line\">18</div><div class=\"line\">19</div><div class=\"line\">20</div><div class=\"line\">21</div><div class=\"line\">22</div><div class=\"line\">23</div><div class=\"line\">24</div><div class=\"line\">25</div><div class=\"line\">26</div><div class=\"line\">27</div><div class=\"line\">28</div><div class=\"line\">29</div><div class=\"line\">30</div><div class=\"line\">31</div><div class=\"line\">32</div><div class=\"line\">33</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"function\"><span class=\"keyword\">static</span> Object <span class=\"title\">attribute</span><span class=\"params\">(AttrID id, JrtFileAttributes jrtfas, <span class=\"keyword\">boolean</span> isJrtView)</span> </span>{</div><div class=\"line\">        <span class=\"keyword\">switch</span> (id) {</div><div class=\"line\">            <span class=\"keyword\">case</span> size:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.size();</div><div class=\"line\">            <span class=\"keyword\">case</span> creationTime:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.creationTime();</div><div class=\"line\">            <span class=\"keyword\">case</span> lastAccessTime:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.lastAccessTime();</div><div class=\"line\">            <span class=\"keyword\">case</span> lastModifiedTime:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.lastModifiedTime();</div><div class=\"line\">            <span class=\"keyword\">case</span> isDirectory:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.isDirectory();</div><div class=\"line\">            <span class=\"keyword\">case</span> isRegularFile:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.isRegularFile();</div><div class=\"line\">            <span class=\"keyword\">case</span> isSymbolicLink:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.isSymbolicLink();</div><div class=\"line\">            <span class=\"keyword\">case</span> isOther:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.isOther();</div><div class=\"line\">            <span class=\"keyword\">case</span> fileKey:</div><div class=\"line\">                <span class=\"keyword\">return</span> jrtfas.fileKey();</div><div class=\"line\">            <span class=\"keyword\">case</span> compressedSize:</div><div class=\"line\">                <span class=\"keyword\">if</span> (isJrtView) {</div><div class=\"line\">                    <span class=\"keyword\">return</span> jrtfas.compressedSize();</div><div class=\"line\">                }</div><div class=\"line\">                <span class=\"keyword\">break</span>;</div><div class=\"line\">            <span class=\"keyword\">case</span> extension:</div><div class=\"line\">                <span class=\"keyword\">if</span> (isJrtView) {</div><div class=\"line\">                    <span class=\"keyword\">return</span> jrtfas.extension();</div><div class=\"line\">                }</div><div class=\"line\">                <span class=\"keyword\">break</span>;</div><div class=\"line\">        }</div><div class=\"line\">        <span class=\"keyword\">return</span> <span class=\"keyword\">null</span>;</div><div class=\"line\">    }</div></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\">这里的枚举类型，也是我们这个类中定义的:</p><figure class=\"highlight java\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><div class=\"line\">1</div><div class=\"line\">2</div><div class=\"line\">3</div><div class=\"line\">4</div><div class=\"line\">5</div><div class=\"line\">6</div><div class=\"line\">7</div><div class=\"line\">8</div><div class=\"line\">9</div><div class=\"line\">10</div><div class=\"line\">11</div><div class=\"line\">12</div><div class=\"line\">13</div></pre></td><td class=\"code\"><pre><div class=\"line\"><span class=\"keyword\">private</span> <span class=\"keyword\">static</span> <span class=\"keyword\">enum</span> AttrID {</div><div class=\"line\">       size,</div><div class=\"line\">       creationTime,</div><div class=\"line\">       lastAccessTime,</div><div class=\"line\">       lastModifiedTime,</div><div class=\"line\">       isDirectory,</div><div class=\"line\">       isRegularFile,</div><div class=\"line\">       isSymbolicLink,</div><div class=\"line\">       isOther,</div><div class=\"line\">       fileKey,</div><div class=\"line\">       compressedSize,</div><div class=\"line\">       extension</div><div class=\"line\">   };</div></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\">就到此吧，关于更多对模块的解读，留在下一篇去说。</p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('193', '43', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('194', '43', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('195', '43', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('196', '43', '1', 'title_name', '文件系统的设计', null, null);
INSERT INTO `of_cms_content_field` VALUES ('197', '44', '1', 'thumbnail', 'upload/image/20180724171640.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('198', '44', '1', 'create_time', '2018-05-29 18:02:02', null, null);
INSERT INTO `of_cms_content_field` VALUES ('199', '44', '1', 'keywords', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('200', '44', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('201', '44', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('202', '44', '1', 'template_path', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('203', '44', '1', 'description', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('204', '44', '1', 'title', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('205', '44', '1', 'content', '<h3 id=\"3\" data-spm-anchor-id=\"a2c4e.11153940.blogcont59972.i0.2aeb6d32yW3W73\">lombok简介</h3><p>lombok是暑假来到公司实习的时候发现的一个非常好用的小工具，刚见到的时候就感觉非常惊艳，有一种相见恨晚的感觉，用了一段时间之后感觉的确挺不错，所以特此来推荐一下。</p><p><a href=\"https://projectlombok.org/\">lombok的官方地址：https://projectlombok.org/</a></p><p><a href=\"https://github.com/rzwitserloot/lombok\">lombok的Github地址：https://github.com/rzwitserloot/lombok</a></p><p>那么lombok到底是个什么呢，lombok是一个可以通过简单的注解的形式来帮助我们简化消除一些必须有但显得很臃肿的 Java 代码的工具，简单来说，比如我们新建了一个类，然后在其中写了几个字段，然后通常情况下我们需要手动去建立getter和setter方法啊，构造函数啊之类的，lombok的作用就是为了省去我们手动创建这些代码的麻烦，它能够在我们编译源码的时候自动帮我们生成这些方法。</p><p>lombok能够达到的效果就是在源码中不需要写一些通用的方法，但是在编译生成的字节码文件中会帮我们生成这些方法，这就是lombok的神奇作用。</p><p>虽然有人可能会说IDE里面都自带自动生成这些方法的功能，但是使用lombok会使你的代码看起来更加简洁，写起来也更加方便。</p><h3 id=\"4\">lombok安装</h3><p>lombok的安装跟一般引用jar包没有什么区别，可以到官网上下载最新的jar包，然后导入到项目里面就好啦。</p><p><span>Maven添加依赖</span></p><div class=\"sourceCode\"><pre class=\"sourceCode xml\"><code class=\"sourceCode xml hljs\"><span><span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">dependencies</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>\n    <span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">dependency</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>\n        <span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">groupId</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>org.projectlombok<span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\"><!--</span--><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">groupId</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>\n        <span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">artifactId</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>lombok<span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\"><!--</span--><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">artifactId</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>\n        <span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\">&lt;</span><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">version</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>1.16.10<span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\"><!--</span--><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">version</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>\n    <span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\"><!--</span--><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">dependency</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span>\n<span class=\"kw\"><span class=\"hljs-tag\"><span class=\"hljs-tag\"><!--</span--><span class=\"hljs-name\"><span class=\"hljs-tag\"><span class=\"hljs-name\">dependencies</span></span></span><span class=\"hljs-tag\">&gt;</span></span></span></span></span></span></span></span></span></code></pre></div><p>Intellij idea开发的话需要安装Lombok plugin，同时设置 Setting -&gt; Compiler -&gt; Annotation Processors -&gt; Enable annotation processing勾选。</p><h3 id=\"5\">lombok使用</h3><p>lombok使用过程中主要是靠注解起作用的，官网上的文档里面有所有的注解，这里不一一罗列，只说明其中几个比较常用的。</p><h4 id=\"6\"><code>@NonNull</code>: 可以帮助我们避免空指针。</h4><p>使用lombok：</p><div class=\"sourceCode\"><pre class=\"sourceCode java\"><code class=\"sourceCode java hljs\"><span><span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">import</span></span> lombok.NonNull;</span>\n    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">public</span></span></span> <span class=\"kw\"><span class=\"hljs-class\"><span class=\"hljs-keyword\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span></span></span></span></span><span class=\"hljs-class\"><span class=\"hljs-class\"> </span><span class=\"hljs-title\"><span class=\"hljs-class\"><span class=\"hljs-title\">NonNullExample</span></span></span><span class=\"hljs-class\"> </span></span><span class=\"kw\"><span class=\"hljs-class\"><span class=\"hljs-keyword\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">extends</span></span></span></span></span><span class=\"hljs-class\"><span class=\"hljs-class\"> </span><span class=\"hljs-title\"><span class=\"hljs-class\"><span class=\"hljs-title\">Something</span></span></span><span class=\"hljs-class\"> </span></span>{\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">private</span></span></span> String name;  \n        <span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-title\"><span class=\"hljs-function\"><span class=\"hljs-title\">NonNullExample</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"><span class=\"hljs-params\">(</span></span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-params\">@NonNull</span></span></span><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-function\"><span class=\"hljs-params\"> Person person)</span></span></span><span class=\"hljs-function\"> </span></span>{\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">super</span></span></span>(<span class=\"st\"><span class=\"hljs-string\"><span class=\"hljs-string\">\"Hello\"</span></span></span>);\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">this</span></span></span>.<span class=\"fu\">name</span> = person.<span class=\"fu\">getName</span>();\n    }\n}</span></code></pre></div><p>不使用lombok：</p><div class=\"sourceCode\"><pre class=\"sourceCode java\"><code class=\"sourceCode java hljs\"><span><span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">public</span></span></span> <span class=\"kw\"><span class=\"hljs-class\"><span class=\"hljs-keyword\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span></span></span></span></span><span class=\"hljs-class\"><span class=\"hljs-class\"> </span><span class=\"hljs-title\"><span class=\"hljs-class\"><span class=\"hljs-title\">NonNullExample</span></span></span><span class=\"hljs-class\"> </span></span><span class=\"kw\"><span class=\"hljs-class\"><span class=\"hljs-keyword\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">extends</span></span></span></span></span><span class=\"hljs-class\"><span class=\"hljs-class\"> </span><span class=\"hljs-title\"><span class=\"hljs-class\"><span class=\"hljs-title\">Something</span></span></span><span class=\"hljs-class\"> </span></span>{\n    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">private</span></span></span> String name;  \n    <span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-title\"><span class=\"hljs-function\"><span class=\"hljs-title\">NonNullExample</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"><span class=\"hljs-params\">(</span></span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-params\">@NonNull</span></span></span><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-function\"><span class=\"hljs-params\"> Person person)</span></span></span><span class=\"hljs-function\"> </span></span>{\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">super</span></span></span>(<span class=\"st\"><span class=\"hljs-string\"><span class=\"hljs-string\">\"Hello\"</span></span></span>);\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">if</span></span></span> (person == <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">null</span></span></span>) {\n            <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">throw</span></span></span> <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">new</span></span></span> NullPointerException(<span class=\"st\"><span class=\"hljs-string\"><span class=\"hljs-string\">\"person\"</span></span></span>);\n        }\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">this</span></span></span>.<span class=\"fu\">name</span> = person.<span class=\"fu\">getName</span>();\n    }\n}</span></code></pre></div><h4 id=\"7\"><code>@Cleanup</code>: 自动帮我们调用<code>close()</code>方法。</h4><p>使用lombok：</p><div class=\"sourceCode\"><pre class=\"sourceCode java\"><code class=\"sourceCode java hljs\"><span><span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">import</span></span> lombok.Cleanup;</span>\n<span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">import</span></span> java.io.*;</span>\n<span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">public</span></span></span> <span class=\"kw\"><span class=\"hljs-class\"><span class=\"hljs-keyword\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span></span></span></span></span><span class=\"hljs-class\"><span class=\"hljs-class\"> </span><span class=\"hljs-title\"><span class=\"hljs-class\"><span class=\"hljs-title\">CleanupExample</span></span></span><span class=\"hljs-class\"> </span></span>{\n    <span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"dt\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">static</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"dt\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-title\"><span class=\"hljs-function\"><span class=\"hljs-title\">main</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-function\"><span class=\"hljs-params\">(String[] args)</span></span></span><span class=\"hljs-function\"> </span></span><span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">throws</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> IOException </span></span>{\n        <span class=\"fu\"><span class=\"hljs-meta\"><span class=\"hljs-meta\">@Cleanup</span></span></span> InputStream in = <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">new</span></span></span> FileInputStream(args[<span class=\"dv\"><span class=\"hljs-number\">0</span></span>]);\n        <span class=\"fu\"><span class=\"hljs-meta\"><span class=\"hljs-meta\">@Cleanup</span></span></span> OutputStream out = <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">new</span></span></span> FileOutputStream(args[<span class=\"dv\"><span class=\"hljs-number\">1</span></span>]);\n        <span class=\"dt\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">byte</span></span></span>[] b = <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">new</span></span></span> <span class=\"dt\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">byte</span></span></span>[<span class=\"dv\"><span class=\"hljs-number\">10000</span></span>];\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">while</span></span></span> (<span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">true</span></span></span>) {\n            <span class=\"dt\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">int</span></span></span> r = in.<span class=\"fu\">read</span>(b);\n            <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">if</span></span></span> (r == -<span class=\"dv\"><span class=\"hljs-number\">1</span></span>) <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">break</span></span></span>;\n            out.<span class=\"fu\">write</span>(b, <span class=\"dv\"><span class=\"hljs-number\">0</span></span>, r);\n        }\n    }\n}</span></code></pre></div><p>不使用lombok：</p><div class=\"sourceCode\"><pre class=\"sourceCode java\"><code class=\"sourceCode java hljs\"><span><span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">import</span></span> java.io.*;</span>\n    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">public</span></span></span> <span class=\"kw\"><span class=\"hljs-class\"><span class=\"hljs-keyword\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span></span></span></span></span><span class=\"hljs-class\"><span class=\"hljs-class\"> </span><span class=\"hljs-title\"><span class=\"hljs-class\"><span class=\"hljs-title\">CleanupExample</span></span></span><span class=\"hljs-class\"> </span></span>{\n        <span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"dt\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">static</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"dt\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-title\"><span class=\"hljs-function\"><span class=\"hljs-title\">main</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-function\"><span class=\"hljs-params\">(String[] args)</span></span></span><span class=\"hljs-function\"> </span></span><span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">throws</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> IOException </span></span>{\n            InputStream in = <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">new</span></span></span> FileInputStream(args[<span class=\"dv\"><span class=\"hljs-number\">0</span></span>]);\n            <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">try</span></span></span> {\n                OutputStream out = <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">new</span></span></span> FileOutputStream(args[<span class=\"dv\"><span class=\"hljs-number\">1</span></span>]);\n                <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">try</span></span></span> {\n                    <span class=\"dt\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">byte</span></span></span>[] b = <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">new</span></span></span> <span class=\"dt\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">byte</span></span></span>[<span class=\"dv\"><span class=\"hljs-number\">10000</span></span>];\n                    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">while</span></span></span> (<span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">true</span></span></span>) {\n                    <span class=\"dt\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">int</span></span></span> r = in.<span class=\"fu\">read</span>(b);\n                    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">if</span></span></span> (r == -<span class=\"dv\"><span class=\"hljs-number\">1</span></span>) <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">break</span></span></span>;\n                    out.<span class=\"fu\">write</span>(b, <span class=\"dv\"><span class=\"hljs-number\">0</span></span>, r);\n                    }\n                } <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">finally</span></span></span> {\n                    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">if</span></span></span> (out != <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">null</span></span></span>) {\n                        out.<span class=\"fu\">close</span>();\n                    }\n                }\n            } <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">finally</span></span></span> {\n                <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">if</span></span></span> (in != <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">null</span></span></span>) {\n                in.<span class=\"fu\">close</span>();\n            }\n        }\n    }\n}</span></code></pre></div><h4 id=\"8\"><code>@Getter / @Setter</code>: 自动生成Getter/Setter方法</h4><p>使用lombok：</p><div class=\"sourceCode\"><pre class=\"sourceCode java\"><code class=\"sourceCode java hljs\"><span>    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">import</span></span> lombok.AccessLevel;</span>\n    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">import</span></span> lombok.Getter;</span>\n    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">import</span></span> lombok.Setter;</span>\n    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">public</span></span></span> <span class=\"kw\"><span class=\"hljs-class\"><span class=\"hljs-keyword\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span></span></span></span></span><span class=\"hljs-class\"><span class=\"hljs-class\"> </span><span class=\"hljs-title\"><span class=\"hljs-class\"><span class=\"hljs-title\">GetterSetterExample</span></span></span><span class=\"hljs-class\"> </span></span>{\n        <span class=\"fu\"><span class=\"hljs-meta\"><span class=\"hljs-meta\">@Getter</span></span></span> <span class=\"fu\"><span class=\"hljs-meta\"><span class=\"hljs-meta\">@Setter</span></span></span> <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">private</span></span></span> <span class=\"dt\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">int</span></span></span> age = <span class=\"dv\"><span class=\"hljs-number\">10</span></span>;\n        <span class=\"fu\"><span class=\"hljs-meta\"><span class=\"hljs-meta\">@Setter</span></span></span>(AccessLevel.<span class=\"fu\">PROTECTED</span>) <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">private</span></span></span> String name;\n    }</span></code></pre></div><p>不使用lombok：</p><div class=\"sourceCode\"><pre class=\"sourceCode java\"><code class=\"sourceCode java hljs\"><span><span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">public</span></span></span> <span class=\"kw\"><span class=\"hljs-class\"><span class=\"hljs-keyword\"><span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span></span></span></span></span><span class=\"hljs-class\"><span class=\"hljs-class\"> </span><span class=\"hljs-title\"><span class=\"hljs-class\"><span class=\"hljs-title\">GetterSetterExample</span></span></span><span class=\"hljs-class\"> </span></span>{\n    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">private</span></span></span> <span class=\"dt\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">int</span></span></span> age = <span class=\"dv\"><span class=\"hljs-number\">10</span></span>;\n    <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">private</span></span></span> String name;\n    <span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"dt\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">int</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-title\"><span class=\"hljs-function\"><span class=\"hljs-title\">getAge</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-function\"><span class=\"hljs-params\">()</span></span></span><span class=\"hljs-function\"> </span></span>{\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">return</span></span></span> age;\n    }\n    <span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"dt\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-title\"><span class=\"hljs-function\"><span class=\"hljs-title\">setAge</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"><span class=\"hljs-params\">(</span></span></span><span class=\"dt\"><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-keyword\">int</span></span></span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-function\"><span class=\"hljs-params\"> age)</span></span></span><span class=\"hljs-function\"> </span></span>{\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">this</span></span></span>.<span class=\"fu\">age</span> = age;\n    }\n    <span class=\"kw\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">protected</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"dt\"><span class=\"hljs-function\"><span class=\"hljs-keyword\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-function\"> </span></span><span class=\"fu\"><span class=\"hljs-function\"><span class=\"hljs-title\"><span class=\"hljs-function\"><span class=\"hljs-title\">setName</span></span></span></span></span><span class=\"hljs-function\"><span class=\"hljs-params\"><span class=\"hljs-function\"><span class=\"hljs-params\">(String name)</span></span></span><span class=\"hljs-function\"> </span></span>{\n        <span class=\"kw\"><span class=\"hljs-keyword\"><span class=\"hljs-keyword\">this</span></span></span>.<span class=\"fu\">name</span> = name;\n    }\n}</span></code></pre></div><h4 id=\"9\"><code>@NoArgsConstructor</code>: 自动生成无参数构造函数。</h4><h4 id=\"10\"><code>@AllArgsConstructor</code>: 自动生成全参数构造函数。</h4><h4 id=\"11\" data-spm-anchor-id=\"a2c4e.11153940.blogcont59972.i1.2aeb6d32yW3W73\"><code>@Data</code>:&nbsp;<a href=\"mailto:%E8%87%AA%E5%8A%A8%E4%B8%BA%E6%89%80%E6%9C%89%E5%AD%97%E6%AE%B5%E6%B7%BB%E5%8A%A0@ToString\">自动为所有字段添加@ToString</a>, @EqualsAndHashCode, @Getter方法，<a href=\"mailto:%E4%B8%BA%E9%9D%9Efinal%E5%AD%97%E6%AE%B5%E6%B7%BB%E5%8A%A0@Setter\">为非final字段添加@Setter</a>,<a href=\"mailto:%E5%92%8C@RequiredArgsConstructor\">和@RequiredArgsConstructor</a>!</h4>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('206', '44', '1', 'column_id', '4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('207', '44', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('208', '44', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('209', '44', '1', 'title_name', 'Lombok介绍及使用方法 lombok', null, null);
INSERT INTO `of_cms_content_field` VALUES ('210', '45', '1', 'column_id', '2', null, null);
INSERT INTO `of_cms_content_field` VALUES ('211', '45', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('212', '45', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('213', '45', '1', 'create_time', '2018-06-06 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('214', '45', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('215', '45', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('216', '45', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('217', '45', '1', 'title_name', '关于我们', null, null);
INSERT INTO `of_cms_content_field` VALUES ('218', '45', '1', 'content', '<p style=\"text-align: left;\"><span>中天网络科技是一家专注于从事网站建设以及企业营销活动策划的创新型互联网服务公司。我们以“创新发展，合作共赢”为经营理念！为企业、政府以及广大互联网用户提供专业的服务和易用的产品。客户包括世界500强企业等实力雄厚的企业。中天科技这个建站品牌已经慢慢深入企业的认识中，建网站，中天科技！在新世纪里，中天网络科技将会在现有的基础上，为客户提供更全面、更优质的电子商务服务，为中国互联网走向世界贡献出自己的微薄之力！</span></p><p style=\"text-align: left;\">中天网络科技是一家专注于从事网站建设以及企业营销活动策划的创新型互联网服务公司。我们以“创新发展，合作共赢”为经营理念！为企业、政府以及广大互联网用户提供专业的服务和易用的产品。客户包括世界500强企业等实力雄厚的企业。中天科技这个建站品牌已经慢慢深入企业的认识中，建网站，中天科技！在新世纪里，中天网络科技将会在现有的基础上，为客户提供更全面、更优质的电子商务服务，为中国互联网走向世界贡献出自己的微薄之力</p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('219', '46', '1', 'column_id', '6', null, null);
INSERT INTO `of_cms_content_field` VALUES ('220', '46', '1', 'thumbnail', '/upload/image/20180724171640.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('221', '46', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('222', '46', '1', 'create_time', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('223', '46', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('224', '46', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('225', '46', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('226', '46', '1', 'title_name', '联系我们', null, null);
INSERT INTO `of_cms_content_field` VALUES ('227', '46', '1', 'content', '<p><b><span>中天网络</span>科技有限公司</b></p><p>地址:&nbsp;湖南**************号</p><p>座机: +86-0731-8*******8</p><p>手机: +86-1******0</p><p>传真: +86-0731-******08</p><p>邮箱: 15******800@qq.com</p><p><span>网站: www.ofsoft.cn</span></p><p><span><br></span></p><p><img src=\"http://demo2.jeecms.com/u/cms/www/201803/29132823a0bp.jpg\" alt=\"lxwm.jpg\"></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('228', '47', '1', 'column_id', '12', null, null);
INSERT INTO `of_cms_content_field` VALUES ('229', '47', '1', 'thumbnail', '/upload/image/20180724171640.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('230', '47', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('231', '47', '1', 'create_time', '2018-06-08 12:20:34', null, null);
INSERT INTO `of_cms_content_field` VALUES ('232', '47', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('233', '47', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('234', '47', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('235', '47', '1', 'title_name', '公司上市', null, null);
INSERT INTO `of_cms_content_field` VALUES ('236', '47', '1', 'content', '<p>自1985年创立以来，Macworld博览会已经成为全球最具影响力的苹果生态圈的盛会。本届博览会以“创新定义未来”为主题，将于8月21日在北京国家会议中心拉开帷幕。届时，Parallels也会参加此次博览会，向消费者展示其创新的产品与技术。      “在技术更迭如此快速的今天，创新是企业可持续发展的驱动力。” Parallel<span>近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。</span></p><p><br></p><p>据美国科技新闻网站AppleInsider报道，联邦通信委员会的数据库中出现了这款苹果尚未对外宣布的新产品，其螺丝位置和设备外壳的大小，类似于第四代苹果机顶盒。</p><p><br></p><p>苹果一直拥有对外保密的传统，而在这款新设备中，苹果也要求不对外泄漏相关信息，因此媒体无法判断到底作何用途。</p><p><br></p><p>这款设备使用的型号A1844，目前并未被苹果发售的商品使用过。</p><p><br></p><p>据称，该设备的电源参数为5.5V到13.2V,输出电流为100毫安，峰值为700毫安。这些参数有别于苹果最新的机顶盒，其电源参数为12V、920毫安。</p><p><br></p><p>这款设备还具有蓝牙通信和NFC（近场通信）功能，美国联邦通信委员会也对这些通信功能进行了测试，相关的无线电通信功能也是这款设备提交到该机构进行测试的原因。</p><p><br></p><p>这一设备没有进行Wi-Fi通信测试，可能意味着会采用目前某个设备的Wi-Fi通信技术，或者根本就不具备Wi-Fi通信功能。</p><p><br></p><p>此前，外部机构曾经对苹果第四代机顶盒进行过拆解，相关的螺丝位置，和此次对外披露的设备有类似之处。</p><p><br></p><p>近些年，苹果的研发资源集中在了智能手机、平板电脑等领域，传统的机顶盒似乎受到了冷落。去年，在长期不更新之后，苹果推出了全新第四代的机顶盒，苹果推出了专有的机顶盒操作系统，在遥控器中植入了语音操控工具Siri。库克也表示，电视的未来是应用软件。</p><p><br></p><p>苹果也围绕机顶盒构建了一个客厅互联网的生态系统，许多第三方开发商正在为苹果机顶盒开发电视端的应用软件。</p><p><br></p><p style=\"text-align: center;\"><img src=\"http://demo2.jeecms.com/u/cms/www/201609/230943156ihf.jpg\" title=\"138679317.jpg\" alt=\"138679317.jpg\"></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('237', '48', '1', 'column_id', '13', null, null);
INSERT INTO `of_cms_content_field` VALUES ('238', '48', '1', 'thumbnail', '/upload/image/20180724171640.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('239', '48', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('240', '48', '1', 'create_time', '2018-08-16 02:03:03', null, null);
INSERT INTO `of_cms_content_field` VALUES ('241', '48', '1', 'author', 'OF', null, null);
INSERT INTO `of_cms_content_field` VALUES ('242', '48', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('243', '48', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('244', '48', '1', 'title_name', '祝贺：SUNYCARE荣获安全教育大奖', null, null);
INSERT INTO `of_cms_content_field` VALUES ('245', '48', '1', 'content', '自1985年创立以来，Macworld博览会已经成为全球最具影响力的苹果生态圈的盛会。本届博览会以“创新定义未来”为主题，将于8月21日在北京国家会议中心拉开帷幕。届时，Parallels也会参加此次博览会，向消费者展示其创新的产品与技术。      “在技术更迭如此快速的今天，创新是企业可持续发展的驱动力。” Parallel', null, null);
INSERT INTO `of_cms_content_field` VALUES ('246', '49', '1', 'column_id', '13', null, null);
INSERT INTO `of_cms_content_field` VALUES ('247', '49', '1', 'thumbnail', '/upload/image/20180724171640.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('248', '49', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('249', '49', '1', 'create_time', '2018-06-08 12:20:34', null, null);
INSERT INTO `of_cms_content_field` VALUES ('250', '49', '1', 'author', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('251', '49', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('252', '49', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('253', '49', '1', 'title_name', 'Parallels即将亮相2014 Macworld博览会', null, null);
INSERT INTO `of_cms_content_field` VALUES ('254', '49', '1', 'content', '<span>&nbsp;&nbsp;自1985年创立以来，Macworld博览会已经成为全球最具影响力的苹果生态圈的盛会。本届博览会以“创新定义未来”为主题，将于8月21日在北京国家会议中心拉开帷幕。届时，Parallels也会参加此次博览会，向消费者展示其创新的产品与技术。</span></p><p><span>&nbsp; &nbsp; &nbsp; “在技术更迭如此快速的今天，创新是企业可持续发展的驱动力。” Parallels大中华区跨平台应用销售总监赵信荣先生表示：“在此次博览会上，Parallels将向消费者展示我们在提升用户体验方面所做的不懈努力。此外，博览会也为我们与消费者之间建立了一个很好的平台，以倾听他们的心声，让我们持续地为他们带来创新的产品与技术。”<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 此次Parallels展台位于国家会议中心A110。为了使消费者更加近距离地了解旗下产品并回答消费者的问题，Parallels还将在8月22-24日期间在会场中央展示区上进行四场产品咨询与技术创新成果的展示。具体展示时间分别为：<br>　　8月22日13:40—14:00<br>　　8月23日11:30—11:50；15:20-15:40<br>　　8月24日11:00—11:20<br>&nbsp; &nbsp; &nbsp; 同时，Parallels也为参访Parallels展台的媒体和观众朋友准备精美的礼品包，先到先得。欢迎大家前去参与领取。想要了解更多关于Parallels的相关信息，不妨8月21日前往国家会议中心Parallels Macworld展台一探究竟。</span>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('255', '50', '1', 'column_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('256', '50', '1', 'thumbnail', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('257', '50', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('258', '50', '1', 'create_time', '2018-07-24 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('259', '50', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('260', '50', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('261', '50', '1', 'site_id', '2', null, null);
INSERT INTO `of_cms_content_field` VALUES ('262', '50', '1', 'title_name', '23', null, null);
INSERT INTO `of_cms_content_field` VALUES ('263', '50', '1', 'content', '123', null, null);
INSERT INTO `of_cms_content_field` VALUES ('264', '51', '1', 'column_id', '13', null, null);
INSERT INTO `of_cms_content_field` VALUES ('265', '51', '1', 'thumbnail', '/upload/image/20180724171640.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('266', '51', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('267', '51', '1', 'create_time', '2018-08-09 21:02:09', null, null);
INSERT INTO `of_cms_content_field` VALUES ('268', '51', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('269', '51', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('270', '51', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('271', '51', '1', 'title_name', '哪些中国企业会上美国贸易战打击清单', null, null);
INSERT INTO `of_cms_content_field` VALUES ('272', '51', '1', 'content', '<p class=\"one-p\">文章称，美国贸易代表办公室已经把“航空航天、信息和通信技术、机械”列为将要征收关税的行业。预计4月初将公布更多细节，不过白宫已经在一份200页的报告中提到了一些中国企业的名字。根据美方的报告，对美构成“最大威胁”的包括以下这6家中企：</p><p class=\"one-p\">　　美的集团(Midea Group)、中国化工(ChemChina)、中国中车(CRRC Corp)、中国商飞(Comac)和中国航空工业集团(Avic)、清华紫光(Tsinghua Unigroup)。</p><p class=\"one-p\">　　报道称，分析人士认为，这些关税背后隐藏着白宫一个更广泛的目标，即破坏“中国制造2025”(Made in China 2025)战略。对此，白宫高级贸易顾问纳瓦罗更是“直言不讳”,他在接受彭博社采访时称，该清单将主要聚焦“中国政府希望力推的高科技行业”,即“中国制造2025”所确定的行业。</p><p class=\"one-p\">　　针对美国近期在对华经贸问题上采取的一系列举措，中国商务部发言人高峰今日表示,美方的行径开启了非常恶劣的先例,对中国产品征税,这是公然违反世贸组织规则,把多边贸易体制完全抛在脑后,是对多边规则的蔑视和践踏。中方将采取一切适当的措施,坚决捍卫国家和人民的利益。希望美方悬崖勒马,否则我们将奉陪到底!</p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('273', '52', '1', 'column_id', '13', null, null);
INSERT INTO `of_cms_content_field` VALUES ('274', '52', '1', 'thumbnail', '/upload/image/20180724171640.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('275', '52', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('276', '52', '1', 'create_time', '2018-08-09 14:04:04', null, null);
INSERT INTO `of_cms_content_field` VALUES ('277', '52', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('278', '52', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('279', '52', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('280', '52', '1', 'title_name', '富豪捐258套别墅反被围堵提过分要求', null, null);
INSERT INTO `of_cms_content_field` VALUES ('281', '52', '1', 'content', '<p class=\"one-p\">在巨大的利益诱惑面前，人性是经不起考验的。</p><p class=\"one-p\">　　广东湛江的亿万富豪陈生捐出2亿元，拟建258套别墅赠送乡亲使用。一期建成后村民们却因分配问题矛盾重重导致好事搁浅，有人甚至对别墅恶意破坏。他为此两年都没有回乡过年，因为“一回去每个人都提要求”。</p><p class=\"one-p\">　　此事本已沸沸扬扬，3月28日经京东创始人刘强东微博转发后更是引发舆论强烈关注。AI财经社独家联系到事发地的村长及与陈生熟悉的知情人士，获悉当地镇政府已成立专门工作组争取在一个月内发布别墅分配方案，而陈生此前已经投入逾千万为村里建公共设施，村里有人甚至连平时生病都会打电话向他要钱。</p><p class=\"one-p\">　　258套免费别墅还不够分</p><p class=\"one-p\">　　在2017年胡润百富榜上以48亿元身家排行第891位的陈生，萌发给乡亲们免费修别墅的想法始于2011年。</p><p class=\"one-p\">　　这位出生于广东省湛江市遂溪县官湖村的富豪，当时看到村民住房破落，于是主动提出给常住人口修别墅、给迁出村里但每年回乡探亲的人修公寓居住。村民及村委会自然是一致赞同。据村长陈春强介绍，2013年前后有190多户常驻村民登记，陈生出资2亿元做建设费，其中主体为分两期建设的258套别墅。</p><p class=\"one-p\">　　陈生的计划其实并不只是改善居住环境。2014年他曾对媒体这样畅想：“全村22户，每户送一栋280平方米的别墅，还送5亩荔枝林，每户在新建的生猪养殖场养猪500-1000头，算下来4年后，村民年收入能达到20万元以上，也不用为上学、住房操心。”</p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('282', '53', '1', 'column_id', '13', null, null);
INSERT INTO `of_cms_content_field` VALUES ('283', '53', '1', 'thumbnail', '/upload/image/20180724171640.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('284', '53', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('285', '53', '1', 'create_time', '2018-08-09 18:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('286', '53', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('287', '53', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('288', '53', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('289', '53', '1', 'title_name', '楼市调控应跳出周期性怪圈', null, null);
INSERT INTO `of_cms_content_field` VALUES ('290', '53', '1', 'content', '<p style=\"text-align: center;\"><img src=\"http://demo2.jeecms.com/u/cms/www/201610/101353469a1k.jpg\" title=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\" alt=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\"></p><p><br></p><p>今年的国庆节注定是个不平凡的节日，北京、广州、深圳、苏州、合肥等20个一二线城市相继出台楼市限购限贷政策，“深八条”、“沪六条”等严厉调控措施相继出笼，犹豫在中国大地上引爆了无数颗原子弹，看得人眼花缭乱、心惊肉跳，让人感受到了中国楼市调控“变脸术”之快、之严。&nbsp;</p><p><br></p><p>社会各界姑且会猜测，这些调控措施付诸实施之后能否成为医治楼市癫狂的灵丹妙药？房地产业服了这些调控药之后是否能走上理性、健康发展轨道？中国民众是否从此不再有楼市猛涨带来的恐慌之虞？回答无疑是否定的。因为这些调控之“药”依然没有摆脱行政窠臼，其结局也就很难跳出行政调控怪圈：“严格管制房价暂时趋缓—放松管制房价暴涨”。也就是说，出台调控措施的这些城市，楼市价格上涨趋势可能暂时会缓一缓，但过后可能又将迎来新一轮量价齐涨周期。因为中国从2005年3月底的“国八条”算起，短短十年间，中国房地产市场虽经历过无数次调控，无论是国务院的各项“通知”，还是九部委、七部委的各种“意见”，都没能阻挡住房价上涨的步伐；不少城市的房价比2005年翻了几番甚至十番都不止。每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。</p><p><br></p><p>这是为什么呢？道理其实很简单，因为我们楼市调控政策存在严重问题：一是没有理顺楼市调控的目的到底是什么，是控制住房价让老百姓买得起房，还是不要过于严厉让房地产开发商能有钱赚和地方财政有收入可进？正因为楼市调控政策总是处于摇摆不定状态，忽而严厉、忽而放松，缺乏长久可持续调控政策措施，让房地产开发商及各级地方政府形成了“耐药性”，使调控功效被抵消。二是没有割断地方政府与房地产业发展之间的各种利益关系，是让楼市调控步入市场运行机制、让市场充分发挥自发调节作用，还是继续伸出行政权力之手来生硬地管制房价或分割利益？由于这种利益关系没理顺，使一些地方政府难下决心认真调控，致使调控政策得不到认真落实走形变样；同时也会更加诱发一些地方政府竭力追求土地财政、推高房价获得足够收入搞高楼房、宽马路等城市形象政绩工程建设，使调控陷入了“死胡同”。三是没有足够底牌或也不愿意拿出有效手段来对冲楼市上涨带来的压力，使楼市调控政策软弱无力。比如保障房、经济适用房等建设速度缓慢、数量严重短缺，把一大批城市中低收入人群也逼向商品房购买行列，更加剧了楼市非理性上涨；也让政府对楼市非正常上涨现象缺乏必要平抑措施，只能望楼市价格上涨兴叹。四是对楼市上涨失控城市政府调控不力、楼市中存在各种违规行为及投机炒作行为缺乏必要法治惩治手段，使楼市失常状况难得到及时扭转。如调控政策出台之后，没有一个地方政府领导因楼市调控措施落实不力受到严肃问责，丢下官帽；没有一个开发商因弄虚作假、违规开发而被罚得倾家荡产；更没有一个楼市投机炒作者被追究刑责入狱。于是地方政府调控措施执行不力已司空见惯，开发商违规行为让人熟视无睹，投机商哄抬房价打乱楼市现象更是让人见怪不怪。</p><p><br></p><p>由此，目前中国一二线城市楼市调控政策不能只求一时轰动效应，而应把追求实实在在的长久调控效果放在首位，推动楼市调控彻底走出“屡涨屡调，屡调屡涨”怪圈：首先，制定富有弹性的楼市调控政策，确立楼市调控近期目标、中期目标和长远目标，分阶段实施，消除狂风暴雨式调控模式；把楼市调控政策制定要交给各级地方政府，建立目标考核责任制，将其纳入施政目标，让民众来打分评价，对民众不满意或房价涨幅过大的地方政府领导实施行政降级、行政记过、诫勉谈话等问责处罚，增强楼市调控政策的严肃性。其次，进一步厘清行政干预与市场调节的界限，确立地方政府在房地产市场中的责任；将房地产市场纳入法治监管轨道，对楼市调控不力的地方政府、违法违规的房地产开发及哄抬房价扰乱楼市秩序的投机商追究刑事责任，增强楼市调控的法治威慑力。再次，应尽快终结土地财政，加快税收制度改革步伐，将中央政府与地方政府事权与财权改革到位，消除地方政府对土地财政的依赖，楼市疯狂暴涨和挤泡沫才真正有希望。</p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('291', '54', '1', 'column_id', '5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('292', '54', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('293', '54', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('294', '54', '1', 'create_time', '2018-08-11 02:03:03', null, null);
INSERT INTO `of_cms_content_field` VALUES ('295', '54', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('296', '54', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('297', '54', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('298', '54', '1', 'title_name', 'OFCMS容管理系统官网1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('299', '54', '1', 'content', '<p>OFCMS容管理系统官网</p><p><br></p><p><img src=\"http://localhost:8081/ofcms-admin/upload/image/cast01.png\" alt=\"cast01.png\"><br></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('300', '55', '1', 'column_id', '5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('301', '55', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('302', '55', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('303', '55', '1', 'create_time', '2018-08-11 03:04:03', null, null);
INSERT INTO `of_cms_content_field` VALUES ('304', '55', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('305', '55', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('306', '55', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('307', '55', '1', 'title_name', 'OFCMS容管理系统官网2', null, null);
INSERT INTO `of_cms_content_field` VALUES ('308', '55', '1', 'content', '<p><a href=\"http://localhost:8081/ofcms-admin/admin/f.html?p=cms/content/index.html\">OFCMS容管理系统官网</a></p><p><br></p><p><img src=\"http://localhost:8081/ofcms-admin/upload/image/cast01.png\" alt=\"cast014.png\"><br></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('309', '56', '1', 'column_id', '5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('310', '56', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('311', '56', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('312', '56', '1', 'create_time', '2018-08-11 03:03:03', null, null);
INSERT INTO `of_cms_content_field` VALUES ('313', '56', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('314', '56', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('315', '56', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('316', '56', '1', 'title_name', 'OFCMS容管理系统官网3', null, null);
INSERT INTO `of_cms_content_field` VALUES ('317', '56', '1', 'content', '<p><a href=\"http://localhost:8081/ofcms-admin/admin/f.html?p=cms/content/index.html\">OFCMS容管理系统官网</a></p><p><br></p><p><img src=\"http://localhost:8081/ofcms-admin/upload/image/cast01.png\" alt=\"cast016.png\"><br></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('318', '57', '1', 'column_id', '5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('319', '57', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('320', '57', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('321', '57', '1', 'create_time', '2018-08-11 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('322', '57', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('323', '57', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('324', '57', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('325', '57', '1', 'title_name', 'OFCMS容管理系统官网4', null, null);
INSERT INTO `of_cms_content_field` VALUES ('326', '57', '1', 'content', '<p><a href=\"http://localhost:8081/ofcms-admin/admin/f.html?p=cms/content/index.html\">OFCMS容管理系统官网</a></p><p><img src=\"http://localhost:8081/ofcms-admin/upload/image/cast01.png\" alt=\"cast018.png\"><br></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('327', '58', '1', 'column_id', '5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('328', '58', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('329', '58', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('330', '58', '1', 'create_time', '2018-08-11 03:04:03', null, null);
INSERT INTO `of_cms_content_field` VALUES ('331', '58', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('332', '58', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('333', '58', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('334', '58', '1', 'title_name', 'OFCMS容管理系统官网5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('335', '58', '1', 'content', '<p><a href=\"http://localhost:8081/ofcms-admin/admin/f.html?p=cms/content/index.html\">OFCMS容管理系统官网</a></p><p><img src=\"http://localhost:8081/ofcms-admin/upload/image/cast01.png\" alt=\"cast01.png\"><br></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('336', '59', '1', 'column_id', '5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('337', '59', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('338', '59', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('339', '59', '1', 'create_time', '2018-08-11 03:03:03', null, null);
INSERT INTO `of_cms_content_field` VALUES ('340', '59', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('341', '59', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('342', '59', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('343', '59', '1', 'title_name', 'OFCMS容管理系统官网6', null, null);
INSERT INTO `of_cms_content_field` VALUES ('344', '59', '1', 'content', '<p><a href=\"http://localhost:8081/ofcms-admin/admin/f.html?p=cms/content/index.html\">OFCMS容管理系统官网</a></p><p><img src=\"http://localhost:8081/ofcms-admin/upload/image/cast01.png\" alt=\"cast01.png\"><br></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('345', '60', '1', 'column_id', '5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('346', '60', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('347', '60', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('348', '60', '1', 'create_time', '2018-08-11 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('349', '60', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('350', '60', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('351', '60', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('352', '60', '1', 'title_name', 'OFCMS容管理系统官网7', null, null);
INSERT INTO `of_cms_content_field` VALUES ('353', '60', '1', 'content', '<p><a href=\"http://localhost:8081/ofcms-admin/admin/f.html?p=cms/content/index.html\">OFCMS容管理系统官网</a></p><p><img src=\"http://localhost:8081/ofcms-admin/upload/image/cast01.png\" alt=\"cast01.png\"><br></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('354', '61', '1', 'column_id', '5', null, null);
INSERT INTO `of_cms_content_field` VALUES ('355', '61', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('356', '61', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('357', '61', '1', 'create_time', '2018-08-11 00:00:00', null, null);
INSERT INTO `of_cms_content_field` VALUES ('358', '61', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('359', '61', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('360', '61', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('361', '61', '1', 'title_name', 'OFCMS容管理系统官网8', null, null);
INSERT INTO `of_cms_content_field` VALUES ('362', '61', '1', 'content', '<p><a href=\"http://localhost:8081/ofcms-admin/admin/f.html?p=cms/content/index.html\">OFCMS容管理系统官网</a></p><p><img src=\"http://localhost:8081/ofcms-admin/upload/image/cast01.png\" alt=\"cast01.png\"><br></p>', null, null);
INSERT INTO `of_cms_content_field` VALUES ('363', '62', '1', 'column_id', '13', null, null);
INSERT INTO `of_cms_content_field` VALUES ('364', '62', '1', 'thumbnail', '/upload/image/cast01.png', null, null);
INSERT INTO `of_cms_content_field` VALUES ('365', '62', '1', 'file', '', null, null);
INSERT INTO `of_cms_content_field` VALUES ('366', '62', '1', 'create_time', '2018-08-20 04:04:04', null, null);
INSERT INTO `of_cms_content_field` VALUES ('367', '62', '1', 'author', 'of', null, null);
INSERT INTO `of_cms_content_field` VALUES ('368', '62', '1', 'form_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('369', '62', '1', 'site_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('370', '62', '1', 'title_name', '测试', null, null);
INSERT INTO `of_cms_content_field` VALUES ('371', '62', '1', 'topic_id', '1', null, null);
INSERT INTO `of_cms_content_field` VALUES ('372', '62', '1', 'content', '123', null, null);

-- ----------------------------
-- Table structure for of_cms_count
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_count`;
CREATE TABLE `of_cms_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `count_date` date DEFAULT NULL COMMENT '统计日期',
  `count_time` time DEFAULT NULL COMMENT '统计时间',
  `day_content_count` int(11) DEFAULT NULL COMMENT '今日内容数',
  `total_content_count` int(11) DEFAULT NULL COMMENT '累计内容数',
  `day_access_count` int(11) DEFAULT NULL COMMENT '今日访问数',
  `total_access_count` int(11) DEFAULT NULL COMMENT '累计访问数',
  `day_comment_count` int(11) DEFAULT NULL COMMENT '今日评论数',
  `total_comment_count` int(11) DEFAULT NULL COMMENT '累计评论数',
  `day_bbs_count` int(11) DEFAULT NULL COMMENT '今天留言数',
  `total_bbs_count` int(11) DEFAULT NULL COMMENT '累计留言数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='每日统计表';

-- ----------------------------
-- Records of of_cms_count
-- ----------------------------
INSERT INTO `of_cms_count` VALUES ('1', '1', '2018-08-29', '14:04:10', '45', '455', '96', '544353', '22', '225', '33', '2533', '2018-08-29 14:04:23');
INSERT INTO `of_cms_count` VALUES ('11', '1', '2018-08-30', '22:39:00', '0', '500', '153', '545499', '0', '247', '0', '2566', '2018-08-30 22:39:00');
INSERT INTO `of_cms_count` VALUES ('12', '1', '2018-08-31', '00:00:00', '0', '500', '4', '545514', '0', '247', '0', '2566', '2018-08-31 00:00:00');
INSERT INTO `of_cms_count` VALUES ('13', '1', '2018-09-03', '09:49:40', '0', '500', '62', '545518', '0', '247', '1', '2566', '2018-09-03 09:49:40');
INSERT INTO `of_cms_count` VALUES ('14', '2', '2018-09-03', '10:00:46', '0', '0', '0', '0', '0', '0', '0', '0', '2018-09-03 10:00:46');
INSERT INTO `of_cms_count` VALUES ('15', '1', '2018-09-04', '17:00:00', '0', '500', '9', '545580', '0', '247', '0', '2567', '2018-09-04 17:00:00');
INSERT INTO `of_cms_count` VALUES ('16', '2', '2018-09-04', '17:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '2018-09-04 17:00:00');

-- ----------------------------
-- Table structure for of_cms_field
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_field`;
CREATE TABLE `of_cms_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段编号',
  `form_id` int(11) NOT NULL COMMENT '表单编号',
  `field_name` varchar(20) NOT NULL COMMENT '字段名称',
  `field_desc` varchar(50) NOT NULL COMMENT '字段描述',
  `field_default_value` varchar(20) DEFAULT NULL COMMENT '提示文字',
  `field_type` varchar(20) DEFAULT NULL COMMENT '1、text 2、checkbox3、radio4、file 5、image 6、password 7、number ',
  `field_sub_type` varchar(10) DEFAULT NULL COMMENT '字段子类型',
  `field_sort` tinyint(3) DEFAULT NULL COMMENT '字段排序',
  `field_regular` varchar(10) DEFAULT NULL COMMENT '正则表达',
  `field_verification` varchar(10) DEFAULT NULL COMMENT '验证类型',
  `is_disabled` tinyint(2) NOT NULL COMMENT '是否禁用:',
  `is_required` tinyint(2) NOT NULL COMMENT '是否必填',
  `is_print` tinyint(2) NOT NULL COMMENT '是否打印',
  `is_default` tinyint(2) NOT NULL COMMENT '是否默认0、系统默认1、不默认 ',
  `status` tinyint(2) NOT NULL COMMENT '状态0、删除 1、显示 2、不显',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='字段表';

-- ----------------------------
-- Records of of_cms_field
-- ----------------------------
INSERT INTO `of_cms_field` VALUES ('1', '1', 'title_name', '标题', '', 'text', null, '1', '', '', '0', '1', '0', '0', '1', '');
INSERT INTO `of_cms_field` VALUES ('2', '1', 'author', '作者', '', 'text', null, '4', '', '', '0', '1', '0', '0', '1', '');
INSERT INTO `of_cms_field` VALUES ('3', '1', 'thumbnail', '缩略图', '', 'image', null, '2', '', '', '0', '0', '0', '1', '1', '');
INSERT INTO `of_cms_field` VALUES ('4', '1', 'content', '内容', '', 'edit', null, '3', '', '', '0', '1', '0', '0', '1', '');
INSERT INTO `of_cms_field` VALUES ('5', '1', 'create_time', '发布时间', '', 'datetime', null, '5', '', '', '1', '1', '1', '1', '1', '');
INSERT INTO `of_cms_field` VALUES ('6', '1', 'topic_id', '所属专题', '', 'select', null, '1', '', '', '1', '0', '1', '1', '1', '');

-- ----------------------------
-- Table structure for of_cms_file
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_file`;
CREATE TABLE `of_cms_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `file_name` varchar(200) NOT NULL COMMENT '文件名称',
  `file_path` varchar(200) NOT NULL COMMENT '文件目录',
  `type` char(1) NOT NULL COMMENT '分类1、图片 2、文件',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_person` datetime DEFAULT NULL COMMENT '修改时间',
  `status` char(1) DEFAULT NULL COMMENT '0、删除 1、正常',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点文件';

-- ----------------------------
-- Records of of_cms_file
-- ----------------------------

-- ----------------------------
-- Table structure for of_cms_form
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_form`;
CREATE TABLE `of_cms_form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表单编号',
  `cat_id` int(4) DEFAULT NULL COMMENT '表单分类',
  `type` int(11) NOT NULL COMMENT '1、内容 2、栏目3、单页 4、其它',
  `form_name` varchar(20) NOT NULL COMMENT '表单名称',
  `form_desc` varchar(20) NOT NULL COMMENT '表单描述',
  `form_params` varchar(200) DEFAULT NULL COMMENT '表单参数',
  `ext_params` varchar(200) DEFAULT NULL COMMENT '扩展参数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(2) NOT NULL COMMENT '0、删除 1、启用 2、停用',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='表单模板';

-- ----------------------------
-- Records of of_cms_form
-- ----------------------------
INSERT INTO `of_cms_form` VALUES ('1', null, '1', '文章', '文章', 'news', null, '2018-05-17 20:15:31', '2018-08-20 13:49:28', '1', '文章');
INSERT INTO `of_cms_form` VALUES ('2', null, '1', '下载', '下载', 'download', null, '2018-05-17 20:26:11', '2018-08-20 13:44:19', '1', '单页');
INSERT INTO `of_cms_form` VALUES ('3', null, '1', '招聘', '招聘', 'job', null, '2018-05-17 20:26:49', '2018-08-20 13:46:41', '1', '招聘');
INSERT INTO `of_cms_form` VALUES ('4', null, '1', '图片', '图片', 'pic', null, '2018-08-20 13:44:44', '2018-08-20 13:49:53', '1', '图库');
INSERT INTO `of_cms_form` VALUES ('5', null, '1', '视频', '视频', 'void', null, '2018-08-20 13:44:56', '2018-08-20 13:45:16', '1', '视频');
INSERT INTO `of_cms_form` VALUES ('6', null, '1', '文库', '文库', 'doc', null, '2018-08-20 13:45:08', '2018-08-20 13:46:21', '1', '文库');

-- ----------------------------
-- Table structure for of_cms_label
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_label`;
CREATE TABLE `of_cms_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `label_name` varchar(50) NOT NULL COMMENT '标签名称',
  `clicks` int(8) DEFAULT NULL COMMENT '点击数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sort` tinyint(2) DEFAULT NULL COMMENT '排序',
  `is_sow` tinyint(2) DEFAULT NULL COMMENT '是否显示 0、不显1、显示',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态:0、删除 1、正常',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签';

-- ----------------------------
-- Records of of_cms_label
-- ----------------------------

-- ----------------------------
-- Table structure for of_cms_link
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_link`;
CREATE TABLE `of_cms_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '链接编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `link_name` varchar(50) NOT NULL COMMENT '链接名称',
  `link_url` varchar(120) DEFAULT NULL COMMENT '链接地址',
  `link_image` varchar(200) DEFAULT NULL COMMENT '链接图标',
  `clicks` tinyint(8) DEFAULT NULL COMMENT '点击数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sort` char(3) DEFAULT NULL COMMENT '排序',
  `is_show` char(1) DEFAULT NULL COMMENT '是否显示 0、不显1、显示',
  `status` char(1) DEFAULT NULL COMMENT '状态:0、删除 1、正常',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='友情连接';

-- ----------------------------
-- Records of of_cms_link
-- ----------------------------
INSERT INTO `of_cms_link` VALUES ('1', '1', '码云', 'https://gitee.com/oufu/', '/upload/image/cms.png', null, '2018-05-09 11:29:56', '2018-08-21 17:47:55', '1', '1', '1', '12');
INSERT INTO `of_cms_link` VALUES ('2', '1', '官网', 'https://ofsoft.cn', '/upload/image/cms.png', null, '2018-05-09 13:25:53', '2018-08-21 17:46:29', '3', '1', '1', '');
INSERT INTO `of_cms_link` VALUES ('3', '2', '码云', 'https://gitee.com/oufu/', '/upload/image/cms.png', null, '2018-05-09 13:27:02', '2018-05-14 08:58:31', '1', '1', '1', '32');
INSERT INTO `of_cms_link` VALUES ('4', '2', '官网', 'https://ofsoft.cn', '/upload/image/cms.png', null, '2018-05-10 23:14:39', '2018-05-14 08:58:31', '2', '1', '1', '2');

-- ----------------------------
-- Table structure for of_cms_message_record
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_message_record`;
CREATE TABLE `of_cms_message_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `app_id` varchar(32) NOT NULL COMMENT '应用编号',
  `message_id` int(11) NOT NULL COMMENT '消息编号',
  `user_id` varchar(20) NOT NULL COMMENT '用户编号',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读0、未读 1、已读',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0、未发送1、已发送成功 2、发送失败 ',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息记录表';

-- ----------------------------
-- Records of of_cms_message_record
-- ----------------------------

-- ----------------------------
-- Table structure for of_cms_message_template
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_message_template`;
CREATE TABLE `of_cms_message_template` (
  `template_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '模板编号',
  `app_id` varchar(32) NOT NULL COMMENT '应用编号',
  `template_title` varchar(50) NOT NULL COMMENT '模板标题',
  `template_industry` varchar(100) DEFAULT NULL COMMENT '行业',
  `template_content` varchar(200) NOT NULL COMMENT '详情内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `template_type` varchar(20) DEFAULT NULL COMMENT '模板类型',
  `template_status` tinyint(1) NOT NULL COMMENT '状态0、删除 1、启用 2、禁用',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息模板';

-- ----------------------------
-- Records of of_cms_message_template
-- ----------------------------

-- ----------------------------
-- Table structure for of_cms_site
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_site`;
CREATE TABLE `of_cms_site` (
  `site_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '站点编号',
  `site_name` varchar(100) NOT NULL COMMENT '站点名称',
  `site_path` varchar(100) NOT NULL COMMENT '站点简称',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `domain_name` varchar(100) DEFAULT NULL COMMENT '域名',
  `access_protocol` varchar(10) DEFAULT NULL COMMENT '访问协议',
  `access_path` varchar(100) DEFAULT NULL COMMENT '访问地址',
  `template_name` varchar(100) DEFAULT NULL COMMENT '模板名称',
  `template_path` varchar(100) DEFAULT NULL COMMENT '模板路径',
  `is_master` char(1) NOT NULL COMMENT '是否主站:0、否1、是',
  `sort` char(3) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` char(1) DEFAULT NULL COMMENT '0、删除 1、正常',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站点管理';

-- ----------------------------
-- Records of of_cms_site
-- ----------------------------
INSERT INTO `of_cms_site` VALUES ('1', '主站演示', '主站默认', '默认主站演示', 'localhost', 'http', 'localhost:8081/ofcms-admin', 'default', 'default', '0', '1', '2018-05-09 08:44:55', '2018-07-24 17:46:21', '1', '1');
INSERT INTO `of_cms_site` VALUES ('2', '子站演示', '子站演示', '子站演示', '127.0.0.1', 'http', '127.0.0.1:8081/ofcms-admin', 'mobile', 'mobile', '1', '1', '2018-05-09 10:11:54', '2018-07-24 20:36:14', '1', '1');

-- ----------------------------
-- Table structure for of_cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `of_cms_topic`;
CREATE TABLE `of_cms_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `topic_name` varchar(50) NOT NULL COMMENT '专题名称',
  `topic_url` varchar(120) DEFAULT NULL COMMENT '专题地址',
  `topic_image` varchar(200) DEFAULT NULL COMMENT '专题图标',
  `description` varchar(2000) DEFAULT NULL COMMENT '专题内容描述',
  `topic_content_image` varchar(200) DEFAULT NULL COMMENT '专题内容图',
  `topic_template` varchar(200) DEFAULT NULL COMMENT '专题模板',
  `clicks` int(8) DEFAULT NULL COMMENT '点击数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sort` tinyint(3) DEFAULT NULL COMMENT '排序',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示 0、不显1、显示',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态:0、删除 1、正常',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专题';

-- ----------------------------
-- Records of of_cms_topic
-- ----------------------------
INSERT INTO `of_cms_topic` VALUES ('1', '1', '专题测试', null, '/upload/image/7zG01.png', '', '/upload/image/code3.png', '', null, '2018-08-20 11:22:44', '2018-08-20 13:40:27', '1', '1', '1', null);
INSERT INTO `of_cms_topic` VALUES ('2', '1', '二会专题', null, '', '', '', '', '0', '2018-08-20 17:44:02', null, '2', '1', '1', null);

-- ----------------------------
-- Table structure for of_sys_announce
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_announce`;
CREATE TABLE `of_sys_announce` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(200) NOT NULL COMMENT '公告标题',
  `content` varchar(1024) DEFAULT NULL COMMENT '公告内容',
  `type` char(1) NOT NULL COMMENT '公告类型:1、系统公告 2、通知 3、推广',
  `user_id` varchar(20) DEFAULT NULL COMMENT '发布用户',
  `release_terminal` char(1) NOT NULL COMMENT '发布终端:1、app 2、微信 3、管理台',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sort` char(2) DEFAULT NULL COMMENT '排序 从 10 两位开始',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT NULL COMMENT '1、正常 0、作废',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统公告表';

-- ----------------------------
-- Records of of_sys_announce
-- ----------------------------

-- ----------------------------
-- Table structure for of_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_dict`;
CREATE TABLE `of_sys_dict` (
  `dict_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '字典编号',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `dict_value` varchar(50) DEFAULT NULL COMMENT '字典值',
  `dict_desc` varchar(100) DEFAULT NULL COMMENT '字典描述',
  `dict_group` varchar(50) DEFAULT NULL COMMENT '字典分组',
  `status` char(1) DEFAULT NULL COMMENT '状态:1、正常 0、作废',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of of_sys_dict
-- ----------------------------
INSERT INTO `of_sys_dict` VALUES ('2', '男', '1', '性别', 'sex', '1');
INSERT INTO `of_sys_dict` VALUES ('3', '女', '2', '性别', 'sex', '1');
INSERT INTO `of_sys_dict` VALUES ('4', '正常', '1', '状态', 'status', '1');
INSERT INTO `of_sys_dict` VALUES ('5', '作废', '0', '状态', 'status', '1');
INSERT INTO `of_sys_dict` VALUES ('6', '允许', '1', '是否允许', 'is_open', '1');
INSERT INTO `of_sys_dict` VALUES ('7', '禁止', '0', '是否禁止', 'is_open', '1');
INSERT INTO `of_sys_dict` VALUES ('8', '是', '1', '是否', 'is_status', '1');
INSERT INTO `of_sys_dict` VALUES ('9', '否', '0', '是否', 'is_status', '1');
INSERT INTO `of_sys_dict` VALUES ('10', 'http', 'http', '访问协议', 'access_protocol', '1');
INSERT INTO `of_sys_dict` VALUES ('11', 'https', 'https', '访问协议', 'access_protocol', '1');
INSERT INTO `of_sys_dict` VALUES ('12', '文本', 'text', '文本', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('13', '复选框', 'checkbox', '复选框', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('14', '单选', 'radio', '单选', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('15', '文件', 'file', '文件', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('16', '图片', 'image', '图片', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('17', '密码', 'password', '密码', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('18', '数字', 'number', '数字', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('19', '时间', 'datetime', '时间', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('20', '编辑器', 'edit', '编辑器', 'field_type', '1');
INSERT INTO `of_sys_dict` VALUES ('21', '待审核', '0', '待审核', 'check_status', '1');
INSERT INTO `of_sys_dict` VALUES ('22', '审核通过 ', '1', '审核通过 ', 'check_status', '1');
INSERT INTO `of_sys_dict` VALUES ('23', '未通过', '2', '未通过', 'check_status', '1');
INSERT INTO `of_sys_dict` VALUES ('24', '选择器', 'select', '下拉选择', 'field_type', '1');

-- ----------------------------
-- Table structure for of_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_menu`;
CREATE TABLE `of_sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能编号',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级功能编号',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT 'url连接',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限',
  `type` varchar(2) DEFAULT NULL COMMENT '功能类型',
  `icon` varchar(64) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '菜单显示序号',
  `status` char(1) NOT NULL COMMENT '1 在用\r\n            0 不在用',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of of_sys_menu
-- ----------------------------
INSERT INTO `of_sys_menu` VALUES ('1', '0', '系统设置', '#', 'system', '1', '<i class=\"fa fa-cog\"></i>', '1', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('4', '0', '内容管理', '#', 'order', '1', '<i class=\"layui-icon\">&#xe63c;</i>', '2', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('11', '1', '系统设置', '', '#', '1', '<i class=\"layui-icon\">&#xe612;</i>', '1', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('33', '11', '用户管理', 'system/user/index.html', 'system:user', '1', '<i class=\"layui-icon\">&#xe612;</i>', '1', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('34', '11', '角色管理', 'system/role/index.html', 'system:role', '1', '<i class=\"layui-icon\">&#xe612;</i>', '2', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('35', '11', '菜单管理', 'system/menu/index.html', 'system:menu', '1', '<i class=\"layui-icon\">&#xe612;</i>', '3', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('36', '11', '操作日志', 'system/log/index.html', 'system:log', '1', '<i class=\"layui-icon\">&#xe612;</i>', '6', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('56', '4', '内容管理', '#', '1', '1', '<i class=\"layui-icon\">&#xe63c;</i>', '1', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('77', '1', '系统运营', '#', '1', '1', '<i class=\"layui-icon\">&#xe612;</i>', '1', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('78', '77', '定时任务', 'system/task/index.html', '1', '1', '<i class=\"layui-icon\">&#xe612;</i>', '2', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('79', '77', '系统监控', 'druid/index.html', '1', '3', '<i class=\"layui-icon\">&#xe612;</i>', '1', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('83', '11', '数据字典', 'system/dict/index.html', 'system/dict', '1', '<i class=\"layui-icon\">&#xe612;</i>', '4', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('84', '11', '参数设置', 'system/param/index.html', 'system/param', '1', '<i class=\"layui-icon\">&#xe612;</i>', '5', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('85', '11', '代码生成', 'system/generate/index.html', 'system/generate', '1', '<i class=\"layui-icon\">&#xe612;</i>', '7', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('86', '77', '通知管理', 'system/announce/index.html', 'system/announce', '1', '<i class=\"layui-icon\">&#xe612;</i>', '1', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('105', '56', '栏目管理', 'cms/column/index.html', 'cms/column', '1', '<i class=\"layui-icon\">&#xe63c;</i>', '1', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('106', '56', '文章管理', 'cms/content/index.html', 'cms/content', '1', '<i class=\"layui-icon\">&#xe63c;</i>', '2', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('107', '56', '主题管理', 'cms/topic/index.html', '#', '1', '<i class=\"layui-icon\">&#xe63c;</i>', '4', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('108', '56', '标签管理', 'shop/order/completed/index.html', '#', '1', '<i class=\"layui-icon\">&#xe63c;</i>', '5', '0', '1');
INSERT INTO `of_sys_menu` VALUES ('109', '56', '回收站', 'cms/recover/index.html', '@', '1', '<i class=\"layui-icon\">&#xe63c;</i>', '6', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('112', '1', '模板设置', '1', '1', '1', '<i class=\"layui-icon\">&#xe656;</i>', '4', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('113', '0', '运营管理', '1', '1', '1', '<i class=\"layui-icon\">&#xe62c;</i>', '3', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('114', '0', '数据统计', '1', '1', '1', '<i class=\"layui-icon\">&#xe629;</i>', '5', '1', '1');
INSERT INTO `of_sys_menu` VALUES ('115', '113', '运营管理', '#', '#', '1', '<i class=\"layui-icon\">&#xe62c;</i>', '1', '1', null);
INSERT INTO `of_sys_menu` VALUES ('116', '115', '广告管理', 'cms/ad/index.html', 'cms/ad', '1', '<i class=\"layui-icon\">&#xe62c;</i>', '1', '1', null);
INSERT INTO `of_sys_menu` VALUES ('117', '115', '友情链接', 'cms/link/index.html', 'cms/link', '1', '<i class=\"layui-icon\">&#xe62c;</i>', '2', '1', null);
INSERT INTO `of_sys_menu` VALUES ('118', '115', '评论管理', 'cms/comment/index.html', 'cms/comment', '1', '<i class=\"layui-icon\">&#xe62c;</i>', '3', '1', null);
INSERT INTO `of_sys_menu` VALUES ('119', '115', '站点公告', 'cms/announce/index.html', 'cms/announce', '1', '<i class=\"layui-icon\">&#xe62c;</i>', '3', '1', null);
INSERT INTO `of_sys_menu` VALUES ('120', '115', '留言管理', 'cms/bbs/index.html', '1', '1', '<i class=\"layui-icon\">&#xe62c;</i>', '1', '1', null);
INSERT INTO `of_sys_menu` VALUES ('121', '141', '微信管理', '#', '#', '1', '<i class=\"layui-icon\">&#xe63a;</i>', '2', '1', null);
INSERT INTO `of_sys_menu` VALUES ('122', '121', '微信设置', 'weixin/config/index.html', '#', '1', '<i class=\"layui-icon\">&#xe63a;</i>', '1', '1', null);
INSERT INTO `of_sys_menu` VALUES ('123', '121', '菜单管理', 'weixin/menu/index.html', '#', '1', '<i class=\"layui-icon\">&#xe63a;</i>', '2', '1', null);
INSERT INTO `of_sys_menu` VALUES ('124', '121', '自动回复', 'weixin/auto/index.html', '#', '1', '<i class=\"layui-icon\">&#xe63a;</i>', '3', '1', null);
INSERT INTO `of_sys_menu` VALUES ('125', '121', '默认回复', 'weixin/reply/index.html', '#', '3', '<i class=\"layui-icon\">&#xe63a;</i>', '4', '1', null);
INSERT INTO `of_sys_menu` VALUES ('126', '121', '信息推送', '#', '#', '1', '<i class=\"layui-icon\">&#xe63a;</i>', '5', '0', null);
INSERT INTO `of_sys_menu` VALUES ('127', '114', '数据统计', '#', '#', '1', '<i class=\"layui-icon\">&#xe629;</i>', '1', '1', null);
INSERT INTO `of_sys_menu` VALUES ('128', '127', '访问统计', 'cms/count/access_index.html', '#', '1', '<i class=\"layui-icon\">&#xe629;</i>', '1', '1', null);
INSERT INTO `of_sys_menu` VALUES ('129', '127', '评论统计', 'cms/count/comment_index.html', '#', '1', '<i class=\"layui-icon\">&#xe629;</i>', '2', '1', null);
INSERT INTO `of_sys_menu` VALUES ('130', '127', '内容统计', 'cms/count/content_index.html', '#', '1', '<i class=\"layui-icon\">&#xe629;</i>', '3', '1', null);
INSERT INTO `of_sys_menu` VALUES ('131', '1', '网站设置', '#', '#', '1', '<i class=\"layui-icon\">&#xe716;</i>', '3', '1', null);
INSERT INTO `of_sys_menu` VALUES ('132', '131', '基本设置', 'cms/site/site_index.html', '1', '1', '<i class=\"layui-icon\">&#xe716;</i>', '1', '1', null);
INSERT INTO `of_sys_menu` VALUES ('133', '131', '站点管理', 'cms/site/index.html', 'cms/site', '1', '<i class=\"layui-icon\">&#xe716;</i>', '2', '1', null);
INSERT INTO `of_sys_menu` VALUES ('134', '131', '页面生成', '#', '#', '1', '<i class=\"layui-icon\">&#xe716;</i>', '1', '0', null);
INSERT INTO `of_sys_menu` VALUES ('135', '131', '缓存设置', '#', '1', '1', '<i class=\"layui-icon\">&#xe716;</i>', '1', '0', null);
INSERT INTO `of_sys_menu` VALUES ('136', '112', '模板文件', 'cms/template/getTemplates.html', 'cms/template', '3', '<i class=\"layui-icon\">&#xe656;</i>', '1', '1', null);
INSERT INTO `of_sys_menu` VALUES ('137', '112', '模板资源', 'cms/template/getTemplates.html?res_path=res', 'cms/template/', '3', '<i class=\"layui-icon\">&#xe656;</i>', '2', '1', null);
INSERT INTO `of_sys_menu` VALUES ('139', '131', '表单管理', 'cms/form/index.html', 'cms/form', '1', '<i class=\"layui-icon\">&#xe716;</i>', '5', '1', null);
INSERT INTO `of_sys_menu` VALUES ('140', '56', '单页管理', 'cms/single/index.html', '#', '1', '<i class=\"layui-icon\">&#xe63c;</i>', '3', '1', null);
INSERT INTO `of_sys_menu` VALUES ('141', '0', '微信管理', '#', '#', '1', '<i class=\"layui-icon\">&#xe63a;</i>', '4', '1', null);
INSERT INTO `of_sys_menu` VALUES ('142', '112', '模板安装', 'cms/template/template_index.html', '#', '2', '<i class=\"layui-icon\">&#xe656;</i>', '3', '1', null);

-- ----------------------------
-- Table structure for of_sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_oper_log`;
CREATE TABLE `of_sys_oper_log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `function_name` varchar(200) DEFAULT NULL COMMENT '功能',
  `business_code` varchar(200) DEFAULT NULL COMMENT '功能代码',
  `oper_type` varchar(10) DEFAULT NULL COMMENT '如：100000 代表登录则填写100000，使用api接口编码',
  `oper_date` date DEFAULT NULL COMMENT '操作日期',
  `oper_time` datetime NOT NULL COMMENT '操作时间',
  `oper_desc` varchar(128) NOT NULL COMMENT '操作内容描述',
  `status` char(1) NOT NULL COMMENT '1 在用\r\n            0 不在用',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Table structure for of_sys_param
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_param`;
CREATE TABLE `of_sys_param` (
  `param_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '参数编号',
  `param_name` varchar(50) NOT NULL COMMENT '参数名称',
  `param_value` varchar(1024) DEFAULT NULL COMMENT '参数值',
  `param_desc` varchar(64) DEFAULT NULL COMMENT '参数描述',
  `param_group` varchar(20) DEFAULT NULL COMMENT '参数分组:相同为一组',
  `param_type` varchar(10) DEFAULT NULL COMMENT '输入类型：‘text’-文本输入，‘int’-整数，‘number’-数字，‘select’-下拉单选，‘mselect''-下拉多选，‘date’-日期，‘time''-时间',
  `is_show` char(1) DEFAULT '1' COMMENT '是否显示：0、不显示 1、显示',
  `status` char(1) DEFAULT NULL COMMENT '状态:1、正常 0、作废',
  `remark` varchar(32) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`param_id`,`param_name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='系统参数表';

-- ----------------------------
-- Records of of_sys_param
-- ----------------------------
INSERT INTO `of_sys_param` VALUES ('1', 'system_name', 'OFCMS', '系统名称', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('2', 'version', '1.1.1', '版本号', 'system', null, '1', '1', '1');
INSERT INTO `of_sys_param` VALUES ('3', 'copyright', '© www.ofosft.cn', '版权', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('4', 'api', 'hosp', '医院信息缓存', 'cache', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('5', 'system', 'dict', '字典缓存', 'cache', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('6', 'system', 'params', '参数缓存', 'cache', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('7', 'system', 'nenu', '菜单缓存', 'cache', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('8', 'system', 'prme', '权限缓存', 'cache', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('9', 'http_image_url', 'http://localhost:8081/ofcms-admin', '图片访问地址', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('10', 'weixin_processInFollowEvent', '感谢关注OF公众平台!', '关注时回复', 'weixin', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('11', 'weixin_processInFollowEvent_two', '欢迎您再次回来!', '再次关注后回复', 'weixin', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('12', 'weixin_seach_no_info', '未搜索到信息!', '搜索没有数据时', 'weixin', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('13', 'weixin_auto_no_info', '没有匹配的关键字!', '没有匹配的关键字', 'weixin', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('14', 'mobile_api_href', 'http://localhost:8080/syk-wx-web-mobile', '手机接口地址', 'system', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('15', 'weixin_unsubscribe', '感谢关注', '取消关注', 'weixin', '', '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('16', 'login_key', 'OF', '登录页面名称前', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('17', 'login_value', 'CMS', '登录页面名称前', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('18', 'index', 'index.html', '首页模板', 'system', null, '1', '1', 'index.html  index2.html  两种');
INSERT INTO `of_sys_param` VALUES ('19', 'wx_app_token', 'oufu', '验证标识', 'weixin_config', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('20', 'wx_app_id', 'wx11bc2e6b3b37df0b', '应用编号', 'weixin_config', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('21', 'wx_app_secret', '8590ab61ba00c33dd2105dcfa25fa1a9', '安全密钥', 'weixin_config', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('22', 'encryptMessage', 'false', '是否加密', 'weixin_config', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('23', 'encodingAesKey', '12345678', '加密密钥', 'weixin_config', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('24', 'weixin_url', 'weixin/index.html', '微信请求地址', 'weixin_config', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('25', 'front_copyright', 'Copyright◎ 2017-2020 wwww.ofsoft.cn, All Rights Reserved ', '前台版权', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('26', 'icp', '湘ICP备17023316号', '备案号', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('27', 'tel', '0791-86538070　13576281815', '电话', 'system', null, '1', '1', '可以用,分开显示');
INSERT INTO `of_sys_param` VALUES ('28', 'fax', '0731-86533320', '传真', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('29', 'address', '长沙市岳麓区大道19号XX大楼A座22', '地址', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('30', 'email_service', 'smtp.qq.com', '邮箱服务器', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('31', 'email_port', '465', '邮件端口', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('32', 'email_username', '333332270@qq.com', '邮件用户名', 'system', null, '1', '1', '');
INSERT INTO `of_sys_param` VALUES ('33', 'email_password', '123456', '邮件密码', 'system', null, '1', '1', '');

-- ----------------------------
-- Table structure for of_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_role`;
CREATE TABLE `of_sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(40) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `role_type` char(1) DEFAULT NULL COMMENT '0：后台管理型，对应菜单模式\r\n            1：app管理型，对应参数模式',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` char(1) NOT NULL COMMENT '数据状态:1 、有效0、失效',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统角色信息表';

-- ----------------------------
-- Records of of_sys_role
-- ----------------------------
INSERT INTO `of_sys_role` VALUES ('1', '管理员', '后台管理员', '1', '2018-01-10 10:14:26', '2018-01-10 10:14:29', '1', '');

-- ----------------------------
-- Table structure for of_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_role_menu`;
CREATE TABLE `of_sys_role_menu` (
  `role_menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色功能编号',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `menu_id` int(11) NOT NULL COMMENT '功能编号',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '数据状态:0、删除1、正常',
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色对应菜单表';

-- ----------------------------
-- Records of of_sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for of_sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_sequence`;
CREATE TABLE `of_sys_sequence` (
  `name` varchar(20) NOT NULL COMMENT '序列名 采用表名',
  `start_value` int(6) NOT NULL DEFAULT '1' COMMENT '开始值',
  `max_value` int(11) NOT NULL DEFAULT '1000000' COMMENT '最大值',
  `current_value` int(11) NOT NULL DEFAULT '0' COMMENT '当前值',
  `increment` int(1) NOT NULL DEFAULT '1' COMMENT '增量',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序列表';

-- ----------------------------
-- Records of of_sys_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for of_sys_task
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_task`;
CREATE TABLE `of_sys_task` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `class_path` varchar(200) DEFAULT NULL COMMENT '类路径',
  `bean_name` varchar(100) DEFAULT NULL COMMENT '实例名称',
  `job_desc` varchar(100) DEFAULT NULL COMMENT '实例描述',
  `params` varchar(50) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(20) DEFAULT NULL COMMENT '表达式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` char(1) NOT NULL COMMENT '状态: 0 删除 1未启动 2、已启动  3已停止      \r\n            ',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统任务表';

-- ----------------------------
-- Records of of_sys_task
-- ----------------------------
INSERT INTO `of_sys_task` VALUES ('1', '', 'SiteTotalTask', '累计统计', null, '0 0 0/1 * * ?', '2018-01-23 18:35:32', '2', '每一小时执行一次');
INSERT INTO `of_sys_task` VALUES ('2', '', 'SiteCountTask', '每日统计', null, '0 0/1 * * * ?', '2018-08-30 22:00:14', '2', '每分钟执行一次');

-- ----------------------------
-- Table structure for of_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_user`;
CREATE TABLE `of_sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `login_name` varchar(20) NOT NULL COMMENT '登录名',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名称',
  `user_password` varchar(64) NOT NULL COMMENT '用户密码',
  `user_sex` char(1) DEFAULT NULL COMMENT '性别:1、男 2、女 3、未知',
  `user_birthday` date DEFAULT NULL COMMENT '生日',
  `user_mobile` char(11) DEFAULT NULL COMMENT '手机号',
  `user_email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `face_image_url` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `department_id` int(11) DEFAULT NULL COMMENT '部门',
  `duties` varchar(20) DEFAULT NULL COMMENT '职务',
  `sort` char(2) DEFAULT NULL COMMENT '排序：数字越小，排名越靠前',
  `status` char(1) DEFAULT NULL COMMENT '状态：0、删除 1、正常',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of of_sys_user
-- ----------------------------
INSERT INTO `of_sys_user` VALUES ('1', 'admin', '管理员', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', '2018-01-08', '18867350835', '523648919@qq.com', '1', '1', '126', null, '1', null);

-- ----------------------------
-- Table structure for of_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_user_role`;
CREATE TABLE `of_sys_user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色编号',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` char(1) NOT NULL COMMENT '数据状态:1、正常 0、删除',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户对应角色表';

-- ----------------------------
-- Records of of_sys_user_role
-- ----------------------------
INSERT INTO `of_sys_user_role` VALUES ('1', '1', '1', '2018-04-23 11:15:53', '1');

-- ----------------------------
-- Table structure for of_sys_user_site
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_user_site`;
CREATE TABLE `of_sys_user_site` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色编号',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `site_id` int(4) NOT NULL COMMENT '站点编号',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '数据状态:1、正常 0、删除',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户对应站点';

-- ----------------------------
-- Records of of_sys_user_site
-- ----------------------------

-- ----------------------------
-- Table structure for of_sys_weixin_auto
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_weixin_auto`;
CREATE TABLE `of_sys_weixin_auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_key` varchar(150) NOT NULL COMMENT '关键字',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `is_del` char(1) DEFAULT '1' COMMENT '是否删除',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统微信自动回复';

-- ----------------------------
-- Records of of_sys_weixin_auto
-- ----------------------------
INSERT INTO `of_sys_weixin_auto` VALUES ('1', '1', '111<a href=\"https://www.baidu.com\"> b</a>', '1', '1', '2018-03-15 14:51:14', '2018-03-16 11:39:57');
INSERT INTO `of_sys_weixin_auto` VALUES ('2', '2', '22222', '1', '1', '2018-03-15 14:51:24', '2018-03-15 15:20:41');
INSERT INTO `of_sys_weixin_auto` VALUES ('3', '3', '3123', '1', '1', '2018-03-15 14:51:42', '2018-03-15 15:20:34');
INSERT INTO `of_sys_weixin_auto` VALUES ('4', '4', '444', '1', '1', '2018-03-15 15:27:11', '2018-03-15 16:04:55');
INSERT INTO `of_sys_weixin_auto` VALUES ('5', '222', '222', '0', '0', '2018-03-15 15:27:12', null);
INSERT INTO `of_sys_weixin_auto` VALUES ('6', '222', '222', '0', '0', '2018-03-15 15:27:12', null);

-- ----------------------------
-- Table structure for of_sys_weixin_menu
-- ----------------------------
DROP TABLE IF EXISTS `of_sys_weixin_menu`;
CREATE TABLE `of_sys_weixin_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `parent_id` int(11) NOT NULL COMMENT '上级菜单',
  `name` varchar(150) NOT NULL COMMENT '菜单名称',
  `type` varchar(10) NOT NULL COMMENT '菜单类型',
  `url` varchar(250) DEFAULT NULL COMMENT '菜单地址',
  `menu_key` varchar(128) DEFAULT NULL COMMENT '关键',
  `media_id` varchar(128) DEFAULT NULL COMMENT '图片ID',
  `is_del` char(1) DEFAULT '1' COMMENT '是否删除',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统微信菜单';

-- ----------------------------
-- Records of of_sys_weixin_menu
-- ----------------------------
INSERT INTO `of_sys_weixin_menu` VALUES ('1', '0', '个人中心', 'view', '', null, null, '1', '1', null, null);
INSERT INTO `of_sys_weixin_menu` VALUES ('2', '0', '住院缴费', 'view', 'http://wechat-app.sunycare.com/syk-wx-web-mobile/hosp/prepay.html', null, null, '1', '1', null, null);
INSERT INTO `of_sys_weixin_menu` VALUES ('3', '0', '系统', 'view', 'http://wechat-app.sunycare.com/syk-wx-web-mobile', null, null, '1', '1', null, null);
INSERT INTO `of_sys_weixin_menu` VALUES ('4', '1', '绑定就诊人', 'view', 'http://wechat-app.sunycare.com/syk-wx-web-mobile/user/choices/choice.html', '', '', '1', '1', null, '2018-03-16 14:57:31');
INSERT INTO `of_sys_weixin_menu` VALUES ('5', '1', '我的预约', 'view', 'http://wechat-app.sunycare.com/syk-wx-web-mobile/user/register/register.html', '', '', '1', '1', null, '2018-03-16 14:57:14');
INSERT INTO `of_sys_weixin_menu` VALUES ('6', '1', '费用账单', 'view', 'http://wechat-app.sunycare.com/syk-wx-web-mobile/user/costbill.html', '', '', '1', '1', null, '2018-03-16 14:51:07');
INSERT INTO `of_sys_weixin_menu` VALUES ('7', '2', '测试', 'click', '2', '', '', '0', '1', '2018-03-16 15:06:31', '2018-03-16 15:06:38');
INSERT INTO `of_sys_weixin_menu` VALUES ('8', '2', '测试一下', 'view', 'http://www.baidu.com', '', '', '1', '1', '2018-03-16 15:45:04', '2018-03-16 15:51:28');
INSERT INTO `of_sys_weixin_menu` VALUES ('9', '0', '1', 'view', '', '', '', '0', '1', '2018-03-16 15:52:48', null);
