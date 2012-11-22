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
		<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/peopleAdd.do" method="post">
		<table>
			<tr>
				<td width="130" height="35">员工权限：</td>
				<td>
					<select name="usertype" >
						<option value="信贷员" selected="selected">
							信贷员
						</option>
	
						<option value="风险评估员">
							风险评估员
						</option>
	
						<option value="后台管理员">
							后台管理员
						</option>
						<option value="worker">
							worker
						</option>
					</select>
				</td>
			</tr>
		
			<tr>
				<td width="130" height="35" >
					员工用户名：
				</td>
					<td width="440">
						<input id="username" value="${user.username}" name="userName" onblur="check_userName(this,'regist_userName_message');"/>
						<font id="regist_userName_message" color="red"></font>
					</td>
												
			</tr>
			
			<tr>
				<td width="130" height="35">
					密码：
				</td>
				<td width="300">
					<input type="text" value="${user.password}" name="password" onblur="check_null(this);"/>
					<font color="red">*密码由6-20个字母或数字组成</font>
				</td>
			</tr>
			
			<tr>
				<td width="130" height="35">
					员工工号：
				</td>
				<td>
					<input type="text" value="${user.workNum}" size="20" name="worknum" />
				</td>
			</tr>
			
			<tr>
				<td height="35">
					员工姓名：
				</td>
				<td>
					<input type="text" value="${user.name}" size="20" name="name"  />
				</td>
			</tr>
			
			<tr>
				<td height="35">
					所在部门：
				</td>
				<td>
					<input type="text" value="${user.department}" size="25" name="department" />
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