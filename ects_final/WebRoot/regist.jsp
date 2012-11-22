<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Auto Parts</title>
		<link rel="stylesheet" type="text/css" href="style.css" />

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
		<div id="wrap">

			<div class="header">
				<jsp:include page="common/menu.jsp"></jsp:include>
			</div>
			<div class="center_content">

				<div>
					<div class="title" style="margin-left: 150px;">
						<span class="title_icon"><img src="images/bullet1.gif" />
						</span>用户注册
					</div>

					<div class="feat_prod_box_details">
						<p class="details" style="margin-left: 140px;">
							还没注册吗？那就快来吧！
						</p>

						<div class="contact_form" style="margin-left: 150px; width: 65%;">
							<div class="form_subtitle">
								新用户注册
							</div>

							<form style="padding-left: 5%;"
								action="${pageContext.request.contextPath}/regist.do"
								method="post">
								<table>
									<tr>
										<td>
											用户名：
										</td>
										<td>
											<input id="ects_userName" name="name" onblur="check_userName(this,'regist_userName_message');"/>
											<font id="regist_userName_message" color="red"></font>
										</td>
										<script language="javascript">
											document.getElementById("ects_userName").focus();
										</script>
									</tr>
									<tr>
										<td>
											密码：
										</td>
										<td>
											<input type="password" name="password" onblur="check_null(this);"/>
											<font color="red">*密码可以由6-20个字母或数字组成</font>
										</td>
									</tr>
									<tr>
										<td>
											确认密码：
										</td>
										<td>
											<input name="repwd" type="password" onblur="check_password(this);"/>
											<font color="red">*请重新输入以上密码</font>
										</td>
									</tr>
									
									<tr>
										<td>
											联系地址：
										</td>
										<td>
											<input type="text" size="35" name="address" />
										</td>
									</tr>

									<tr>
										<td>
											手机
										</td>
										<td>
											<input type="text" size="15" name="cellPhone" />
										</td>
									</tr>
									
									<tr>
										<td>
											Email地址：
										</td>
										<td>
											<input type="text" size="32" name="email" />
											<font color="red">*请输入有效的邮件地址</font>
										</td>
									</tr>									
								</table>
								
								<div class="form_row"/>
								<center>
									<input type="button" value="注册" style="margin-right:50px;" onclick="check_submit(this.form);"/>
									&nbsp;
									<input type="reset" value="重置" />
								</center>
								<br />
							</form>
						</div>

					</div>
					<div class="clear"></div>
				</div>

				<div class="clear"></div>
			</div>
			<jsp:include page="common/footer.jsp"></jsp:include> 
		</div>

	</body>
</html>