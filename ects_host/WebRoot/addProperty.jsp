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
		getID(citycode).options[0]= new Option("请选择一个城市","");
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
        <li ><a href="index.html">主页</a></li>
        
        <li><a href="${pageContext.request.contextPath}/productList.do">商品列表</a></li>
         <li><a href="${pageContext.request.contextPath}/search.jsp">搜索商品</a></li>
        
        <li><a href="${pageContext.request.contextPath}/cart.jsp">我的购物车</a></li>
        <c:if test="${user != null}">        	
        	<li><a href="${pageContext.request.contextPath}/orderList.do">订单列表</a></li>
        </c:if>
        
        <c:if test="${user == null}">        	
        	<li><a href="${pageContext.request.contextPath}/login.jsp">订单列表</a></li>
        </c:if>
        <c:if test="${user != null}">
        	
        </c:if>
	 </ul>
  </div>
  
  
<div class="Box">
  <div class="col-sub">
    <div id="J_Category" class="mall-category">
    <h2 class="title"><a href="#" >货物管理</a></h2>
    <div class="entity">
      <div class="items">
        <ul class="item">
         <li class="J_MenuItem"><a class="c8" href="sell.html" ><s></s><i></i>我要卖</a></li>
          <li class="J_MenuItem"><a class="c8" href="selling.html" ><s></s><i></i>出售中的商品</a></li>

          <li class="J_MenuItem"><a class="c8" href="liuyan.html" ><s></s><i></i>商品留言/回复</a></li>
        </ul>
        </div>
        </div>
         <div class="entity">
      <div class="items">
        <h2 class="title"><a href="#" >交易管理</a></h2>
        <ul class="item">
          <li class="J_MenuItem"><a class="c8" href="selled.html" ><s></s><i></i>已卖出的商品</a></li>
          <li class="J_MenuItem"><a class="c8" href="w_orderList.html" ><s></s><i></i>等待发货的订单</a></li>
          
          <li class="J_MenuItem"><a class="c8" href="r_orderList.html" ><s></s><i></i>已发货的订单</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>评价管理</a></li>          
        </ul>
        </div>
        </div>
       
         <div class="entity">
      <div class="items">
        <h2 class="title"><a href="#" >客户服务</a></h2>
        <ul class="item">
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>投诉举报</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>咨询回复</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>违规记录</a></li>
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
    <font color="#FF6600">当前位置：</font> <a  href="seller.html"  >货物管理</a> ——> <a  href="sell.html"  >我要卖</a><p>&nbsp;</p>
<div class="head"> 
<a href="seller.html" class="seller">我的商铺首页</a>
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="http://dv.youku.com/" >添加商品</a> 
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
											商品名称：
											<a href="${pageContext.request.contextPath}/upload.jsp?productId=${product.product_id}" class="more">- 上传图片 -</a>
							      </td>
										<td width="366">
							        <input id="productName" name="productName"  value="${product.name}" readonly="readonly" onblur="check_null(this);"/>
											
										</td>
									
									</tr>
									<tr>
										<td height="34">
											单价：
										</td>
										<td>
										  <input name="productPrice" type="text"  value="${product.price}" onblur="check_null(this);"/>
											
										</td>
									</tr>
									<tr>
										<td height="30">
											上架时间：
										</td>
										<td>
										  <input name="productTime" type="text" value="${product.time}" onblur="check_password(this);"/>
											
										</td>
									</tr>
									
									
									<tr>
										<td height="29">
											商品描述：
										</td>
										<td>
											<input type="text" size="35" name="productDescription" value="${product.descriptions}"/>
										</td>
									</tr>
								
									
									<c:forEach items="${propertys}" var="propertys" varStatus="varStatus">  
										<tr>
										   <td>${varStatus.count}</td>
										   
											<td height="35">
												商品属性：
											</td>
											
											<td>
												${propertys.propertyName}
											</td>
										
											<td height="30">
												属性值：
											</td>
											<td>
												${propertys.propertyValue}
											</td>
										<!-- 	<td><a href="${pageContext.request.contextPath}/deleteProperty.do?propertyId=${propertys.id}" class="more">-删除 -</a></td>
										 -->
										</tr>
									</c:forEach>  
									<tr>
										<td height="35">
											新增商品属性：
										</td>
										<td>
							        <input type="text" size="32" name="addPropertyName" />
											
										</td>
									</tr>
									<tr>
										<td height="35">
											属性值：
										</td>
										<td>
							        <input type="text" size="32" name="addPropertyValue" />
											
										</td>
									</tr>
									
									
								</table>
								<div class="form_row"/>
								<center>
									<input type="submit" value="添加商品属性" style="margin-right:50px;" />
									&nbsp;
									<input type="reset" value="重置" />
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