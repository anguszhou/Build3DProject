<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<link rel="stylesheet" type="text/css" href="style3.css" />
    
    <script src="js/style.js"></script>

    <link rel="icon" href="http://img07.taobaocdn.com/tps/i7/T1bZNxXjXjXXXXXXXX.png" type="image/x-icon" />
	

	
    
    
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
          <li class="J_MenuItem"><a class="c8" href="sell.html" ><s></s><i></i>��Ҫ��</a></li>
          <li class="J_MenuItem"><a class="c8" href="selling.html" ><s></s><i></i>�����е���Ʒ</a></li>

          <li class="J_MenuItem"><a class="c8" href="#" ><s></s><i></i>��Ʒ����/�ظ�</a></li>
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
        
      <h2 class="title"><a  ></a></h2>
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
    	<font color="#FF6600">��ǰλ�ã�</font> <a  href="seller.html"  >�������</a> ����> <a  href="liuyan.html" >������Ϣ</a><p>&nbsp;</p>
        <a href="seller.html" class="seller">�ҵ�������ҳ</a>
			<div class="head"> 
				<div class="caption"> 
					<h3 class="title"> 
					  <a  href="#" >��Ʒ������Ϣ</a> 
				  </h3> 
			  </div> 
			</div> 
			<div class="body"> 
				<div id="tabber1" >
				  <div class="vImgColl_W">
				    <c:forEach items="${ pageController.data }" var="product" varStatus="status">
				    <div class="feat_prod_box">
				      <div class="prod_img"><a href="${pageContext.request.contextPath}/productDetail.do?productId=${product.id}"><img src="images/${product.images}" alt="" title="" border="0" width="119px" onmouseover="ects_img_detail(this);"/></a></div>
				      <div class="prod_det_box">
				        <div class="box_top"></div>
				        <div class="box_center">
				          <div class="prod_title">${ product.name }</div>
				          <div class="prod_price">�� ${ product.basePrice }</div>
                          <p>&nbsp;</p><p>&nbsp;</p>
                          	<a href="productDetails.html" class="more" style="float:right;">- ��ϸ��Ϣ -</a>
				          <div class="clear"></div>
			            </div>
				        <div class="box_bottom"></div>
			          </div>
				      <div class="clear"></div>
                      
                      
                      <div id="demo" class="demolayout">

						<ul id="demo-nav" class="demolayout">
							<li>
								<a class="active">������Ϣ </a>
							</li>							
					  </ul>

						<div class="tabs-container">

							<div style="display: block;" class="tab" id="tab1">
							  <p class="more_details">
									<c:forEach items="${productDetail.comments}" var="comment">
							
							  <div class="box_center1">
                    						<div class="prod_title1">���ѣ�${ comment.name }</div>
                    						<div class="prod_price1">����ʱ�䣺${ comment.commentDate }</div>                       
                    						<div class="details1">${ comment.content }</div>
                                            <div class="clear"></div>
                                <input type="button" value="�ظ�" style="margin-right:50px;float:right;" onclick="#"/>
                                <input type="button" value="ɾ��" style="margin-right:50px;float:right;" onclick="#"/>
       						  </div>  
								
						</c:forEach>
								</p>

							</div>
						</div>
                        </div>
       	
        
        <div id="demo" class="demolayout">
        	<ul id="demo-nav" class="demolayout">
							<li>
								<a class="active">�������</a>
							</li>							
						</ul>

						<div class="tabs-container">
							<form action="${pageContext.request.contextPath}/addComment.do?productId=${productDetail.id}" method="post">
							<div style="display: block;" class="tab" id="tab1">
								
								<div class="more_details">																		
										
										<div style="margin:10px;">
										  <textarea rows="10" cols="100" name="content"></textarea>
								  </div>
										<div style="margin:10px;">										
											<input type="submit" value="�ύ" style="margin-left:20px;"/>
											<input type="reset" value="����" style="margin-left:30px;"/>
										</div>																	
								</div>	
							</div>
							</form>	
						</div>
        </div>
        
        </c:forEach>
        
				      <div class="clear"></div>
			        </div>
			      </div>
				</div> 
 		 	</div> 
       </div>
   </div>
   <p>&nbsp;</p><p>&nbsp;</p>
   <p>&nbsp;</p>
   
   
   
   


    <div id="footer">
	  <p>&nbsp;</p>
		  <p>&nbsp;</p>
</div>

</body>
</html>