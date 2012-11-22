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
					alert('对不起，产品数量不能小于 1 ');
					caller.focus();
				}
			}
		</script>
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
	            			</span>请仔细检查以下购物车中商品<br />
	            	</div>
	        
	        		<div class="feat_prod_box_details">
	            
	            		<table class="cart_table">
	            			<tr class="cart_title">
	                			<td width="30px;">序号</td>
	                			<td  width="119px;">图片</td>
	                			<td  width="150px;">名称</td>
	                   			<td  width="50px;">分类</td>
	                   		 	<td  width="70px;">价格</td>
	                    		<td  width="30px;">数量</td>   
	                    		<td  width="80px;">合计</td>            
	                		</tr>                
	            		<c:forEach items="${cart.items}" var="orderLine" varStatus="varStatus">                
		            		<tr>
		            			<td>${varStatus.count}</td>
		                		<td><a href="${pageContext.request.contextPath}/productDetail.do?productId=${orderLine.value.product.id}"><img src="images/${orderLine.value.product.images}" alt="" title="" border="0" class="cart_thumb" width="119px"/></a></td>
		                		<td>${orderLine.value.product.name}</td>
		                		<td>${orderLine.value.product.category.name}</td>
		                    	<td>${orderLine.value.product.basePrice}</td>
		                    	<td class=tablebody2 valign=middle align=center width="40">
		                    	${orderLine.value.amount}
		                    	</td>
		                   	 	<td>${orderLine.value.product.basePrice*orderLine.value.amount}</td>
		               		</tr>	           
	               		</c:forEach>
	               		
	               			<tr>
		                		<td colspan="3" class="cart_total"><span class="red">总计金额:</span></td>
		                		<td colspan="3">${cart.total}</td>                
	                		</tr>
	            		</table>
	            	</div>
	            	
	            	
	            	<form  action="${pageContext.request.contextPath}/addOrder.do" method="post">	
		            	<div> 
		            	 以下是用户注册送货信息确认,如果变化请先进行更新操作：
	            
		           			 <table class="cart_table">
		            			<tr class="cart_title">
		                			<td colspan="2">用户注册信息确认</td>            
		                		</tr>
		                		<tr>
		                			<td>用户名：</td>
		                			<td><input name="name" value="${user.name}" readonly="readonly"/></td>            
		               			 </tr>
		                		<tr>
									<td >联系地址1：</td>
									<td><input type="text"  size="20" name="street1" value="${user.info.street1 }"/></td>
								</tr>
								<tr>
									<td >联系地址2：</td>
									<td><input type="text" size="20" name="street2" value="${user.info.street2 }"/></td>
								</tr>
								<tr>
									<td >邮编：</td>
									<td><input type="text" size="20" name="zip" value="${user.info.zip}"/></td>
								</tr>
								<tr>
									<td >办公室电话：</td>
									<td><input type="text" size="15" name="officePhone" value="${user.info.officePhone}"/></td>
								</tr>
								<tr>
									<td >手机：</td>
									<td><input type="text" size="15" name="cellPhone" value="${user.info.cellPhone}"/></td>
								</tr>
								<tr>
									<td >家庭电话：</td>
									<td><input type="text" size="15" name="homePhone" value="${user.info.homePhone}"/></td>
								</tr>
								<tr>
									<td >Email地址：</td>
									<td ><input type="text" size="20" name="email" value="${user.info.email}"/>
								</td>
								</tr>
		            		</table>
	           			 </div>
	           			 
	            		<div align="center" style="margin-top:10px;">
	            			<table>
	            				<tr>
	            					<td>请选择付款方式：</td>
	            					<td>
	            						<select name="payWayId">
	            						<option value="1">现金支付</option>
	            						<option value="2">网银转账</option>
	            						<option value="3">银行支付</option>
	            						</select>
	            					</td>
	            				</tr>
	            			</table>
	            		</div>
	            			
	            		<div align="center" style="margin-top:10px;">
	            			<input type="submit"  value="提 交"  />
	                		<input type="button"  value="取 消"  onclick="history.go(-1);" />
	            		</div>
	           		 </form>
	           		 
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