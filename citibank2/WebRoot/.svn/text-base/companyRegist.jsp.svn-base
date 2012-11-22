<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
		
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript" src="js/jquery-1.2.1.min.js"></script>

		<script language="javascript">
			function check_null(caller)
			{				
				if(caller.value.length == 0)
				{
					alert("该项不能为空");										
				}
			}
			function check_userName(caller,messageId){
				
				if(caller.value.length == 0)
				{
					alert("该项不能为空");
					return;
										
				}
				
				testUserName(caller,messageId);
			}
			function check_password(caller){
				
				if(caller.value.length == 0)
				{
					alert("该项不能为空");					
					return;
				}
				
				if(caller.value != caller.form.password.value)
				{
					alert("两次输入密码不一致,请重新输入");	
					caller.value = '';				
				}
			}
			
			function check_submit(form)
			{
				
				if(form.name.value.length ==0)
				{
					alert('用户名不能为空');	
					return;
				}
				if(form.password.value.length ==0)
				{
					alert('密码不能为空');
					return;
				}
				if(form.repwd.value.length ==0)
				{
					alert('重复密码不能为空');	
					return;
				}				
				form.submit();	
			}
	</script>
	
</head>

<body>
<div id="mainPan">
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="left">
		<jsp:include page="left2.jsp"></jsp:include>
	</div>
	<div class="middle">
	  <div id="middlePan">
	  <br /><br /><h4>用户注册</h4> <br /><br />
		<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/companyRegist.do" method="post">
		<table>
			<tr>
				<td align="center">
				企业名称：
				</td>
				<td>
					<input type="text" size="35" name="name" />
				</td>
			</tr>
			
			<tr>
				<td align="center" width="90">
					工商登记号：
				</td>
				<td>
					<input type="text"  name="taxnum" />
				</td>
			</tr>
			
			<tr>
				<td align="center">
				用户名：
				</td>
				<td>
					<input id="citi_userName" name="username" onblur="check_userName(this,'regist_userName_message');"/>
					<font id="regist_userName_message" color="red"></font>
				</td>
				<script language="javascript">
					document.getElementById("citi_userName").focus();
				</script>
			</tr>
			<tr>
				<td align="center">
					密码：
				</td>
				<td>
					<input type="password" name="password" onblur="check_null(this);"/>
					<font color="red">*密码由6-20个字母或数字组成</font>
				</td>
			</tr>
			<tr>
				<td align="center">
					确认密码：
				</td>
				<td>
					<input name="repwd" type="password" onblur="check_password(this);"/>
					<font color="red">*请重新输入以上密码</font>
				</td>
			</tr>
							
		</table>
		<br />
		      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="注册" style="margin-right:100px;"/>
											&nbsp;
				<input type="reset" value="重置" />
										
		</form>
		
	 </div>
	 </div>
	<div class="right">
		<jsp:include page="right2.jsp"></jsp:include>
		</div>
		
		<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</div>
</body>
</html>