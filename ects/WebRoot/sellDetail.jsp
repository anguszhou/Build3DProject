<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page contentType="text/html; charset=gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>��������</title>
<link href="style00.css" rel="stylesheet" type="text/css" />
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

<table>
   <tr height="100">
     <td width="1000">
      <img src="images/����00.gif" />
     </td>
   </tr>       
</table>

<table>
  <tr>
    <td width="100"><a href="buyList.do" class="text004">��ҹ���</a></td>
      <td width="100"><a href="sellList.do" class="text004">���ҹ���</a></td>
      <td width="100"><a href="��̨����-Ͷ�߼�¼.html" class="text004">Ͷ�߼�¼</a></td>
      <td width="100"><a href="��̨����-���ͼ�¼.html" class="text004">���ͼ�¼</a></td>
      <td width="400"></td>
      <td><a href="��̨����02.html" class="text004">����</a></td>
      <td><span class="text004">�˳�����</span></td>
  </tr>
</table>

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
        <td>
            <img src="images/ok.gif" />
        </td>
    </tr>
</table>

</body>
</html>
