<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<%@ page contentType="text/html; charset=gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<title>买家详情</title>
<link href="style00.css" rel="stylesheet" type="text/css" />
</head>

<body>

<table align="center">
   <tr height="100">
     <td width="1000">
      <img src="images/标题00.gif" />
     </td>
   </tr>       
</table>

<table align="center">
  <tr>
    <td width="100"><a href="buyList.do" class="text004">买家管理</a></td>
      <td width="100"><a href="sellList.do" class="text004">卖家管理</a></td>
      <td width="100"><a href="后台管理-投诉记录.html" class="text004">投诉记录</a></td>
      <td width="100"><a href="后台管理-奖惩记录.html" class="text004">奖惩记录</a></td>
      <td width="400"></td>
      <td><a href="buyList.jsp" class="text004">返回</a></td>
      <td><span class="text004">退出管理</span></td>
  </tr>
</table>

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
    <tr class="m-01" align="center">
        <td><strong>奖惩记录</strong></td>
        <td><span>无</span></td>
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
