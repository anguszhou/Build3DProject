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
			<li><a href="#tab1">核心企业表</a></li> 
			<li><a href="#tab2">中小企业表</a></li> 
		</ul> 
 
		<div class="tab_container"> 
			<div id="tab1" class="tab_content"> 
			  	<div class="details">
			  		<table border=1>
							<tr>
								<td align="center" width="200">
									企业名称
								</td>
								<td width="80">
									工商登记号
								</td>
								<td width="60">
									行业分类
								</td>
								<td width="60">
									上市公司
								</td>
							</tr>
							<c:forEach items="${cart.items}" var="orderLine"
								varStatus="varStatus">
								<tr>
									 <td>
										<a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.product_id}">
										${companyinfo.name}
									</td>
								
									<td>
										${companyinfo.taxnum}
									</td>
									
									<td>
										${companyinfo.industrytype.name}
									</td>
									
									<td>
										${companyinfo.isListedComp}
									</td>
								</tr>
							</c:forEach>
						</table>
			  	
			  	</div>
			</div> 
			
			<div id="tab2" class="tab_content"> 
				<div class="details">
			  		<table border=1>
							<tr>
								<td align="center" width="200">
									企业名称
								</td>
								<td width="80">
									工商登记号
								</td>
								<td width="60">
									行业分类
								</td>
								<td width="60">
									风险等级
								</td>
							</tr>
							<c:forEach items="${cart.items}" var="orderLine"
								varStatus="varStatus">
								<tr>
									 <td>
										<a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.product_id}">
										${companyinfo.name}
									</td>
								
									<td>
										${companyinfo.taxnum}
									</td>
									
									<td>
										${companyinfo.industrytype.name}
									</td>
									
									<td>
										${companyinfo.smeassessments.risklevel}
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