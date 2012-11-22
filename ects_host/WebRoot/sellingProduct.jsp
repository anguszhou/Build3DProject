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
          <li class="J_MenuItem"><a class="c8" href="${pageContext.request.contextPath}/showSeller.do" ><s></s><i></i>我要卖</a></li>
          <li class="J_MenuItem"><a class="c8" href="selling.html" ><s></s><i></i>出售中的商品</a></li>

          <li class="J_MenuItem"><a class="c8" href="${pageContext.request.contextPath}/showSeller.do" ><s></s><i></i>商品留言/回复</a></li>
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
    	<font color="#FF6600">当前位置：</font> <a  href="seller.html"  >货物管理</a> ——> <a  href="selling.html" >出售中的商品</a><p>&nbsp;</p>
  <a href="seller.html" class="seller">我的商铺首页</a>
			<div class="head"> 
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="#" >出售中的商品</a> 
				  </h3> 
			  </div> 
			</div> 
			<div class="body"> 
				<div id="tabber1" >
				  <div class="vImgColl_W">
				    <c:forEach items="${ pageController.data }" var="product" varStatus="status">
				    <div class="feat_prod_box">
				      <div class="prod_img"><a href="${pageContext.request.contextPath}/productDetail.do?productId=${product.product_id}"><img src="images/${product.name}" alt="" title="" border="0" width="119px" onmouseover="ects_img_detail(this);"/></a></div>
				      <div class="prod_det_box">
				        <div class="box_top"></div>
				        <div class="box_center">
				          <div class="prod_title">${ product.name }</div>
				          <div class="prod_price">￥ ${ product.name }</div>
				          <p class="details">产品系列：${ product.name } </p>
				          <a href="productDetails.html" class="more" style="float:right;">- 详细信息 -</a>
				          <div class="clear"></div>
			            </div>
				        <div class="box_bottom"></div>
			          </div>
				      <div class="clear"></div>
				      </c:forEach>
				      <div class="pagination"> 共有<font color="red">${pageController.totalRowsAmount}</font>条记录
				        共有<font color="red">${pageController.totalPages}</font>页
				        当前是第<font color="red">${pageController.currentPage}</font>页 <br/>
				        <br/>
				        <a href="${pageContext.request.contextPath}/sellerProductList.do?destId=1">首页</a>
				        <c:if test="${pageController.hasPrevious}"> <a href="${pageContext.request.contextPath}/sellerProductList.do?destId=${pageController.currentPage-1}">上一页</a> </c:if>
				        <span class="current">
				          <select name="pageSelector" id="pageSelector" style="font-size:12px;padding-top:3px;"
								onchange="location='${pageContext.request.contextPath}/sellerProductList.do?destId='+this.value">
				            <c:out value="${pageSelector}" escapeXml="false"></c:out>
			            </select>
			            </span>
				        <c:if test="${pageController.hasNext}"> <a href="${pageContext.request.contextPath}/sellerProductList.do?destId=${pageController.currentPage+1}">下一页</a> </c:if>
				        <a href="${pageContext.request.contextPath}/sellerProductList.do?destId=${pageController.totalPages}">最后一页</a> </div>
				      <div class="clear"></div>
			        </div>
			      </div>
				</div> 
 		 	</div> 
       </div>
   </div>
   <p>&nbsp;</p><p>&nbsp;</p>
   <p>&nbsp;</p>
   
   
   
   


    <div id="footer">
	  <p>&nbsp;</p>
		  <p>&nbsp;</p>
</div>

</body>
</html>