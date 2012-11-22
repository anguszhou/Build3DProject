<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page contentType="text/html; charset=gbk"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>卖家详情</title>
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

<table align="center">
   <tr >
     <td>
      <img src="images/title.gif" />
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
      <td><a href="后台管理02.html" class="text004">返回</a></td>
      <td><span class="text004">退出管理</span></td>
  </tr>
</table>

<table align="center">
    <tr class="m-00" align="center">
        <td width="200"><span>卖家姓名</span></td>
        <td width="300"><span>${sellerDetail.realName }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><span>卖家编号</span></td>
        <td><span>${sellerDetail.id }</span></td>
    </tr>
    <tr class="m-00" align="center">
        <td><span>卖家信誉</span></td>
        <td><span>${sellerDetail.credit }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><span>商店名称</span></td>
        <td><span>${sellerDetail.shopName }</span></td>
    </tr>
    <tr class="m-00" align="center">
        <td><span>卖家QQ</span></td>
        <td><span>${sellerDetail.QQ }</span></td>
    </tr>
    <tr class="m-01" align="center">
        <td><span>奖惩记录</span></td>
        <td><span>无</span></td>
    </tr>
     <tr class="m-00" align="center">
        <td><span>商店描述</span></td>
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
