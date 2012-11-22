<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	<script language="JavaScript" type="text/javascript" src="js/wysiwyg.js"></script> 
	<script language="JavaScript" type="text/javascript" src="js/wysiwyg-settings.js"></script> 
	<script type="text/javascript">
    // attach the editor to all textareas of your page.
   	WYSIWYG.attach('textarea3', small);
    // attach the editor to the textarea with the identifier 'textarea1'.
	</script> 
</head>

<body>
<div id="mainPan">
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="left">
		<jsp:include page="left.jsp"></jsp:include>
	</div>
	<div id="leftPan">
	</div>
	  <div id="middle_pan">
		<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/feedback.do" method="post">
			<table>
				<tr>
					<p>${feedback.time}
					<c:if test="{$feedback.reviewer == 0}">
						${feedback.companyInfo.name}
					</c:if>
					<c:if test="{$feedback.reviewer == 1}">
						花旗银行
					</c:if>
					</p>
				</tr>
				<tr>
					<p>${feedback.description}</p>
				</tr>
			
			</table>
			
			<textarea id="textarea3" name="test3"rows="3" cols="50" value="description"></textarea>
			
		
		       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="提交" style="margin-right:100px;"/>
											&nbsp;
				<input type="reset" value="取消" />
		</form>
	 </div>
	<div class="right">
		<jsp:include page="right.jsp"></jsp:include>
		</div>
		
		<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</div>
</body>
</html>