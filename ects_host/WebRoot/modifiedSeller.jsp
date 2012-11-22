<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="style3.css" />
    
    <script src="js/style.js"></script>

    <link rel="icon" href="http://img07.taobaocdn.com/tps/i7/T1bZNxXjXjXXXXXXXX.png" type="image/x-icon" />
	

	
    
    
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
								action="#"
								method="post">
								<table>
									<tr>
										<td width="83" height="44" >
											商品名称：
							      </td>
										<td width="366">
							        <input id="ects_userName" name="name" onblur="check_userName(this,'regist_userName_message');"/>
											<font id="regist_userName_message" color="red"></font>
										</td>
										<script language="javascript">
											document.getElementById("ects_userName").focus();
										</script>
									</tr>
									<tr>
										<td height="34">
											密码：
										</td>
										<td>
										  <input type="password" name="password" onblur="check_null(this);"/>
											<font color="red">*密码可以由6-20个字母或数字组成</font>
										</td>
									</tr>
									<tr>
										<td height="30">
											确认密码：
										</td>
										<td>
										  <input name="repwd" type="password" onblur="check_password(this);"/>
											<font color="red">*请重新输入以上密码</font>
										</td>
									</tr>
									
									<tr>
										<td height="32">
											联系地址1：
										</td>
										<td>
											<input type="text" size="35" name="street1" />
										</td>
									</tr>
									<tr>
										<td height="32">
											联系地址2：
										</td>
										<td>
											<input type="text" size="35" name="street2" />
										</td>
									</tr>
									<tr>
										<td height="29">
											邮编：
										</td>
										<td>
											<input type="text" size="35" name="zip" />
										</td>
									</tr>
									<tr>
										<td height="33">
											办公室电话
										</td>
										<td>
											<input type="text" size="15" name="officePhone" />
										</td>
									</tr>
									<tr>
										<td height="35">
											手机
										</td>
										<td>
											<input type="text" size="15" name="cellPhone" />
										</td>
									</tr>
									<tr>
										<td height="30">
											家庭电话
										</td>
										<td>
											<input type="text" size="15" name="homePhone" />
										</td>
									</tr>
									<tr>
										<td height="35">
											Email地址：
										</td>
										<td>
							        <input type="text" size="32" name="email" />
											<font color="red">*请输入有效的邮件地址</font>
										</td>
									</tr>
								</table>
								<div class="form_row"/>
								<center>
									<input type="button" value="添加商品" style="margin-right:50px;" onclick="check_submit(this.form);"/>
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