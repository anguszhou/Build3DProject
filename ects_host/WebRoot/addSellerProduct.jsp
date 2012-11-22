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
		getID(citycode).options[0]= new Option("请选择","");
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

//===========  国家名称数据 =========//
CityList(1,0,"数码","CN","数码");
CityList(2,0,"服装","JP","服装");
CityList(3,0,"书籍","US","书籍");
CityList(4,0,"日常用品","US","日常用品");
//===========  省份或者直辖市名称数据 =========//
CityList(501,2,"北京市","Beijing","CN001000");
CityList(502,2,"重庆市","Chongqing","CN002000");
CityList(503,2,"天津市","Tianjin","CN003000");
CityList(504,3,"上海市","Shanghai","CN004000");
CityList(505,3,"黑龙江省","Heilongjiang","CN005000");
CityList(506,3,"吉林省","Jilin","CN006000");
CityList(507,3,"辽宁省","Liaoning","CN007000");
CityList(508,3,"青海省","Qinghai","CN008000");
CityList(509,4,"山西省","Shanxi","CN009000");
CityList(510,4,"陕西省","ShanXi","CN010000");
CityList(511,4,"河南省","Henan","CN011000");
CityList(512,4,"湖南省","Hunan","CN012000");
CityList(513,4,"湖北省","Hubei","CN013000");
CityList(514,4,"河北省","Hebei","CN014000");
CityList(515,1,"电脑","Anhui","电脑");
CityList(516,1,"手机","Jiangsu","手机");
CityList(517,1,"浙江省","Zhejiang","CN017000");
CityList(518,1,"江西省","Jiangxi","CN018000");
CityList(519,1,"山东省","Shandong","CN019000");
CityList(520,1,"广东省","Guangdong","CN020000");
CityList(521,1,"云南省","Yunnan","CN021000");
CityList(522,1,"贵州省","Guizhou","CN022000");
CityList(523,1,"四川省","Sichuan","CN023000");
CityList(524,1,"海南省","Hainan","CN024000");
CityList(525,1,"福建省","Fujian","CN025000");
CityList(526,1,"台湾省","Taiwan","CN026000");
CityList(527,1,"甘肃省","Gansu","CN027000");
CityList(528,1,"宁夏回族自治区","Ningxia","CN028000");
CityList(529,1,"广西壮族自治区","Guangxi","CN0029000");
CityList(530,1,"内蒙古自治区","Neimenggu","CN030000");
CityList(531,1,"新疆维吾尔自治区","Xinjiang","CN031000");
CityList(532,1,"西藏自治区","Xizang", "CN032000");
CityList(533,1,"香港特别行政区","Xianggang","CN033000");
CityList(534,1,"澳门特别行政区","Aomen","CN034000");
//===========  地区或者县级市名称数据 =========//
CityList(601,501,"北京市","Beijing","CN001001");
CityList(602,502,"重庆市","Chongqing","CN002001");
CityList(603,503,"天津市","Tianjin","CN003001");
CityList(604,504,"上海市","Shanghai","CN004001");
//===========  地区  黑龙江  数据 =========//
CityList(606,505,"哈尔滨","Haerbin","CN005001"); 
CityList(607,505,"齐齐哈尔","Qiqihaer","CN005002"); 
CityList(608,505,"牡丹江","Mudanjiang","CN005003"); 
CityList(609,505,"大庆","Daqing","CN005004"); 
CityList(610,505,"鸡西","Jixi","CN005005"); 
CityList(611,505,"伊春","Yichun","CN005006"); 
CityList(612,505,"佳木斯","Jiamusi","CN005007"); 
CityList(613,505,"黑河","Heihe","CN005008"); 
CityList(614,505,"绥化","Suihua","CN005009"); 
CityList(615,505,"大兴安岭","Daxinganling","CN005010"); 
CityList(616,505,"鹤岗","Hegang","CN005011"); 
CityList(617,505,"海伦","Hailun","CN005012"); 
CityList(618,505,"宁安","Ninan","CN005013"); 
//===========  地区  吉林  数据 =========//
CityList(620,506,"长春","Changchun","CN006001"); 
CityList(621,506,"延边","Yanbian","CN006002"); 
CityList(622,506,"通化","Tonghua","CN006003"); 
CityList(623,506,"白城","Baicheng","CN006004"); 
CityList(624,506,"辽源","Liaoyuan","CN006005"); 
CityList(625,506,"四平","Siping","CN006006"); 
CityList(626,506,"白山","Baishan","CN006007"); 
CityList(627,506,"松原","Songyuan","CN006008"); 
CityList(628,506,"吉林","Jilin","CN006009"); 
CityList(629,506,"公主岭","Gongzhuling","CN006010"); 
//===========  地区  辽定  数据 =========//
CityList(631,507,"沈阳","Shenyang","CN007001"); 
CityList(632,507,"大连","Dalian","CN007002"); 
CityList(633,507,"鞍山","Anshan","CN007003"); 
CityList(634,507,"抚顺","Fushun","CN007004"); 
CityList(635,507,"本溪","Benxi","CN007005"); 
CityList(636,507,"锦州","Jinzhou","CN007006"); 
CityList(637,507,"丹东","Dandong","CN007007"); 
CityList(638,507,"营口","Yingkou","CN007008"); 
CityList(639,507,"辽阳","Liaoyang","CN007009"); 
CityList(640,507,"铁岭","Tieling","CN007010"); 
CityList(641,507,"朝阳","Chaoyang","CN007011"); 
CityList(642,507,"盘锦","Panjin","CN007012"); 
CityList(643,507,"阜新","Fuxin","CN007013"); 
CityList(644,507,"葫芦岛","Huludao","CN007014"); 
//===========  地区  青海  数据 =========//
CityList(646,508,"西宁","Xining","CN008001"); 
CityList(647,508,"玉树","Yushu","CN008002"); 
CityList(648,508,"果洛","Guoluo","CN008003"); 
CityList(649,508,"海东","Haidong","CN008004"); 
CityList(650,508,"海北","Haibei","CN008005"); 
CityList(651,508,"海西","Haixi","CN008006"); 
CityList(652,508,"黄南","Huangnan","CN008007"); 
//===========  地区  山西  数据 =========//
CityList(654,509,"太原","Taiyuan","CN009001"); 
CityList(655,509,"大同","Datong","CN009002"); 
CityList(656,509,"阳泉","Yangquan","CN009003"); 
CityList(657,509,"晋中","Jinzhong","CN009004"); 
CityList(658,509,"长治","Changzhi","CN009005"); 
CityList(659,509,"晋城","Jincheng","CN009006"); 
CityList(660,509,"临汾","Linfen","CN009007"); 
CityList(661,509,"吕梁","Lvliang","CN009008"); 
CityList(662,509,"运城","Yuncheng","CN009009"); 
CityList(663,509,"忻州","Xinzhou","CN009010"); 
CityList(664,509,"朔州","Shuozhou","CN009011"); 
//===========  地区  陕西  数据 =========//
CityList(666,510,"西安","Xian","CN010001"); 
CityList(667,510,"咸阳","Xianyang","CN010002"); 
CityList(668,510,"汉中","Hanzhong","CN010003"); 
CityList(669,510,"安康","Ankang","CN010004"); 
CityList(670,510,"宝鸡","Baoji","CN010005"); 
CityList(671,510,"商洛","Shangluo","CN010006"); 
CityList(672,510,"渭南","Weinan","CN010007"); 
CityList(673,510,"延安","Yanan","CN010008"); 
CityList(674,510,"铜川","Tongchuan","CN010009"); 
CityList(675,510,"榆林","Yulin","CN010010"); 
//===========  地区  河南  数据 =========//
CityList(676,511,"郑州","Zhengzhou","CN011001"); 
CityList(677,511,"信阳","Xinyang","CN011002"); 
CityList(678,511,"南阳","Nanyang","CN011003"); 
CityList(679,511,"驻马店","Zhumadian","CN011004"); 
CityList(680,511,"周口","Zhoukou","CN011005"); 
CityList(681,511,"漯河","Zuohe","CN011006"); 
CityList(682,511,"新乡","Xinxiang","CN011007"); 
CityList(683,511,"安阳","Anyang","CN011008"); 
CityList(684,511,"三门峡","Sanmenxia","CN011009"); 
CityList(685,511,"许昌","Xuchang","CN011010"); 
CityList(686,511,"平顶山","Pingdingshan","CN011011"); 
CityList(687,511,"开封","Kaifeng","CN011012"); 
CityList(688,511,"洛阳","Luoyang","CN011013"); 
CityList(689,511,"商丘","Shangqiu","CN011014"); 
CityList(690,511,"济源","Jiyuan","CN011015"); 
CityList(691,511,"焦作","Jiaozuo","CN011016"); 
CityList(692,511,"鹤壁","Hebi","CN011017"); 
CityList(693,511,"濮阳","Zuoyang","CN011018"); 
CityList(694,511,"巩义","Gongyi","CN011019"); 
CityList(695,511,"荥阳","Xingyang","CN011020"); 
//===========  地区  湖南  数据 =========//
CityList(696,512,"长沙","Changsha","CN012001"); 
CityList(697,512,"常德","Changde","CN012002"); 
CityList(698,512,"郴州","Chenzhou","CN012003"); 
CityList(699,512,"怀化","Huaihua","CN012004"); 
CityList(700,512,"衡阳","Hengyang","CN012005"); 
CityList(701,512,"娄底","Loudi","CN012006"); 
CityList(702,512,"湘潭","Xiangtan","CN012007"); 
CityList(703,512,"张家界","Zhangjiajie","CN012008"); 
CityList(704,512,"岳阳","Yueyang","CN012009"); 
CityList(705,512,"永州","Yongzhou","CN012010"); 
CityList(706,512,"湘西","Xiangxi","CN012011"); 
CityList(707,512,"邵阳","Shaoyang","CN012012"); 
CityList(708,512,"益阳","Yiyang","CN012013"); 
CityList(709,512,"株洲","Zhuzhou","CN012014"); 
CityList(710,512,"耒阳","Leiyang","CN012015"); 
//===========  地区  湖北  数据 =========//
CityList(671,513,"武汉","Wuhan","CN013001"); 
CityList(672,513,"孝感","Xiaogan","CN013002"); 
CityList(673,513,"黄石","Huangshi","CN013003"); 
CityList(674,513,"咸宁","Xianning","CN013004"); 
CityList(675,513,"宜昌","Yichang","CN013005"); 
CityList(676,513,"十堰","Shiyan","CN013006"); 
CityList(677,513,"襄樊","Xiangfan","CN013007"); 
CityList(678,513,"鄂州","Ezhou","CN013008"); 
CityList(679,513,"荆州","Jingzhou","CN013009"); 
CityList(680,513,"黄冈","Huanggang","CN013010"); 
CityList(681,513,"恩施","Enshi","CN013011"); 
CityList(682,513,"荆门","Jingmen","CN013012"); 
CityList(683,513,"潜江","Qianjiang","CN013013"); 
CityList(684,513,"天门","Tianmen","CN013014"); 
CityList(685,513,"仙桃","Xiantao","CN013015"); 
CityList(686,513,"随州","Suizhou","CN013016"); 
//===========  地区  河北  数据 =========//
CityList(687,514,"石家庄","Shijiazhuang","CN014001"); 
CityList(688,514,"保定","Baoding","CN014002"); 
CityList(689,514,"张家口","Zhangjiakou","CN014003"); 
CityList(690,514,"承德","Chengde","CN014004"); 
CityList(691,514,"唐山","Tangshan","CN014005"); 
CityList(692,514,"廊坊","Langfang","CN014006"); 
CityList(693,514,"衡水","Hengshui","CN014007"); 
CityList(694,514,"邢台","Xingtai","CN014008"); 
CityList(695,514,"邯郸","Handan","CN014009"); 
CityList(696,514,"秦皇岛","Qinhuangdao","CN014010"); 
CityList(697,514,"沧州","Cangzhou","CN014011"); 
//===========  地区  安徽  数据 =========//
CityList(698,515,"合肥","Hefei","CN015001"); 
CityList(699,515,"蚌埠","Bangbu","CN015002"); 
CityList(700,515,"淮南","Huainan","CN015003"); 
CityList(701,515,"马鞍山","Maanshan","CN015004"); 
CityList(702,515,"安庆","Anqing","CN015005"); 
CityList(703,515,"阜阳","Fuyang","CN015006"); 
CityList(704,515,"淮北","Huaibei","CN015007"); 
CityList(705,515,"铜陵","Tongling","CN015008"); 
CityList(706,515,"六安","Liuan","CN015009"); 
CityList(707,515,"黄山","Huangshan","CN015010"); 
CityList(708,515,"滁州","Chuzhou","CN015011"); 
CityList(709,515,"芜湖","Wuhu","CN015012"); 
CityList(710,515,"亳州","Bozhou","CN015013"); 
CityList(711,515,"宣城","Xuancheng","CN015014"); 
CityList(712,515,"池州","Chizhou","CN015015"); 
CityList(713,515,"巢湖","Chaohu","CN015016"); 
CityList(714,515,"宿州","Suzhou","CN015017"); 
//===========  地区  江苏  数据 =========//
CityList(716,516,"南京","Nanjing","CN016001"); 
CityList(717,516,"镇江","Zhenjiang","CN016002"); 
CityList(718,516,"苏州","Suzhou","CN016003"); 
CityList(719,516,"南通","Nantong","CN016004"); 
CityList(720,516,"扬州","Yangzhou","CN016005"); 
CityList(721,516,"盐城","Yancheng","CN016006"); 
CityList(722,516,"徐州","Xuzhou","CN016007"); 
CityList(723,516,"淮安","Huaian","CN016008"); 
CityList(724,516,"连云港","Lianyungang","CN016009"); 
CityList(725,516,"常州","Changzhou","CN016010"); 
CityList(726,516,"无锡","Wuxi","CN016011"); 
CityList(727,516,"泰州","Taizhou","CN016012"); 
CityList(728,516,"宿迁","Suqian","CN016013"); 
CityList(729,516,"江阴","Jiangyin","CN016014"); 
CityList(730,516,"如皋","Rugao","CN016015"); 
//===========  地区  浙江  数据 =========//
CityList(731,517,"杭州","Hangzhou","CN017001"); 
CityList(732,517,"湖州","Huzhou","CN017002"); 
CityList(733,517,"嘉兴","Jiaxing","CN017003"); 
CityList(734,517,"宁波","Ningbo","CN017004"); 
CityList(735,517,"绍兴","Shaoxing","CN017005"); 
CityList(736,517,"温州","Wenzhou","CN017006"); 
CityList(737,517,"丽水","Lishui","CN017007"); 
CityList(738,517,"金华","Jinhua","CN017008"); 
CityList(739,517,"舟山","Zhoushan","CN017009"); 
CityList(740,517,"衢州","Quzhou","CN017010"); 
CityList(741,517,"台州","Taizhou","CN017011"); 
CityList(742,517,"上虞","Shangyu","CN017012"); 
//===========  地区  江西  数据 =========//
CityList(743,518,"南昌","Nanchang","CN018001"); 
CityList(744,518,"九江","Jiujiang","CN018002"); 
CityList(745,518,"上饶","Shangrao","CN018003"); 
CityList(746,518,"宜春","Yichun","CN018004"); 
CityList(747,518,"吉安","Jian","CN018005"); 
CityList(748,518,"赣州","Ganzhou","CN018006"); 
CityList(749,518,"景德镇","Jingdezhen","CN018007"); 
CityList(750,518,"萍乡","Pingxiang","CN018008"); 
CityList(751,518,"鹰潭","Yingtan","CN018009"); 
CityList(752,518,"新余","Xinyu","CN018010"); 
CityList(753,518,"樟树","Zhangshu","CN018011"); 
CityList(754,518,"抚州","Fuzhou","CN018012"); 
//===========  地区  山东  数据 =========//
CityList(755,519,"济南","Jinan","CN019001"); 
CityList(756,519,"青岛","Qingdao","CN019002"); 
CityList(757,519,"德州","Dezhou","CN019003"); 
CityList(758,519,"烟台","Yantai","CN019004"); 
CityList(759,519,"潍坊","Weifang","CN019005"); 
CityList(760,519,"淄博","Zibo","CN019006"); 
CityList(761,519,"莱芜","Laiwu","CN019007"); 
CityList(762,519,"菏泽","Heze","CN019008"); 
CityList(763,519,"日照","Rizhao","CN019009"); 
CityList(764,519,"临沂","Linyi","CN019010"); 
CityList(765,519,"济宁","Jining","CN019011"); 
CityList(766,519,"泰安","Taian","CN019012"); 
CityList(767,519,"威海","Weihai","CN019013"); 
CityList(768,519,"聊城","Liaocheng","CN019014"); 
CityList(769,519,"东营","Dongying","CN019015"); 
CityList(770,519,"滨州","Binzhou","CN019016"); 
CityList(771,519,"枣庄","Zaozhuang","CN019017"); 
//===========  地区  广东  数据 =========//
CityList(772,520,"广州","Guangzhou","CN020001"); 
CityList(773,520,"韶关","Shaoguan","CN020002"); 
CityList(774,520,"佛山","Foshan","CN020003"); 
CityList(775,520,"惠州","Huizhou","CN020004"); 
CityList(776,520,"汕头","Shantou","CN020005"); 
CityList(777,520,"中山","Zhongshan","CN020006"); 
CityList(778,520,"深圳","Shenzuo","CN020007"); 
CityList(779,520,"珠海","Zhuhai","CN020008"); 
CityList(780,520,"江门","Jiangmen","CN020009"); 
CityList(781,520,"东莞","Dongzuo","CN020010"); 
CityList(782,520,"潮州","Chaozhou","CN020011"); 
CityList(783,520,"湛江","Zhanjiang","CN020012"); 
CityList(784,520,"揭阳","Jieyang","CN020013"); 
CityList(785,520,"茂名","Maoming","CN020014"); 
CityList(786,520,"肇庆","Zhaoqing","CN020015"); 
CityList(787,520,"梅州","Meizhou","CN020016"); 
CityList(788,520,"云浮","Yunfu","CN020017"); 
CityList(789,520,"清远","Qingyuan","CN020018"); 
CityList(790,520,"阳江","Yangjiang","CN020019"); 
CityList(791,520,"汕尾","Shanwei","CN020020"); 
CityList(792,520,"河源","Heyuan","CN020021"); 
CityList(793,520,"廉江","Lianjiang","CN020022"); 
//===========  地区  云南  数据 =========//
CityList(794,521,"昆明","Kunming","CN021001"); 
CityList(795,521,"楚雄","Chuxiong","CN021002"); 
CityList(796,521,"曲靖","Qujing","CN021003"); 
CityList(797,521,"思茅","Simao","CN021004"); 
CityList(798,521,"玉溪","Yuxi","CN021005"); 
CityList(799,521,"丽江","Lijiang","CN021006"); 
CityList(800,521,"保山","Baoshan","CN021007"); 
CityList(801,521,"文山","Wenshan","CN021008"); 
CityList(802,521,"临沧","Lincang","CN021009"); 
CityList(803,521,"西双版纳","Xishuangbanna","CN021010"); 
CityList(804,521,"大理","Dali","CN021011"); 
CityList(805,521,"个旧","Gejiu","CN021012"); 
CityList(806,521,"潞西","Luxi","CN021013"); 
CityList(807,521,"红河州","Honghezhou","CN021014"); 
CityList(808,521,"怒江洲","Nujiangzhou","CN021015"); 
CityList(809,521,"昭通","Zhaotong","CN021016"); 
CityList(810,521,"迪庆州","Diqingzhou","CN021017"); 
CityList(811,521,"安宁","Anning","CN021018"); 
//===========  地区  贵州  数据 =========//
CityList(812,522,"贵阳","Guiyang","CN022001"); 
CityList(813,522,"遵义","Zunyi","CN022002"); 
CityList(814,522,"六盘水","Liupanshui","CN022003"); 
CityList(815,522,"铜仁","Tongren","CN022004"); 
CityList(816,522,"安顺","Anshun","CN022005"); 
CityList(817,522,"毕节","Bijie","CN022006"); 
CityList(818,522,"黔西南","Qianxinan","CN022007"); 
CityList(819,522,"黔南","Qiannan","CN022008"); 
CityList(820,522,"黔东南","Qiandongnan","CN022009"); 
//===========  地区  四川  数据 =========//
CityList(821,523,"成都","Chengdu","CN023001"); 
CityList(822,523,"攀枝花","Panzhihua","CN023002"); 
CityList(823,523,"自贡","Zigong","CN023003"); 
CityList(824,523,"德阳","Deyang","CN023004"); 
CityList(825,523,"广安","Guangan","CN023005"); 
CityList(826,523,"广元","Guangyuan","CN023006"); 
CityList(827,523,"乐山","Leshan","CN023007"); 
CityList(828,523,"达州","Dazhou","CN023008"); 
CityList(829,523,"绵阳","Mianyang","CN023009"); 
CityList(830,523,"南充","Nanchong","CN023010"); 
CityList(831,523,"泸州","Luzhou","CN023011"); 
CityList(832,523,"宜宾","Yibin","CN023012"); 
CityList(833,523,"雅安","Yaan","CN023013"); 
CityList(834,523,"内江","Neijiang","CN023014"); 
CityList(835,523,"甘孜","Ganzi","CN023015"); 
CityList(836,523,"阿坝","Aba","CN023016"); 
CityList(837,523,"遂宁","Suining","CN023017"); 
CityList(838,523,"巴中","Bazhong","CN023018"); 
CityList(839,523,"眉山","Meishan","CN023019"); 
CityList(840,523,"资阳","Ziyang","CN023020"); 
CityList(841,523,"凉山州","Liangshanzhou","CN023021"); 
//===========  地区  海南  数据 =========//
CityList(842,524,"海口","Haikou","CN024001"); 
CityList(843,524,"三亚","Sanya","CN024002"); 
//===========  地区  福建  数据 =========//
CityList(844,525,"福州","Fuzhou","CN025001"); 
CityList(845,525,"厦门","Xiamen","CN025002"); 
CityList(846,525,"宁德","Ningde","CN025003"); 
CityList(847,525,"莆田","Putian","CN025004"); 
CityList(848,525,"泉州","Quanzhou","CN025005"); 
CityList(849,525,"漳州","Zhangzhou","CN025006"); 
CityList(850,525,"龙岩","Longyan","CN025007"); 
CityList(851,525,"三明","Sanming","CN025008"); 
CityList(852,525,"南平","Nanping","CN025009"); 
//===========  地区  台湾  数据 =========//
CityList(852,526,"台北","Taibei","CN026001");
CityList(853,526,"高雄","Gaoxiong","CN026002");
CityList(854,526,"台南","Tainan","CN026003");
//===========  地区  甘肃省  数据 =========//
CityList(861,527,"兰州","Lanzhou","CN027001"); 
CityList(862,527,"天水","Tianshui","CN027002"); 
CityList(863,527,"酒泉","Jiuquan","CN027003"); 
CityList(864,527,"张掖","Zhangye","CN027004"); 
CityList(865,527,"临夏","Linxia","CN027005"); 
CityList(866,527,"金昌","Jinchang","CN027006"); 
CityList(867,527,"白银","Baiyin","CN027007"); 
CityList(868,527,"平凉","Pingliang","CN027008"); 
CityList(869,527,"庆阳","Qingyang","CN027009"); 
CityList(870,527,"武威","Wuwei","CN027010"); 
CityList(871,527,"定西","Dingxi","CN027011"); 
CityList(872,527,"嘉峪关","Jiayuguan","CN027012"); 
CityList(873,527,"陇南","Longnan","CN027013"); 
CityList(874,527,"甘南","Gannan","CN027014"); 
//===========  地区  宁夏  数据 =========//
CityList(875,528,"银川","Yinchuan","CN028001"); 
CityList(876,528,"石嘴山","Shizuishan","CN028002"); 
CityList(877,528,"吴忠","Wuzhong","CN028003"); 
CityList(878,528,"固原","Guyuan","CN028004"); 
CityList(879,528,"青铜峡","Qingtongxia","CN028005"); 
CityList(880,528,"中卫","Zhongwei","CN028006"); 
//===========  地区  广西  数据 =========//
CityList(881,529,"南宁","Nanning","CN029001"); 
CityList(882,529,"桂林","Guilin","CN029002"); 
CityList(883,529,"柳州","Liuzhou","CN029003"); 
CityList(884,529,"梧州","Wuzhou","CN029004"); 
CityList(885,529,"玉林","Yulin","CN029005"); 
CityList(886,529,"北海","Beihai","CN029006"); 
CityList(887,529,"钦州","Qinzhou","CN029007"); 
CityList(888,529,"河池","Hechi","CN029008"); 
CityList(889,529,"防城港","Fangchenggang","CN029009"); 
CityList(890,529,"贺州","Hezhou","CN029010"); 
CityList(891,529,"百色","Baise","CN029011"); 
CityList(892,529,"来宾","Laibin","CN029012"); 
CityList(893,529,"贵港市","Guigangshi","CN029013"); 
CityList(894,529,"崇左","Chongzuo","CN029014"); 
CityList(895,529,"北流","Beiliu","CN029015"); 
//===========  地区  内蒙古  数据 =========//
CityList(896,530,"呼和浩特","Huhehaote","CN030001"); 
CityList(897,530,"乌海","Wuhai","CN030002"); 
CityList(898,530,"包头","Baotou","CN030003"); 
CityList(899,530,"乌兰察布盟","Wulanchabumeng","CN030004"); 
CityList(900,530,"赤峰","Chifeng","CN030005"); 
CityList(901,530,"通辽","Tongliao","CN030006"); 
CityList(902,530,"鄂尔多斯","Eerduosi","CN030007"); 
CityList(903,530,"巴彦淖尔","Bayannaoer","CN030008"); 
CityList(904,530,"锡林浩特","Xilinhaote","CN030009"); 
CityList(905,530,"海拉尔","Hailaer","CN030010"); 
CityList(906,530,"乌兰浩特","Wulanhaote","CN030011"); 
CityList(907,530,"呼伦贝尔","Hulunbeier","CN030012"); 
CityList(908,530,"阿拉善盟","Alashanmeng","CN030013"); 
CityList(909,530,"兴安盟","Xinganmeng","CN030014"); 
CityList(910,530,"锡林郭勒盟","Xilinguolemeng","CN030015"); 
//===========  地区  新缰  数据 =========//
CityList(911,531,"乌鲁木齐","Wulumuqi","CN031001"); 
CityList(912,531,"克拉玛依","Kelamayi","CN031002"); 
CityList(913,531,"吐鲁番","Tulufan","CN031003"); 
CityList(914,531,"和田","Hetian","CN031004"); 
CityList(915,531,"喀什","Kashi","CN031005"); 
CityList(916,531,"阿克苏","Akesu","CN031006"); 
CityList(917,531,"哈密","Hami","CN031007"); 
CityList(918,531,"石河子","Shihezi","CN031008"); 
CityList(919,531,"伊犁","Yili","CN031009"); 
CityList(920,531,"巴音郭楞","Bayinguoleng","CN031010"); 
CityList(921,531,"昌吉","Changji","CN031011"); 
CityList(922,531,"奎屯","Kuitun","CN031012"); 
CityList(923,531,"博尔塔拉","Boertala","CN031013"); 
CityList(924,531,"克孜勒苏柯尔克孜","Kezilesukeerkezi","CN031014"); 
CityList(925,531,"塔城","Tacheng","CN031015"); 
CityList(926,531,"阿勒泰","Aletai","CN031016"); 
CityList(927,531,"图木舒克市","Tumushukeshi","CN031017"); 
CityList(928,531,"五家渠市","Wujiaqushi","CN031018"); 
CityList(929,531,"博乐","Bole","CN031019"); 
//===========  地区  西藏  数据 =========//
CityList(931,532,"拉萨","Lasa","CN032001"); 
CityList(932,532,"阿里","Ali","CN032002"); 
CityList(933,532,"那曲","Naqu","CN032003"); 
CityList(934,532,"日喀则","Rikaze","CN032004"); 
CityList(935,532,"山南","Shannan","CN032005"); 
CityList(936,532,"林芝","Linzhi","CN032006"); 
CityList(937,532,"昌都","Changdu","CN032007"); 

CityList(940,533,"香港特别行政区","Xianggang","CN033001"); 

CityList(942,534,"澳门特别行政区","Aomen","CN034001"); 

CityList(1000,501,"海淀区","haidingqu","CN101000");
CityList(1001,848,"安溪县","anxi","CN125005"); 


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
		请选择商品类型：
		<select id="citylist" name="citylist" onchange="m('citylist','citycode')">
		 	<option value="">大类别</option>
		</select>
		<select id="citycode" name="citycode"  onchange="m('citycode','cityaaa')" >
		 	<option value="">小类别</option>
		</select>

<table>
									<tr>
										<td width="83" height="44" >
											商品名称：
							      </td>
										<td width="366">
							        <input id="productName" name="productName" onblur="check_userName(this,'regist_userName_message');"/>
											<font id="regist_userName_message" color="red"></font>
										</td>
										
									</tr>
	
									<tr>
										<td height="29">
											单价（元）：
										</td>
										<td>
											<input type="text" size="15" name="productPrice" />
										</td>
									</tr>
									<tr>
										<td height="33">
											上架时间：
										</td>
										<td>
											<input type="text" size="15" name="productTime"  />
										</td>
									</tr>
									<tr>
										<td height="35">
											描述：
										</td>
										<td>
											<input type="text" size="25" name="productDescription" />
										</td>
									</tr>
				                    
								</table>

                          
									<input type="submit" value="添加商品" style="margin-right:50px;"/>
									&nbsp;
									<input type="reset" value="重置" />
								
			</form>
		</div>
<div id="outcity" class="data2"></div>
<script language="javaScript">
/*******
CityData, CityCount为本脚本内象对像
函数CityList(城市ID,父ID,中文名,英文名,编号);
函数 SelectCity (城市列表数据，调用列表表单名称，调用列表子表单名称，限制ID），ID为0为根类
函数m(当前列表表单名称，子表单名称)
********/
SelectCity(CityData,'citylist','citycode',0);
SelectCity(CityData,'citylist1','citycode',0);  //调用初始城市列表

//////   以下为输出范列  ///////
var listcity = listCity('');
if(listcity != false){
	var ocity = "JS功能输出<br />你选择的城市<br />中文名为："+listcity[2];
	ocity += "<br />英文名为:" + listcity[3];
	ocity += "<br />编码为:" + listcity[4];
	getID('outcity').innerHTML = ocity;
}
</script>

</body>
</html>