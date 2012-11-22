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
	<div id="leftPan">
	</div>
	  <div id="middle_pan">
		<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/companyModify.do" method="post">
				<table border=1>
					<tr>
						<td width="130" height="35" >
							用户名：
						</td>
							<td width="440">
								${user.username}
							</td>					
					</tr>
					
					<tr>
						<td width="130" height="35">
							原密码：
						</td>
						<td width="300">
							<input type="password" value="${user.password}" name="password" onblur="check_null(this);"/>
							
						</td>
					</tr>
					
					<tr>
						<td width="130" height="35">
							新密码：
						</td>
						<td width="300">
							<input type="password"  name="password" onblur="check_null(this);"/>
							<font color="red">*密码由6-20个字母或数字组成</font>
						</td>
					</tr>	                    
				</table>
				
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="确定" style="margin-right:100px;"/>
													&nbsp;
						<input type="reset" value="重置" />
												
				</form>
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