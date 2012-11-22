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
					alert("�����Ϊ��");										
				}
			}
			function check_userName(caller,messageId){
				
				if(caller.value.length == 0)
				{
					alert("�����Ϊ��");
					return;
										
				}
				
				testUserName(caller,messageId);
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
				<jsp:include page="common/menu.jsp"></jsp:include>
			</div>
			<div class="center_content">

				<div>
					<div class="title" style="margin-left: 150px;">
						<span class="title_icon"><img src="images/bullet1.gif" />
						</span>�û�ע��
					</div>

					<div class="feat_prod_box_details">
						<p class="details" style="margin-left: 140px;">
							��ûע�����ǾͿ����ɣ�
						</p>

						<div class="contact_form" style="margin-left: 150px; width: 65%;">
							<div class="form_subtitle">
								���û�ע��
							</div>

							<form style="padding-left: 5%;"
								action="${pageContext.request.contextPath}/regist.do"
								method="post">
								<table>
									<tr>
										<td>
											�û�����
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
											���룺
										</td>
										<td>
											<input type="password" name="password" onblur="check_null(this);"/>
											<font color="red">*���������6-20����ĸ���������</font>
										</td>
									</tr>
									<tr>
										<td>
											ȷ�����룺
										</td>
										<td>
											<input name="repwd" type="password" onblur="check_password(this);"/>
											<font color="red">*������������������</font>
										</td>
									</tr>
									<tr>
										<td>
											���ڵ�����
										</td>
										<td>
											<select name="country">
												<option value="1">
													�й�
												</option>
											</select>
											<select name="province" >
												<option value="1" selected="selected">
													����
												</option>

												<option value="2">
													����
												</option>

												<option value="3">
													����
												</option>

												<option value="4">
													����
												</option>

												<option value="5">
													�㶫
												</option>

												<option value="6">
													����
												</option>

												<option value="7">
													����
												</option>

												<option value="8">
													����
												</option>

												<option value="9">
													����
												</option>

												<option value="10">
													����
												</option>

												<option value="11">
													�ӱ�
												</option>

												<option value="12">
													����
												</option>

												<option value="13">
													���
												</option>

												<option value="14">
													������
												</option>

												<option value="15">
													����
												</option>

												<option value="16">
													����
												</option>

												<option value="17">
													����
												</option>

												<option value="18">
													����
												</option>

												<option value="19">
													����
												</option>

												<option value="20">
													����
												</option>

												<option value="21">
													���ɹ�
												</option>

												<option value="22">
													����
												</option>

												<option value="23">
													�ຣ
												</option>

												<option value="24">
													�Ĵ�
												</option>

												<option value="25">
													ɽ��
												</option>

												<option value="26">
													�Ϻ�
												</option>

												<option value="27">
													����
												</option>

												<option value="28">
													ɽ��
												</option>

												<option value="29">
													���
												</option>

												<option value="30">
													̨��
												</option>

												<option value="31">
													�½�
												</option>

												<option value="32">
													����
												</option>

												<option value="33">
													����
												</option>

												<option value="34">
													�㽭
												</option>

												<option value="35">
													����
												</option>
											</select>
											ʡ
											<input name="city" type="text" size="10" />
											��/��
										</td>
									</tr>
									<tr>
										<td>
											��ϵ��ַ1��
										</td>
										<td>
											<input type="text" size="35" name="street1" />
										</td>
									</tr>
									<tr>
										<td>
											��ϵ��ַ2��
										</td>
										<td>
											<input type="text" size="35" name="street2" />
										</td>
									</tr>
									<tr>
										<td>
											�ʱࣺ
										</td>
										<td>
											<input type="text" size="35" name="zip" />
										</td>
									</tr>
									<tr>
										<td>
											�칫�ҵ绰
										</td>
										<td>
											<input type="text" size="15" name="officePhone" />
										</td>
									</tr>
									<tr>
										<td>
											�ֻ�
										</td>
										<td>
											<input type="text" size="15" name="cellPhone" />
										</td>
									</tr>
									<tr>
										<td>
											��ͥ�绰
										</td>
										<td>
											<input type="text" size="15" name="homePhone" />
										</td>
									</tr>
									<tr>
										<td>
											Email��ַ��
										</td>
										<td>
											<input type="text" size="32" name="email" />
											<font color="red">*��������Ч���ʼ���ַ</font>
										</td>
									</tr>
								</table>
								<div class="form_row"/>
								<center>
									<input type="button" value="ע��" style="margin-right:50px;" onclick="check_submit(this.form);"/>
									&nbsp;
									<input type="reset" value="����" />
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