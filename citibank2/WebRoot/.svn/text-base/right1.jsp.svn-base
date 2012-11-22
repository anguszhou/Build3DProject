<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
</head>
<body>	
   <div id="mainPan1">
	  
	   <div class="right">
	    <div id="rightPan">
		  <ul>
			<img src="images/bullet4.gif" style="padding-left:5%"/><font size="5" color=#8F146E>本期预警企业</font>
			<c:forEach items="${warninfos}" var="warninfo">
	         	<div>
	        	 	<li><a href="#">${warninfo.smeassess.companyinfo.name}</a></li>
			 	</div>				         
          </c:forEach> 
          <br />  
           <img src="images/icon4.gif" style="padding-left:5%"/><font size="5" color=#8F146E>本期优质中小企业</font>
			<c:forEach items="${smeassessments}" var="smeassessment">
	         	<div>
	        	 	<li><a href="#">${smeassessment.companyinfo.name}</a></li>
			 	</div>				         
          </c:forEach>           
		</ul>
	   
		</div>
	</div>
  </div>
</body>
</html>