##   ɾ�����ݿ�
drop  database  ecport;

##   �������ݿ�
create   database   ecport;

##   ʹ�����ݿ�
use   ecport;


##   ���ұ�ṹ
create   table COUNTRY(
               country_id     int  primary key auto_increment,
               name           varchar(64)
              
               );
##   ģ����ұ�����               
INSERT INTO COUNTRY( name ) VALUES ('�й�');

create   table PROVINCE(
               province_id     int  primary key auto_increment,
               name           varchar(64),
               country_id      int  references   COUNTRY(country_id)
               );
//    ģ��ʡ�ݱ�����
INSERT INTO province (province_id , name , country_id ) VALUES (1, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (2, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (3, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (4, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (5, '�㶫', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (6, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (7, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (8, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (9, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (10, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (11, '�ӱ�', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (12, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (13, '���', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (14, '������', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (15, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (16, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (17, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (18, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (19, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (20, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (21, '���ɹ�', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (22, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (23, '�ຣ', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (24, '�Ĵ�', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (25, 'ɽ��', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (26, '�Ϻ�', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (27, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (28, 'ɽ��', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (29, '���', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (30, '̨��', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (31, '�½�', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (32, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (33, '����', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (34, '�㽭', 1);
INSERT INTO province (province_id , name , country_id ) VALUES (35, '����', 1);
  
  ##    �û�������Ϣ��ṹ
  create  table  USER(
                   user_id     int   primary key  auto_increment,
                   name        varchar(64),
                   passwd      varchar(16)
                   );
                   
  ##    �û���Ϣ������Ϣ��ṹ
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
 
## ������Ʒ���ͱ�ṹ
create   table   Category(
                 category_id   int  primary key auto_increment,
                 name          varchar(64),
                 descriptions  varchar(256)
                  );  
##  ģ����Ʒ����  
INSERT INTO  Category (category_id , name ,descriptions )  values  (1, '�����', '��������������');
INSERT INTO  Category (category_id , name ,descriptions )  values (2, 'Ӣ��', 'Ӣ�����ͼ��');
INSERT INTO  Category (category_id , name ,descriptions )  values (3, '��ѧ', '��ѧ��Ʒͼ�鼯');
                 
## ������Ʒ��ṹ
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
                             
##  ģ����Ʒ���� 

INSERT INTO product VALUES ('1', 'sdfs', '12', 'sldfkj', 'sdfas', '23', '', '1', '2010-03-15', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', '3242', '1', '123412', '1');


##����Ϊ�����촴����ṹ
##  �������ʽ��ṹ

 create   table  PAYWAY(
                   payway_id  int  primary key auto_increment,
                   payStyle   varchar(36)
                   );
## ģ�⸶�ʽ����
insert  into   PAYWAY(payway_id , payStyle) values(1, "�ֽ𸶿�");
insert  into   PAYWAY(payway_id , payStyle) values(2, "��������");
insert  into   PAYWAY(payway_id , payStyle) values(3, "��㸶��");

## ��������״̬��ṹ
  create   table  OrderStatus(
            orderStatus_id   int  primary key auto_increment,
            name    varchar(36),
            descriptions  varchar(128)
            );
##  ģ�ƶ���״̬����
insert into  OrderStatus(orderStatus_id,name, descriptions) values
(1,'���״̬','�����������״̬�����ڽ�����');
insert into  OrderStatus(orderStatus_id,name, descriptions) values
(2,'�ɹ�״̬','�����Ѿ��ɹ����ͻ���');
insert into  OrderStatus(orderStatus_id,name, descriptions) values
(3,'����;��','���������ͻ�״̬');
insert into  OrderStatus(orderStatus_id,name, descriptions) values
(4,'ȱ��״̬','�����漰��Ʒ��ʱȱ��');             

## ����������ṹ
 create  table  myOrder(
                order_id  int  primary key auto_increment,
                name      varchar(32),
                cost      double,
                user_id   int  references USER(user_id),
                payWay_id int  references PAYWAY(payWay_id),
                orderStatus_id  int  references ORDERSTATUS(orderStatus_id)
                );     

## ����������ϸ��
 create   table OrderLine(
                orderLine_id  int primary key auto_increment,
                amount        int ,
                product_id    int  references PRODUCT(product_id),
                order_id      int  references MYORDER(order_id)
                );                                                                                    