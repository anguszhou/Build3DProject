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

			<!-- 顶栏 -->
			<div class="header">
				<jsp:include page="common/menu.jsp"></jsp:include>
			</div>
			<div class="center_content">
				<!-- 左侧栏 -->
				<div class="left_content">
					<jsp:include page="common/left.jsp"></jsp:include>
				</div>


				<!-- 以下到右侧栏之前均为页面主体内容 -->

				<div class="right_content">
					<div class="crumb_nav">
						<a href="index.jsp">主页</a> &gt;&gt; 产品介绍
					</div>
					<div class="title">
						<span class="title_icon"><img src="images/bullet1.gif"
								alt="" title="" />
						</span>详细信息
					</div>

					<div class="feat_prod_box_details">

						<div class="prod_img">
							<br />
							<br />
							<br />
							<br />							
							<a
								href="${pageContext.request.contextPath}/productDetail.do?productId=${productDetail.product_id}">
								<img src="images/${productDetail.name}" border="0" style="margin-left: 10px;"
									 width="150px;" onmouseover="ects_img_detail(this);"/>
							</a>
							
							 <span id="rateStatus">评分...</span>
							<span id="ratingSaved"></span> 
							<div id="rateMe" title="评分...">
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=1" onClick="rateIt(this)" id="_1" title="较差" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=2" onClick="rateIt(this)" id="_2" title="还可以" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=3" onClick="rateIt(this)" id="_3" title="好" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=4" onClick="rateIt(this)" id="_4" title="相当好" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							    <a href="${pageContext.request.contextPath}/addStarRating.do?productId=${productDetail.product_id}&star=5" onClick="rateIt(this)" id="_5" title="好极了" onMouseOver="rating(this)" onMouseOut="off(this)"></a>
							</div>
							<c:if test="${productDetail.starRating == null}">
								<div class="personNum">					            	
										0人评价
					            </div>   
					            <div class="avgStar">
					            	平均0分
					            </div> 
							</c:if>
							<c:if test="${productDetail.starRating != null}">
								<div class="personNum">	
									${ productDetail.starRating.personNum }人评价
					            </div>   
					            <div class="avgStar">
					            	平均${ productDetail.starRating.avgStar }分
					            </div> 
							</c:if>							
						</div>

						<div class="prod_det_box" style="margin-left:40px;">
							<div class="box_top"></div>
							<div class="box_center">
							<!--<div class="prod_title">
									详细介绍
								</div>   -->

								<div class="price">
									<strong>品牌:</strong>
									<span class="red">${productDetail.name}</span>
								</div>
								<div class="price">
									<strong>型号:</strong>
									<span class="red">${productDetail.name}</span>
								</div>
								<div class="price">
									<strong>价格:</strong>
									<span class="red">${productDetail.name}元</span>
								</div>
								<div class="price">
									<strong>机型:</strong>
									<span class="red">${productDetail.name}</span>
								</div>
								<div class="price" >
									<strong>CPU:</strong>
									<span class="red">${productDetail.name}</span>
								</div>
								<div class="price">
									<strong>显卡:</strong>
									<span class="red">${productDetail.name}</span>
								</div>
								<div class="price">
									<strong>内存:</strong>
									<span class="red">${productDetail.name}</span>
								</div>
								<div class="price">
									<strong>硬盘:</strong>
									<span class="red">${productDetail.name}</span>
								</div>
									<a href="${pageContext.request.contextPath}/addToCart.do?productId=${productDetail.product_id}"
										class="checkout">加入购物车 &gt;</a>								
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
								<a class="active">更多介绍 </a>
							</li>							
						</ul>

						<div class="tabs-container">

							<div style="display: block;" class="tab" id="tab1">
								<p class="more_details">
									${productDetail.time}
								</p>

							</div>
						</div>
						
						<ul id="demo-nav" class="demolayout">
							<li>
								<a class="active">评论</a>
							</li>							
						</ul>
						<c:forEach items="${productDetail.comments}" var="comment">
							<div class="tabs-container">
								<div style="display: block;" class="tab" id="tab1">
									<div class="more_details">
										<div class="box_center1">
                    						<div class="prod_title1">网友：${ comment.name }</div>
                    						<div class="prod_price1">发表时间：${ comment.commentDate }</div>                       
                    						<div class="details1">${ comment.content }</div>
                    						<div class="clear"></div>
                   						</div>  
									</div>
								</div>
							</div>
						</c:forEach>
						<ul id="demo-nav" class="demolayout">
							<li>
								<a class="active">添加评论</a>
							</li>							
						</ul>

						<div class="tabs-container">
							<form action="${pageContext.request.contextPath}/addComment.do?productId=${productDetail.product_id}" method="post">
							<div style="display: block;" class="tab" id="tab1">
								
								<div class="more_details">																		
										<div style="margin:10px;">
											昵称：
											<input name="name" size="20" style="margin-left:16px;"/>
										</div>
										<div style="margin:10px;">
											E-mail：
											<input name="email" size="30" />
										</div>
										<div style="margin:10px;">											
											<textarea rows="10" cols="50" name="content"></textarea>
										</div>
										<div style="margin:10px;">										
											<input type="submit" value="提交" style="margin-left:20px;"/>
											<input type="reset" value="重置" style="margin-left:30px;"/>
										</div>																	
								</div>	
							</div>
							</form>	
						</div>
					</div>



					<div class="clear"></div>
				</div>
				<!--end of left content-->


				<!-- 右侧栏 -->
				<div class="rank_content">
					<jsp:include page="common/right.jsp"></jsp:include>
				</div>
				<!-- 底栏 -->
				<jsp:include page="common/footer.jsp"></jsp:include>
			</div>
		</div>

	</body>
</html>