<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	 
</head>
<body>	
   <div id="mainPan1">	  
	   <div class="left">
	    <div id="leftPan">
	    <ul>
			<br />
					<li class="home">��ҳ</li>
					<li><a href="#">��Ʒ����</a></li>
					<li><a href="#">��̨����</a></li>
					<li><a href="#">��ҵ�û�</a></li>
					<li><a href="#">�����û�</a></li>
					<li><a href="#">����</a></li>
					<li class="contact"><a href="#">��ϵ����</a></li>
				
		</ul>
		<br />
		<br />
		<br />
		<br /><br />
		<form action="${pageContext.request.contextPath}/login.do" method="post">
				<h2>�û���¼</h2>
				<label>�û���:</label>
				<input name="name" type="text" id="name" />
				<label>����:</label>
				<input name="password" type="password" id="password" />
				<input name="" type="submit" class="button" value="��¼" />
				<div id="register">
					<a href="${pageContext.request.contextPath}/companyRegist.jsp">��ҵ�û�ע��</a>
				</div>
			</form>
		
		</div>
	</div>
		
<Script  LANGUAGE="JavaScript">
 Calendar();
</Script>
  </div>
</body>
</html>