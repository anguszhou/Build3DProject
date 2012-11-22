<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>Consultant</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	<script language="JavaScript" type="text/javascript" src="js/jquery.min.js"></script> 
	<script type="text/javascript"> 
		$(function(){
			// 预设显示第一个 Tab
			var _showTab = 0;
			$('.abgne_tab').each(function(){
				// 目前的页签区号
				var $tab = $(this);
	 
				$('ul.tabs li', $tab).eq(_showTab).addClass('active');
				$('.tab_content', $tab).hide().eq(_showTab).show();
				
				
				$('ul.tabs li', $tab).click(function() {
				
					var $this = $(this),
						_clickTab = $this.find('a').attr('href');
					
					$this.addClass('active').siblings('.active').removeClass('active');
					
					$(_clickTab).stop(false, true).fadeIn().siblings().hide();
	 
					return false;
				}).find('a').focus(function(){
					this.blur();
				});
			});
		});
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
	

	<div class="middle">
	  <div class="abgne_tab"> 
		<ul class="tabs"> 
			<li><a href="#tab1">参数设置</a></li> 
			<li><a href="#tab2">预警临界值设置</a></li> 
		</ul> 
 
		<div class="tab_container"> 
			<div id="tab1" class="tab_content"> 
			  <form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/parameter.do" method="post">
				<p>核心企业筛选</p>
				<table align="center">
					<tr>
						<td width="130" height="35" >
							资金流量系数：
						</td>
							<td width="200">
								<input type="text" value="${parameter.cashflow }" size="20" name="cashflow" />
							</td>
					</tr>
					
					<tr>
						<td width="130" height="35">
							注册资本金系数：
						</td>
						<td width="200">
							<input type="text" value="${parameter.registfund }" name="registfund"/>
						</td>
					</tr>
					
					<tr>
						<td width="130" height="35">
							上市公司系数：
						</td>
						<td>
							<input type="text" value="${parameter.listedcomp }"size="20" name="listedcomp" />
						</td>
					</tr>
					
					<tr>
						<td width="130" height="35">
							大公司筛选百分比：
						</td>
						<td>
							<input type="text" value="${parameter.corecomp }"size="20" name="corecomp"  />
						</td>
					</tr>	                    
				</table>
				
				<p>优质中小企业筛选</p>
				<table align="center">
					
					<tr>
						<td width="130" height="35" >
							大企业资金净流入到被打分企业且路径为一的系数：
						</td>
							<td width="200">
								<input type="text" value="${parameter.ain }"size="20" name="ain" />
							</td>
					</tr>
					
					<tr>
						<td width="130" height="35">
							被打分企业资金净流入到大企业且路径为一的系数：
						</td>
						<td width="200">
							<input type="text" value="${parameter.aout }"name="aout";"/>
						</td>
					</tr>
					
					<tr>
						<td width="130" height="35">
							小企业资金净流入到被打分企业且路径为一的系数：
						</td>
						<td>
							<input type="text" value="${parameter.bin }"size="20" name="bin" />
						</td>
					</tr>
					
					<tr>
						<td width="130" height="35">
							被打分企业资金净流入到小企业且路径为一的系数：
						</td>
						<td>
							<input type="text" value="${parameter.bout }" size="20" name="bout"  />
						</td>
					</tr>	                    
				</table>
				
				
		
		
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="确定" style="margin-right:100px;"/>
											&nbsp;
				<input type="reset" value="重置" />
										
		</form>
	</div> 
			<div id="tab2" class="tab_content"> 
				<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/warnparameter.do" method="post">
		<p>预警临界值设置</p>
		<table align="center">
			<tr>
				<td width="130" height="35">
					预警临界值：
				</td>
				<td>
					<input type="text" value="${warnparameter.value }"size="20" name="listedcomp" />
				</td>
			</tr>
					
		</table>
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="确定" style="margin-right:100px;"/>
											&nbsp;
				<input type="reset" value="重置" />
										
		</form>
			</div> 
		</div> 
	</div> 
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