/*
MySQL Data Transfer
Source Host: localhost
Source Database: ects
Target Host: localhost
Target Database: ects
Date: 2010/5/29 16:33:03
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
  `contentDate` date default NULL,
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
  `seller_id` int(11) default NULL,
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
  `seller_id` int(11) NOT NULL auto_increment,
  `realName` varchar(20) default NULL,
  `credit` varchar(20) default NULL,
  `shopName` varchar(20) default NULL,
  `shopDescriptions` varchar(100) default NULL,
  `user_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`seller_id`,`user_id`)
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
INSERT INTO `product` VALUES ('1', 'yelsd', null, null, '0', null);
INSERT INTO `user` VALUES ('1', 'wang', '123');
