<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Auto Parts</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
		
		<%@ page contentType="text/html; charset=gbk"%>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	
		<script language="javascript">
			function check_num(caller)
			{
				if(caller.value<1)
				{
					alert('�Բ��𣬲�Ʒ��������С�� 1 ');
					caller.focus();
				}
			}
		</script>
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
	            			</span>����ϸ������¹��ﳵ����Ʒ<br />
	            	</div>
	        
	        		<div class="feat_prod_box_details">
	            
	            		<table class="cart_table">
	            			<tr class="cart_title">
	                			<td width="30px;">���</td>
	                			<td  width="119px;">ͼƬ</td>
	                			<td  width="150px;">����</td>
	                   			<td  width="50px;">����</td>
	                   		 	<td  width="70px;">�۸�</td>
	                    		<td  width="30px;">����</td>   
	                    		<td  width="80px;">�ϼ�</td>            
	                		</tr>                
	            		<c:forEach items="${cart.items}" var="orderLine" varStatus="varStatus">                
		            		<tr>
		            			<td>${varStatus.count}</td>
		                		<td><a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.product_id}"><img src="images/${orderLine.value.product.image}" alt="" title="" border="0" class="cart_thumb" width="119px"/></a></td>
		                		<td>${orderLine.value.product.name}</td>
		                		<td>${orderLine.value.product.productClass.name}</td>
		                    	<td>${orderLine.value.product.price}</td>
		                    	<td class=tablebody2 valign=middle align=center width="40">
		                    	${orderLine.value.amount}
		                    	</td>
		                   	 	<td>${orderLine.value.product.price*orderLine.value.amount}</td>
		               		</tr>	           
	               		</c:forEach>
	               		
	               			<tr>
		                		<td colspan="3" class="cart_total"><span class="red">�ܼƽ��:</span></td>
		                		<td colspan="3">${cart.total}</td>                
	                		</tr>
	            		</table>
	            	</div>
	            	
	            	
	            	<form  action="${pageContext.request.contextPath}/addOrder.do" method="post">	
		            	<div> 
		            	 �������û�ע���ͻ���Ϣȷ��,����仯���Ƚ��и��²�����
	            
		           			 <table class="cart_table">
		            			<tr class="cart_title">
		                			<td colspan="2">�û�ע����Ϣȷ��</td>            
		                		</tr>
		                		<tr>
		                			<td>�û�����</td>
		                			<td><input name="name" value="${user.name}" readonly="readonly"/></td>            
		               			 </tr>
		                		<tr>
									<td >��ϵ��ַ��</td>
									<td><input type="text"  size="20" name="address" value="${user.contcatInfo.address }"/></td>
								</tr>
								
								
								
								<tr>
									<td >�ֻ���</td>
									<td><input type="text" size="15" name="cellPhone" value="${user.contcatInfo.cellPhone}"/></td>
								</tr>
								
								<tr>
									<td >Email��ַ��</td>
									<td ><input type="text" size="20" name="email" value="${user.contcatInfo.email}"/>
								</td>
								</tr>
		            		</table>
	           			 </div>
	           			 
	            		<div align="center" style="margin-top:10px;">
	            			<table>
	            				<tr>
	            					<td>��ѡ�񸶿ʽ��</td>
	            					<td>
	            						<select name="payWayId">
	            						<option value="1">�ֽ�֧��</option>
	            						<option value="2">����ת��</option>
	            						<option value="3">����֧��</option>
	            						</select>
	            					</td> 
	            				</tr>
	            			</table>
	            		</div>
	            			
	            		<div align="center" style="margin-top:10px;">
	            			<input type="submit"  value="�� ��"  />
	                		<input type="button"  value="ȡ ��"  onclick="history.go(-1);" />
	            		</div>
	           		 </form>
	           		 
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