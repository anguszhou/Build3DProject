<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<%@ page contentType="text/html; charset=gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<title>�������</title>
<link href="style00.css" rel="stylesheet" type="text/css" />
</head>

<body>

<table align="center">
   <tr >
     <td>
      <img src="images/title.gif" />
     </td>
   </tr>       
</table>

<table align="center">
  <tr>
    <td width="100"><a href="buyList.do" class="text004">��ҹ���</a></td>
      <td width="100"><a href="sellList.do" class="text004">���ҹ���</a></td>
      <td width="100"><a href="��̨����-Ͷ�߼�¼.html" class="text004">Ͷ�߼�¼</a></td>
      <td width="100"><a href="��̨����-���ͼ�¼.html" class="text004">���ͼ�¼</a></td>
      <td width="400"></td>
      <td><a href="buyList.jsp" class="text004">����</a></td>
      <td><span class="text004">�˳�����</span></td>
  </tr>
</table>

<table align="center">

    <tr class="m-00" align="center">
        <td width="200"><strong>�������</strong></td>
        <td width="300"><span>${userDetail.name }</span></td>
    </tr>
   
    <tr class="m-00" align="center">
        <td><strong>��������</strong></td>
        <td><span>${userDetail.contcatInfo.email }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><strong>�ֻ�����</strong></td>
        <td><span>${userDetail.contcatInfo.cellPhone }</span></td>
    </tr>
    <tr class="m-00" align="center">
        <td><strong>��ַ</strong></td>
        <td><span>${userDetail.contcatInfo.address }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><strong>���ͼ�¼</strong></td>
        <td><span>��</span></td>
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
