<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<script src="js/jquery-1.2.1.min.js" type="text/javascript"></script>
	<script src="js/menu.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="style1.css" />

	<title>Auto Parts</title>
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>
        <div class="right_box">         	
 	      <ul id="menu1">
			<li>
				<a href="#">����</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=1">����</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=2">MP3</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=3">PSP</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=4">�ֻ�</a></li>
					
				</ul>
			</li>
			<li>
				<a href="#">��װ</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=5">����</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=6">����</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=7">Ь</a></li>
				</ul>
			</li>			
			<li>
				<a href="#">�鼮</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=9">ѧϰ</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=10">С˵</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=11">��־</a></li>
				</ul>
			</li>			
			<li>
				<a href="#">�ճ���Ʒ</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=12">ë��</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=13">��ˢ</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/productClassList.do?productClass_id=14">����</a></li>
				</ul>
			</li>
		</ul>   
 	  <div class="clear"></div>       
 	           
   </div>
      
</body>
</html>