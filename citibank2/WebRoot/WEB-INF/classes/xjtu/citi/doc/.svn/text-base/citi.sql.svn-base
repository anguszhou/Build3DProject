/*
MySQL Data Transfer
Source Host: localhost
Source Database: citi
Target Host: localhost
Target Database: citi
Date: 2010-9-4 13:10:13
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL auto_increment,
  `companyid` int(11) NOT NULL,
  `account` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for bankuser
-- ----------------------------
DROP TABLE IF EXISTS `bankuser`;
CREATE TABLE `bankuser` (
  `id` int(11) NOT NULL auto_increment,
  `usertypeid` int(4) NOT NULL,
  `workNum` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `department` varchar(30) default NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for companyinfo
-- ----------------------------
DROP TABLE IF EXISTS `companyinfo`;
CREATE TABLE `companyinfo` (
  `id` int(11) NOT NULL auto_increment,
  `companyName` varchar(50) NOT NULL,
  `taxNum` varchar(20) NOT NULL,
  `registFund` double(15,0) NOT NULL,
  `legal` varchar(20) NOT NULL,
  `telephone` varchar(13) default NULL,
  `isListedComp` int(4) default NULL,
  `isCoreComp` int(4) default NULL,
  `industrytypeid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for companyuser
-- ----------------------------
DROP TABLE IF EXISTS `companyuser`;
CREATE TABLE `companyuser` (
  `id` int(11) NOT NULL auto_increment,
  `companyName` varchar(50) NOT NULL,
  `taxNum` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `companyinfoid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL auto_increment,
  `companyid` int(20) NOT NULL,
  `time` date NOT NULL,
  `reviewer` int(4) NOT NULL,
  `description` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for industrytype
-- ----------------------------
DROP TABLE IF EXISTS `industrytype`;
CREATE TABLE `industrytype` (
  `id` int(11) NOT NULL auto_increment,
  `industrycode` int(6) NOT NULL,
  `industryname` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `id` int(11) NOT NULL auto_increment,
  `cashflow` double(6,5) default NULL,
  `registfund` double(6,5) default NULL,
  `listedcomp` double(20,2) default NULL,
  `corecomp` double(11,5) default NULL,
  `ain` double(6,5) default NULL,
  `aout` double(6,5) default NULL,
  `bin` double(6,5) default NULL,
  `bout` double(6,5) default NULL,
  `modifiedtime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for smeassessment
-- ----------------------------
DROP TABLE IF EXISTS `smeassessment`;
CREATE TABLE `smeassessment` (
  `id` int(11) NOT NULL auto_increment,
  `risklevel` varchar(4) default NULL,
  `score` double(11,6) default NULL,
  `rank` int(11) default NULL,
  `industryrank` int(11) default NULL,
  `time` date default NULL,
  `companyid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for transinfo
-- ----------------------------
DROP TABLE IF EXISTS `transinfo`;
CREATE TABLE `transinfo` (
  `id` int(11) NOT NULL auto_increment,
  `accountIn` varchar(20) NOT NULL,
  `accountOut` varchar(20) NOT NULL,
  `amount` double(15,0) default NULL,
  `time` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `id` int(4) NOT NULL auto_increment,
  `typename` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for warninfo
-- ----------------------------
DROP TABLE IF EXISTS `warninfo`;
CREATE TABLE `warninfo` (
  `id` int(11) NOT NULL auto_increment,
  `time` date default NULL,
  `prevalue` double(11,6) default NULL,
  `latevalue` double(11,6) default NULL,
  `description` varchar(100) NOT NULL,
  `warnparameterid` int(11) NOT NULL,
  `smeassessid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for warnparameter
-- ----------------------------
DROP TABLE IF EXISTS `warnparameter`;
CREATE TABLE `warnparameter` (
  `id` int(11) NOT NULL auto_increment,
  `value` double(6,3) default NULL,
  `modifedtime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '0000000000000001');
INSERT INTO `account` VALUES ('2', '2', '0000000000000002');
INSERT INTO `account` VALUES ('3', '3', '0000000000000003');
INSERT INTO `account` VALUES ('4', '4', '0000000000000004');
INSERT INTO `account` VALUES ('5', '5', '0000000000000005');
INSERT INTO `account` VALUES ('6', '6', '0000000000000006');
INSERT INTO `account` VALUES ('7', '7', '0000000000000007');
INSERT INTO `account` VALUES ('8', '3', '0000000000000008');
INSERT INTO `account` VALUES ('9', '2', '0000000000000009');
INSERT INTO `account` VALUES ('10', '8', '0000000000000010');
INSERT INTO `account` VALUES ('11', '9', '0000000000000011');
INSERT INTO `account` VALUES ('12', '10', '0000000000000012');
INSERT INTO `account` VALUES ('13', '11', '0000000000000013');
INSERT INTO `account` VALUES ('14', '4', '0000000000000014');
INSERT INTO `account` VALUES ('15', '12', '0000000000000015');
INSERT INTO `account` VALUES ('16', '13', '0000000000000016');
INSERT INTO `account` VALUES ('17', '14', '0000000000000017');
INSERT INTO `account` VALUES ('18', '15', '0000000000000018');
INSERT INTO `account` VALUES ('19', '16', '0000000000000019');
INSERT INTO `account` VALUES ('20', '17', '0000000000000020');
INSERT INTO `account` VALUES ('21', '2', '0000000000000021');
INSERT INTO `account` VALUES ('22', '18', '0000000000000022');
INSERT INTO `account` VALUES ('23', '2', '0000000000000023');
INSERT INTO `account` VALUES ('24', '19', '0000000000000024');
INSERT INTO `account` VALUES ('25', '20', '0000000000000025');
INSERT INTO `account` VALUES ('26', '3', '0000000000000026');
INSERT INTO `account` VALUES ('27', '21', '0000000000000027');
INSERT INTO `account` VALUES ('28', '22', '0000000000000028');
INSERT INTO `account` VALUES ('29', '23', '0000000000000029');
INSERT INTO `account` VALUES ('30', '24', '0000000000000030');
INSERT INTO `account` VALUES ('31', '25', '0000000000000031');
INSERT INTO `account` VALUES ('32', '26', '0000000000000032');
INSERT INTO `account` VALUES ('33', '27', '0000000000000033');
INSERT INTO `account` VALUES ('34', '28', '0000000000000034');
INSERT INTO `bankuser` VALUES ('1', '1', '233', '娜娜', '信贷部', 'nana', '1234');
INSERT INTO `bankuser` VALUES ('2', '2', '542', '鑫鑫', '风险控制部', 'xinxin', '1234');
INSERT INTO `bankuser` VALUES ('3', '3', '125', '聪聪', '科技运营部', 'zc', '123');
INSERT INTO `bankuser` VALUES ('4', '2', '123', '宿舍', '速度', 'zc', '1');
INSERT INTO `bankuser` VALUES ('5', '1', '456', '速度', '司法官', 'zc', '2');
INSERT INTO `bankuser` VALUES ('6', '1', '234', '士大夫', '士大夫', 'zc', '3');
INSERT INTO `bankuser` VALUES ('9', '1', '111', 'zhocuong', 'asdf', 'zc', '111');
INSERT INTO `bankuser` VALUES ('8', '1', '455 ', '豆腐花', '飞过海', 'zc', '5');
INSERT INTO `bankuser` VALUES ('10', '2', '222', 'zhoucong', 'asd', 'zc', '222');
INSERT INTO `companyinfo` VALUES ('1', '西安科技有限责任公司', '10000000', '2000000', '周聪', '13467856399', '0', '0', '7');
INSERT INTO `companyinfo` VALUES ('2', '西安三星有限责任公司', '10000023', '50000000', '杨峰', '13456789678', '0', '1', '2');
INSERT INTO `companyinfo` VALUES ('3', '红叶有限责任公司', '20000340', '2100000', '王珏鑫', '82656667', '0', '1', '2');
INSERT INTO `companyinfo` VALUES ('4', '腾讯股份有限公司', '30000876', '800000000', '窦辉', '67658930', '0', '1', '3');
INSERT INTO `companyinfo` VALUES ('5', '雁塔有限责任公司', '23000012', '2300000', '汪雅妮', '15823636952', '0', '0', '4');
INSERT INTO `companyinfo` VALUES ('6', '太白股份有限公司', '56236594', '50000000', '付晨', '15923665845', '1', '1', '3');
INSERT INTO `companyinfo` VALUES ('7', '西安风险投资有限责任公司', '23656560', '1000000', '毛娜', '82652230', '0', '0', '3');
INSERT INTO `companyinfo` VALUES ('8', '柯达股份有限公司', '56945512', '56000000', '苏洁', '86521345', '0', '0', '3');
INSERT INTO `companyinfo` VALUES ('9', '东方科技有限责任公司', '45681318', '1264000', '王晓玉', '65682132', '0', '0', '13');
INSERT INTO `companyinfo` VALUES ('10', '东风股份有限公司', '98564215', '100000000', '孔晓雨', '13569845656', '1', '1', '7');
INSERT INTO `companyinfo` VALUES ('11', '西部投资股份有限公司', '15466512', '230000000', '李宁', '95623654', '1', '1', '11');
INSERT INTO `companyinfo` VALUES ('12', '西欧机械有限责任公司', '58962365', '5100000', '方达', '96548569', '0', '0', '4');
INSERT INTO `companyinfo` VALUES ('13', '恒大地产股份有限公司', '85962365', '82100000', '夏雨荷', '58168320', '0', '0', '5');
INSERT INTO `companyinfo` VALUES ('14', '宝钢控股集团', '85945612', '3100000000', '谢林', '49956123', '1', '1', '4');
INSERT INTO `companyinfo` VALUES ('15', '鞍山钢铁集团', '46561848', '1200000000', '杨东方', '96485551', '1', '1', '9');
INSERT INTO `companyinfo` VALUES ('16', '小肥羊餐饮股份有限公司', '12468514', '60000000', '王秀丽', '13594687897', '1', '1', '9');
INSERT INTO `companyinfo` VALUES ('17', '西开肥牛控股集团', '85946123', '40000000', '牛建国', '85646523', '1', '1', '9');
INSERT INTO `companyinfo` VALUES ('18', '小天鹅集团', '85623652', '100000000', '魏建林', '15465512321', '1', '1', '5');
INSERT INTO `companyinfo` VALUES ('19', '中国石油控股集团', '54623654', '12000000000', '石美琳', '94561324', '1', '1', '5');
INSERT INTO `companyinfo` VALUES ('20', '海天有限责任公司', '46568132', '2300000', '海梅', '86451235', '0', '0', '7');
INSERT INTO `companyinfo` VALUES ('21', '新浪科技有限责任公司', '65465321', '4200000', '谢林云', '76865461', '0', '0', '5');
INSERT INTO `companyinfo` VALUES ('22', '美孚石油集团', '48125131', '72000000', '方琳', '89562312', '0', '0', '6');
INSERT INTO `companyinfo` VALUES ('23', '崂山旅游有限责任公司', '54658223', '5620000', '向腊梅', '46465122', '0', '0', '3');
INSERT INTO `companyinfo` VALUES ('24', '西飞国际股份有限公司', '45616812', '12000000', '柳梦梅', '98954223', '0', '0', '6');
INSERT INTO `companyinfo` VALUES ('25', '西安电子有限责任公司', '79843212', '4500000', '云天河', '48621322', '0', '0', '11');
INSERT INTO `companyinfo` VALUES ('26', '成都飞机制造集团', '78121233', '89000000', '欧阳峰', '48121239', '0', '0', '3');
INSERT INTO `companyinfo` VALUES ('27', '海尔集团', '78451323', '1200000000', '李晓娜', '89431333', '0', '0', '3');
INSERT INTO `companyinfo` VALUES ('28', '腾飞有限责任公司', '89451309', '3200000', '闵方伟', '89435612', '0', '0', '4');
INSERT INTO `companyuser` VALUES ('1', '西安交大', 'SW12345', 'zc', 'zc', '4');
INSERT INTO `companyuser` VALUES ('7', '西安交通大学创业园', '7907', 'cv', '123456', '6');
INSERT INTO `feedback` VALUES ('1', '1', '2009-08-10', '1', '近期应该注意该企业流动性风险');
INSERT INTO `feedback` VALUES ('2', '22', '2010-08-16', '1', '在本期打分中，贵企业出现严重评分下降状况，希望你们做出合理解释，否则将移出优质企业表。');
INSERT INTO `feedback` VALUES ('3', '22', '2010-08-17', '0', '企业正面对一项大型业务，其他业务暂时搁浅。');
INSERT INTO `feedback` VALUES ('4', '22', '2010-08-18', '1', '请问贵企业业务何时完成，何时恢复正常？');
INSERT INTO `feedback` VALUES ('5', '22', '2010-08-19', '0', '下月中旬我们将完成这一大型业务，届时一切恢复正常。');
INSERT INTO `feedback` VALUES ('6', '22', '2010-08-20', '1', '基于此，我们将于下月底对你们进行重新测评，届时将决定是否作为推荐。');
INSERT INTO `feedback` VALUES ('7', '4', '2010-08-21', '0', '在最近一期打分中，我们企业进入了优质企业推荐名单，请问我们企业有什么好处？');
INSERT INTO `feedback` VALUES ('8', '4', '2010-08-22', '1', '进入推荐名单后，你们可以获得相应的电子印章，对应企业特权。详情请在本系统网页中继续查看。');
INSERT INTO `feedback` VALUES ('9', '4', '2010-08-23', '0', '谢谢！');
INSERT INTO `feedback` VALUES ('10', '9', '2010-08-24', '1', '您好，贵企业已经连续几期成为我们本系统中优质中小企业，请问贵企业是否计划贷款，增加现金资本，进一步投资。');
INSERT INTO `feedback` VALUES ('11', '9', '2010-08-25', '0', '企业近期有想法扩大规模，希望能够尽快联系。');
INSERT INTO `feedback` VALUES ('12', '9', '2010-08-26', '1', '贵企业可以查询电子护照，查看企业特权，以提高贷款优惠。');
INSERT INTO `feedback` VALUES ('13', '9', '2010-08-27', '0', '谢谢！');
INSERT INTO `feedback` VALUES ('14', '7', '2010-08-28', '0', '您好，我们企业在下期打分中会进行重组，会影响到业务的进行。');
INSERT INTO `feedback` VALUES ('15', '7', '2010-08-29', '1', '请上传相关资料，我们会根据材料认定企业打分是否会因此影响。');
INSERT INTO `feedback` VALUES ('16', '7', '2010-08-30', '0', '材料已上传~');
INSERT INTO `feedback` VALUES ('17', '7', '2010-08-31', '1', '本行认定企业会受影响，我们将在下一期中不对企业评级调整，请尽快完成重组工作。');
INSERT INTO `feedback` VALUES ('18', '7', '2010-09-01', '0', '谢谢您，如果在下期不能完成呢，可以继续申请吗？');
INSERT INTO `feedback` VALUES ('19', '7', '2010-09-02', '1', '我们到时候根据情况决定是否改变。');
INSERT INTO `feedback` VALUES ('20', '7', '2010-09-03', '0', '好的，谢谢！');
INSERT INTO `industrytype` VALUES ('1', '1', '农、林、牧、渔业');
INSERT INTO `industrytype` VALUES ('2', '2', '采矿业');
INSERT INTO `industrytype` VALUES ('3', '3', '制造业');
INSERT INTO `industrytype` VALUES ('4', '4', '电力、燃气及水的生产和供应业');
INSERT INTO `industrytype` VALUES ('5', '5', '建筑业');
INSERT INTO `industrytype` VALUES ('6', '6', '交通运输、仓储和邮政业');
INSERT INTO `industrytype` VALUES ('7', '7', '信息传输、计算机服务和软件业');
INSERT INTO `industrytype` VALUES ('8', '8', '批发和零售业');
INSERT INTO `industrytype` VALUES ('9', '9', '住宿和餐饮业');
INSERT INTO `industrytype` VALUES ('10', '10', '金融业');
INSERT INTO `industrytype` VALUES ('11', '11', '房地产业');
INSERT INTO `industrytype` VALUES ('12', '12', '租赁和商务服务业');
INSERT INTO `industrytype` VALUES ('13', '13', '科学研究、技术服务和地质勘查业');
INSERT INTO `industrytype` VALUES ('14', '14', '水利、环境、和公共设施管理业');
INSERT INTO `industrytype` VALUES ('15', '15', '居民服务和其他服务业');
INSERT INTO `industrytype` VALUES ('16', '16', '教育');
INSERT INTO `industrytype` VALUES ('17', '17', '卫生、社会保障和社会福利业');
INSERT INTO `industrytype` VALUES ('18', '18', '文化、体育和娱乐业');
INSERT INTO `industrytype` VALUES ('19', '19', '公共管理与社会组织');
INSERT INTO `industrytype` VALUES ('20', '20', '国际组织');
INSERT INTO `parameter` VALUES ('1', '0.00300', '0.00004', '1000000.00', '12.00000', '0.15000', '0.17000', '0.13000', '0.23000', '2010-08-17');
INSERT INTO `parameter` VALUES ('2', '0.00200', '0.00006', '1000000.00', '12.00000', '0.15000', '0.17000', '0.13000', '0.23000', '2010-08-14');
INSERT INTO `parameter` VALUES ('3', '0.00250', '0.00005', '1000000.00', '12.00000', '0.15500', '0.17700', '0.13300', '0.23300', '2010-08-18');
INSERT INTO `parameter` VALUES ('6', '0.00350', '0.00004', '3000000.00', '12.00000', '0.40100', '0.43100', '0.26700', '0.28900', '2010-09-03');
INSERT INTO `smeassessment` VALUES ('1', 'D', '23.000000', '6', '2', '2010-08-14', '1');
INSERT INTO `smeassessment` VALUES ('2', 'C', '46.000000', '4', '2', '2010-08-14', '4');
INSERT INTO `smeassessment` VALUES ('3', 'E', '11.000000', '11', '3', '2010-08-14', '5');
INSERT INTO `smeassessment` VALUES ('4', 'D', '32.000000', '5', '3', '2010-08-14', '7');
INSERT INTO `smeassessment` VALUES ('5', 'A', '100.000000', '1', '1', '2010-08-14', '8');
INSERT INTO `smeassessment` VALUES ('6', 'B', '74.000000', '2', '1', '2010-08-14', '9');
INSERT INTO `smeassessment` VALUES ('7', 'E', '13.000000', '10', '2', '2010-08-14', '12');
INSERT INTO `smeassessment` VALUES ('8', 'E', '2.000000', '16', '2', '2010-08-14', '13');
INSERT INTO `smeassessment` VALUES ('9', 'C', '50.000000', '3', '1', '2010-08-14', '20');
INSERT INTO `smeassessment` VALUES ('10', 'E', '8.000000', '13', '1', '2010-08-14', '21');
INSERT INTO `smeassessment` VALUES ('11', 'E', '7.000000', '14', '2', '2010-08-14', '22');
INSERT INTO `smeassessment` VALUES ('12', 'E', '16.000000', '7', '4', '2010-08-14', '23');
INSERT INTO `smeassessment` VALUES ('13', 'E', '13.000000', '9', '1', '2010-08-14', '24');
INSERT INTO `smeassessment` VALUES ('14', 'E', '5.000000', '15', '1', '2010-08-14', '25');
INSERT INTO `smeassessment` VALUES ('15', 'E', '9.000000', '12', '5', '2010-08-14', '26');
INSERT INTO `smeassessment` VALUES ('16', 'E', '13.000000', '8', '1', '2010-08-14', '28');
INSERT INTO `smeassessment` VALUES ('129', 'D', '21.283536', '6', '2', '2010-08-17', '1');
INSERT INTO `smeassessment` VALUES ('130', 'E', '5.775851', '14', '3', '2010-08-17', '5');
INSERT INTO `smeassessment` VALUES ('131', 'D', '23.347625', '5', '3', '2010-08-17', '7');
INSERT INTO `smeassessment` VALUES ('132', 'A', '100.000000', '1', '1', '2010-08-17', '8');
INSERT INTO `smeassessment` VALUES ('133', 'A', '92.108801', '2', '1', '2010-08-17', '9');
INSERT INTO `smeassessment` VALUES ('134', 'E', '11.792720', '8', '2', '2010-08-17', '12');
INSERT INTO `smeassessment` VALUES ('135', 'E', '2.161191', '15', '2', '2010-08-17', '13');
INSERT INTO `smeassessment` VALUES ('136', 'B', '77.213209', '3', '1', '2010-08-17', '20');
INSERT INTO `smeassessment` VALUES ('137', 'E', '5.824004', '13', '1', '2010-08-17', '21');
INSERT INTO `smeassessment` VALUES ('138', 'E', '5.959110', '11', '2', '2010-08-17', '22');
INSERT INTO `smeassessment` VALUES ('139', 'D', '25.488659', '4', '2', '2010-08-17', '23');
INSERT INTO `smeassessment` VALUES ('140', 'E', '10.623131', '9', '1', '2010-08-17', '24');
INSERT INTO `smeassessment` VALUES ('141', 'E', '5.912623', '12', '1', '2010-08-17', '25');
INSERT INTO `smeassessment` VALUES ('142', 'E', '9.345679', '10', '4', '2010-08-17', '26');
INSERT INTO `smeassessment` VALUES ('143', 'E', '0.209110', '16', '5', '2010-08-17', '27');
INSERT INTO `smeassessment` VALUES ('144', 'E', '12.239897', '7', '1', '2010-08-17', '28');
INSERT INTO `smeassessment` VALUES ('161', 'D', '23.396714', '6', '2', '2010-08-18', '1');
INSERT INTO `smeassessment` VALUES ('162', 'C', '45.329046', '4', '2', '2010-08-18', '4');
INSERT INTO `smeassessment` VALUES ('163', 'E', '9.061801', '11', '3', '2010-08-18', '5');
INSERT INTO `smeassessment` VALUES ('164', 'D', '23.942000', '5', '3', '2010-08-18', '7');
INSERT INTO `smeassessment` VALUES ('165', 'A', '100.000000', '1', '1', '2010-08-18', '8');
INSERT INTO `smeassessment` VALUES ('166', 'A', '88.451327', '2', '1', '2010-08-18', '9');
INSERT INTO `smeassessment` VALUES ('167', 'E', '9.509615', '9', '1', '2010-08-18', '12');
INSERT INTO `smeassessment` VALUES ('168', 'E', '2.194859', '16', '2', '2010-08-18', '13');
INSERT INTO `smeassessment` VALUES ('169', 'C', '59.466699', '3', '1', '2010-08-18', '20');
INSERT INTO `smeassessment` VALUES ('170', 'E', '5.912376', '13', '1', '2010-08-18', '21');
INSERT INTO `smeassessment` VALUES ('171', 'E', '4.341304', '14', '2', '2010-08-18', '22');
INSERT INTO `smeassessment` VALUES ('172', 'E', '19.571707', '7', '4', '2010-08-18', '23');
INSERT INTO `smeassessment` VALUES ('173', 'E', '10.741063', '8', '1', '2010-08-18', '24');
INSERT INTO `smeassessment` VALUES ('174', 'E', '3.318483', '15', '1', '2010-08-18', '25');
INSERT INTO `smeassessment` VALUES ('175', 'E', '7.185545', '12', '5', '2010-08-18', '26');
INSERT INTO `smeassessment` VALUES ('176', 'E', '9.102153', '10', '2', '2010-08-18', '28');
INSERT INTO `smeassessment` VALUES ('193', 'E', '19.770619', '6', '2', '2010-09-03', '1');
INSERT INTO `smeassessment` VALUES ('194', 'E', '6.710863', '11', '3', '2010-09-03', '5');
INSERT INTO `smeassessment` VALUES ('195', 'D', '28.108925', '4', '2', '2010-09-03', '7');
INSERT INTO `smeassessment` VALUES ('196', 'A', '100.000000', '1', '1', '2010-09-03', '8');
INSERT INTO `smeassessment` VALUES ('197', 'A', '97.578969', '2', '1', '2010-09-03', '9');
INSERT INTO `smeassessment` VALUES ('198', 'E', '10.199795', '7', '1', '2010-09-03', '12');
INSERT INTO `smeassessment` VALUES ('199', 'E', '2.607984', '15', '2', '2010-09-03', '13');
INSERT INTO `smeassessment` VALUES ('200', 'A', '81.454332', '3', '1', '2010-09-03', '20');
INSERT INTO `smeassessment` VALUES ('201', 'E', '5.699073', '12', '1', '2010-09-03', '21');
INSERT INTO `smeassessment` VALUES ('202', 'E', '4.532160', '13', '2', '2010-09-03', '22');
INSERT INTO `smeassessment` VALUES ('203', 'D', '26.942065', '5', '3', '2010-09-03', '23');
INSERT INTO `smeassessment` VALUES ('204', 'E', '10.092157', '8', '1', '2010-09-03', '24');
INSERT INTO `smeassessment` VALUES ('205', 'E', '3.714361', '14', '1', '2010-09-03', '25');
INSERT INTO `smeassessment` VALUES ('206', 'E', '7.891707', '10', '4', '2010-09-03', '26');
INSERT INTO `smeassessment` VALUES ('207', 'E', '0.251754', '16', '5', '2010-09-03', '27');
INSERT INTO `smeassessment` VALUES ('208', 'E', '8.922339', '9', '2', '2010-09-03', '28');
INSERT INTO `transinfo` VALUES ('1', '0000000000000001', '0000000000000010', '5000000', '2010-06-05');
INSERT INTO `transinfo` VALUES ('2', '0000000000000011', '0000000000000002', '4500000', '2010-06-06');
INSERT INTO `transinfo` VALUES ('3', '0000000000000006', '0000000000000003', '234444', '2010-06-06');
INSERT INTO `transinfo` VALUES ('4', '0000000000000004', '0000000000000026', '5000000', '2010-06-07');
INSERT INTO `transinfo` VALUES ('5', '0000000000000005', '0000000000000013', '850000', '2010-06-08');
INSERT INTO `transinfo` VALUES ('6', '0000000000000021', '0000000000000006', '700000', '2010-06-09');
INSERT INTO `transinfo` VALUES ('7', '0000000000000017', '0000000000000007', '9560000', '2010-06-10');
INSERT INTO `transinfo` VALUES ('8', '0000000000000023', '0000000000000008', '452563', '2010-06-11');
INSERT INTO `transinfo` VALUES ('9', '0000000000000009', '0000000000000024', '6958422', '2010-06-12');
INSERT INTO `transinfo` VALUES ('10', '0000000000000010', '0000000000000021', '7856232', '2010-06-13');
INSERT INTO `transinfo` VALUES ('11', '0000000000000011', '0000000000000019', '586299', '2010-06-14');
INSERT INTO `transinfo` VALUES ('12', '0000000000000011', '0000000000000020', '4586214', '2010-06-15');
INSERT INTO `transinfo` VALUES ('13', '0000000000000018', '0000000000000012', '489632', '2010-06-16');
INSERT INTO `transinfo` VALUES ('14', '0000000000000013', '0000000000000022', '458963', '2010-06-17');
INSERT INTO `transinfo` VALUES ('15', '0000000000000014', '0000000000000015', '896535', '2010-06-18');
INSERT INTO `transinfo` VALUES ('16', '0000000000000019', '0000000000000015', '789653', '2010-06-19');
INSERT INTO `transinfo` VALUES ('17', '0000000000000016', '0000000000000017', '789000', '2010-06-20');
INSERT INTO `transinfo` VALUES ('18', '0000000000000017', '0000000000000030', '890000', '2010-06-21');
INSERT INTO `transinfo` VALUES ('19', '0000000000000018', '0000000000000031', '125690', '2010-06-22');
INSERT INTO `transinfo` VALUES ('20', '0000000000000019', '0000000000000027', '780000', '2010-06-23');
INSERT INTO `transinfo` VALUES ('21', '0000000000000020', '0000000000000005', '965000', '2010-06-24');
INSERT INTO `transinfo` VALUES ('22', '0000000000000008', '0000000000000021', '9865000', '2010-06-25');
INSERT INTO `transinfo` VALUES ('23', '0000000000000006', '0000000000000022', '7896320', '2010-06-26');
INSERT INTO `transinfo` VALUES ('24', '0000000000000022', '0000000000000009', '856230', '2010-06-27');
INSERT INTO `transinfo` VALUES ('25', '0000000000000024', '0000000000000012', '783250', '2010-06-28');
INSERT INTO `transinfo` VALUES ('26', '0000000000000025', '0000000000000026', '9856420', '2010-06-29');
INSERT INTO `transinfo` VALUES ('27', '0000000000000026', '0000000000000010', '785923', '2010-06-30');
INSERT INTO `transinfo` VALUES ('28', '0000000000000013', '0000000000000027', '654200', '2010-07-01');
INSERT INTO `transinfo` VALUES ('29', '0000000000000014', '0000000000000028', '658423', '2010-07-02');
INSERT INTO `transinfo` VALUES ('30', '0000000000000029', '0000000000000008', '3285620', '2010-07-03');
INSERT INTO `transinfo` VALUES ('31', '0000000000000030', '0000000000000006', '456123', '2010-07-04');
INSERT INTO `transinfo` VALUES ('32', '0000000000000015', '0000000000000031', '785423', '2010-07-05');
INSERT INTO `transinfo` VALUES ('33', '0000000000000004', '0000000000000032', '789230', '2010-07-06');
INSERT INTO `transinfo` VALUES ('34', '0000000000000002', '0000000000000014', '788512', '2010-07-07');
INSERT INTO `transinfo` VALUES ('35', '0000000000000033', '0000000000000001', '789223', '2010-07-08');
INSERT INTO `transinfo` VALUES ('36', '0000000000000008', '0000000000000034', '965823', '2010-07-11');
INSERT INTO `transinfo` VALUES ('37', '0000000000000017', '0000000000000034', '125863', '2010-07-12');
INSERT INTO `transinfo` VALUES ('38', '0000000000000015', '0000000000000032', '75823', '2010-07-13');
INSERT INTO `transinfo` VALUES ('39', '0000000000000032', '0000000000000019', '789653', '2010-07-14');
INSERT INTO `transinfo` VALUES ('40', '0000000000000025', '0000000000000013', '85236', '2010-07-15');
INSERT INTO `transinfo` VALUES ('41', '0000000000000024', '0000000000000030', '542630', '2010-07-18');
INSERT INTO `transinfo` VALUES ('42', '0000000000000023', '0000000000000011', '2544632', '2010-07-19');
INSERT INTO `transinfo` VALUES ('43', '0000000000000016', '0000000000000025', '123415', '2010-07-20');
INSERT INTO `transinfo` VALUES ('44', '0000000000000017', '0000000000000027', '65423', '2010-07-22');
INSERT INTO `transinfo` VALUES ('45', '0000000000000020', '0000000000000033', '85623', '2010-07-22');
INSERT INTO `usertype` VALUES ('1', '信贷员');
INSERT INTO `usertype` VALUES ('2', '风险评估员');
INSERT INTO `usertype` VALUES ('3', '后台管理员');
INSERT INTO `usertype` VALUES ('4', '企业用户');
INSERT INTO `warninfo` VALUES ('8', '2010-08-18', '5.959110', '4.341304', '该企业被预警!', '3', '171');
INSERT INTO `warninfo` VALUES ('9', '2010-08-18', '5.912623', '3.318483', '该企业被预警!', '3', '174');
INSERT INTO `warninfo` VALUES ('10', '2010-08-18', '12.239897', '9.102153', '该企业被预警!', '3', '176');
INSERT INTO `warninfo` VALUES ('5', '2010-08-17', '11.000000', '5.775851', '该企业被预警!', '3', '130');
INSERT INTO `warninfo` VALUES ('6', '2010-08-17', '32.000000', '23.347625', '该企业被预警!', '3', '131');
INSERT INTO `warninfo` VALUES ('7', '2010-08-17', '8.000000', '5.824004', '该企业被预警!', '3', '137');
INSERT INTO `warninfo` VALUES ('13', '2010-09-03', '9.061801', '6.710863', '该企业被预警!', '3', '194');
INSERT INTO `warnparameter` VALUES ('1', '0.200', '2010-08-05');
INSERT INTO `warnparameter` VALUES ('2', '0.300', '2010-08-16');
INSERT INTO `warnparameter` VALUES ('3', '0.250', '2010-08-17');
