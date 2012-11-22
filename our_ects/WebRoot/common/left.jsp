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
				<a href="#">��ƷƷ��</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=1">����</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=2">��˶</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=3">����</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=4">���</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=5">Mac</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=6">����</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=7">����</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=8">�廪ͬ��</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=9">����</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=10">����</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=11">GateWay</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=12">ThinkPad</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=13">LG</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=14">Toshiba</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=15">��ϲ</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=16">����</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/categoryList.do?categoryId=17">����</a></li>
				</ul>
			</li>
			<li>
				<a href="#">��Ʒ�۸�</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/priceList.do?low=0&high=3999">3999����</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/priceList.do?low=4000&high=4999">4000-4999</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/priceList.do?low=5000&high=5999">5000-5999</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/priceList.do?low=6000&high=6999">6000-6999</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/priceList.do?low=7000&high=7999">7000-7999</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/priceList.do?low=8000&high=11999">8000-11999</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/priceList.do?low=12000&high=120000">12000����</a></li>
				</ul>
			</li>			
			<li>
				<a href="#">��Ʒ�ߴ�</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/sizeList.do?size=<=11">11������</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/sizeList.do?size==12">12��</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/sizeList.do?size==13">13��</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/sizeList.do?size==14">14��</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/sizeList.do?size==15">15��</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/sizeList.do?size==16">16��</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/sizeList.do?size=>=17">17������</a></li>
				</ul>
			</li>			
			<li>
				<a href="#">��Ʒ����</a>
				<ul>
					<li class="odd"><a href="${pageContext.request.contextPath}/typeList.do?type=1">ȫ��ѧ����</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/typeList.do?type=2">ʱ�����˱�</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/typeList.do?type=3">��������</a></li>
					<li class="even"><a href="${pageContext.request.contextPath}/typeList.do?type=4">��ϷӰ����</a></li>
					<li class="odd"><a href="${pageContext.request.contextPath}/typeList.do?type=5">�ճ��칫��</a></li>
				</ul>
			</li>
		</ul>   
 	  <div class="clear"></div>       
 	           
   </div>
      
</body>
</html>