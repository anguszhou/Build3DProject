<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>卖家管理</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@ page contentType="text/html; charset=gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="js/jquery-1.2.1.min.js"></script>
<script type="text/javascript" src="js/ymPrompt.js"></script>

	<script language="javascript">   
		function   kk(){   
			var   handleEl   =   document.getElementById("kkHandler");   
			var   els   =   document.getElementsByName("kk");   
			for(i=0;i<els.length;i++){   
			els[i].checked   =   handleEl.checked;   
		}   
	    
	  
	</script>   
</head>



<body>
    
<div id="wrap">
			<div class="header">        
	       	   <jsp:include page="common/menu.jsp"></jsp:include>
	       </div>
			<div class="center_content">
				<div class="left_content">
				</div>
				<div class="right_content">
					<div class="title">
						<span class="title_icon">
							<img src="images/bullet1.gif"/>
						</span>卖家管理
					</div>
					<div class="feat_prod_box_details">
						<div class="contact_form" style="margin-left:60px;margin-bottom:50px;">
							<div class="form_subtitle">
								卖家列表
							</div>
							<a href="${pageContext.request.contextPath}/buyList.do" >买家管理</a>
				
				
<table align="center">
    <tr class="m-00" align="center">
      	<td width="60"><span>序号</span></td>
        <td width="150"><span>卖家名称</span></td>
        <td width="150"><span>卖家编号</span></td>
       	<td width="150"><span>卖家QQ</span></td>
        <td width="150" align="center"><span>操作</span></td>
        <td ></td>
  </tr>
   <c:forEach items="${pageController.data}" var="seller" varStatus="status">
    <tr align="center">
      	<td><span>${status.count}</span></td>
        <td><span>${seller.realName}</span></td>
        <td><span>${seller.id}</span></td>
       	<td><span>${seller.QQ}</span></td>
        
        <td>
        	<input type="button"  value="删除"
				onclick="Alert('确认删除?',null,null,'确认删除?',function(){location='${pageContext.request.contextPath}/deleteSeller.do?sellerId=${seller.id}';},null);"/>
       <a href="${pageContext.request.contextPath}/sellDetail.do?sellerId=${seller.id}" class="text006">详情</a>
       </td>
    </tr>
   </c:forEach>  
</table>

 <div class="pagination">

            	共有<font color="red">${pageController.totalRowsAmount}</font>条记录
            	共有<font color="red">${pageController.totalPages}</font>页
            	当前是第<font color="red">${pageController.currentPage}</font>页
            	<br/><br/>
                <a href="${pageContext.request.contextPath}/sellList.do?destId=1">首页</a>
                <c:if test="${pageController.hasPrevious}">
            		<a href="${pageContext.request.contextPath}/sellList.do?destId=${pageController.currentPage-1}">上一页</a>
            	</c:if>
            		<span class="current">
						<select id="pageSelector" style="font-size:12px;padding-top:3px;"
							onchange="location='${pageContext.request.contextPath}/sellList.do?destId='+this.value">
							<c:out value="${pageSelector}" escapeXml="false"></c:out>
						</select>
					</span>				
				<c:if test="${pageController.hasNext}">
            		<a href="${pageContext.request.contextPath}/sellList.do?destId=${pageController.currentPage+1}">下一页</a>
            	</c:if>
            	<a href="${pageContext.request.contextPath}/sellList.do?destId=${pageController.totalPages}">最后一页</a>
          
            </div> 
            
     
      
       

<table align="center">
    <tr>
      <td><br /></td>
  </tr>
</table>
</div>
</div>
</div>
</div>
</div>



</body>
</html>
