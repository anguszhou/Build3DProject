##   删除数据库
drop  database  ecport;

##   创建数据库
create   database   ecport;

##   使用数据库
use   ecport;


##   国家表结构
create   table COUNTRY(
               country_id     int  primary key auto_increment,
               name           varchar(64)
              
               );
##   模拟国家表数据               
INSERT INTO COUNTRY( name ) VALUES ('中国');

create   table PROVINCE(
               province_id     int  primary key auto_increment,
               name           varchar(64),
               country_id      int  references   COUNTRY(country_id)
               );
//    模拟省份表数据
INSERT INTO province (province_id , name , country_id ) VALUES (1, '安徽', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (2, '北京', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (3, '重庆', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (4, '福建', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (5, '广东', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (6, '甘肃', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (7, '广西', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (8, '贵州', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (9, '河南', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (10, '湖北', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (11, '河北', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (12, '海南', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (13, '香港', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (14, '黑龙江', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (15, '湖南', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (16, '吉林', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (17, '江苏', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (18, '江西', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (19, '辽宁', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (20, '澳门', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (21, '内蒙古', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (22, '宁夏', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (23, '青海', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (24, '四川', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (25, '山东', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (26, '上海', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (27, '陕西', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (28, '山西', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (29, '天津', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (30, '台湾', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (31, '新疆', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (32, '西藏', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (33, '云南', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (34, '浙江', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (35, '其它', 1);
  
  ##    用户基本信息表结构
  create  table  USER(
                   user_id     int   primary key  auto_increment,
                   name        varchar(64),
                   passwd      varchar(16)
                   );
                   
  ##    用户信息关联信息表结构
 create  table  CONTCATINFO(
                    contcatinfo_id   int  references USER(user_id ),
                    street1          varchar(128),
                    street2          varchar(128),    
                    city             varchar(128), 
                    zip              varchar(12),    
                    email            varchar(128), 
                    homePhone        varchar(32),
                    cellPhone        varchar(32),
                    officePhone      varchar(32),
                    country_id   int   references COUNTRY(country_id),
                    province_id  int   references PROVINCE(province_id),
                    primary key(contcatinfo_id)
                    );
 
## 创建商品类型表结构
create   table   Category(
                 category_id   int  primary key auto_increment,
                 name          varchar(64),
                 descriptions  varchar(256)
                  );  
##  模拟商品数据  
INSERT INTO  Category (category_id , name ,descriptions )  values  (1, '计算机', '软件与程序设计相关');
INSERT INTO  Category (category_id , name ,descriptions )  values (2, '英语', '英语相关图书');
INSERT INTO  Category (category_id , name ,descriptions )  values (3, '文学', '文学作品图书集');
                 
## 创建商品表结构
CREATE TABLE product (
  product_id int(11) NOT NULL auto_increment,
  name varchar(64) NOT NULL,
  size double default NULL,
  model varchar(64) default NULL,
  images varchar(128) default NULL,
  basePrice double default NULL,
  descriptions varchar(1000) default NULL,
  category_id int(11) default NULL,
  time date default NULL,
  service varchar(200) default NULL,
  cpu varchar(50) default NULL,
  board varchar(50) default NULL,
  color varchar(20) default NULL,
  disk varchar(50) default NULL,
  display varchar(50) default NULL,
  memory varchar(50) default NULL,
  saleVolume int(11) default NULL,
  promoted bit(1) default NULL,
  discountPrice double default NULL,
  discounted bit(1) default NULL,
  PRIMARY KEY  (`product_id`)
) CHARSET=gbk;            
                             
##  模拟商品数据 

INSERT INTO product VALUES ('1', 'sdfs', '12', 'sldfkj', 'sdfas', '23', '', '1', '2010-03-15', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', '3242', '1', '123412', '1');


##以下为第三天创建表结构
##  创建付款方式表结构

 create   table  PAYWAY(
                   payway_id  int  primary key auto_increment,
                   payStyle   varchar(36)
                   );
## 模拟付款方式数据
insert  into   PAYWAY(payway_id , payStyle) values(1, "现金付款");
insert  into   PAYWAY(payway_id , payStyle) values(2, "网银付款");
insert  into   PAYWAY(payway_id , payStyle) values(3, "电汇付款");

## 创建订单状态表结构
  create   table  OrderStatus(
            orderStatus_id   int  primary key auto_increment,
            name    varchar(36),
            descriptions  varchar(128)
            );
##  模似订单状态数据
insert into  OrderStatus(orderStatus_id,name, descriptions) values
(1,'配货状态','订单正在配货状态三天内将发出');
insert into  OrderStatus(orderStatus_id,name, descriptions) values
(2,'成功状态','订单已经成功发送货物');
insert into  OrderStatus(orderStatus_id,name, descriptions) values
(3,'交易途中','订单正在送货状态');
insert into  OrderStatus(orderStatus_id,name, descriptions) values
(4,'缺货状态','订单涉及货品暂时缺货');             

## 创建订单表结构
 create  table  myOrder(
                order_id  int  primary key auto_increment,
                name      varchar(32),
                cost      double,
                user_id   int  references USER(user_id),
                payWay_id int  references PAYWAY(payWay_id),
                orderStatus_id  int  references ORDERSTATUS(orderStatus_id)
                );     

## 创建订单明细表
 create   table OrderLine(
                orderLine_id  int primary key auto_increment,
                amount        int ,
                product_id    int  references PRODUCT(product_id),
                order_id      int  references MYORDER(order_id)
                );                                                                                    