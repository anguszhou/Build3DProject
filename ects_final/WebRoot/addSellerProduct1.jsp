<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/login.js"></script>
		<script type="text/javascript" src="js/jquery-1.2.1.min.js"></script>
<title></title>
<script language="javaScript" >
var CityData;
var CityCount;
function CityList(cid,pid,cname,ename,ccode){
var CityId = cid;
var CityPid = pid;
var CityCnName = cname;
var CityEnName = ename;
var CityCode = ccode;
var idx;

 if(this.CityData == null){
	this.CityData=new Array;
	idx=0;
 }else{
	idx=this.CityData.length;
	idx+1;
 }
	this.CityData[idx]=new Array(CityId, CityPid,CityCnName,CityEnName,CityCode);
	this.CithCount = idx;
	
}
function SelectCity(CityData,FormName,CityName,id){
  var FormValue = "";
  if(id == null || id == "" || id == 'undefined') id = 0;
  if(FormName == null || FormName == "" || FormName == 'undefined') FormName = "citylist";
  for(i=0;i<CityData.length;i++){
	if(CityData[i][1] == id){
		getID(FormName).options[getID(FormName).options.length]= new Option(CityData[i][2],CityData[i][4]);
	}
  }
}
function SelectCode(CityData,FormName,id){
  var FormValue = "";
  if(id == null || id == "" || id == 'undefined') id = 0;
  if(FormName == null || FormName == "" || FormName == 'undefined') FormName = "citycode";
  for(i=0;i<CityData.length;i++){
	if(CityData[i][1] == id){
		getID(FormName).options[getID(FormName).options.length]= new Option(CityData[i][2],CityData[i][4]);
	}
  }
}
function DelSelect(FormName) {
	FormName = getID(FormName).innerHTML = "";
}
function searchID(name){
	var CityData = this.CityData;
	var id = 0;
	var num = getID(name).options[getID(name).selectedIndex].value;
	for(i=0;i<CityData.length;i++){
		if(CityData[i][4] == num){
			id = CityData[i][0];
		}
	}
	return id;
}
function m(citylist,citycode){
	var CityData = this.CityData;
	var id = searchID(citylist);
	if(id != "" && id != null && id != 'undefined'){
		DelSelect(citycode,'');
		SelectCode(CityData,citycode,id);
	}else{
		DelSelect(citycode,'');
		getID(citycode).options[0]= new Option("��ѡ��","");
	}
		getID(citycode).options[0].selected = true;
}
function listCity(code){
	var data = this.CityData;
	var outdata = false;
	for(i=0;i<data.length;i++){
		if(data[i][4] == code){
			outdata = data[i];
			break;
		}
	}
	return outdata;
}
function array_unique(array){
  var tmp = array
  for(var i=0;i<array.length;i++){  
	for(j=i+1;j<array.length;j++){  
		if(a[i]==a[j])tmp[i]=null ; 
	}  
  }  
  var m = 0,ok = new Array();  
  for(k=0;k<tmp.length;k++){  
	if(tmp[k]){ 
		m = m++;
		ok[m] = tmp[k];
	 }
  }
} 
function getID(ID){
 var ID = document.getElementById(ID);
 return ID;
}

//===========  ������������ =========//
CityList(1,0,"����","CN","����");
CityList(2,0,"��װ","JP","��װ");
CityList(3,0,"�鼮","US","�鼮");
CityList(4,0,"�ճ���Ʒ","US","�ճ���Ʒ");
//===========  ʡ�ݻ���ֱϽ���������� =========//
CityList(501,2,"������","Beijing","CN001000");
CityList(502,2,"������","Chongqing","CN002000");
CityList(503,2,"�����","Tianjin","CN003000");
CityList(504,3,"�Ϻ���","Shanghai","CN004000");
CityList(505,3,"������ʡ","Heilongjiang","CN005000");
CityList(506,3,"����ʡ","Jilin","CN006000");
CityList(507,3,"����ʡ","Liaoning","CN007000");
CityList(508,3,"�ຣʡ","Qinghai","CN008000");
CityList(509,4,"ɽ��ʡ","Shanxi","CN009000");
CityList(510,4,"����ʡ","ShanXi","CN010000");
CityList(511,4,"����ʡ","Henan","CN011000");
CityList(512,4,"����ʡ","Hunan","CN012000");
CityList(513,4,"����ʡ","Hubei","CN013000");
CityList(514,4,"�ӱ�ʡ","Hebei","CN014000");
CityList(515,1,"����","Anhui","����");
CityList(516,1,"�ֻ�","Jiangsu","�ֻ�");
CityList(517,1,"�㽭ʡ","Zhejiang","CN017000");
CityList(518,1,"����ʡ","Jiangxi","CN018000");
CityList(519,1,"ɽ��ʡ","Shandong","CN019000");
CityList(520,1,"�㶫ʡ","Guangdong","CN020000");
CityList(521,1,"����ʡ","Yunnan","CN021000");
CityList(522,1,"����ʡ","Guizhou","CN022000");
CityList(523,1,"�Ĵ�ʡ","Sichuan","CN023000");
CityList(524,1,"����ʡ","Hainan","CN024000");
CityList(525,1,"����ʡ","Fujian","CN025000");
CityList(526,1,"̨��ʡ","Taiwan","CN026000");
CityList(527,1,"����ʡ","Gansu","CN027000");
CityList(528,1,"���Ļ���������","Ningxia","CN028000");
CityList(529,1,"����׳��������","Guangxi","CN0029000");
CityList(530,1,"���ɹ�������","Neimenggu","CN030000");
CityList(531,1,"�½�ά���������","Xinjiang","CN031000");
CityList(532,1,"����������","Xizang", "CN032000");
CityList(533,1,"����ر�������","Xianggang","CN033000");
CityList(534,1,"�����ر�������","Aomen","CN034000");
//===========  ���������ؼ����������� =========//
CityList(601,501,"������","Beijing","CN001001");
CityList(602,502,"������","Chongqing","CN002001");
CityList(603,503,"�����","Tianjin","CN003001");
CityList(604,504,"�Ϻ���","Shanghai","CN004001");
//===========  ����  ������  ���� =========//
CityList(606,505,"������","Haerbin","CN005001"); 
CityList(607,505,"�������","Qiqihaer","CN005002"); 
CityList(608,505,"ĵ����","Mudanjiang","CN005003"); 
CityList(609,505,"����","Daqing","CN005004"); 
CityList(610,505,"����","Jixi","CN005005"); 
CityList(611,505,"����","Yichun","CN005006"); 
CityList(612,505,"��ľ˹","Jiamusi","CN005007"); 
CityList(613,505,"�ں�","Heihe","CN005008"); 
CityList(614,505,"�绯","Suihua","CN005009"); 
CityList(615,505,"���˰���","Daxinganling","CN005010"); 
CityList(616,505,"�׸�","Hegang","CN005011"); 
CityList(617,505,"����","Hailun","CN005012"); 
CityList(618,505,"����","Ninan","CN005013"); 
//===========  ����  ����  ���� =========//
CityList(620,506,"����","Changchun","CN006001"); 
CityList(621,506,"�ӱ�","Yanbian","CN006002"); 
CityList(622,506,"ͨ��","Tonghua","CN006003"); 
CityList(623,506,"�׳�","Baicheng","CN006004"); 
CityList(624,506,"��Դ","Liaoyuan","CN006005"); 
CityList(625,506,"��ƽ","Siping","CN006006"); 
CityList(626,506,"��ɽ","Baishan","CN006007"); 
CityList(627,506,"��ԭ","Songyuan","CN006008"); 
CityList(628,506,"����","Jilin","CN006009"); 
CityList(629,506,"������","Gongzhuling","CN006010"); 
//===========  ����  �ɶ�  ���� =========//
CityList(631,507,"����","Shenyang","CN007001"); 
CityList(632,507,"����","Dalian","CN007002"); 
CityList(633,507,"��ɽ","Anshan","CN007003"); 
CityList(634,507,"��˳","Fushun","CN007004"); 
CityList(635,507,"��Ϫ","Benxi","CN007005"); 
CityList(636,507,"����","Jinzhou","CN007006"); 
CityList(637,507,"����","Dandong","CN007007"); 
CityList(638,507,"Ӫ��","Yingkou","CN007008"); 
CityList(639,507,"����","Liaoyang","CN007009"); 
CityList(640,507,"����","Tieling","CN007010"); 
CityList(641,507,"����","Chaoyang","CN007011"); 
CityList(642,507,"�̽�","Panjin","CN007012"); 
CityList(643,507,"����","Fuxin","CN007013"); 
CityList(644,507,"��«��","Huludao","CN007014"); 
//===========  ����  �ຣ  ���� =========//
CityList(646,508,"����","Xining","CN008001"); 
CityList(647,508,"����","Yushu","CN008002"); 
CityList(648,508,"����","Guoluo","CN008003"); 
CityList(649,508,"����","Haidong","CN008004"); 
CityList(650,508,"����","Haibei","CN008005"); 
CityList(651,508,"����","Haixi","CN008006"); 
CityList(652,508,"����","Huangnan","CN008007"); 
//===========  ����  ɽ��  ���� =========//
CityList(654,509,"̫ԭ","Taiyuan","CN009001"); 
CityList(655,509,"��ͬ","Datong","CN009002"); 
CityList(656,509,"��Ȫ","Yangquan","CN009003"); 
CityList(657,509,"����","Jinzhong","CN009004"); 
CityList(658,509,"����","Changzhi","CN009005"); 
CityList(659,509,"����","Jincheng","CN009006"); 
CityList(660,509,"�ٷ�","Linfen","CN009007"); 
CityList(661,509,"����","Lvliang","CN009008"); 
CityList(662,509,"�˳�","Yuncheng","CN009009"); 
CityList(663,509,"����","Xinzhou","CN009010"); 
CityList(664,509,"˷��","Shuozhou","CN009011"); 
//===========  ����  ����  ���� =========//
CityList(666,510,"����","Xian","CN010001"); 
CityList(667,510,"����","Xianyang","CN010002"); 
CityList(668,510,"����","Hanzhong","CN010003"); 
CityList(669,510,"����","Ankang","CN010004"); 
CityList(670,510,"����","Baoji","CN010005"); 
CityList(671,510,"����","Shangluo","CN010006"); 
CityList(672,510,"μ��","Weinan","CN010007"); 
CityList(673,510,"�Ӱ�","Yanan","CN010008"); 
CityList(674,510,"ͭ��","Tongchuan","CN010009"); 
CityList(675,510,"����","Yulin","CN010010"); 
//===========  ����  ����  ���� =========//
CityList(676,511,"֣��","Zhengzhou","CN011001"); 
CityList(677,511,"����","Xinyang","CN011002"); 
CityList(678,511,"����","Nanyang","CN011003"); 
CityList(679,511,"פ���","Zhumadian","CN011004"); 
CityList(680,511,"�ܿ�","Zhoukou","CN011005"); 
CityList(681,511,"���","Zuohe","CN011006"); 
CityList(682,511,"����","Xinxiang","CN011007"); 
CityList(683,511,"����","Anyang","CN011008"); 
CityList(684,511,"����Ͽ","Sanmenxia","CN011009"); 
CityList(685,511,"���","Xuchang","CN011010"); 
CityList(686,511,"ƽ��ɽ","Pingdingshan","CN011011"); 
CityList(687,511,"����","Kaifeng","CN011012"); 
CityList(688,511,"����","Luoyang","CN011013"); 
CityList(689,511,"����","Shangqiu","CN011014"); 
CityList(690,511,"��Դ","Jiyuan","CN011015"); 
CityList(691,511,"����","Jiaozuo","CN011016"); 
CityList(692,511,"�ױ�","Hebi","CN011017"); 
CityList(693,511,"���","Zuoyang","CN011018"); 
CityList(694,511,"����","Gongyi","CN011019"); 
CityList(695,511,"����","Xingyang","CN011020"); 
//===========  ����  ����  ���� =========//
CityList(696,512,"��ɳ","Changsha","CN012001"); 
CityList(697,512,"����","Changde","CN012002"); 
CityList(698,512,"����","Chenzhou","CN012003"); 
CityList(699,512,"����","Huaihua","CN012004"); 
CityList(700,512,"����","Hengyang","CN012005"); 
CityList(701,512,"¦��","Loudi","CN012006"); 
CityList(702,512,"��̶","Xiangtan","CN012007"); 
CityList(703,512,"�żҽ�","Zhangjiajie","CN012008"); 
CityList(704,512,"����","Yueyang","CN012009"); 
CityList(705,512,"����","Yongzhou","CN012010"); 
CityList(706,512,"����","Xiangxi","CN012011"); 
CityList(707,512,"����","Shaoyang","CN012012"); 
CityList(708,512,"����","Yiyang","CN012013"); 
CityList(709,512,"����","Zhuzhou","CN012014"); 
CityList(710,512,"����","Leiyang","CN012015"); 
//===========  ����  ����  ���� =========//
CityList(671,513,"�人","Wuhan","CN013001"); 
CityList(672,513,"Т��","Xiaogan","CN013002"); 
CityList(673,513,"��ʯ","Huangshi","CN013003"); 
CityList(674,513,"����","Xianning","CN013004"); 
CityList(675,513,"�˲�","Yichang","CN013005"); 
CityList(676,513,"ʮ��","Shiyan","CN013006"); 
CityList(677,513,"�差","Xiangfan","CN013007"); 
CityList(678,513,"����","Ezhou","CN013008"); 
CityList(679,513,"����","Jingzhou","CN013009"); 
CityList(680,513,"�Ƹ�","Huanggang","CN013010"); 
CityList(681,513,"��ʩ","Enshi","CN013011"); 
CityList(682,513,"����","Jingmen","CN013012"); 
CityList(683,513,"Ǳ��","Qianjiang","CN013013"); 
CityList(684,513,"����","Tianmen","CN013014"); 
CityList(685,513,"����","Xiantao","CN013015"); 
CityList(686,513,"����","Suizhou","CN013016"); 
//===========  ����  �ӱ�  ���� =========//
CityList(687,514,"ʯ��ׯ","Shijiazhuang","CN014001"); 
CityList(688,514,"����","Baoding","CN014002"); 
CityList(689,514,"�żҿ�","Zhangjiakou","CN014003"); 
CityList(690,514,"�е�","Chengde","CN014004"); 
CityList(691,514,"��ɽ","Tangshan","CN014005"); 
CityList(692,514,"�ȷ�","Langfang","CN014006"); 
CityList(693,514,"��ˮ","Hengshui","CN014007"); 
CityList(694,514,"��̨","Xingtai","CN014008"); 
CityList(695,514,"����","Handan","CN014009"); 
CityList(696,514,"�ػʵ�","Qinhuangdao","CN014010"); 
CityList(697,514,"����","Cangzhou","CN014011"); 
//===========  ����  ����  ���� =========//
CityList(698,515,"�Ϸ�","Hefei","CN015001"); 
CityList(699,515,"����","Bangbu","CN015002"); 
CityList(700,515,"����","Huainan","CN015003"); 
CityList(701,515,"��ɽ","Maanshan","CN015004"); 
CityList(702,515,"����","Anqing","CN015005"); 
CityList(703,515,"����","Fuyang","CN015006"); 
CityList(704,515,"����","Huaibei","CN015007"); 
CityList(705,515,"ͭ��","Tongling","CN015008"); 
CityList(706,515,"����","Liuan","CN015009"); 
CityList(707,515,"��ɽ","Huangshan","CN015010"); 
CityList(708,515,"����","Chuzhou","CN015011"); 
CityList(709,515,"�ߺ�","Wuhu","CN015012"); 
CityList(710,515,"����","Bozhou","CN015013"); 
CityList(711,515,"����","Xuancheng","CN015014"); 
CityList(712,515,"����","Chizhou","CN015015"); 
CityList(713,515,"����","Chaohu","CN015016"); 
CityList(714,515,"����","Suzhou","CN015017"); 
//===========  ����  ����  ���� =========//
CityList(716,516,"�Ͼ�","Nanjing","CN016001"); 
CityList(717,516,"��","Zhenjiang","CN016002"); 
CityList(718,516,"����","Suzhou","CN016003"); 
CityList(719,516,"��ͨ","Nantong","CN016004"); 
CityList(720,516,"����","Yangzhou","CN016005"); 
CityList(721,516,"�γ�","Yancheng","CN016006"); 
CityList(722,516,"����","Xuzhou","CN016007"); 
CityList(723,516,"����","Huaian","CN016008"); 
CityList(724,516,"���Ƹ�","Lianyungang","CN016009"); 
CityList(725,516,"����","Changzhou","CN016010"); 
CityList(726,516,"����","Wuxi","CN016011"); 
CityList(727,516,"̩��","Taizhou","CN016012"); 
CityList(728,516,"��Ǩ","Suqian","CN016013"); 
CityList(729,516,"����","Jiangyin","CN016014"); 
CityList(730,516,"���","Rugao","CN016015"); 
//===========  ����  �㽭  ���� =========//
CityList(731,517,"����","Hangzhou","CN017001"); 
CityList(732,517,"����","Huzhou","CN017002"); 
CityList(733,517,"����","Jiaxing","CN017003"); 
CityList(734,517,"����","Ningbo","CN017004"); 
CityList(735,517,"����","Shaoxing","CN017005"); 
CityList(736,517,"����","Wenzhou","CN017006"); 
CityList(737,517,"��ˮ","Lishui","CN017007"); 
CityList(738,517,"��","Jinhua","CN017008"); 
CityList(739,517,"��ɽ","Zhoushan","CN017009"); 
CityList(740,517,"����","Quzhou","CN017010"); 
CityList(741,517,"̨��","Taizhou","CN017011"); 
CityList(742,517,"����","Shangyu","CN017012"); 
//===========  ����  ����  ���� =========//
CityList(743,518,"�ϲ�","Nanchang","CN018001"); 
CityList(744,518,"�Ž�","Jiujiang","CN018002"); 
CityList(745,518,"����","Shangrao","CN018003"); 
CityList(746,518,"�˴�","Yichun","CN018004"); 
CityList(747,518,"����","Jian","CN018005"); 
CityList(748,518,"����","Ganzhou","CN018006"); 
CityList(749,518,"������","Jingdezhen","CN018007"); 
CityList(750,518,"Ƽ��","Pingxiang","CN018008"); 
CityList(751,518,"ӥ̶","Yingtan","CN018009"); 
CityList(752,518,"����","Xinyu","CN018010"); 
CityList(753,518,"����","Zhangshu","CN018011"); 
CityList(754,518,"����","Fuzhou","CN018012"); 
//===========  ����  ɽ��  ���� =========//
CityList(755,519,"����","Jinan","CN019001"); 
CityList(756,519,"�ൺ","Qingdao","CN019002"); 
CityList(757,519,"����","Dezhou","CN019003"); 
CityList(758,519,"��̨","Yantai","CN019004"); 
CityList(759,519,"Ϋ��","Weifang","CN019005"); 
CityList(760,519,"�Ͳ�","Zibo","CN019006"); 
CityList(761,519,"����","Laiwu","CN019007"); 
CityList(762,519,"����","Heze","CN019008"); 
CityList(763,519,"����","Rizhao","CN019009"); 
CityList(764,519,"����","Linyi","CN019010"); 
CityList(765,519,"����","Jining","CN019011"); 
CityList(766,519,"̩��","Taian","CN019012"); 
CityList(767,519,"����","Weihai","CN019013"); 
CityList(768,519,"�ĳ�","Liaocheng","CN019014"); 
CityList(769,519,"��Ӫ","Dongying","CN019015"); 
CityList(770,519,"����","Binzhou","CN019016"); 
CityList(771,519,"��ׯ","Zaozhuang","CN019017"); 
//===========  ����  �㶫  ���� =========//
CityList(772,520,"����","Guangzhou","CN020001"); 
CityList(773,520,"�ع�","Shaoguan","CN020002"); 
CityList(774,520,"��ɽ","Foshan","CN020003"); 
CityList(775,520,"����","Huizhou","CN020004"); 
CityList(776,520,"��ͷ","Shantou","CN020005"); 
CityList(777,520,"��ɽ","Zhongshan","CN020006"); 
CityList(778,520,"����","Shenzuo","CN020007"); 
CityList(779,520,"�麣","Zhuhai","CN020008"); 
CityList(780,520,"����","Jiangmen","CN020009"); 
CityList(781,520,"��ݸ","Dongzuo","CN020010"); 
CityList(782,520,"����","Chaozhou","CN020011"); 
CityList(783,520,"տ��","Zhanjiang","CN020012"); 
CityList(784,520,"����","Jieyang","CN020013"); 
CityList(785,520,"ï��","Maoming","CN020014"); 
CityList(786,520,"����","Zhaoqing","CN020015"); 
CityList(787,520,"÷��","Meizhou","CN020016"); 
CityList(788,520,"�Ƹ�","Yunfu","CN020017"); 
CityList(789,520,"��Զ","Qingyuan","CN020018"); 
CityList(790,520,"����","Yangjiang","CN020019"); 
CityList(791,520,"��β","Shanwei","CN020020"); 
CityList(792,520,"��Դ","Heyuan","CN020021"); 
CityList(793,520,"����","Lianjiang","CN020022"); 
//===========  ����  ����  ���� =========//
CityList(794,521,"����","Kunming","CN021001"); 
CityList(795,521,"����","Chuxiong","CN021002"); 
CityList(796,521,"����","Qujing","CN021003"); 
CityList(797,521,"˼é","Simao","CN021004"); 
CityList(798,521,"��Ϫ","Yuxi","CN021005"); 
CityList(799,521,"����","Lijiang","CN021006"); 
CityList(800,521,"��ɽ","Baoshan","CN021007"); 
CityList(801,521,"��ɽ","Wenshan","CN021008"); 
CityList(802,521,"�ٲ�","Lincang","CN021009"); 
CityList(803,521,"��˫����","Xishuangbanna","CN021010"); 
CityList(804,521,"����","Dali","CN021011"); 
CityList(805,521,"����","Gejiu","CN021012"); 
CityList(806,521,"º��","Luxi","CN021013"); 
CityList(807,521,"�����","Honghezhou","CN021014"); 
CityList(808,521,"ŭ����","Nujiangzhou","CN021015"); 
CityList(809,521,"��ͨ","Zhaotong","CN021016"); 
CityList(810,521,"������","Diqingzhou","CN021017"); 
CityList(811,521,"����","Anning","CN021018"); 
//===========  ����  ����  ���� =========//
CityList(812,522,"����","Guiyang","CN022001"); 
CityList(813,522,"����","Zunyi","CN022002"); 
CityList(814,522,"����ˮ","Liupanshui","CN022003"); 
CityList(815,522,"ͭ��","Tongren","CN022004"); 
CityList(816,522,"��˳","Anshun","CN022005"); 
CityList(817,522,"�Ͻ�","Bijie","CN022006"); 
CityList(818,522,"ǭ����","Qianxinan","CN022007"); 
CityList(819,522,"ǭ��","Qiannan","CN022008"); 
CityList(820,522,"ǭ����","Qiandongnan","CN022009"); 
//===========  ����  �Ĵ�  ���� =========//
CityList(821,523,"�ɶ�","Chengdu","CN023001"); 
CityList(822,523,"��֦��","Panzhihua","CN023002"); 
CityList(823,523,"�Թ�","Zigong","CN023003"); 
CityList(824,523,"����","Deyang","CN023004"); 
CityList(825,523,"�㰲","Guangan","CN023005"); 
CityList(826,523,"��Ԫ","Guangyuan","CN023006"); 
CityList(827,523,"��ɽ","Leshan","CN023007"); 
CityList(828,523,"����","Dazhou","CN023008"); 
CityList(829,523,"����","Mianyang","CN023009"); 
CityList(830,523,"�ϳ�","Nanchong","CN023010"); 
CityList(831,523,"����","Luzhou","CN023011"); 
CityList(832,523,"�˱�","Yibin","CN023012"); 
CityList(833,523,"�Ű�","Yaan","CN023013"); 
CityList(834,523,"�ڽ�","Neijiang","CN023014"); 
CityList(835,523,"����","Ganzi","CN023015"); 
CityList(836,523,"����","Aba","CN023016"); 
CityList(837,523,"����","Suining","CN023017"); 
CityList(838,523,"����","Bazhong","CN023018"); 
CityList(839,523,"üɽ","Meishan","CN023019"); 
CityList(840,523,"����","Ziyang","CN023020"); 
CityList(841,523,"��ɽ��","Liangshanzhou","CN023021"); 
//===========  ����  ����  ���� =========//
CityList(842,524,"����","Haikou","CN024001"); 
CityList(843,524,"����","Sanya","CN024002"); 
//===========  ����  ����  ���� =========//
CityList(844,525,"����","Fuzhou","CN025001"); 
CityList(845,525,"����","Xiamen","CN025002"); 
CityList(846,525,"����","Ningde","CN025003"); 
CityList(847,525,"����","Putian","CN025004"); 
CityList(848,525,"Ȫ��","Quanzhou","CN025005"); 
CityList(849,525,"����","Zhangzhou","CN025006"); 
CityList(850,525,"����","Longyan","CN025007"); 
CityList(851,525,"����","Sanming","CN025008"); 
CityList(852,525,"��ƽ","Nanping","CN025009"); 
//===========  ����  ̨��  ���� =========//
CityList(852,526,"̨��","Taibei","CN026001");
CityList(853,526,"����","Gaoxiong","CN026002");
CityList(854,526,"̨��","Tainan","CN026003");
//===========  ����  ����ʡ  ���� =========//
CityList(861,527,"����","Lanzhou","CN027001"); 
CityList(862,527,"��ˮ","Tianshui","CN027002"); 
CityList(863,527,"��Ȫ","Jiuquan","CN027003"); 
CityList(864,527,"��Ҵ","Zhangye","CN027004"); 
CityList(865,527,"����","Linxia","CN027005"); 
CityList(866,527,"���","Jinchang","CN027006"); 
CityList(867,527,"����","Baiyin","CN027007"); 
CityList(868,527,"ƽ��","Pingliang","CN027008"); 
CityList(869,527,"����","Qingyang","CN027009"); 
CityList(870,527,"����","Wuwei","CN027010"); 
CityList(871,527,"����","Dingxi","CN027011"); 
CityList(872,527,"������","Jiayuguan","CN027012"); 
CityList(873,527,"¤��","Longnan","CN027013"); 
CityList(874,527,"����","Gannan","CN027014"); 
//===========  ����  ����  ���� =========//
CityList(875,528,"����","Yinchuan","CN028001"); 
CityList(876,528,"ʯ��ɽ","Shizuishan","CN028002"); 
CityList(877,528,"����","Wuzhong","CN028003"); 
CityList(878,528,"��ԭ","Guyuan","CN028004"); 
CityList(879,528,"��ͭϿ","Qingtongxia","CN028005"); 
CityList(880,528,"����","Zhongwei","CN028006"); 
//===========  ����  ����  ���� =========//
CityList(881,529,"����","Nanning","CN029001"); 
CityList(882,529,"����","Guilin","CN029002"); 
CityList(883,529,"����","Liuzhou","CN029003"); 
CityList(884,529,"����","Wuzhou","CN029004"); 
CityList(885,529,"����","Yulin","CN029005"); 
CityList(886,529,"����","Beihai","CN029006"); 
CityList(887,529,"����","Qinzhou","CN029007"); 
CityList(888,529,"�ӳ�","Hechi","CN029008"); 
CityList(889,529,"���Ǹ�","Fangchenggang","CN029009"); 
CityList(890,529,"����","Hezhou","CN029010"); 
CityList(891,529,"��ɫ","Baise","CN029011"); 
CityList(892,529,"����","Laibin","CN029012"); 
CityList(893,529,"�����","Guigangshi","CN029013"); 
CityList(894,529,"����","Chongzuo","CN029014"); 
CityList(895,529,"����","Beiliu","CN029015"); 
//===========  ����  ���ɹ�  ���� =========//
CityList(896,530,"���ͺ���","Huhehaote","CN030001"); 
CityList(897,530,"�ں�","Wuhai","CN030002"); 
CityList(898,530,"��ͷ","Baotou","CN030003"); 
CityList(899,530,"�����첼��","Wulanchabumeng","CN030004"); 
CityList(900,530,"���","Chifeng","CN030005"); 
CityList(901,530,"ͨ��","Tongliao","CN030006"); 
CityList(902,530,"������˹","Eerduosi","CN030007"); 
CityList(903,530,"�����׶�","Bayannaoer","CN030008"); 
CityList(904,530,"���ֺ���","Xilinhaote","CN030009"); 
CityList(905,530,"������","Hailaer","CN030010"); 
CityList(906,530,"��������","Wulanhaote","CN030011"); 
CityList(907,530,"���ױ���","Hulunbeier","CN030012"); 
CityList(908,530,"��������","Alashanmeng","CN030013"); 
CityList(909,530,"�˰���","Xinganmeng","CN030014"); 
CityList(910,530,"���ֹ�����","Xilinguolemeng","CN030015"); 
//===========  ����  ����  ���� =========//
CityList(911,531,"��³ľ��","Wulumuqi","CN031001"); 
CityList(912,531,"��������","Kelamayi","CN031002"); 
CityList(913,531,"��³��","Tulufan","CN031003"); 
CityList(914,531,"����","Hetian","CN031004"); 
CityList(915,531,"��ʲ","Kashi","CN031005"); 
CityList(916,531,"������","Akesu","CN031006"); 
CityList(917,531,"����","Hami","CN031007"); 
CityList(918,531,"ʯ����","Shihezi","CN031008"); 
CityList(919,531,"����","Yili","CN031009"); 
CityList(920,531,"��������","Bayinguoleng","CN031010"); 
CityList(921,531,"����","Changji","CN031011"); 
CityList(922,531,"����","Kuitun","CN031012"); 
CityList(923,531,"��������","Boertala","CN031013"); 
CityList(924,531,"�������տ¶�����","Kezilesukeerkezi","CN031014"); 
CityList(925,531,"����","Tacheng","CN031015"); 
CityList(926,531,"����̩","Aletai","CN031016"); 
CityList(927,531,"ͼľ�����","Tumushukeshi","CN031017"); 
CityList(928,531,"�������","Wujiaqushi","CN031018"); 
CityList(929,531,"����","Bole","CN031019"); 
//===========  ����  ����  ���� =========//
CityList(931,532,"����","Lasa","CN032001"); 
CityList(932,532,"����","Ali","CN032002"); 
CityList(933,532,"����","Naqu","CN032003"); 
CityList(934,532,"�տ���","Rikaze","CN032004"); 
CityList(935,532,"ɽ��","Shannan","CN032005"); 
CityList(936,532,"��֥","Linzhi","CN032006"); 
CityList(937,532,"����","Changdu","CN032007"); 

CityList(940,533,"����ر�������","Xianggang","CN033001"); 

CityList(942,534,"�����ر�������","Aomen","CN034001"); 

CityList(1000,501,"������","haidingqu","CN101000");
CityList(1001,848,"��Ϫ��","anxi","CN125005"); 


</script>

</head>
<style>
.data1 { background-color:#fff0ff}
.data2 { background-color:#ffff00}
</style>
<body>
<div class="contact_form" style="margin-left: 150px; width: 65%;">
							<div class="form_subtitle">
								
							</div>
							
<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/addSellerProduct.do" method="post">
		��ѡ����Ʒ���ͣ�
		<select id="citylist" name="citylist" onchange="m('citylist','citycode')">
		 	<option value="">�����</option>
		</select>
		<select id="citycode" name="citycode"  onchange="m('citycode','cityaaa')" >
		 	<option value="">С���</option>
		</select>

<table>
									<tr>
										<td width="83" height="44" >
											��Ʒ���ƣ�
							      </td>
										<td width="366">
							        <input id="productName" name="productName" onblur="check_userName(this,'regist_userName_message');"/>
											<font id="regist_userName_message" color="red"></font>
										</td>
										
									</tr>
	
									<tr>
										<td height="29">
											���ۣ�Ԫ����
										</td>
										<td>
											<input type="text" size="15" name="productPrice" />
										</td>
									</tr>
									<tr>
										<td height="33">
											�ϼ�ʱ�䣺
										</td>
										<td>
											<input type="text" size="15" name="productTime"  />
										</td>
									</tr>
									<tr>
										<td height="35">
											������
										</td>
										<td>
											<input type="text" size="25" name="productDescription" />
										</td>
									</tr>
				                    
								</table>

                          
									<input type="submit" value="�����Ʒ" style="margin-right:50px;"/>
									&nbsp;
									<input type="reset" value="����" />
								
			</form>
		</div>
<div id="outcity" class="data2"></div>
<script language="javaScript">
/*******
CityData, CityCountΪ���ű��������
����CityList(����ID,��ID,������,Ӣ����,���);
���� SelectCity (�����б����ݣ������б�����ƣ������б��ӱ����ƣ�����ID����IDΪ0Ϊ����
����m(��ǰ�б�����ƣ��ӱ�����)
********/
SelectCity(CityData,'citylist','citycode',0);
SelectCity(CityData,'citylist1','citycode',0);  //���ó�ʼ�����б�

//////   ����Ϊ�������  ///////
var listcity = listCity('');
if(listcity != false){
	var ocity = "JS�������<br />��ѡ��ĳ���<br />������Ϊ��"+listcity[2];
	ocity += "<br />Ӣ����Ϊ:" + listcity[3];
	ocity += "<br />����Ϊ:" + listcity[4];
	getID('outcity').innerHTML = ocity;
}
</script>

</body>
</html>