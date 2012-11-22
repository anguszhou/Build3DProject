<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>买家管理</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@ page contentType="text/html; charset=gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="js/jquery-1.2.1.min.js"></script>
<script type="text/javascript" src="js/ymPrompt.js"></script>

	<script language="javascript">   
		function   kk(){   
			var   handleEl   =   document.getElementById("kkHandler");   
			var   els   =   document.getElementsByName("kk");   
			for(i=0;i<els.length;i++){   
			els[i].checked   =   handleEl.checked;   
		}   
	    
	  
	</script>   
</head>



<body>
    
<div id="wrap">
			<div class="header">        
	       	   <jsp:include page="common/menu.jsp"></jsp:include>
	       </div>
			<div class="center_content">
				<div class="left_content">
				</div>
				<div class="right_content">
					<div class="title">
						<span class="title_icon">
							<img src="images/bullet1.gif"/>
						</span>买家管理
					</div>
					<div class="feat_prod_box_details">
						<div class="contact_form" style="margin-left:60px;margin-bottom:50px;">
							<div class="form_subtitle">
								买家详细信息
							</div>
							
				<table align="center">

    <tr class="m-00" align="center">
        <td width="200"><strong>买家名称</strong></td>
        <td width="300"><span>${userDetail.name }</span></td>
    </tr>
   
    <tr class="m-00" align="center">
        <td><strong>电子邮箱</strong></td>
        <td><span>${userDetail.contcatInfo.email }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><strong>手机号码</strong></td>
        <td><span>${userDetail.contcatInfo.cellPhone }</span></td>
    </tr>
    <tr class="m-00" align="center">
        <td><strong>地址</strong></td>
        <td><span>${userDetail.contcatInfo.address }</span></td>
    </tr>
    
</table>
<table align="center">
    <tr>
      <td><a href="${pageContext.request.contextPath}/buyList.do" >返回</a></td>
  </tr>
</table>
</div>
</div>
</div>
</div>
</div>



</body>
</html>
