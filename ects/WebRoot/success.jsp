<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Auto Parts</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	
	<%@ page contentType="text/html; charset=gbk"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

	<script language="javascript">
		function check_num(caller)
		{
			if(caller.value<1)
			{
				alert('�Բ��𣬲�Ʒ��������С�� 1 ');
				caller.focus();
			}
		}
	</script>
</head>
<body>
<div id="wrap">
		<!-- ���� -->
		<div class="header">
			<jsp:include page="common/menu.jsp"></jsp:include>
		</div>
       <div class="center_content">
       	
        
        <div class="left_content">  
        
        </div><!--end of right content-->
        
        <div class="right_content">            
        
        	<div class="feat_prod_box_details">
            	
	              	<div class="contact_form" style="margin-left: 70px;">
		              	<script language="javascript">
		              		function modifyTime()
		              		{
		              			if( time == 1)
			              		{
			              			clearInterval(timer);
			              			
			              			if(${success}==true)
			              			{
			              				location ="productList.jsp";
			              			}
			              			else
			              			{
			              				history.go(-1);
			              			}
			              		}
			              		else
			              		{
			              		    time = time - 1;
			              			if(${success}==true)
			              			{
			              				document.getElementById('message').innerText = 'ϵͳ����' + time + '���Ӻ󷵻���ҳ';
			              			}
			              			else
			              			{
			              				document.getElementById('message').innerText = 'ϵͳ����' + time + '���Ӻ󷵻�ǰһҳ';
			              			}			              			
			              		}
		              		}
		              		var time = 3;	
		              		var timer = setInterval(modifyTime,1000);
		              	</script>
		             <div style="text-align: center">
	                	<div ><h2>${message}</h2></div>
	                	<div style="margin-top: 30px;">
		                	<h3>		                	 
		                		<a href="${pageContext.request.contextPath}/index.jsp">������ҳ</a>
		                		<br/>
		                		<a href="#" onclick="history.go(-1);">����ǰһҳ</a>
		                	</h3>
						</div>
						<c:if test="${success == true }">
							<div style="margin-top:50px;"><h3 id="message" >ϵͳ����3���Ӻ󷵻���ҳ</h3></div>
						</c:if>
						<c:if test="${success == false}">
							<div style="margin-top:50px;"><h3 id="message" >ϵͳ����3���Ӻ󷵻�ǰһҳ</h3></div>
						</c:if>  
						</div>
							   
	                </div>  
            </div>
            
        <div class="clear"></div>
        </div>
       
       
       <div class="clear"></div>
       </div>       
              
       <!-- ���� -->
	   <jsp:include page="common/footer.jsp"></jsp:include>
    

</div>

</body>
</html>