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
        
      <h2 class="title"><a  ></a></h2>
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
    	<font color="#FF6600">当前位置：<a  href="seller.html"  >交易管理</a> ——> <a  href="r_orderList.html" >已发货的订单</a><p>&nbsp;</p>
        <a href="seller.html" class="seller">我的商铺首页</a>
			<div class="head"> 
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="#" >已发货的订单</a> 
				  </h3> 
			  </div> 
			</div> 
			<div class="body"> 
				<div id="tabber1" >
				  <div class="vImgColl_W">
				    <div class="right_content" align="center">

				      <div class="feat_prod_box_details">
				        <form>
				          <table class="cart_table">
				            <tr class="cart_title">
				              <td width="74">序号</td>
				              <td width="120">订单名称</td>
				              <td width="120">订单金额</td>
				              <td width="120">付款方式</td>
				              <td width="141">操作</td>
			                </tr>
				            <c:forEach items="${orderList}" var="order" varStatus="varStatus">
				              <tr>
				                <td>${varStatus.count}</td>
				                <td>${order.name}</td>
				                <td>${order.cost}</td>
				                <td>${order.payWay.payStyle}</td>
				                <td><a href="${pageContext.request.contextPath}/orderDetail.do?orderId=${order.id}" class="continue">订单明细</a></td>
			                  </tr>
			                </c:forEach>
			              </table>
			            </form>
			          </div>
				      <div class="clear"></div>
			        </div>
			      </div>
				</div> 
 		 	</div> 
       </div>
   </div>
   <p>&nbsp;</p><p>&nbsp;</p>
   <p>&nbsp;</p>
   
   
   
   
</div>

    <div id="footer">
	  <p>&nbsp;</p>
		  <p>&nbsp;</p>
</div>

</body>
</html>