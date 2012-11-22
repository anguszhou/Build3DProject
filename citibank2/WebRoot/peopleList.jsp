<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>XJTU-ME</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@ page contentType="text/html; charset=gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="js/jquery-1.2.1.min.js"></script>
<script type="text/javascript" src="js/ymPrompt.js"></script>

	
</head>



<body>
    
<div id="mainPan">
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="left">
		<jsp:include page="left.jsp"></jsp:include>
	</div>
	
	<div class="leftPan">
	</div>
	
	<div class="middlePan">
		<table align="center">
		    <tr>
				<td width="30"><span>序号</span></td>     
		        <td width="50"><span>用户名</span></td>
		        <td width="50"><span>员工姓名</span></td>
		        <td width="50"><span>所在部门</span></td>
		  	</tr>
			<c:forEach items="${pageController.data}" var="user" varStatus="status">
			    <tr align="center">      
			      	<td><span>${status.count}</span></td>
			        <td><span>${user.username}</span></td>
			        <td><span>${user.name}</span></td>
			       	<td><span>${user.department}</span></td>
			        <td>
			        	<button
							onclick="Alert('确认删除?',null,null,'确认删除?',function(){location='${pageContext.request.contextPath}/deleteUser.do?userId=${user.id}';},null);">
								删除
						</button>
					</td>
			        <td ><a href="${pageContext.request.contextPath}/bankuserDetail.do?userId=${user.id}" >详情</a></td>
			    </tr>
			 </c:forEach>  
	 	</table> 
	 	
	     <table align="center">
	            	共有<font color="red">${pageController.totalRowsAmount}</font>条记录
	            	共有<font color="red">${pageController.totalPages}</font>页
	            	当前是第<font color="red">${pageController.currentPage}</font>页
	            	<br/><br/>
	                <a href="${pageContext.request.contextPath}/buyList.do?destId=1">首页</a>
	                <c:if test="${pageController.hasPrevious}">
	            		<a href="${pageContext.request.contextPath}/buyList.do?destId=${pageController.currentPage-1}">上一页</a>
	            	</c:if>
	            		<span class="current">
							<select id="pageSelector" style="font-size:12px;padding-top:3px;"
								onchange="location='${pageContext.request.contextPath}/buyList.do?destId='+this.value">
								<c:out value="${pageSelector}" escapeXml="false"></c:out>
							</select>
						</span>				
					<c:if test="${pageController.hasNext}">
	            		<a href="${pageContext.request.contextPath}/buyList.do?destId=${pageController.currentPage+1}">下一页</a>
	            	</c:if>
	            	<a href="${pageContext.request.contextPath}/buyList.do?destId=${pageController.totalPages}">最后一页</a>
	      </table> 
  	</div>
      
     <div class="right">
		<jsp:include page="right.jsp"></jsp:include>
	</div>
		
	<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</div>
</body>
</html>
