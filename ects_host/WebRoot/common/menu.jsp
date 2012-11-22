<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>	
	<title>Auto Parts</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>	
	<div class="logo">
	<br />
	<br />
	<br />
	
		<%--<a href="${pageContext.request.contextPath}/index.jsp">
			<img src="images/logo.gif"  title="" border="0" />
		</a>
	--%></div>                         
    <div id="menu">
        <ul>                                                                       
        <li ><a href="index.jsp">主页</a></li>
        
        <li><a href="${pageContext.request.contextPath}/productList.do">商品列表</a></li>
         <li><a href="${pageContext.request.contextPath}/search.jsp">搜索商品</a></li>
        
        <li><a href="${pageContext.request.contextPath}/cart.jsp">我的购物车</a></li>
        <c:if test="${user != null}">        	
        	<li><a href="${pageContext.request.contextPath}/orderList.do">订单列表</a></li>
        </c:if>
        
        <c:if test="${user == null}">        	
        	<li><a href="${pageContext.request.contextPath}/login.jsp">订单列表</a></li>
        </c:if>
        <c:if test="${user != null}">
        	
        </c:if>
        <c:if test="${user != null}">
        	<li class="right"><a href="${pageContext.request.contextPath}/goToAccount.do">账户管理</a></li>
        	<li class="right"><a href="${pageContext.request.contextPath}/logout.do">退出</a></li>
        	<li class="welcome">${ user.name } 欢迎你！</li>
        </c:if>
        <c:if test="${user == null}">
        	<li class="right"><a href="${pageContext.request.contextPath}/regist.jsp">注册</a></li>
        	<li class="right"><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
        	<li class="right"><a href="${pageContext.request.contextPath}/buyList.do">后台管理</a></li>
        </c:if>
        
        </ul>
    </div>
</body>