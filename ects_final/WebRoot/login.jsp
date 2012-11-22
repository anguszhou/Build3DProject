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
					alert('�û�������Ϊ��');
					form.name.focus();
					return false; 
				}
				if(form.password.value == null || form.password.value == '')
				{
					alert('���벻��Ϊ��');
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
						</span>�û���¼
					</div>
					<div class="feat_prod_box_details">
						<div class="contact_form" style="margin-left:60px;margin-bottom:50px;">
							<div class="form_subtitle">
								����������ʺź�����
							</div>
							<form name="register"
								action="${pageContext.request.contextPath}/login.do"
								method="post">
								<div class="form_row">
									<label class="contact">
										<strong>�û���:</strong>
									</label>
									<input id="ects_userName" type="text" name="name" />
								</div>
								<script language="javascript">
									document.getElementById("ects_userName").focus();
								</script>
								<div class="form_row">
									<label class="contact">
										<strong> �� �� :</strong>
									</label>
									<input type="password" name="password"/>
								</div>								
								<div style="margin-left: 40px;">
									<input type="radio" value="1" name="role" checked="checked"/>
									<label>
											<strong> ��ҵ�¼</strong>
										</label>
									<input type="radio" value="2" name="role"/>
									<label>
											<strong> ���ҵ�¼</strong>
										</label>
								</div>
								<div class="form_row" style="margin-left: 40px;">							

								</div>
								<div class="form_row">
									<input type="button" class="register" value="��¼" onclick="return check_null(this.form);"/>
									<a href="regist.jsp" style="margin-left: 40px;">���û�����ע��ɣ�</a>
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