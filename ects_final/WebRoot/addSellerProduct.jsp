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



			function check_null(caller)
			{				
				if(caller.value.length == 0)
				{
					alert("�����Ϊ��");										
				}
			}
			
			function check_password(caller){
				
				if(caller.value.length == 0)
				{
					alert("�����Ϊ��");					
					return;
				}
				
				if(caller.value != caller.form.password.value)
				{
					alert("�����������벻һ��,����������");	
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
					alert('��Ʒ������Ϊ��!');	
					document.form.productName.focus();
					return false;
				}
				
				if(form.productPrice.value.length ==0)
				{
					alert('���۲���Ϊ��!');
					document.form.productPrice.focus();
					return false;
				}
				if(form.productTime.value.length ==0)
				{
					alert('����д��ȷ��д��Ʒ�ϼ�ʱ�䣡');	
					document.form.productTime.focus();
					return;
				}	
				if(form.productDescription.value.length ==0)
				{
					alert('������������Ʒ��Ϣ��');	
					document.form.productDescription.focus();
					return false;
				}			
				form.submit();	
			}
			
			//ȥ���ַ�����β�ո�
String.prototype.trim = function()
{
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

//��֤�Ƿ�Ϊ����
function validator(){  
    if(isDate(document.all.productTime.value.trim())==false){
     document.all.productTime.select(); 
     return false;
    }
    
}

/**   
    �ж����������������ڸ�ʽ�Ƿ�Ϊ yyyy-mm-dd   ��yyyy-m-d
  */   

function isDate(dateString){
  if(dateString.trim()=="")return true;
  //������������ʽ
  var r=dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
        if(r==null){
   alert("�������ʽ��ȷ������\n\r���ڸ�ʽ��yyyy-mm-dd\n\r��    �磺2010-07-01\n\r");
   return false;
  }
        var d=new Date(r[1],r[3]-1,r[4]);   
  var num = (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
  if(num==0){
   alert("�������ʽ��ȷ������\n\r���ڸ�ʽ��yyyy-mm-dd\n\r��    �磺2010-07-018\n\r");
  }
  return (num!=0);
  
}  



	
//===========  ������������ =========//
CityList(1,0,"����","CN","����");
CityList(2,0,"��װ","JP","��װ");
CityList(3,0,"�鼮","US","�鼮");
CityList(4,0,"�ճ���Ʒ","US","�ճ���Ʒ");
//===========  ʡ�ݻ���ֱϽ���������� =========//

CityList(1,1,"����","diannao","����");
CityList(2,1,"MP3","shouji","MP3");
CityList(3,1,"PSP","shouji","PSP");
CityList(4,1,"�ֻ�","shouji","�ֻ�");
CityList(5,2,"����","shouji","����");
CityList(6,2,"����","shouji","����");
CityList(7,2,"Ь","shouji","Ь");
CityList(9,3,"ѧϰ","shouji","ѧϰ");
CityList(10,3,"С˵","shouji","С˵");
CityList(11,3,"��־","shouji","��־");
CityList(12,4,"ë��","shouji","ë��");
CityList(13,4,"��ˢ","shouji","��ˢ");
CityList(14,4,"����","shouji","����");


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
						</span>�����Ʒ
					</div>
					<div class="clear"></div>
							
<form name="form1" style="padding-left: 5%;" onsubmit="return check_submit(this.form)"  action="${pageContext.request.contextPath}/addSellerProduct.do" method="post">
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
											<input type="text" size="15" name="productPrice" onblur="check_null(this);" />
										</td>
									</tr>
									<tr>
										<td height="33">
											�ϼ�ʱ�䣺
										</td>
										<td>
											<input type="text" size="15" name="productTime"  onblur="validator();"/>��ʽ��"yyyy-mm-dd"
										</td>
									</tr>
									<tr>
										<td height="35">
											������
										</td>
										<td>
											<input type="text" size="25" name="productDescription" onblur="check_null(this);"/>
										</td>
									</tr>
				                    
								</table>

                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="sub" type="button" value="�����Ʒ" style="margin-right:100px;" onclick="check_submit(this.form);"/>
									&nbsp;
									<input type="reset" value="����" />
								
			</form>
		</div>
		</div>
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