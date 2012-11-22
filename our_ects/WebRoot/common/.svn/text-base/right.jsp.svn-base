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

			 <div id="basketWrap">
				<div id="basketTitleWrap"><a href="${pageContext.request.contextPath}/cart.jsp" >
					购物车 </a><span id="notificationsLoader"></span>
				</div>

				<div id="basketItemsWrap">
					<ul>
					<li>物品数：${ cart.count }</li>
					<c:forEach items="${cart.items}" var="orderLine"
								varStatus="varStatus">
					<li id="${orderLine.value.product.id}">
					<img src="images/checked.png" id="${orderLine.value.product.id}"/> 
					${ orderLine.value.product.name }×${ orderLine.value.amount }
					</li>
					</c:forEach>
					<li>
					共 计： ${ cart.total }
					</li>
					</ul>
				</div>

			</div>
	

			<div class="title">
				<span class="title_icon"> <img src="images/bullet5.gif"
						alt="" title="" /> 畅销机型 </span>

			</div>
			<!-- 测试ranknum -->
			<div class="bmod rank1" id="potential-rank">
				<div class="tit">
					<b></b>
				</div>
				<ul>
				<c:forEach items="${rankProduct}" var="product">
					<li>
							<a href="${pageContext.request.contextPath}/productDetail.do?productId=${product.id }">${product.name}</a>
						</li>
				</c:forEach>

				</ul>
			</div>
			<div class="title">
				<span class="title_icon"> <img src="images/bullet5.gif"
						alt="" title="" /> 畅销品牌 </span>

			</div>
			<div class="bmod rank1" id="potential-rank">
				<div class="tit">
					<b></b>
				</div>
				<ul>
				<c:forEach items="${rankCategory}" var="product">
					<li>
					<a href="${pageContext.request.contextPath}/categoryList.do?categoryId=${product.category.id }">${product.category.name}</a>
						</li>
				</c:forEach>

				</ul>
			</div>
			
			

		</div>
	</body>
</html>