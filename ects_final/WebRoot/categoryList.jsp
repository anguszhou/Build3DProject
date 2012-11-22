
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Auto Parts</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<script type="text/javascript" src="js/picture.js"></script>
	
</head>
<body>
<div id="wrap">

		<!-- ���� -->
       <div class="header">
       		<jsp:include page="common/menu.jsp"></jsp:include>
       </div>           
       
       
       <div class="center_content">
       <!-- ����� -->
       <div class="left_content">	        	 
	        	<jsp:include page="common/left.jsp"></jsp:include>
	   </div>
       
       <!-- �������� -->
        
        <div class="right_content">
       		<div class="title">
   	 			<span class="title_icon"><img src="images/bullet1.gif" alt="" title="" />��Ʒ�б�<br /></span>
   	 		</div>           		
           	<c:forEach items="${pageController.data}" var="product">
				<div class="feat_prod_box">
           
            		<div class="prod_img">
            			<a href="${pageContext.request.contextPath}/productDetail.do?productId=${product.product_id}">
            				<img src="images/${product.image}" alt="" title="" border="0" width="119px" onmouseover="ects_img_detail(this);"/>
            			</a>
            		</div>
                
               		<div class="prod_det_box">
                		<div class="box_top"></div>
                    	<div class="box_center">
                    		<div class="prod_title">${ product.name }</div>
                    		<div class="prod_price">�� ${ product.price }</div>                       
                    		<p class="details">�ϼ�ʱ�䣺${ product.time} </p>
                    		<a href="${pageContext.request.contextPath}/addToCart1.do?action=addToBasket&productId=${product.product_id}" class="more"><img src="images/cart1.gif" alt="add to cart" title="" border="0" /></a>
                    		<a href="${pageContext.request.contextPath}/productDetail.do?productId=${product.product_id}" class="more">- ��ϸ��Ϣ -</a>
                    		<div class="clear"></div>
                   		</div>
                    	<div class="box_bottom"></div>
                	</div>    
            		<div class="clear"></div>
           		</div>					
			</c:forEach>
            <div class="pagination">
            	����<font color="red">${pageController.totalRowsAmount}</font>����¼
            	����<font color="red">${pageController.totalPages}</font>ҳ
            	��ǰ�ǵ�<font color="red">${pageController.currentPage}</font>ҳ
            	<br/><br/>
                <a href="${pageContext.request.contextPath}/productClassList.do?destId=1&productClass_id=${productClass_id}">��ҳ</a>
                <c:if test="${pageController.hasPrevious}">
            		<a href="${pageContext.request.contextPath}/productClassList.do?destId=${pageController.currentPage-1}&productClass_id=${productClass_id}">��һҳ</a>
            	</c:if>
            		<span class="current">
						<select id="pageSelector" style="font-size:12px;padding-top:3px;"
							onchange="location='${pageContext.request.contextPath}/productClassList.do.do?destId='+this.value+'&productClass_id=${productClass_id}">
							<c:out value="${pageSelector}" escapeXml="false"></c:out>
						</select>
					</span>				
				<c:if test="${pageController.hasNext}">
            		<a href="${pageContext.request.contextPath}/productClassList.do?destId=${pageController.currentPage+1}&productClass_id=${productClass_id}">��һҳ</a>
            	</c:if>
            	<a href="${pageContext.request.contextPath}/productClassList.do?destId=${pageController.totalPages}&productClass_id=${productClass_id}">���һҳ</a>
            </div> 
        	<div class="clear"></div>
        </div>
      <!-- �Ҳ��� -->
				<div class="rank_content">
					<jsp:include page="common/right.jsp"></jsp:include>
				</div>
				<!-- ���� -->
				<jsp:include page="common/footer.jsp"></jsp:include>
			</div>
		</div>

	</body>
</html>