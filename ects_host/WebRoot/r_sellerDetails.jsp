<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<link rel="stylesheet" type="text/css" href="style3.css" />
    
    <script src="js/style.js"></script>

    <link rel="icon" href="http://img07.taobaocdn.com/tps/i7/T1bZNxXjXjXXXXXXXX.png" type="image/x-icon" />
	<script language="javascript">
			function check_null(caller){
				
				if(caller.value.length == 0)
				{
					alert("�����Ϊ��");
					
				}
			}
			function check_password(caller){
				
				if(caller.value.length == 0)
				{
					alert("�����Ϊ��");
					
					return;
				}
				if(caller.value != caller.form.password.value)
				{
					alert("�����������벻һ��,����������");
					caller.value = '';					
				}
			}
			
			function check_submit(form)
			{
				
				if(form.name.value.length ==0)
				{
					alert('�û�������Ϊ��');	
					return;
				}
				if(form.password.value.length ==0)
				{
					alert('���벻��Ϊ��');
					return;
				}
				if(form.repwd.value.length ==0)
				{
					alert('�ظ����벻��Ϊ��');	
					return;
				}				
				form.submit();	
			}
	</script>
	

	
    
    
<style type="text/css">
<!--
body,td,th {
	font-size: 0.7em;
}
-->
</style></head>
<body >
<p><span class="clear"><span class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=6"></a></span></span></p>
<div id="main">
  <p><a href="#"><img src="images/logo.gif"  title="" border="0" /></a></p>
  
 <div id="menu">
        <ul>                                                                       
        <li ><a href="index.html">��ҳ</a></li>
        
        <li><a href="${pageContext.request.contextPath}/productList.do">��Ʒ�б�</a></li>
         <li><a href="${pageContext.request.contextPath}/search.jsp">������Ʒ</a></li>
        
        <li><a href="${pageContext.request.contextPath}/cart.jsp">�ҵĹ��ﳵ</a></li>
        <c:if test="${user != null}">        	
        	<li><a href="${pageContext.request.contextPath}/orderList.do">�����б�</a></li>
        </c:if>
        
        <c:if test="${user == null}">        	
        	<li><a href="${pageContext.request.contextPath}/login.jsp">�����б�</a></li>
        </c:if>
        <c:if test="${user != null}">
        	
        </c:if>
	 </ul>
  </div>
  
  
<div class="Box">
  <div class="col-sub">
    <div id="J_Category" class="mall-category">
    <h2 class="title"><a href="#" >�������</a></h2>
    <div class="entity">
      <div class="items">
        <ul class="item">
          <li class="J_MenuItem"><a class="c8" href="addSellerProduct.jsp" ><s></s><i></i>��Ҫ��</a></li>
          <li class="J_MenuItem"><a class="c8" href="Test.jsp" ><s></s><i></i>�����е���Ʒ</a></li>

          <li class="J_MenuItem"><a class="c8" href="liuyan.html" ><s></s><i></i>��Ʒ����/�ظ�</a></li>
        </ul>
        </div>
        </div>
         <div class="entity">
      <div class="items">
        <h2 class="title"><a href="#" >���׹���</a></h2>
        <ul class="item">
          <li class="J_MenuItem"><a class="c8" href="selled.html" ><s></s><i></i>����������Ʒ</a></li>
          <li class="J_MenuItem"><a class="c8" href="w_orderList.html" ><s></s><i></i>�ȴ������Ķ���</a></li>
          
          <li class="J_MenuItem"><a class="c8" href="r_orderList.html" ><s></s><i></i>�ѷ����Ķ���</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>���۹���</a></li>          
        </ul>
        </div>
        </div>
       
         <div class="entity">
      <div class="items">
        <h2 class="title"><a href="#" >�ͻ�����</a></h2>
        <ul class="item">
         <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>Ͷ�߾ٱ�</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>��ѯ�ظ�</a></li>
          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>Υ���¼</a></li>
        </ul>
        
      <h2 class="title"><a ></a></h2>
      </div>
        
      </div>
    </div>
    </div>
  </div>
 

<style>
	.qBox{margin-left:250px;margin-top:-30px;}
	.seller{float:right;margin-top:-35px;}
</style>

  <div class="Box1">
   
	<div class="qBox"> 
    <font color="#FF6600">��ǰλ�ã�</font> <a  href="seller.html"  >�ҵ�����</a> ����> <a  href="r_sellerDetails.html"  >������Ϣ�޸�</a><p>&nbsp;</p>
    <a href="seller.html" class="seller">�ҵ�������ҳ</a>
			<div class="head"> 
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="#" >������Ϣ�޸�</a> 
				  </h3> 
			  </div> 
			</div> 
			<div class="body"> 
				<div id="tabber1" > 
					<div class="vImgColl_W"> 
                
                		
	            
	            		  <div class="prod_img"><a href="${pageContext.request.contextPath}/productDetail.do?productId=${product.id}"><img src="images/photo.jpg" alt="" title="" border="0" width="119px" onmouseover="ects_img_detail(this);"/></a></div>
		                
		               		<div class="prod_det_box">
		                		<div class="box_top"></div>
		                    	<div class="box_center">
		                    		<form style="padding-left:5%;" action="${pageContext.request.contextPath}/modifySeller.do" method="post">
								<table>
									<tr>
										<td>�û�����</td>
										<td>
											<input name="name" value="${name}" readonly="readonly" onblur="check_null(this);"/>
										</td>
									</tr>
									<tr>
										<td>���룺</td>
										<td><input id="pwd" type="password" name="password" value="" /><font color="red">*���������6-20����ĸ���������</font></td>
									</tr>
									<tr>
										<td>ȷ�����룺</td>
										<td><input name="repwd" type="password" onblur="check_password(this)" /><font color="red">*������������������</font></td>
									</tr>
									
									<tr>
										<td >��ʵ����</td>
										<td><input type="text" size="15" name="realName" value="${seller.realName}"/></td>
									</tr>
									<tr>
										<td >����</td>
										<td><input type="text" size="15" name="shopName" value="${seller.shopName}"/></td>
									</tr>
									<tr>
										<td >QQ</td>
										<td><input type="text" size="15" name="QQ" value="${seller.QQ}"/></td>
									</tr>
									<tr>
										<td >�̵�������</td>
										<td ><input type="text" size="32" name="shopDescriptions" value="${seller.shopDescriptions}"/>
										</td>
									</tr>
								</table>
								<div class="form_row"/>
								<div style="padding-left:30px;padding-top:20px;">
									<input type="button" value="ȷ��" onclick="check_submit(this.form);"/>
									<button style="margin-left:50px;" onclick="history.go(-1);">ȡ��</button>
								</div>
                                <br />
							</form>
		                   		</div>
		                    	<div class="box_bottom"></div>
		                	</div>    
		            		<div class="clear"></div>
           		  </div>					
                
 					
				</div> 
 		 	</div> 
    </div>
   </div>
   <p>&nbsp;</p><p>&nbsp;</p>
   <p>&nbsp;</p>
</div>
   
   
   


    <div id="footer">
	  <p>&nbsp;</p>
		  <p>&nbsp;</p>
</div>

</body>
</html>