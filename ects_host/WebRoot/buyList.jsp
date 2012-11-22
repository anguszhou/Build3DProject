<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>买家管理</title>
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
      <img src="images/title.gif" />
     </td>
   </tr>       
</table>

<table align="center">
  <tr>
    <td width="100"><a href="buyList.do" class="text005">买家管理</a></td>
      <td width="100"><a href="sellList.do" class="text004">卖家管理</a></td>
      <td width="100"><a href="后台管理-投诉记录.html" class="text004">投诉记录</a></td>
      <td width="100"><a href="后台管理-奖惩记录.html" class="text004">奖惩记录</a></td>
      <td width="400"></td>
      <td><span class="text004">退出管理</span></td>
  </tr>
</table>

<table align="center">
     <tr>
      <td><span>搜索关键字:</span><input name="textfield" type="text"  value=""><img src="images/ok.gif" /></td>
     </tr>
</table>
 <div class="right_content">
<table align="center">
    <tr class="m-00" align="center">
        <td width="100"><input name="kkHandler" type="checkbox" onclick="kk()" value="" /><span>全选</span></td>
     
        <td width="150"><span>买家名称</span></td>
        <td width="150"><span>买家编号</span></td>
        <td width="150"><span>备注</span></td>
        <td width="10"></td><td></td><td>操作</td>
        <td></td>
  </tr>
  <c:forEach items="${pageController.data}" var="user" varStatus="">
    <tr align="center">
      <td><input name="kk" type="checkbox" value="" /></td>
        <td><span>${user.name}</span></td>
        <td><span>${user.id}</span></td>
        <td><span>无</span></td>
        <td></td>
        <td class="text006">删除</td>
        <td></td>
        <td ><a href="${pageContext.request.contextPath}/buyDetail.do?userId=${user.id}" class="text006">详情</a></td>
    </tr>
   </c:forEach>  
 </table> 
   
    <div class="pagination">
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
       

<table align="center">
    <tr>
      <td><img src="images/Del00.gif" /></td>
  </tr>
</table>
</div>

</body>
</html>
