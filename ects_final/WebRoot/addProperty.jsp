<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<script type="text/javascript" src="js/login.js"></script>
		<script type="text/javascript" src="js/jquery-1.2.1.min.js"></script>		
		<script type="text/javascript" src="js/ymPrompt.js"></script>
    
    <script src="js/style.js"></script>
    

	
    
    
<%--<style type="text/css">
<!--
body,td,th {
	font-size: 0.7em;
}
-->
</style>
--%></head>
<body>
<div id="wrap">
			<div class="header">        
	       	   <jsp:include page="common/menu2.jsp"></jsp:include>
	       </div>
			<div class="center_content">
				<div class="left_content">
				</div>
				<div class="right_content">
					<div class="title">
						<span class="title_icon">
							<img src="images/bullet1.gif"/>
						</span>�����Ʒ����
					</div>
					<div class="clear"></div>

						<style>
							.qBox{margin-left:250px;margin-top:-30px;}
							.seller{float:right;margin-top:-35px;}
						</style>
 				<div>
				<a href="#" class="seller">�ҵ�������ҳ</a>
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="#" >�����Ʒ</a> 
				 	 </h3> 
			 	 </div> 
			</div> 
			<div class="body"> 
				<div id="tabber1" > 
					<div class="vImgColl_W"> 
          							         
                    
      <div class="contact_form" style="margin-left: 10px; width: 88%;margin-top:5px;">
                    	
                    	<form style="padding-left: 5%;"
								action="${pageContext.request.contextPath}/addProperty.do"
								method="post">
								<table>
								<tr>
										<td width="366">
							        <input  id="productId" name="productId" type="hidden" value="${product.product_id}"  />
											
										</td>
									
									</tr>
									<tr>
										<td width="83" height="44" >
											<font size="3">��Ʒ���ƣ� </font>
											<a href="${pageContext.request.contextPath}/upload.jsp?productId=${product.product_id}" class="more"><font size="3">�ϴ�ͼƬ</font></a>
							      </td>
										<td width="366">
							      <font size="3">  <input id="productName" name="productName"  value="${product.name}" readonly="readonly" onblur="check_null(this);"/></font>
											
										</td>
									
									</tr>
									<tr>
										<td height="34">
										<font size="3">	���ۣ�</font>
										</td>
										<td>
										  <input name="productPrice" type="text"  value="${product.price}" onblur="check_null(this);"/>
											
										</td>
									</tr>
									<tr>
										<td height="30">
										<font size="3">	�ϼ�ʱ�䣺</font>
										</td>
										<td>
										  <input name="productTime" type="text" value="${product.time}" onblur="check_password(this);"/>
											
										</td>
									</tr>
									
									
									<tr>
										<td height="29">
										<font size="3">	��Ʒ������</font>
										</td>
										<td>
											<input type="text" size="35" name="productDescription" value="${product.descriptions}"/>
										</td>
									</tr>
								
									
									<c:forEach items="${product.propertys}" var="property" varStatus="varStatus" >  
										<tr>
										  
										   
											<td>
											<font size="2">	${varStatus.count} .��Ʒ���ԣ�</font>
											
											
											
											<font size="2">	${property.propertyName}</font>
											</td>
										
											<td height="30">
												<font size="2">����ֵ��</font>
											
											<font size="2">	${property.propertyValue}</font>
											</td>
									 		<td><%--<button
											onclick="Alert('ȷ��ɾ��?',null,null,'ȷ��ɾ��?',function(){location='${pageContext.request.contextPath}/deleteProperty.do?propertyId=${property.id}';},null);">
											ɾ��
										</button></td>--%>
										<font size="2"><a href="${pageContext.request.contextPath}/deleteProperty.do?propertyId=${property.id}"> ɾ��</a></font>
										</tr>
									</c:forEach>  
									<tr>
										<td height="35">
										<font size="3">	������Ʒ���ԣ�</font>
										</td>
										<td>
							        <input type="text" size="32" name="addPropertyName" />
											
										</td>
									</tr>
									<tr>
										<td height="35">
										<font size="3">	����ֵ��</font>
										</td>
										<td>
							        <input type="text" size="32" name="addPropertyValue" />
											
										</td>
									</tr>
									
									
								</table>
								<div class="form_row"/>
								<center>
									<input type="submit" value="�����Ʒ����" style="margin-right:50px;" />
									&nbsp;
									<input type="reset" value="����" />
								</center>
								<br />
							</form>
								
                   	 </div>
                
				  </div>
				</div> 
 		 	</div> 
       </div>
   </div>
   <p>&nbsp;</p><p>&nbsp;</p>
  
</div>

    <div id="footer">
	  <p>&nbsp;</p>
		  <p>&nbsp;</p>
</div>

</body>
</html>