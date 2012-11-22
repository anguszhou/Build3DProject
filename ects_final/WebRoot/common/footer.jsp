<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<title>Auto Parts</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>	
   	   <div class="clear"></div>
       <div class="footer">
	       	<div class="left_footer">
	       		<br />
	       		<%--<a href="http://csscreme.com/freecsstemplates/" title="free templates">
	       			<img src="images/csscreme.gif" alt="free templates" title="free templates" border="0" />
	       		</a>
	       	--%></div>
	        <div class="right_footer">
	        	<a href="${pageContext.request.contextPath}/index.jsp">主页</a>
	        	<a href="${pageContext.request.contextPath}/about.jsp">关于我们</a>
	            <a href="${pageContext.request.contextPath}/productList.jsp">商品列表</a>
	            <%--<a href="${pageContext.request.contextPath}/special.jsp">特价商品</a>
	            --%><a href="${pageContext.request.contextPath}/login.jsp">登录</a>
	            <a href="${pageContext.request.contextPath}/regist.jsp">注册</a>
	            <%--<a href="${pageContext.request.contextPath}/contact.jsp">联系我们</a>
	        --%></div>
      </div>
</body>
</html>