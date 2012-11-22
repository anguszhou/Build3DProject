<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=GBK"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	<script language="JavaScript" type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript" src="js/ymPrompt.js"></script>

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
  		<div id ="middlePan">
	    <div class="abgne_tab"> 
	    	<ul class="tabs"> 
				<li><a href="#tab1">信贷管理</a></li> 
				
				<li><a href="#tab3">用户管理</a></li> 
			</ul> 
			<table></table>
			<div class="tab_container"> 
				<div id="tab1" class="tab_content"> 
				<br /><br /><h4>信贷管理</h4> <br />
					<div class="abgne_tab"> 
					<ul class="tabs"> 
						<li><a href="#tab11">核心企业表</a></li> 
						<li><a href="#tab12">中小企业表</a></li> 
					</ul> 
 
					<div class="tab_container"> 
						<div id="tab11" class="tab_content"> 
						  	<div class="details">
						  		<table border=1>
										<tr>
											<td align="center" width="200">
												企业名称
											</td>
											<td align="center" width="80" >
												工商登记号
											</td>
											<td align="center" width="60" >
												行业分类
											</td>
											<td align="center" width="60" >
												上市公司
											</td>
										</tr>
										<c:forEach items="${pageController.data}" var="companyinfo"
											varStatus="varStatus">
											<tr  align="center">
												 <td align="center">
													<a href="${pageContext.request.contextPath}/corecompanyDetail.do?corecompanyId=${companyinfo.id}">
													${companyinfo.name} </a>
												</td>
											
												<td align="center">
													${companyinfo.taxnum}
												</td>
												
												<td align="center">
													${companyinfo.industrytype.name}
												</td>
												
												<td align="center">
													<c:if test="${companyinfo.isListedComp == 1}">
													是
													</c:if>
													<c:if test="${companyinfo.isListedComp == 0}">
													否
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</table>
			<table align="center">
            	共有<font color="red">${pageController.totalRowsAmount}</font>条记录
            	共有<font color="red">${pageController.totalPages}</font>页
            	当前是第<font color="red">${pageController.currentPage}</font>页
            	<br/><br/>
                <a href="${pageContext.request.contextPath}/coreComp.do?destId=1">首页</a>
                <c:if test="${pageController.hasPrevious}">
            		<a href="${pageContext.request.contextPath}/coreComp.do?destId=${pageController.currentPage-1}">上一页</a>
            	</c:if>
            		<span class="current">
						<select id="pageSelector" style="font-size:12px;padding-top:3px;"
							onchange="location='${pageContext.request.contextPath}/coreComp.do?destId='+this.value">
							<c:out value="${pageSelector}" escapeXml="false"></c:out>
						</select>
					</span>				
				<c:if test="${pageController.hasNext}">
            		<a href="${pageContext.request.contextPath}/coreComp.do?destId=${pageController.currentPage+1}">下一页</a>
            	</c:if>
            	<a href="${pageContext.request.contextPath}/coreComp.do?destId=${pageController.totalPages}">最后一页</a>
      </table>
						  	</div>
						</div> 
			
						<div id="tab12" class="tab_content"> 
							<div>
								<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/sort.do" method="post">
									<table>
										<tr>
											<td width="130" height="35">选择排序基准：</td>
											<td>
												<select name="type" >
													<option value="0" selected="selected">
														--------
													</option>
													<option value="1">
														按分值排序
													</option>
								
													<option value="2">
														按总排名排序
													</option>
								
													<option value="3">
														按风险等级排序
													</option>
													
												</select>
											</td>
											
											<td>
												&nbsp;&nbsp;&nbsp;<input type="submit" value="排序" style="margin-right:100px;"/>
											</td>
										</tr>
										</table>
						</form>
							</div>
							<div class="details">
						  		<table border=1>
										<tr align="center">
											<td align="center" width="180">
												企业名称
											</td>
											<td align="center" width="80">
												工商登记号
											</td>
											<td align="center" width="80">
												分值
											</td>
											<td align="center" width="80">
												行业排名
											</td>
											<td align="center" width="60">
												风险等级
											</td>
										</tr>
										<c:forEach items="${pageController1.data}" var="SMEassessment"
											varStatus="varStatus">
											<tr  align="center" >
												 <td align="center">
													<a href="${pageContext.request.contextPath}/smcompanyDetail.do?smcompanyId=${SMEassessment.companyinfo.id}">
													${SMEassessment.companyinfo.name}  </a>
												</td>
											
												<td align="center">
													${SMEassessment.companyinfo.taxnum}
												</td>
												
												<td align="center">
													${SMEassessment.score}
												</td>
												
												<td align="center">
													${SMEassessment.rank}
												</td>
												
												<td align="center">
													${SMEassessment.risklevel}
												</td>
											</tr>
										</c:forEach>
									</table>
						  	<table align="center">
            	共有<font color="red">${pageController1.totalRowsAmount}</font>条记录
            	共有<font color="red">${pageController1.totalPages}</font>页
            	当前是第<font color="red">${pageController1.currentPage}</font>页
            	<br/><br/>
                <a href="${pageContext.request.contextPath}/smeComp.do?destId=1">首页</a>
                <c:if test="${pageController1.hasPrevious}">
            		<a href="${pageContext.request.contextPath}/smeComp.do?destId=${pageController1.currentPage-1}">上一页</a>
            	</c:if>
            		<span class="current">
						<select id="pageSelector" style="font-size:12px;padding-top:3px;"
							onchange="location='${pageContext.request.contextPath}/smeComp.do?destId='+this.value">
							<c:out value="${pageSelector}" escapeXml="false"></c:out>
						</select>
					</span>				
				<c:if test="${pageController1.hasNext}">
            		<a href="${pageContext.request.contextPath}/smeComp.do?destId=${pageController1.currentPage+1}">下一页</a>
            	</c:if>
            	<a href="${pageContext.request.contextPath}/smeComp.do?destId=${pageController1.totalPages}">最后一页</a>
      </table>
						  	</div>
						</div> 
					</div> 
				</div>
				</div>
				
				
				
				<div id="tab3" class="tab_content"> 
				  	<form name="form1" style="padding-left: 3%;" action="${pageContext.request.contextPath}/bankModify.do" method="post">
				<br /><br /><h4>密码修改</h4> <br />
				<table border-width:thin; border-style:solid;>
					<tr>
						<td align="center" width="100" height="35" >
							用户名：
						</td>
							<td width="440">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.username}
							</td>					
					</tr>					
					<tr>
						<td align="center" width="100" height="35">
							新密码：
						</td>
						<td width="380">
							<input type="password"  name="password" onblur="check_null(this);"/>
							<font color="red">密码由6-20个字母或数字组成</font>
						</td>
					</tr>	                    
				</table>
				<br />
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<input type="submit" value="确定" style="margin-right:100px;"/>
													&nbsp;
						<input type="reset" value="重置" />
												
				</form>
				<br />
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
