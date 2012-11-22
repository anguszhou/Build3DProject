<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Auto Parts</title>
		<link rel="stylesheet" type="text/css" href="style.css" />

		<%@ page contentType="text/html; charset=gbk"%>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
		<script language="javascript">
			function check_null(caller){
				
				if(caller.value.length == 0)
				{
					alert("该项不能为空");
					
				}
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
	       	   <jsp:include page="common/menu2.jsp"></jsp:include>
	       </div>
			<div class="center_content">
				<div class="left_content">
				</div>
				<div class="right_content">
					<div class="title">
						<span class="title_icon">
							<img src="images/bullet1.gif"/>
						</span>账户管理
					</div>
					<div class="feat_prod_box_details">
						<div class="contact_form" style="margin-left:60px;margin-bottom:50px;">
							<div class="form_subtitle">
								请按提示输入
							</div>
							
							
							<form style="padding-left:5%;" action="${pageContext.request.contextPath}/modifySeller.do" method="post">
								<table>
									<tr>
										<td>用户名：</td>
										<td>
											<input name="name" value="${name}" readonly="readonly" onblur="check_null(this);"/>
										</td>
									</tr>
									<tr>
										<td>密码：</td>
										<td><input id="pwd" type="password" name="password" value="" /><font color="red">*密码可以由6-20个字母或数字组成</font></td>
									</tr>
									<tr>
										<td>确认密码：</td>
										<td><input name="repwd" type="password" onblur="check_password(this)" /><font color="red">*请重新输入以上密码</font></td>
									</tr>
									
									<tr>
										<td >真实姓名</td>
										<td><input type="text" size="15" name="realName" value="${seller.realName}"/></td>
									</tr>
									<tr>
										<td >店名</td>
										<td><input type="text" size="15" name="shopName" value="${seller.shopName}"/></td>
									</tr>
									<tr>
										<td >QQ</td>
										<td><input type="text" size="15" name="QQ" value="${seller.QQ}"/></td>
									</tr>
									<tr>
										<td >商店描述：</td>
										<td ><input type="text" size="32" name="shopDescriptions" value="${seller.shopDescriptions}"/>
										</td>
									</tr>
								</table>
								<div class="form_row"/>
								<div style="padding-left:30px;padding-top:20px;">
									<input type="button" value="确定" onclick="check_submit(this.form);"/>
									<input type="button" style="margin-left:50px;" value="取消"  onclick="history.go(-1);" />
								</div>
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