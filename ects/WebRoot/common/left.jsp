<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<script src="js/jquery-1.2.1.min.js" type="text/javascript"></script>
	<script src="js/menu.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="style1.css" />

	<title>Auto Parts</title>
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>
        <div class="right_box">         	
 	      <ul id="menu1">
			<li>
				<a href="#">产品品牌</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=1">联想</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=2">华硕</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=3">索尼</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=4">宏基</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=5">Mac</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=6">戴尔</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=7">惠普</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=8">清华同方</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=9">三星</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=10">海尔</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=11">GateWay</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=12">ThinkPad</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=13">LG</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=14">Toshiba</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=15">七喜</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=16">神舟</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=17">明基</a></li>
				</ul>
			</li>
			<li>
				<a href="#">产品价格</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/priceList.do?low=0&high=3999">3999以下</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/priceList.do?low=4000&high=4999">4000-4999</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/priceList.do?low=5000&high=5999">5000-5999</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/priceList.do?low=6000&high=6999">6000-6999</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/priceList.do?low=7000&high=7999">7000-7999</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/priceList.do?low=8000&high=11999">8000-11999</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/priceList.do?low=12000&high=120000">12000以上</a></li>
				</ul>
			</li>			
			<li>
				<a href="#">产品尺寸</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/sizeList.do?size=<=11">11寸以下</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/sizeList.do?size==12">12寸</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/sizeList.do?size==13">13寸</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/sizeList.do?size==14">14寸</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/sizeList.do?size==15">15寸</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/sizeList.do?size==16">16寸</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/sizeList.do?size=>=17">17寸以上</a></li>
				</ul>
			</li>			
			<li>
				<a href="#">产品类型</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/typeList.do?type=1">全能学生本</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/typeList.do?type=2">时尚丽人本</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/typeList.do?type=3">沉稳商务本</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/typeList.do?type=4">游戏影音本</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/typeList.do?type=5">日常办公本</a></li>
				</ul>
			</li>
		</ul>   
 	  <div class="clear"></div>       
 	           
   </div>
      
</body>
</html>