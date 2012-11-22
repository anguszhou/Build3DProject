/*
MySQL Data Transfer
Source Host: localhost
Source Database: ects
Target Host: localhost
Target Database: ects
Date: 2010/6/29 3:04:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `passwd` varchar(20) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL auto_increment,
  `name` varchar(18) default NULL,
  `descriptions` varchar(256) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) default NULL,
  `content` varchar(200) default NULL,
  `commentDate` date default NULL,
  `product_id` int(11) default '0',
  PRIMARY KEY  (`id`),
  KEY `R_5` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for contactinfo
-- ----------------------------
DROP TABLE IF EXISTS `contactinfo`;
CREATE TABLE `contactinfo` (
  `id` int(11) NOT NULL,
  `address` varchar(100) default NULL,
  `email` varchar(20) default NULL,
  `cellPhone` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for myorder
-- ----------------------------
DROP TABLE IF EXISTS `myorder`;
CREATE TABLE `myorder` (
  `order_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `cost` double(11,0) default NULL,
  `user_id` int(11) default NULL,
  `orderStatus_id` int(11) default NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL auto_increment,
  `noticeTitle` varchar(20) default NULL,
  `noticeContext` varchar(1000) default NULL,
  `noticeDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for orderline
-- ----------------------------
DROP TABLE IF EXISTS `orderline`;
CREATE TABLE `orderline` (
  `id` int(11) NOT NULL auto_increment,
  `amount` int(11) default NULL,
  `product_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `R_9` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus` (
  `orderStatus_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `descriptions` varchar(100) default NULL,
  PRIMARY KEY  (`orderStatus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `time` date default NULL,
  `productClass_id` int(11) default NULL,
  `price` double(11,0) default NULL,
  `descriptions` varchar(1000) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `R_2` (`productClass_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for productclass
-- ----------------------------
DROP TABLE IF EXISTS `productclass`;
CREATE TABLE `productclass` (
  `productClass_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `category_id` int(11) default NULL,
  PRIMARY KEY  (`productClass_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL auto_increment,
  `propertyName` varchar(20) default NULL,
  `propertyValue` varchar(20) default NULL,
  `product_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `user_id` int(11) NOT NULL auto_increment,
  `realName` varchar(20) default NULL,
  `credit` varchar(20) default NULL,
  `QQ` varchar(20) default NULL,
  `shopName` varchar(20) default NULL,
  `shopDescriptions` varchar(100) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for starrating
-- ----------------------------
DROP TABLE IF EXISTS `starrating`;
CREATE TABLE `starrating` (
  `id` int(11) NOT NULL auto_increment,
  `personNum` int(11) default NULL,
  `totalStar` int(11) default NULL,
  `avgStar` double(11,0) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `passwd` varchar(20) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `category` VALUES ('2', '服装', '222222');
INSERT INTO `category` VALUES ('3', '书籍', '222222222');
INSERT INTO `category` VALUES ('4', '日常用品', '222222');
INSERT INTO `category` VALUES ('1', '数码', '333333333');
INSERT INTO `comment` VALUES ('1', 's', 's', '', '2010-06-03', '1');
INSERT INTO `comment` VALUES ('2', 'a', 'a', 'a', '2010-06-04', '3');
INSERT INTO `comment` VALUES ('3', '1', '1', '1', '2010-06-04', '1');
INSERT INTO `contactinfo` VALUES ('8', 'a', 'a', 'a');
INSERT INTO `contactinfo` VALUES ('9', 'q', 'q', 'q');
INSERT INTO `contactinfo` VALUES ('10', '12', '1@11', '12');
INSERT INTO `contactinfo` VALUES ('14', '', '', '');
INSERT INTO `contactinfo` VALUES ('21', 'ffda', 'afdf', 'fdaf');
INSERT INTO `contactinfo` VALUES ('22', null, null, null);
INSERT INTO `contactinfo` VALUES ('23', null, null, null);
INSERT INTO `myorder` VALUES ('1', 'zc', '133333332', '14', null);
INSERT INTO `notice` VALUES ('1', null, 'sdf', null);
INSERT INTO `notice` VALUES ('4', null, 'zhousdl;fjksd', null);
INSERT INTO `notice` VALUES ('3', null, 'yuiyui', null);
INSERT INTO `notice` VALUES ('5', null, 'sdfasdfasdfsdf;fjksd', null);
INSERT INTO `orderline` VALUES ('1', '4', '76', '1');
INSERT INTO `product` VALUES ('76', '333333333333333', '1000-02-02', '1', '33333337', '3333', '14');
INSERT INTO `product` VALUES ('75', '222222222', '1000-02-02', '1', '222222222', '2222222222', '14');
INSERT INTO `product` VALUES ('77', '2222222', '1000-11-11', '1', '2222', '2222222222', '14');
INSERT INTO `product` VALUES ('78', '1', '1000-11-11', '1', '1', '1', '14');
INSERT INTO `product` VALUES ('79', '2', '1000-11-11', '1', '22222222', '33333', '14');
INSERT INTO `productclass` VALUES ('1', '电脑', '1');
INSERT INTO `productclass` VALUES ('2', 'MP3', '1');
INSERT INTO `productclass` VALUES ('3', 'PSP', '1');
INSERT INTO `productclass` VALUES ('4', '手机', '1');
INSERT INTO `productclass` VALUES ('5', '上衣', '2');
INSERT INTO `productclass` VALUES ('6', '裤子', '2');
INSERT INTO `productclass` VALUES ('7', '鞋', '2');
INSERT INTO `productclass` VALUES ('9', '学习', '3');
INSERT INTO `productclass` VALUES ('10', '小说', '3');
INSERT INTO `productclass` VALUES ('11', '杂志', '3');
INSERT INTO `productclass` VALUES ('12', '毛巾', '4');
INSERT INTO `productclass` VALUES ('13', '牙刷', '4');
INSERT INTO `productclass` VALUES ('14', '脸盆', '4');
INSERT INTO `property` VALUES ('66', '33333333', '333333333333', null);
INSERT INTO `property` VALUES ('67', '22222222', '222222222222', '75');
INSERT INTO `property` VALUES ('68', '22222222', '2222222222222', '75');
INSERT INTO `property` VALUES ('69', '33333333', '333333333', '76');
INSERT INTO `property` VALUES ('70', '333333', '33333', '76');
INSERT INTO `property` VALUES ('71', '鍥剧墖鍚?', '銆婇暱鐢熺晫銆婽XT.txt', '76');
INSERT INTO `property` VALUES ('72', '2222222222', '22222222222', '77');
INSERT INTO `property` VALUES ('73', '图片名', '编译原理-总复习-48学时.ppt', '77');
INSERT INTO `property` VALUES ('74', '44444444444', '44444444444444', '77');
INSERT INTO `property` VALUES ('75', '图片名', 'test.jpg', '79');
INSERT INTO `property` VALUES ('76', '2222222222', '22222222222', '79');
INSERT INTO `seller` VALUES ('14', 'sdsd', 'first', '313151515', '2wewe', 'werwerweS');
INSERT INTO `seller` VALUES ('17', 'mao', 'first', null, 'hahahah', 'wonderful');
INSERT INTO `seller` VALUES ('19', '鍛ㄨ仾', 'first', '313516285', 'hahahah', 'wonderful');
INSERT INTO `seller` VALUES ('20', '鍛ㄨ仾', 'first', '313516285', 'hahahah', 'wonderful');
INSERT INTO `starrating` VALUES ('1', '20', '74', '4');
INSERT INTO `starrating` VALUES ('2', '1', '4', '4');
INSERT INTO `starrating` VALUES ('3', '1', '4', '4');
INSERT INTO `user` VALUES ('1', 'wang', '123');
INSERT INTO `user` VALUES ('2', 'za', '123456');
INSERT INTO `user` VALUES ('3', '12', '12');
INSERT INTO `user` VALUES ('4', '12', '123456');
INSERT INTO `user` VALUES ('5', '12', '12');
INSERT INTO `user` VALUES ('6', '1', '1');
INSERT INTO `user` VALUES ('7', '2', '2');
INSERT INTO `user` VALUES ('8', 'a', 'a');
INSERT INTO `user` VALUES ('9', 'q', 'q');
INSERT INTO `user` VALUES ('10', '12', '12');
INSERT INTO `user` VALUES ('11', '12', '12');
INSERT INTO `user` VALUES ('12', 'congcong', '123');
INSERT INTO `user` VALUES ('13', 'congcong', '123');
INSERT INTO `user` VALUES ('14', 'zc', '123');
INSERT INTO `user` VALUES ('15', 'congcong', '123');
INSERT INTO `user` VALUES ('16', 'cong', '123');
INSERT INTO `user` VALUES ('17', 'k', '123');
INSERT INTO `user` VALUES ('18', 'cong', '123');
INSERT INTO `user` VALUES ('19', 'cong', '123');
INSERT INTO `user` VALUES ('20', 'sadfsadf', '123');
INSERT INTO `user` VALUES ('21', 'maona', '1234');
INSERT INTO `user` VALUES ('22', null, null);
INSERT INTO `user` VALUES ('23', null, null);
