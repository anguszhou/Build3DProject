<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>���ҹ���</title>
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
						</span>��ҹ���
					</div>
					<div class="feat_prod_box_details">
						<div class="contact_form" style="margin-left:60px;margin-bottom:50px;">
							<div class="form_subtitle">
								�����ϸ��Ϣ
							</div>
							
				<table align="center">
    <tr class="m-00" align="center">
        <td width="200"><span>��������</span></td>
        <td width="300"><span>${sellerDetail.realName }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><span>���ұ��</span></td>
        <td><span>${sellerDetail.id }</span></td>
    </tr>
    <tr class="m-00" align="center">
        <td><span>��������</span></td>
        <td><span>${sellerDetail.credit }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><span>�̵�����</span></td>
        <td><span>${sellerDetail.shopName }</span></td>
    </tr>
    <tr class="m-00" align="center">
        <td><span>����QQ</span></td>
        <td><span>${sellerDetail.QQ }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><span>���ͼ�¼</span></td>
        <td><span>��</span></td>
    </tr>
     <tr class="m-00" align="center">
        <td><span>�̵�����</span></td>
        <td><span>${sellerDetail.shopDescriptions }</span></td>
    </tr>
   
</table>
<table align="center">
    <tr>
      <td><a href="${pageContext.request.contextPath}/sellerList.do" >����</a></td>
  </tr>
</table>
</div>
</div>
</div>
</div>
</div>



</body>
</html>
