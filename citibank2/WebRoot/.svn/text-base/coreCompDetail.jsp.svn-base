<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	
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
  		
	   		<form name="form1" style="padding-left: 5%;" action="" method="post">
	   			<br /><br /><h4>核心企业信息</h4><br /><br />
	   			
	   			<table border=1 align="center">
	   				<tr>
	   					<td align="center">
	   					企业名称：
	   					</td>
	   					<td align="center">
	   					${companyinfo.name }
	   					</td>
	   				</tr>
	   				<tr>
	   					<td align="center">
	   					工商登记号：
	   					</td>
	   					<td align="center">
	   					${companyinfo.taxnum }
	   					</td>
	   				</tr>
	   				<tr>
	   					<td align="center">
	   					行业分类：
	   					</td>
	   					<td align="center">
	   					${companyinfo.industrytype.name }
	   					</td>
	   				</tr>
	   				<tr>
	   					<td align="center">
	   					注册资金：
	   					</td>
	   					<td align="center">
	   					${companyinfo.registfund }
	   					</td>
	   				</tr>
	   				<tr>
	   					<td align="center">
	   					企业法人：
	   					</td>
	   					<td align="center">
	   					${companyinfo.legal }
	   					</td>
	   				</tr>
	   				<tr>
	   					<td align="center">
	   					联系电话：
	   					</td>
	   					<td align="center">
	   					${companyinfo.telephone }
	   					</td>
	   				</tr>
	   				<tr>
	   					<td align="center">
	   					是否为上市公司：
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
	   			</table>
	   		</form>
	    </div>
  	</div>
  	<a href="${pageContext.request.contextPath}/getback.do"  align="right">  返回  </a>
  	<div class="right">
		<jsp:include page="right1.jsp"></jsp:include>
		</div>
		
		<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
  
  
</div>
</body>
</html>
