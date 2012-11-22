<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	
<link rel="stylesheet" type="text/css" href="style3.css" />
    
    <script src="js/style.js"></script>
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
		getID(citycode).options[0]= new Option("��ѡ��һ������","");
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

   


</script>	

	
    
    
<style type="text/css">
<!--
body,td,th {
	font-size: 0.7em;
}
-->
</style></head>
<body >
<p><span class="clear"><span class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=6"></a></span></span></p>
<div id="main">
  <p><a href="#"><img src="images/logo.gif"  title="" border="0" /></a></p>
  
 <div id="menu">
        <ul>                                                                       
        <li ><a href="index.html">��ҳ</a></li>
        
        <li><a href="${pageContext.request.contextPath}/productList.do">��Ʒ�б�</a></li>
         <li><a href="${pageContext.request.contextPath}/search.jsp">������Ʒ</a></li>
        
        <li><a href="${pageContext.request.contextPath}/cart.jsp">�ҵĹ��ﳵ</a></li>
        <c:if test="${user != null}">        	
        	<li><a href="${pageContext.request.contextPath}/orderList.do">�����б�</a></li>
        </c:if>
        
        <c:if test="${user == null}">        	
        	<li><a href="${pageContext.request.contextPath}/login.jsp">�����б�</a></li>
        </c:if>
        <c:if test="${user != null}">
        	
        </c:if>
	 </ul>
  </div>
  
  
<div class="Box">
  <div class="col-sub">
    <div id="J_Category" class="mall-category">
    <h2 class="title"><a href="#" >�������</a></h2>
    <div class="entity">
      <div class="items">
        <ul class="item">
         <li class="J_MenuItem"><a class="c8" href="sell.html" ><s></s><i></i>��Ҫ��</a></li>
          <li class="J_MenuItem"><a class="c8" href="selling.html" ><s></s><i></i>�����е���Ʒ</a></li>

          <li class="J_MenuItem"><a class="c8" href="liuyan.html" ><s></s><i></i>��Ʒ����/�ظ�</a></li>
        </ul>
        </div>
        </div>
         <div class="entity">
      <div class="items">
        <h2 class="title"><a href="#" >���׹���</a></h2>
        <ul class="item">
          <li class="J_MenuItem"><a class="c8" href="selled.html" ><s></s><i></i>����������Ʒ</a></li>
          <li class="J_MenuItem"><a class="c8" href="w_orderList.html" ><s></s><i></i>�ȴ������Ķ���</a></li>
          
          <li class="J_MenuItem"><a class="c8" href="r_orderList.html" ><s></s><i></i>�ѷ����Ķ���</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>���۹���</a></li>          
        </ul>
        </div>
        </div>
       
         <div class="entity">
      <div class="items">
        <h2 class="title"><a href="#" >�ͻ�����</a></h2>
        <ul class="item">
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>Ͷ�߾ٱ�</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>��ѯ�ظ�</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>Υ���¼</a></li>
        </ul>
        
      <h2 class="title"><a ></a></h2>
      </div>
        
      </div>
    </div>
    </div>
  </div>
 

<style>
	.qBox{margin-left:250px;margin-top:-30px;}
	.seller{float:right;margin-top:-35px;}
</style>
   <div class="Box1">
	<div class="qBox"> 
    <font color="#FF6600">��ǰλ�ã�</font> <a  href="seller.html"  >�������</a> ����> <a  href="sell.html"  >��Ҫ��</a><p>&nbsp;</p>
<div class="head"> 
<a href="seller.html" class="seller">�ҵ�������ҳ</a>
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="http://dv.youku.com/" >�����Ʒ</a> 
				  </h3> 
			  </div> 
			</div> 
			<div class="body"> 
				<div id="tabber1" > 
					<div class="vImgColl_W"> 
          							         
                    
      <div class="contact_form" style="margin-left: 10px; width: 88%;margin-top:5px;">
                    	
                    	<form style="padding-left: 5%;"
								action="${pageContext.request.contextPath}/addProperty.do"
								method="post">
								<table>
								<tr>
										<td width="366">
							        <input  id="productId" name="productId" type="hidden" value="${product.product_id}"  />
											
										</td>
									
									</tr>
									<tr>
										<td width="83" height="44" >
											��Ʒ���ƣ�
											<a href="${pageContext.request.contextPath}/upload.jsp?productId=${product.product_id}" class="more">- �ϴ�ͼƬ -</a>
							      </td>
										<td width="366">
							        <input id="productName" name="productName"  value="${product.name}" readonly="readonly" onblur="check_null(this);"/>
											
										</td>
									
									</tr>
									<tr>
										<td height="34">
											���ۣ�
										</td>
										<td>
										  <input name="productPrice" type="text"  value="${product.price}" onblur="check_null(this);"/>
											
										</td>
									</tr>
									<tr>
										<td height="30">
											�ϼ�ʱ�䣺
										</td>
										<td>
										  <input name="productTime" type="text" value="${product.time}" onblur="check_password(this);"/>
											
										</td>
									</tr>
									
									
									<tr>
										<td height="29">
											��Ʒ������
										</td>
										<td>
											<input type="text" size="35" name="productDescription" value="${product.descriptions}"/>
										</td>
									</tr>
								
									
									<c:forEach items="${propertys}" var="propertys" varStatus="varStatus">  
										<tr>
										   <td>${varStatus.count}</td>
										   
											<td height="35">
												��Ʒ���ԣ�
											</td>
											
											<td>
												${propertys.propertyName}
											</td>
										
											<td height="30">
												����ֵ��
											</td>
											<td>
												${propertys.propertyValue}
											</td>
										<!-- 	<td><a href="${pageContext.request.contextPath}/deleteProperty.do?propertyId=${propertys.id}" class="more">-ɾ�� -</a></td>
										 -->
										</tr>
									</c:forEach>  
									<tr>
										<td height="35">
											������Ʒ���ԣ�
										</td>
										<td>
							        <input type="text" size="32" name="addPropertyName" />
											
										</td>
									</tr>
									<tr>
										<td height="35">
											����ֵ��
										</td>
										<td>
							        <input type="text" size="32" name="addPropertyValue" />
											
										</td>
									</tr>
									
									
								</table>
								<div class="form_row"/>
								<center>
									<input type="submit" value="�����Ʒ����" style="margin-right:50px;" />
									&nbsp;
									<input type="reset" value="����" />
								</center>
								<br />
							</form>
								
                   	 </div>
                
				  </div>
				</div> 
 		 	</div> 
       </div>
   </div>
   <p>&nbsp;</p><p>&nbsp;</p>
  
</div>

    <div id="footer">
	  <p>&nbsp;</p>
		  <p>&nbsp;</p>
</div>

</body>
</html>