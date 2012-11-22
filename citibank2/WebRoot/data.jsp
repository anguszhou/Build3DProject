<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	
</head>
<script language="JavaScript">
function BrowseFolder(){   
try{   
var Message = "请选择文件夹"; //选择框提示信息   
var Shell = new ActiveXObject( "Shell.Application" );   
var Folder = Shell.BrowseForFolder(0,Message,0x0040,0x11);//第四个参数，为0x11或17表示起始目录为：我的电脑   
//var Folder = Shell.BrowseForFolder(0,Message,0); //起始目录为：桌面   
if(Folder != null){   
    Folder = Folder.items(); // 返回 FolderItems 对象   
    Folder = Folder.item(); // 返回 Folderitem 对象   
    Folder = Folder.Path;   // 返回路径   
    if(Folder.charAt(Folder.length-1) != "\\"){   
      Folder = Folder + "\\";   
    }   
    document.getElementById("savePath").value=Folder;   
    return Folder;   
}   
}catch(e){    
alert(e.message);   
}   
}
</script>
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
		<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/backup.do" method="post">
		
		
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="数据备份" style="margin-right:100px;"/>
				<input type="button" value="选择路径" onclick="BrowseFolder()" />
											<input type="text" id="savePath" name="savePath" />
											&nbsp;
				
										
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