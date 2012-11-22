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
					alert("�����Ϊ��");
					
				}
			}
			function check_password(caller){
				
				if(caller.value.length == 0)
				{
					alert("�����Ϊ��");
					
					return;
				}
				if(caller.value != caller.form.password.value)
				{
					alert("�����������벻һ��,����������");
					caller.value = '';					
				}
			}
			
			function check_submit(form)
			{
				
				if(form.name.value.length ==0)
				{
					alert('�û�������Ϊ��');	
					return;
				}
				if(form.password.value.length ==0)
				{
					alert('���벻��Ϊ��');
					return;
				}
				if(form.repwd.value.length ==0)
				{
					alert('�ظ����벻��Ϊ��');	
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
						</span>�˻�����
					</div>
					<div class="feat_prod_box_details">
						<div class="contact_form" style="margin-left:60px;margin-bottom:50px;">
							<div class="form_subtitle">
								�밴��ʾ����
							</div>
							
							
							<form style="padding-left:5%;" action="${pageContext.request.contextPath}/modifySeller.do" method="post">
								<table>
									<tr>
										<td>�û�����</td>
										<td>
											<input name="name" value="${name}" readonly="readonly" onblur="check_null(this);"/>
										</td>
									</tr>
									<tr>
										<td>���룺</td>
										<td><input id="pwd" type="password" name="password" value="" /><font color="red">*���������6-20����ĸ���������</font></td>
									</tr>
									<tr>
										<td>ȷ�����룺</td>
										<td><input name="repwd" type="password" onblur="check_password(this)" /><font color="red">*������������������</font></td>
									</tr>
									
									<tr>
										<td >��ʵ����</td>
										<td><input type="text" size="15" name="realName" value="${seller.realName}"/></td>
									</tr>
									<tr>
										<td >����</td>
										<td><input type="text" size="15" name="shopName" value="${seller.shopName}"/></td>
									</tr>
									<tr>
										<td >QQ</td>
										<td><input type="text" size="15" name="QQ" value="${seller.QQ}"/></td>
									</tr>
									<tr>
										<td >�̵�������</td>
										<td ><input type="text" size="32" name="shopDescriptions" value="${seller.shopDescriptions}"/>
										</td>
									</tr>
								</table>
								<div class="form_row"/>
								<div style="padding-left:30px;padding-top:20px;">
									<input type="button" value="ȷ��" onclick="check_submit(this.form);"/>
									<input type="button" style="margin-left:50px;" value="ȡ��"  onclick="history.go(-1);" />
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