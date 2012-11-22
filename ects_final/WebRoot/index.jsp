<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<title>Auto Parts</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <SCRIPT src="js/flashobj.js" type=text/javascript></SCRIPT>
    
    
</head>
<body>
<div id="wrap">

	  
	   <c:if test="${first == null || first == true}">
			<jsp:forward page="/home.do"></jsp:forward>
	   </c:if>
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
	            <div class="title">
	            	<span class="title_icon">
	            		<img src="images/bullet1.gif" />
	            	</span>
	            	热点新闻
	            </div>        
	        	<div class="feat_prod_box">
					  <div class=focusFlash>
							<div id=sasFlashFocus27></div>
							<script>
							var sohuFlash2 = new sohuFlash("flash/demo001.swf", "27", 522, 245, "7");
							sohuFlash2.addParam("quality", "high");
							sohuFlash2.addParam("wmode", "opaque");
							sohuFlash2.addVariable("image","images/02.jpg|images/03.jpg|images/04.jpg|images/01.jpg|");
							sohuFlash2.addVariable("url","${pageContext.request.contextPath}/productDetail.do?productId=99|${pageContext.request.contextPath}/productDetail.do?productId=116|${pageContext.request.contextPath}/productDetail.do?productId=112|${pageContext.request.contextPath}/productDetail.do?productId=113");
							sohuFlash2.addVariable("info", "全城热恋dv3|强悍独显N71|时尚Inspiron|超值大换购|");
							sohuFlash2.addVariable("stopTime","5000");
							sohuFlash2.write("sasFlashFocus27");
							</script>
					   </div>	                	           	
	            	<div class="clear"></div>
	            </div>
	            
	            

		<!-- 滚动代码开始 -->
					<div class="tag">
						<div class="title">
		        			<span class="title_icon">
		        				<img src="images/bullet2.gif" />
		        			</span> 
		        			产品推荐 
        				</div>  

			<div class="new_products">
        	<div id="div"  style="overflow: hidden; width: 550px; height:170px;">
              <table cellspace="0" align="left" border="0" cellpadding="0" width="450" height="150">
                <tbody>
                	<tr>

                  <td id="div11" valign="top">
                  	<table class="title_icon" border="0" cellpadding="0" cellspacing="10" height="150">
                      <tbody>
                      <tr style="height: 130px;">
						<c:forEach items="${promotedProduct}" var="product" varStatus="status">
							<td align="center" style="border: solid 1px;">
								<a >${product.name }</a> 
								<a href="productDetail.do?productId=${product.product_id }"><img src="images/${ product.image }" alt="" title="" class="thumb" border="0" /></a>
								
							</td>
						</c:forEach>
                      </tr>
                  	  </tbody>
                  	 </table>
                  </td>
                  <td id="div12" valign="top">
                  	<table class="items" border="0" cellpadding="0" cellspacing="10" height="150">
                      <tbody>
                      <c:forEach items="${promotedProduct}" var="product" varStatus="status">
							<td><div>
							<%--<a href="productDetail.do?productId=${product.id }" 
							>${product.name } <img 
							src="images/${ product.images }" height="90"></a>
							--%>
							<a align="center">${product.name }</a> 
							<a href="productDetail.do?productId=${product.product_id }"><img src="images/${ product.name }" alt="" title="" class="thumb" border="0" /></a>
							
							</div></td>
					  </c:forEach>
                      
                 	 </tbody>
                 	</table>
                 </td>
                </tr>
              </tbody></table>
      	  </div>
          
</div>
</div>
<a href="${pageContext.request.contextPath}/productList.do" class="more">- 更多 -</a>
       			<div class="clear"></div>
<script>
var speed=30
div12.innerHTML=div11.innerHTML
function Marquee11(){
if(div12.offsetWidth-div.scrollLeft<=0)
div.scrollLeft-=div11.offsetWidth
else{
div.scrollLeft++
}
}
var MyMar1=setInterval(Marquee11,speed)
div.onmouseover=function() {clearInterval(MyMar1)}
div.onmouseout=function() {MyMar1=setInterval(Marquee11,speed)}

</script>


<script language="JavaScript">
var ownerId = 'ARTICLE';
var title = "";
var extParams = "&article_id=380796&node_id=3&subject_id=4352&is_link=&product_tree_id=103&author_id=0&editor_id=200&area_id=&source_id=39&copyright_id=0&style_id=4&cooperate_id=0&input_time=2009-03-12 15:24:14&publish_time=2009-03-13 00:30:00";
</script>
<script language="javascript" src="lenovo960a_1203_data/stat.js"></script>
<script src="lenovo960a_1203_data/dw.js"></script>
<script>
if(window==window.top && ( document.location.host.match(/.*\.pchome\.net$/i) || document.location.host.match(/.*\.pchome\.com$/i) ) ){
DW.pageParams = {
siteid: 69
};
DW.clear();
}
</script>
<!--滚动代码结束-->


					<%--<div class="title">
           			<span class="title_icon">
           				<img src="images/bullet2.gif"/>
           			</span>
           			特价商品
           		</div>           
           		<div class="new_products">  
	           		<c:forEach items="${discProduct}" var="product" varStatus="status">        
	                    <div class="new_prod_box">
	                        <div class="new_prod_bg">
	                        	<span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
	                       		<a href="productDetail.do?productId=${product.id }"><img src="images/${ product.images } " alt="" title="" class="thumb" border="0" /></a>
	                        </div>
	                        <a >${product.name }</a>  
	                        <a >${product.basePrice }</a>        
	                   </div> 
	           		</c:forEach> 
           		</div>
           		<a href="special.do" class="more">- 更多 -</a>
       			<div class="clear"></div>
       			
       
       
        		--%><%--<div class="title">
        			<span class="title_icon">
        				<img src="images/bullet2.gif" />
        			</span>
        			新货上架
        		</div>           
           		<div class="new_products">  
	           		<c:forEach items="${newProduct}" var="product" varStatus="status">         
	                    <div class="new_prod_box">
	                        <div class="new_prod_bg">
	                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
	                        <a href="productDetail.do?productId=${product.id }"><img src="images/${ product.images }" alt="" title="" class="thumb" border="0" /></a>
	                        </div>      
	                       	<a >${product.name }</a>  
	                        <a >${product.basePrice }</a>       
	                    </div>
                    </c:forEach>
           		</div> 
           		<a href="newProduct.do" class="more">- 更多 -</a>
       			<div class="clear"></div>
       			
       
         
           		--%><%--<div class="title">
           			<span class="title_icon">
           				<img src="images/bullet2.gif"/>
           			</span>
           			推荐商品
           		</div>           
          		<div class="new_products">  
	           		<c:forEach items="${promotedProduct}" var="product" varStatus="status">         
	                    <div class="new_prod_box">
	                        <div class="new_prod_bg">
	                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
	                        <a href="productDetail.do?productId=${product.id }"><img src="images/${ product.images }" alt="" title="" class="thumb" border="0" /></a>
	                        </div>      
	                       	<a >${product.name }</a>  
	                        <a >${product.basePrice }</a>       
	                    </div>
                    </c:forEach>
           		</div> 
           		<a href="promotedProduct.do" class="more">- 更多 -</a>
       			<div class="clear"></div>--%>
      	   </div>
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