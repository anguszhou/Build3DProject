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
		<jsp:include page="left.jsp"></jsp:include>
	</div>
	<div class="middle">
		<div id="middle_pan">
			<div class="feat_prod_box_details">
            	
	              	<div class="contact_form" style="margin-left: 70px;">
		              	<script language="javascript">
		              		function modifyTime()
		              		{
		              			if( time == 1)
			              		{
			              			clearInterval(timer);
			              			
			              			if(${success}==true)
			              			{
			              				location ="index.jsp";
			              			}
			              			else
			              			{
			              				history.go(-1);
			              			}
			              		}
			              		else
			              		{
			              		    time = time - 1;
			              			if(${success}==true)
			              			{
			              				document.getElementById('message').innerText = '系统将在' + time + '秒钟后返回首页';
			              			}
			              			else
			              			{
			              				document.getElementById('message').innerText = '系统将在' + time + '秒钟后返回前一页';
			              			}			              			
			              		}
		              		}
		              		var time = 3;	
		              		var timer = setInterval(modifyTime,1000);
		              	</script>
		             <div style="text-align: center">
		             <br /><br />
	                	<div ><h2>${message}</h2></div>
	                	<div style="margin-top: 30px;">
		                	<h3>		                	 
		                		<a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
		                		<br/>
		                		<a href="#" onclick="history.go(-1);">返回前一页</a>
		                	</h3>
						</div>
						<c:if test="${success == true }">
							<div style="margin-top:50px;"><h3 id="message" >系统将在3秒钟后返回首页</h3></div>
						</c:if>
						<c:if test="${success == false}">
							<div style="margin-top:50px;"><h3 id="message" >系统将在3秒钟后返回前一页</h3></div>
						</c:if>  
						</div>
							   
	                </div>  
            </div>
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