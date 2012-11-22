<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	
		
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



			function check_null(caller)
			{				
				if(caller.value.length == 0)
				{
					alert("该项不能为空");										
				}
			}
			
			function check_password(caller){
				
				if(caller.value.length == 0)
				{
					alert("该项不能为空");					
					return;
				}
				
				if(caller.value != caller.form.password.value)
				{
					alert("两次输入密码不一致,请重新输入");	
					caller.value = '';				
				}
			}
			function check(str){
					var reg = /^(d+)-(d{1,2})-(d{1,2}) (d{1,2}):(d{1,2}):(d{1,2})$/;
					var r = str.match(reg);
					if(r==null)return false;
					r[2]=r[2]-1;
					var d= new Date(r[1], r[2],r[3], r[4],r[5], r[6]);
					if(d.getFullYear()!=r[1])return false;
					if(d.getMonth()!=r[2])return false;
					if(d.getDate()!=r[3])return false;
					if(d.getHours()!=r[4])return false;
					if(d.getMinutes()!=r[5])return false;
					if(d.getSeconds()!=r[6])return false;
					return true;
					}
			function check_submit(form)
			{
				
				if(form.productName.value.length ==0)
				{
					alert('商品名不能为空!');	
					document.form.productName.focus();
					return false;
				}
				
				if(form.productPrice.value.length ==0)
				{
					alert('单价不能为空!');
					document.form.productPrice.focus();
					return false;
				}
				if(form.productTime.value.length ==0)
				{
					alert('请填写正确填写商品上架时间！');	
					document.form.productTime.focus();
					return;
				}	
				if(form.productDescription.value.length ==0)
				{
					alert('请描述您的商品信息！');	
					document.form.productDescription.focus();
					return false;
				}			
				form.submit();	
			}
			
			//去除字符串首尾空格
String.prototype.trim = function()
{
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

//验证是否为日期
function validator(){  
    if(isDate(document.all.productTime.value.trim())==false){
     document.all.productTime.select(); 
     return false;
    }
    
}

/**   
    判断输入框中输入的日期格式是否为 yyyy-mm-dd   或yyyy-m-d
  */   

function isDate(dateString){
  if(dateString.trim()=="")return true;
  //年月日正则表达式
  var r=dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
        if(r==null){
   alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例    如：2010-07-01\n\r");
   return false;
  }
        var d=new Date(r[1],r[3]-1,r[4]);   
  var num = (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
  if(num==0){
   alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例    如：2010-07-018\n\r");
  }
  return (num!=0);
  
}  



	
//===========  国家名称数据 =========//
CityList(1,0,"数码","CN","数码");
CityList(2,0,"服装","JP","服装");
CityList(3,0,"书籍","US","书籍");
CityList(4,0,"日常用品","US","日常用品");
//===========  省份或者直辖市名称数据 =========//

CityList(1,1,"电脑","diannao","电脑");
CityList(2,1,"MP3","shouji","MP3");
CityList(3,1,"PSP","shouji","PSP");
CityList(4,1,"手机","shouji","手机");
CityList(5,2,"上衣","shouji","上衣");
CityList(6,2,"裤子","shouji","裤子");
CityList(7,2,"鞋","shouji","鞋");
CityList(9,3,"学习","shouji","学习");
CityList(10,3,"小说","shouji","小说");
CityList(11,3,"杂志","shouji","杂志");
CityList(12,4,"毛巾","shouji","毛巾");
CityList(13,4,"牙刷","shouji","牙刷");
CityList(14,4,"脸盆","shouji","脸盆");


</script>

</head>
<style>
.data1 { background-color:#fff0ff}
.data2 { background-color:#ffff00}
</style>
<body>
<div id="wrap">
			<div class="header">        
	       	   <jsp:include page="common/menu2.jsp"></jsp:include>
	       </div>
			<div class="center_content">
				<div class="left_content">
				</div>
				<div class="right_content">
		<div class="title">
						<span class="title_icon">
							<img src="images/bullet1.gif"/>
						</span>添加商品
					</div>
					<div class="clear"></div>
							
<form name="form1" style="padding-left: 5%;" onsubmit="return check_submit(this.form)"  action="${pageContext.request.contextPath}/addSellerProduct.do" method="post">
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
											<input type="text" size="15" name="productPrice" onblur="check_null(this);" />
										</td>
									</tr>
									<tr>
										<td height="33">
											上架时间：
										</td>
										<td>
											<input type="text" size="15" name="productTime"  onblur="validator();"/>格式："yyyy-mm-dd"
										</td>
									</tr>
									<tr>
										<td height="35">
											描述：
										</td>
										<td>
											<input type="text" size="25" name="productDescription" onblur="check_null(this);"/>
										</td>
									</tr>
				                    
								</table>

                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="sub" type="button" value="添加商品" style="margin-right:100px;" onclick="check_submit(this.form);"/>
									&nbsp;
									<input type="reset" value="重置" />
								
			</form>
		</div>
		</div>
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