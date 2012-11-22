<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>	
	<title>Auto Parts</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	
	<script language="javascript">  
		var timeout	= 500;
		var closetimer	= 0;
		var ddmenuitem	= 0;
		
		// open hidden layer
		function mopen(id)
		{	
			// cancel close timer
			mcancelclosetime();
		
			// close old layer
			if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
		
			// get new layer and show it
			ddmenuitem = document.getElementById(id);
			ddmenuitem.style.visibility = 'visible';
		
		}
		// close showed layer
		function mclose()
		{
			if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
		}
		
		// go close timer
		function mclosetime()
		{
			closetimer = window.setTimeout(mclose, timeout);
		}
		
		// cancel close timer
		function mcancelclosetime()
		{
			if(closetimer)
			{
				window.clearTimeout(closetimer);
				closetimer = null;
			}
		}
		
		// close layer when click-out
		document.onclick = mclose; 
</script>
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
        	<li ><a href="index.jsp">��ҳ</a></li>
        
        	<li><a href="${pageContext.request.contextPath}/productList.do">��Ʒ�б�</a></li><%--
         	<li><a href="${pageContext.request.contextPath}/search.jsp">������Ʒ</a></li>
        
        	--%><li><a href="${pageContext.request.contextPath}/cart.jsp">�ҵĹ��ﳵ</a></li>
       	<c:if test="${user != null}">        	
        		<li><a href="${pageContext.request.contextPath}/orderList.do">�����б�</a></li>
        </c:if>
        
        <c:if test="${user == null}">        	
        	<li><a href="${pageContext.request.contextPath}/login.jsp">�����б�</a></li>
        </c:if>
        <c:if test="${user != null}">
        	
        </c:if>
        <c:if test="${user != null}">
        	<li class="right"><a href="${pageContext.request.contextPath}/goToAccount.do">�˻�����</a></li>
        	<li class="right"><a href="${pageContext.request.contextPath}/logout.do">�˳�</a></li>
        	<li class="welcome">${ user.name } ��ӭ�㣡</li>
        </c:if>
        <c:if test="${user == null}">
       	
				<li><a href="#" 
			        onmouseover="mopen('m1')" 
			        onmouseout="mclosetime()">ע��</a>
			        <div id="m1" 
			            onmouseover="mcancelclosetime()" 
			            onmouseout="mclosetime()">
			        <a href="${pageContext.request.contextPath}/regist.jsp">�����ע��</a>
			        <a href="${pageContext.request.contextPath}/registSeller.jsp">����ע��</a>			        
			        </div>
			    </li>
			    <li><a href="${pageContext.request.contextPath}/login.jsp">��¼</a></li>
			    <li><a href="${pageContext.request.contextPath}/loginadmin.jsp">��̨����</a></li>
			
			<div style="clear:both"></div>			
        </c:if>
        
        </ul>
    </div>
</body>