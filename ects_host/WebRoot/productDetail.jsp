<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Auto Parts</title>
		<link rel="stylesheet" type="text/css" href="style.css" />

		<%@ page contentType="text/html; charset=gbk"%>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<link rel="stylesheet" href="lightbox.css" type="text/css"
			media="screen" />
		
		<script src="js/prototype.js" type="text/javascript"></script>
		<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
		<script src="js/lightbox.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/java.js"></script>
		<script type="text/javascript" src="js/picture.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
		<script type="text/javascript" src="js/jquery-1.2.1.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/ratingsys.js"></script> 
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


				<!-- ���µ��Ҳ���֮ǰ��Ϊҳ���������� -->

				<div class="right_content">
					<div class="crumb_nav">
						<a href="index.jsp">��ҳ</a> &gt;&gt; ��Ʒ����
					</div>
					<div class="title">
						<span class="title_icon"><img src="images/bullet1.gif"
								alt="" title="" />
						</span>��ϸ��Ϣ
					</div>
					

					<div class="feat_prod_box_details">

						<div class="prod_img">
													
							<a
								href="${pageContext.request.contextPath}/productDetail.do?productId=${productDetail.product_id}">
								<img src="images/${productDetail.name}" border="0" style="margin-left: 10px;"
									 width="150px;" onmouseover="ects_img_detail(this);"/>
							</a>
							
							 <span id="rateStatus">����...</span>
							<span id="ratingSaved"></span> 
							<div id="rateMe" title="����...">
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=1" onClick="rateIt(this)" id="_1" title="�ϲ�" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=2" onClick="rateIt(this)" id="_2" title="������" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=3" onClick="rateIt(this)" id="_3" title="��" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=4" onClick="rateIt(this)" id="_4" title="�൱��" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=5" onClick="rateIt(this)" id="_5" title="�ü���" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							</div>
							<c:if test="${productDetail.starRating == null}">
								<div class="personNum">					            	
										0������
					            </div>   
					            <div class="avgStar">
					            	ƽ��0��
					            </div> 
							</c:if>
							<c:if test="${productDetail.starRating != null}">
								<div class="personNum">	
									${ productDetail.starRating.personNum }������
					            </div>   
					            <div class="avgStar">
					            	ƽ��${ productDetail.starRating.avgStar }��
					            </div> 
							</c:if>							
						</div>

						<div class="prod_det_box" style="margin-left:40px;">
							<div class="box_top"></div>
							<div class="box_center">
							<!--<div class="prod_title">
									��ϸ����
								</div>   -->
								<br />
								

								<div class="price">
									<strong>��Ʒ����:</strong>
									<span class="red">${productDetail.name}</span>
								</div>
								<div class="price">
									<strong>�۸�:</strong>
									<span class="red">${productDetail.price}</span>
								</div>
								
								<div class="price">
									<strong> �ϼ�ʱ��</strong>
									<span class="red">${productDetail.time}</span>
								</div>
								
								
									<a href="${pageContext.request.contextPath}/addToCart.do?productId=${productDetail.product_id}"
										class="checkout">���빺�ﳵ &gt;</a>								
								<div class="clear"></div>
							</div>

							<div class="box_bottom"></div>
						</div>
						<div class="clear"></div>
					</div>

					<hr />
					<div id="demo" class="demolayout">

						<ul id="demo-nav" class="demolayout">
							<li>
								<a class="active">������� </a>
							</li>							
						</ul>

						<div class="tabs-container">

							<div style="display: block;" class="tab" id="tab1">
								<p class="more_details">
									${productDetail.descriptions}
								</p>

							</div>
						</div>
						
						<ul id="demo-nav" class="demolayout">
							<li>
								<a class="active">����</a>
							</li>							
						</ul>
						<c:forEach items="${productDetail.comments}" var="comment">
							<div class="tabs-container">
								<div style="display: block;" class="tab" id="tab1">
									<div class="more_details">
										<div class="box_center1">
                    						<div class="prod_title1">���ѣ�${ comment.name }</div>
                    						<div class="prod_price1">����ʱ�䣺${ comment.commentDate }</div>                       
                    						<div class="details1">${ comment.content }</div>
                    						<div class="clear"></div>
                   						</div>  
									</div>
								</div>
							</div>
						</c:forEach>
						<ul id="demo-nav" class="demolayout">
							<li>
								<a class="active">�������</a>
							</li>							
						</ul>

						<div class="tabs-container">
							<form action="${pageContext.request.contextPath}/addComment.do?productId=${productDetail.product_id}" method="post">
							<div style="display: block;" class="tab" id="tab1">
								
								<div class="more_details">																		
										<div style="margin:10px;">
											�ǳƣ�
											<input name="name" size="20" style="margin-left:16px;"/>
										</div>
										<div style="margin:10px;">
											E-mail��
											<input name="email" size="30" />
										</div>
										<div style="margin:10px;">											
											<textarea rows="10" cols="50" name="content"></textarea>
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



					<div class="clear"></div>
				</div>
				<!--end of left content-->


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