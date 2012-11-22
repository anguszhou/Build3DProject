<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Auto Parts</title>
		<link rel="stylesheet" type="text/css" href="style.css" />

		<%@ page contentType="text/html; charset=gbk"%>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
		<script type="text/javascript" src="js/login.js"></script>
		<script type="text/javascript" src="js/jquery-1.2.1.min.js"></script>
		<script type="text/javascript" src="js/ymPrompt.js"></script>

		<script language="javascript">
		function check_num(caller)
		{
			if(caller.value<1)
			{
				alert('对不起，产品数量不能小于 1 ');
				caller.value = 1;
				caller.focus();
			}
		}
       	function modifyNum(productId,numId)
       	{       		
       		var num = document.getElementById(numId).value;       		
       		window.location="${pageContext.request.contextPath}/modifyCart.do?productId="+productId+"&num="+num;
       	}  
       	  
	</script>
	</head>
	<body>		
		<div id="wrap">

			<!-- 顶栏 -->
			<div class="header">
				<jsp:include page="common/menu.jsp"></jsp:include>
			</div>
			
			<div class="center_content">
				<!-- 左侧栏 -->
				<div class="left_content">
					<jsp:include page="common/left.jsp"></jsp:include>
				</div>
				<!-- 以下到右侧栏之前均为页面主体内容 -->
				<div class="right_content">
					<div class="cart">
						<div class="title">
							<span class="title_icon"><img src="images/cart.gif" alt=""
									title="" /> </span>购物车
						</div>
					</div>
					<div class="feat_prod_box_details">
						<table class="cart_table">
							<tr class="cart_title">
								<td width="130">
									商品照片
								</td>
							<td width="150">
									商品名称
								</td>
								<td width="70">
									单价
								</td>
								<td width="30">
									数量
								</td>
								<td width="90">
									合计
								</td>
								<td width="150">
									操作
								</td>
							</tr>
							<c:forEach items="${cart.items}" var="orderLine"
								varStatus="varStatus">
								<tr>
									 <td>
										<a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.product_id}">
										${orderLine.value.product.name}
									</td>
								
									<td>
										${orderLine.value.product.name}
									</td>
									<td>
										${orderLine.value.product.price}
									</td>
									<td class=tablebody2 valign=middle align=center width="40">
										<input id="num${varStatus.count}" type="text"
											value="${orderLine.value.amount}" size="4" onchange="check_num(this);"/>
									</td>
									<td>
										${orderLine.value.product.price*orderLine.value.amount}
									</td>
									<td>
										<button
											onclick="modifyNum('${orderLine.value.product.product_id}','num${varStatus.count}');">
											保存修改
										</button>
										<button
											onclick="Alert('确认删除?',null,null,'确认删除?',function(){location='${pageContext.request.contextPath}/deleteCart.do?productId=${orderLine.value.product.product_id}';},null);">
											删除
										</button>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="4" class="cart_total">
									<span class="red">总计金额:</span>
								</td>
								<td>
									${cart.total}
								</td>
							</tr>
						</table>

						<a href="${pageContext.request.contextPath}/clearCart.do"
							class="continue">清空购物车</a>
						<a href="${pageContext.request.contextPath}/productList.do"
							class="continue" style="margin-left: 150px;">继续购物</a>	
						<c:if test="${cart.size != 0}">				
							<c:if test="${user != null }">
								<a href="getOrder.jsp" class="checkout">付款订货</a>
							</c:if>
							<c:if test="${user == null }">
								<a href="#" class="checkout" onclick="AsynLogin('getOrder.jsp',this);">付款订货</a>
							</c:if>
						</c:if>													
					</div>

					<div class="clear"></div>
				</div>
				<!--end of left content-->
                <!-- 右侧栏 -->
				<div class="rank_content">
					<jsp:include page="common/right.jsp"></jsp:include>
				</div>
				<!-- 底栏 -->
				<jsp:include page="common/footer.jsp"></jsp:include>
			</div>
		</div>

	</body>
</html>