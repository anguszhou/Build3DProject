<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Auto Parts</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

</head>
<body>
	<div id="wrap">
	     	<!-- ���� -->
	       	<div class="header">        
	       	   <jsp:include page="common/menu.jsp"></jsp:include>
	       	</div>
	       	
	       	
	       <div class="center_content"  >
	       		<!-- ����� -->
		        <div class="left_content">	        	 
		        	<jsp:include page="common/left.jsp"></jsp:include>
		        </div>
		        
	        	<div class="right_content" align="center">
	        	
	          		<div class="cart">
	          		
	      				<div class="title">
	      					<span class="title_icon">
	      						<img src="images/cart.gif" alt="" title="" />
	      					</span>�����б�</div>
	          			</div>
	        			<div class="feat_prod_box_details">
	            			<form>
	      						<table class="cart_table">
					            	<tr class="cart_title">
					                	<td width="74">���</td>
					                	<td width="120">��������</td>
					                    <td width="120">�������</td>
					                    <%--<td width="150">����״̬</td>
					                    
					                    --%><td width="141">����</td>              
					                </tr>
		                			<c:forEach items="${orderList}" var="order" varStatus="varStatus">                
					            		<tr>
						                	<td>${varStatus.count}</td>
						                	<td>${order.name}</td>
						                    <td>${order.cost}</td>
<%--						                    <td>${order.orderStatus.name}</td>--%>
						                   
						                    <td>
						                    	<a href="${pageContext.request.contextPath}/orderDetail.do?orderId=${order.order_id}" class="continue">������ϸ</a>
						                    </td>             
					              		</tr> 
		              				</c:forEach>  
	            				</table>            
	       					</form>
	          			</div>
	        			<div class="clear"></div>
	       			 </div><!--end of left content-->
	       		<!-- �Ҳ��� -->
		       	<div class="rank_content">	       		
		       		<jsp:include page="common/right.jsp"></jsp:include>
		       	</div>
	        
	       		<div class="clear"></div>
	       	</div><!--end of center content-->
	       		 
	       <!-- ���� -->
		   <jsp:include page="common/footer.jsp"></jsp:include>        

	</div>

</body>
</html>