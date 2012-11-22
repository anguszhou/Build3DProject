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
	
	     	<!-- 顶栏 -->
	       	<div class="header">        
	       	   <jsp:include page="common/menu.jsp"></jsp:include>
	       	</div>
	       
	       	<div class="center_content" >
	       		<!-- 左侧栏 -->
		        <div class="left_content">	        	 
		        	<jsp:include page="common/left.jsp"></jsp:include>
		        </div>
	
	        	<div class="right_content" align="center">
	           	 	<div class="title">
	           	 		<span class="title_icon">
	           	 			<img src="images/bullet1.gif" alt="" title="" />
	           	 		</span>订单详细信息<br />
	           	 	</div>
	        
	        		<div class="feat_prod_box_details">
	            		<table class="cart_table">
		            		<tr class="cart_title">
		                		<td width="74">商品照片</td>
		                		<td width="72">商品名称</td>
		                    	<td width="32">单价</td>
		                    	<td>数量</td>
		                    	<td width="40">合计</td>	                                 
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
				                <td colspan="4" class="cart_total"><span class="red">总计金额:</span></td>
				                <td>${order.cost}</td>                
		                	</tr>  
		            	</table>
	            	</div>	
	            	<div>
	     				 <table class="cart_table">
	            			<tr class="cart_title">
	                			<td colspan="2">订单用户信息</td>            
	                		</tr>
			                <tr>
			                	<td>用户名：</td>
			                	<td>${order.user.name }</td>            
			                </tr>
			                <tr>
			                	<td>联系地址：</td>
			                	<td>${order.user.contcatInfo.address}</td>            
			                </tr>
			                <tr>
			                	<td>订单状态：</td>
			                	<td>${order.orderStatus.name}</td>            
			                </tr>
			                
	           		 	</table>
	          			<p align="center">
	            			<input type="button"  value="返 回"  onclick="history.go(-1);" />
	          			</p>
	          		</div>
	           
	        		<div class="clear"></div>
	       		 </div>
	        	<!-- 右侧栏 -->
			    <div class="rank_content">	       		
			       	<jsp:include page="common/right.jsp"></jsp:include>
			    </div>
	        
	      		<div class="clear"></div>
	       </div>
	     	
	     	<!-- 底栏 -->
		    <jsp:include page="common/footer.jsp"></jsp:include>        
	
	</div>

</body>
</html>