<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>��ҹ���</title>
<link href="style00.css" rel="stylesheet" type="text/css" />
<%@ page contentType="text/html; charset=gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

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
<table align="center">
   <tr >
     <td>
      <img src="images/����00.gif" />
     </td>
   </tr>       
</table>

<table align="center">
  <tr>
    <td width="100"><a href="buyList.do" class="text005">��ҹ���</a></td>
      <td width="100"><a href="sellList.do" class="text004">���ҹ���</a></td>
      <td width="100"><a href="��̨����-Ͷ�߼�¼.html" class="text004">Ͷ�߼�¼</a></td>
      <td width="100"><a href="��̨����-���ͼ�¼.html" class="text004">���ͼ�¼</a></td>
      <td width="400"></td>
      <td><span class="text004">�˳�����</span></td>
  </tr>
</table>

<table align="center">
     <tr>
      <td><span>�����ؼ���:</span><input name="textfield" type="text"  value=""><img src="images/ok.gif" /></td>
     </tr>
</table>

<table align="center">
    <tr class="m-00" align="center">
        <td width="100"><input name="kkHandler" type="checkbox" onclick="kk()" value="" /><span>ȫѡ</span></td>
     
        <td width="150"><span>�������</span></td>
        <td width="150"><span>��ұ��</span></td>
        <td width="150"><span>��ע</span></td>
        <td width="10"></td><td></td><td>����</td>
        <td></td>
  </tr>
  <c:forEach items="${pageController.data}" var="user" varStatus="">
    <tr align="center">
      <td><input name="kk" type="checkbox" value="" /></td>
        <td><span>${user.name}</span></td>
        <td><span>${user.id}</span></td>
        <td><span>��</span></td>
        <td></td>
        <td class="text006">ɾ��</td>
        <td></td>
        <td ><a href="${pageContext.request.contextPath}/buyDetail.do?userId=${user.id}" class="text006">����</a></td>
    </tr>
   </c:forEach>  
 </table> 
   
    <div class="pagination">
            	����<font color="red">${pageController.totalRowsAmount}</font>����¼
            	����<font color="red">${pageController.totalPages}</font>ҳ
            	��ǰ�ǵ�<font color="red">${pageController.currentPage}</font>ҳ
            	<br/><br/>
                <a href="${pageContext.request.contextPath}/buyList.do?destId=1">��ҳ</a>
                <c:if test="${pageController.hasPrevious}">
            		<a href="${pageContext.request.contextPath}/buyList.do?destId=${pageController.currentPage-1}">��һҳ</a>
            	</c:if>
            		<span class="current">
						<select id="pageSelector" style="font-size:12px;padding-top:3px;"
							onchange="location='${pageContext.request.contextPath}/buyList.do?destId='+this.value">
							<c:out value="${pageSelector}" escapeXml="false"></c:out>
						</select>
					</span>				
				<c:if test="${pageController.hasNext}">
            		<a href="${pageContext.request.contextPath}/buyList.do?destId=${pageController.currentPage+1}">��һҳ</a>
            	</c:if>
            	<a href="${pageContext.request.contextPath}/buyList.do?destId=${pageController.totalPages}">���һҳ</a>
            </div> 
       

<table align="center">
    <tr>
      <td><img src="images/Del00.gif" /></td>
  </tr>
</table>

</body>
</html>
