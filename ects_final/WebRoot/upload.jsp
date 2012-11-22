<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Jewelry Shop</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
  
  <body vLink="#006666" link="#003366" bgColor="#E0F0F8">
     <tr>
		<td width="366">
       		<input  id="productId" name="productId" type="hidden" value="${product.product_id}"  />
			
		</td>
</tr>
     <form name="upform" action="UploadServlet" method="post" enctype="multipart/form-data">  
     <input type ="file" name="file1" id="file1"/><br/>        
              <input type="submit" value="上传" /><br/>    
               <input type="reset" /> 
      </form>


<script language="vbscript">
 Function Foder()
   Const MY_COMPUTER = &H11&
  Const WINDOW_HANDLE = 0
  Const OPTIONS = 0
  
  Set objShell = CreateObject("Shell.Application")
  Set objFolder = objShell.Namespace(MY_COMPUTER)
  Set objFolderItem = objFolder.Self
  strPath = objFolderItem.Path
  
  Set objShell = CreateObject("Shell.Application")
  Set objFolder = objShell.BrowseForFolder _
      (WINDOW_HANDLE, "请选择文件夹:", OPTIONS, strPath) 
        
  If objFolder Is Nothing Then
      exit Function
  End If
  
  Set objFolderItem = objFolder.Self
  objPath = objFolderItem.Path

  document.frmList.FODER_PATH.value = objPath
  
 End Function
</script>

<input type = "button" name = "path" size = "100" onclick="Foder()" value="选择文件夹" />
</body>
</html>
