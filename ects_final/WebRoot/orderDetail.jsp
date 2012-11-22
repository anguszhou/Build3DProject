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
	       
	       	<div class="center_content" >
	       		<!-- ����� -->
		        <div class="left_content">	        	 
		        	<jsp:include page="common/left.jsp"></jsp:include>
		        </div>
	
	        	<div class="right_content" align="center">
	           	 	<div class="title">
	           	 		<span class="title_icon">
	           	 			<img src="images/bullet1.gif" alt="" title="" />
	           	 		</span>������ϸ��Ϣ<br />
	           	 	</div>
	        
	        		<div class="feat_prod_box_details">
	            		<table class="cart_table">
		            		<tr class="cart_title">
		                		<td width="74">��Ʒ��Ƭ</td>
		                		<td width="72">��Ʒ����</td>
		                    	<td width="32">����</td>
		                    	<td>����</td>
		                    	<td width="40">�ϼ�</td>	                                 
		                	</tr>
		                	<c:forEach items="${order.orderLines}" var="orderLine" varStatus="varStatus">                
			            		<tr>
			                		<td>
			                			<a href="${pageContext.request.contextPath }/productDetail.do?productId=${orderLine.product.product_id}">
			                				<img src="images/${orderLine.product.image}" border="0" class="cart_thumb" width="119px"/>
			           
			                			</a>
			                		</td>
			                		<td>${orderLine.product.name}</td>
			                    	<td>${orderLine.product.price}</td>
			                    	<td class=tablebody2 valign=middle align=center width="40">
			                    		${orderLine.amount}
			                    	</td>
			                    	<td>${orderLine.product.price*orderLine.amount}</td>		                               
			               		</tr>	           
		               		</c:forEach>
		                
		               		<tr>
				                <td colspan="4" class="cart_total"><span class="red">�ܼƽ��:</span></td>
				                <td>${order.cost}</td>                
		                	</tr>  
		            	</table>
	            	</div>	
	            	<div>
	     				 <table class="cart_table">
	            			<tr class="cart_title">
	                			<td colspan="2">�����û���Ϣ</td>            
	                		</tr>
			                <tr>
			                	<td>�û�����</td>
			                	<td>${order.user.name }</td>            
			                </tr>
			                <tr>
			                	<td>��ϵ��ַ��</td>
			                	<td>${order.user.contcatInfo.address}</td>            
			                </tr>
			                <tr>
			                	<td>����״̬��</td>
			                	<td>${order.orderStatus.name}</td>            
			                </tr>
			                
	           		 	</table>
	          			<p align="center">
	            			<input type="button"  value="�� ��"  onclick="history.go(-1);" />
	          			</p>
	          		</div>
	           
	        		<div class="clear"></div>
	       		 </div>
	        	<!-- �Ҳ��� -->
			    <div class="rank_content">	       		
			       	<jsp:include page="common/right.jsp"></jsp:include>
			    </div>
	        
	      		<div class="clear"></div>
	       </div>
	     	
	     	<!-- ���� -->
		    <jsp:include page="common/footer.jsp"></jsp:include>        
	
	</div>

</body>
</html>