<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>���ҹ���</title>
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
						</span>���ҹ���
					</div>
					<div class="feat_prod_box_details">
						<div class="contact_form" style="margin-left:60px;margin-bottom:50px;">
							<div class="form_subtitle">
								�����б�
							</div>
							<a href="${pageContext.request.contextPath}/buyList.do" >��ҹ���</a>
				
				
<table align="center">
    <tr class="m-00" align="center">
      	<td width="60"><span>���</span></td>
        <td width="150"><span>��������</span></td>
        <td width="150"><span>���ұ��</span></td>
       	<td width="150"><span>����QQ</span></td>
        <td width="150" align="center"><span>����</span></td>
        <td ></td>
  </tr>
   <c:forEach items="${pageController.data}" var="seller" varStatus="status">
    <tr align="center">
      	<td><span>${status.count}</span></td>
        <td><span>${seller.realName}</span></td>
        <td><span>${seller.id}</span></td>
       	<td><span>${seller.QQ}</span></td>
        
        <td>
        	<input type="button"  value="ɾ��"
				onclick="Alert('ȷ��ɾ��?',null,null,'ȷ��ɾ��?',function(){location='${pageContext.request.contextPath}/deleteSeller.do?sellerId=${seller.id}';},null);"/>
       <a href="${pageContext.request.contextPath}/sellDetail.do?sellerId=${seller.id}" class="text006">����</a>
       </td>
    </tr>
   </c:forEach>  
</table>

 <div class="pagination">

            	����<font color="red">${pageController.totalRowsAmount}</font>����¼
            	����<font color="red">${pageController.totalPages}</font>ҳ
            	��ǰ�ǵ�<font color="red">${pageController.currentPage}</font>ҳ
            	<br/><br/>
                <a href="${pageContext.request.contextPath}/sellList.do?destId=1">��ҳ</a>
                <c:if test="${pageController.hasPrevious}">
            		<a href="${pageContext.request.contextPath}/sellList.do?destId=${pageController.currentPage-1}">��һҳ</a>
            	</c:if>
            		<span class="current">
						<select id="pageSelector" style="font-size:12px;padding-top:3px;"
							onchange="location='${pageContext.request.contextPath}/sellList.do?destId='+this.value">
							<c:out value="${pageSelector}" escapeXml="false"></c:out>
						</select>
					</span>				
				<c:if test="${pageController.hasNext}">
            		<a href="${pageContext.request.contextPath}/sellList.do?destId=${pageController.currentPage+1}">��һҳ</a>
            	</c:if>
            	<a href="${pageContext.request.contextPath}/sellList.do?destId=${pageController.totalPages}">���һҳ</a>
          
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
