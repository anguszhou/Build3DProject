<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<title>Auto Parts</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>
	<div class="right_box">  
	
		 <div class="shopping_cart">
        	<div class="cart_title">购物车</div>
           	<div class="cart_details">
           		 目前：<span class="cart_count">${cart.count}</span><br />
           		 <span class="border_cart"></span>
           		 总价：<span class="price">${cart.total}</span>
           	</div>
            <div class="cart_icon"><a href="${pageContext.request.contextPath}/cart.jsp" ><img src="images/cart.gif" alt="" title="" /></a></div>
        </div>
	
	           
     	<div class="title">
     		<span class="title_icon">
     			<img src="images/bullet5.gif" alt="" title="" /> 
     			排行榜
     		</span>
     		
     	</div>                
        <ul class="list">
      
        <c:forEach items="${rankProduct}" var="product">
        
        	 <div>
        	 <li><a href="${pageContext.request.contextPath}/productDetail.do?productId=${product.id }">${product.name}</a></li>
		     </div>				         
          </c:forEach>                                           
        </ul>
       
       <div class="title">
     		<span class="title_icon">
     			<img src="images/bullet5.gif" alt="" title="" /> 
     			排行榜
     		</span>
     		
     	</div>                
        <ul class="list">
      
        <c:forEach items="${rankCategory}" var="product">
        
        	 <div>
        	 <li><a href="#">${product.category.name}</a></li>
		     </div>				         
          </c:forEach>                                           
        </ul>
       
   </div>
</body>
</html>