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
				<a href="#">商家操作</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/showSeller.do">我要卖</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=2">华硕</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=3">索尼</a></li>
					
				</ul>
			</li>
			<li>
				
		</ul>   
 	  <div class="clear"></div>       
 	           
   </div>
      
</body>
</html>