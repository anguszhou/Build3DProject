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
<div id="mainPan">
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="left">
		<jsp:include page="left2.jsp"></jsp:include>
	</div>
	<div class="middle">
	  <div id="middlePan">
	  <br /><br /><h4>�û�ע��</h4> <br /><br />
		<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/companyRegist.do" method="post">
		<table>
			<tr>
				<td align="center">
				��ҵ���ƣ�
				</td>
				<td>
					<input type="text" size="35" name="name" />
				</td>
			</tr>
			
			<tr>
				<td align="center" width="90">
					���̵ǼǺţ�
				</td>
				<td>
					<input type="text"  name="taxnum" />
				</td>
			</tr>
			
			<tr>
				<td align="center">
				�û�����
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
					���룺
				</td>
				<td>
					<input type="password" name="password" onblur="check_null(this);"/>
					<font color="red">*������6-20����ĸ���������</font>
				</td>
			</tr>
			<tr>
				<td align="center">
					ȷ�����룺
				</td>
				<td>
					<input name="repwd" type="password" onblur="check_password(this);"/>
					<font color="red">*������������������</font>
				</td>
			</tr>
							
		</table>
		<br />
		      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="ע��" style="margin-right:100px;"/>
											&nbsp;
				<input type="reset" value="����" />
										
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