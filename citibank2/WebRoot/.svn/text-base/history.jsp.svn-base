<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	<script language="JavaScript" type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript"> 
		$(function(){
			// 预设显示第一个 Tab
			var _showTab = 0;
			$('.abgne_tab').each(function(){
				// 目前的页签区号
				var $tab = $(this);
	 
				$('ul.tabs li', $tab).eq(_showTab).addClass('active');
				$('.tab_content', $tab).hide().eq(_showTab).show();
				
				
				$('ul.tabs li', $tab).click(function() {
				
					var $this = $(this),
						_clickTab = $this.find('a').attr('href');
					
					$this.addClass('active').siblings('.active').removeClass('active');
					
					$(_clickTab).stop(false, true).fadeIn().siblings().hide();
	 
					return false;
				}).find('a').focus(function(){
					this.blur();
				});
			});
		});
	</script> 
	
</head>

<body>
<div id="mainPan">
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="left">
		<jsp:include page="left.jsp"></jsp:include>
	</div>
	

	<div class="middle">
	  <div class="abgne_tab"> 
		<ul class="tabs"> 
			<li><a href="#tab1">分值</a></li> 
			<li><a href="#tab2">风险等级</a></li> 
			<li><a href="#tab3">行业排名</a></li> 
			<li><a href="#tab4">总排名</a></li> 
		</ul> 
		<table></table>
		<div class="tab_container"> 
			<div id="tab1" class="tab_content"> 
			<table>
				<tr>
					<td><span>企业名称：</span></td>
					<td><span>${companyinfo.name }</span></td>
				</tr>
			</table>
			  	<div class="details">
			  		<table border="0" width="200" cellspacing="1" cellpadding="0"  >
							<tr>
								<td align="center" width="200">
									时间
								</td>
								<td width="80">
									分值
								</td>
							</tr>
							<c:forEach items="${cart.items}" var="orderLine"
								varStatus="varStatus">
								<tr>
									 <td>
										<a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.product_id}">
										${assessment.time}
									</td>
								
									<td>
										${assessment.score}
									</td>
								</tr>
							</c:forEach>
						</table>
			  	</div>
			</div> 
			
			<div id="tab2" class="tab_content"> 
				<table>
				<tr>
					<td><span>企业名称：</span></td>
					<td><span>${companyinfo.name }</span></td>
				</tr>
				</table>
				<div class="details">
			  		<table border=1>
							<tr>
								<td align="center" width="200">
									时间
								</td>
								<td width="80">
									风险等级
								</td>
							</tr>
							<c:forEach items="${cart.items}" var="orderLine"
								varStatus="varStatus">
								<tr>
									 <td>
										<a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.product_id}">
										${assessment.time}
									</td>
								
									<td>
										${assessment.risklevel}
									</td>
									
								</tr>
							</c:forEach>
						</table>
			  		</div>
			  	</div>
			  <div id="tab3" class="tab_content"> 
			  	<table>
				<tr>
					<td><span>企业名称：</span></td>
					<td><span>${companyinfo.name }</span></td>
				</tr>
				</table>
				<div class="details">
			  		<table border=1>
							<tr>
								<td align="center" width="200">
									时间
								</td>
								<td width="80">
									行业排名
								</td>
							</tr>
							<c:forEach items="${cart.items}" var="orderLine"
								varStatus="varStatus">
								<tr>
									 <td>
										<a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.product_id}">
										${assessment.time}
									</td>
								
									<td>
										${assessment.industryrank}
									</td>
									
								</tr>
							</c:forEach>
						</table>
			  		</div>
			  	</div>
			  	<div id="tab4" class="tab_content"> 
			  		<table>
					<tr>
						<td><span>企业名称：</span></td>
						<td><span>${companyinfo.name }</span></td>
					</tr>
					</table>
				<div class="details">
			  		<table border=0>
							<tr>
								<td align="center" width="200">
									时间
								</td>
								<td width="80">
									总排名
								</td>
							</tr>
							<c:forEach items="${cart.items}" var="orderLine"
								varStatus="varStatus">
								<tr>
									 <td>
										<a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.product_id}">
										${assessment.time}
									</td>
								
									<td>
										${assessment.rank}
									</td>
									
								</tr>
							</c:forEach>
						</table>
			  		</div>
			  	</div>
			</div> 
		</div> 
	</div> 
	
		<div class="right">
		<jsp:include page="right.jsp"></jsp:include>
		</div>
		
		<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</div>
</body>
</html>