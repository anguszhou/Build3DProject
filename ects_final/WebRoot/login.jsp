<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Auto Parts</title>
		<link rel="stylesheet" type="text/css" href="style.css" />

		<%@ page contentType="text/html; charset=gbk"%>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
		
		
		
		<script language="javascript">
			function check_null(form)
			{
				
				if(form.name.value == null || form.name.value == '')
				{
					alert('用户名不能为空');
					form.name.focus();
					return false; 
				}
				if(form.password.value == null || form.password.value == '')
				{
					alert('密码不能为空');
					form.password.focus();
					return false; 
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
				<div class="left_content">
				</div>
				<div class="right_content">
					<div class="title">
						<span class="title_icon">
							<img src="images/bullet1.gif"/>
						</span>用户登录
					</div>
					<div class="feat_prod_box_details">
						<div class="contact_form" style="margin-left:60px;margin-bottom:50px;">
							<div class="form_subtitle">
								请输入你的帐号和密码
							</div>
							<form name="register"
								action="${pageContext.request.contextPath}/login.do"
								method="post">
								<div class="form_row">
									<label class="contact">
										<strong>用户名:</strong>
									</label>
									<input id="ects_userName" type="text" name="name" />
								</div>
								<script language="javascript">
									document.getElementById("ects_userName").focus();
								</script>
								<div class="form_row">
									<label class="contact">
										<strong> 密 码 :</strong>
									</label>
									<input type="password" name="password"/>
								</div>								
								<div style="margin-left: 40px;">
									<input type="radio" value="1" name="role" checked="checked"/>
									<label>
											<strong> 买家登录</strong>
										</label>
									<input type="radio" value="2" name="role"/>
									<label>
											<strong> 卖家登录</strong>
										</label>
								</div>
								<div class="form_row" style="margin-left: 40px;">							

								</div>
								<div class="form_row">
									<input type="button" class="register" value="登录" onclick="return check_null(this.form);"/>
									<a href="regist.jsp" style="margin-left: 40px;">新用户？来注册吧！</a>
								</div>

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