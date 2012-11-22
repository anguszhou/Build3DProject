<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page import="xjtu.citi.chart.ScoreHistoryChart"%>
	<%@ page import="xjtu.citi.chart.IndustryRankHistoryChart"%>
	<%@ page import="xjtu.citi.chart.RankHistoryChart"%>
	<%@ page import="xjtu.citi.chart.RiskLevelHistoryChart"%>
	<%@ page import = "java.io.PrintWriter" %>
	<% ScoreHistoryChart scoreChart=new ScoreHistoryChart(); 
	String fileName_score=scoreChart.getScoreChart(session,new PrintWriter(out),Integer.parseInt(request.getSession().getAttribute("companyinfoId").toString())); 
	String graphURL_score = request.getContextPath() + "/servlet/DisplayChart?filename=" + fileName_score; %> 
	<% IndustryRankHistoryChart inRankChart=new  IndustryRankHistoryChart();
	String fileName_inRank=inRankChart.getInRankChart(session,new PrintWriter(out),Integer.parseInt(request.getSession().getAttribute("companyinfoId").toString()));
	String graphURL_inRank = request.getContextPath() + "/servlet/DisplayChart?filename=" + fileName_inRank; %>
	<% RankHistoryChart RankChart=new  RankHistoryChart();
	String fileName_Rank=RankChart.getRankChart(session,new PrintWriter(out),Integer.parseInt(request.getSession().getAttribute("companyinfoId").toString()));
	String graphURL_Rank = request.getContextPath() + "/servlet/DisplayChart?filename=" + fileName_Rank; %>
	<% RiskLevelHistoryChart RiskChart=new  RiskLevelHistoryChart();
	String fileName_Risk=RiskChart.getRiskLevelChart(session,new PrintWriter(out),Integer.parseInt(request.getSession().getAttribute("companyinfoId").toString()));
	String graphURL_Risk = request.getContextPath() + "/servlet/DisplayChart?filename=" + fileName_Risk; %>
<head>

	<title>XJTU-ME</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<%@ page contentType="text/html; charset=GBK"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<link type="text/css" href="jquery.ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="js/jquery.ui.core.js"></script>
	<script type="text/javascript" src="js/jquery.ui.widget.js"></script>

	<script type="text/javascript" src="js/jquery.ui.datepicker.js"></script>
	<link type="text/css" href="demos.css" rel="stylesheet" />
	
	
	<script type="text/javascript" language="javascript">
	$(function setdate() {
		$("#datepicker").datepicker();
		$("#format").change(function setdate() { $('#datepicker').datepicker('option', {dateFormat: $(this).val()}); });
	});
	</script>
	
	
	<script language="JavaScript" type="text/javascript" src="js/wysiwyg.js"></script> 
	<script language="JavaScript" type="text/javascript" src="js/wysiwyg-settings.js"></script> 
	<script type="text/javascript">
    // attach the editor to all textareas of your page.
   	WYSIWYG.attach('textarea3', small);
    // attach the editor to the textarea with the identifier 'textarea1'.
	</script> 
	<script language="javascript">
			function check_null(caller)
			{				
				if(caller.value.length == 0)
				{
					alert("该项不能为空");										
				}
			}
		</script>
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
	<div id="middlePan">
	  <div class="abgne_tab"> 
		<ul class="tabs"> 
			<li><a href="#tab10">电子护照</a></li> 
			<li><a href="#tab1">信息反馈</a></li> 
			<li><a href="#tab2">数据查询</a></li> 
			<li><a href="#tab3">用户管理</a></li> 
		</ul> 
		<table></table>
		
							
		
		<div class="tab_container">
			<div id="tab10" class="tab_content"> 
			<br /><br /><h4>电子护照</h4><br /><br />
				<div id="passport">
					<div id="passportinfo">
						<form name="form1" style="padding-left: 1%;" action="${pageContext.request.contextPath}/passport.jsp" method="post">
						<br /><br /><br /><br />
						<table style="padding-up:20%;">
							<tr>
								<td width="80">
								企业名称：
								</td>
								<td>
								${companyinfo.name}
								</td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td width="80">
								行业名称：
								</td>
								<td>
								${companyinfo.industrytype.name}
								</td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td>
								企业法人：
								</td>
								<td>
								${companyinfo.legal}
								</td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td>
								联系电话：
								</td>
								<td>
								${companyinfo.telephone}
								</td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td>
								签发日期：
								</td>
								<td>
								2010-8-22
								</td>
							</tr>
							<tr></tr>
						</table>
						<br /><br /><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="进入印章页" style="margin-right:20px;"/>
						</form>				
					</div>
				</div>
			</div> 
			<div id="tab1" class="tab_content"> 
				<form name="form1" style="padding-left: 5%;" action="${pageContext.request.contextPath}/feedback.do" method="post">
				<br /><br /><h4>留言板</h4><br /><br />
				<table width="400">
				<c:forEach items="${feedbacks}" var="feedback"
								varStatus="varStatus">
					<tr width="400">
						<p>第${varStatus.count}条 &nbsp;&nbsp;&nbsp;&nbsp; ${feedback.time}&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${feedback.reviewer == 0}">
							${feedback.companyInfo.name}
						</c:if>
						<c:if test="${feedback.reviewer == 1}">
							花旗银行
						</c:if>
						</p>
					</tr>
					<tr width="400">
					<p>&nbsp;&nbsp;&nbsp;&nbsp;${feedback.description}</p>
				</tr>
				<tr>
				<p>-----------------------------------------------------------------------</p>
				</tr>
				</c:forEach>
			</table>
			<div>
				<textarea id="textarea3" name="description"rows="3" cols="50" value="description"></textarea>
			</div>
			<br />
		       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="提交" style="margin-right:100px;"/>
											&nbsp;
				<input type="reset" value="取消" />
				
			</form>
			
		</div> 
			
			<div id="tab2" class="tab_content"> 
				 <div class="abgne_tab"> 
				 <br /><br /><h4>信息查询</h4><br /><br />
		<ul class="tabs"> 
			<li><a href="#tab4">分值</a></li> 
			<li><a href="#tab5">风险等级</a></li> 
			<li><a href="#tab6">行业排名</a></li> 
			<li><a href="#tab7">总排名</a></li> 
			<li><a href="#tab8">搜索</a></li> 
		</ul> 
		<table></table>
		<div class="tab_container"> 
			<div id="tab4" class="tab_content"> 
			<table>
				<tr>
					<td><span>企业名称：</span></td>
					<td><span>${user.companyinfo.name }</span></td>
				</tr>
			</table>
			  
				<img src="<%= graphURL_score %>" width=500 height=300 border=0 usemap="<%= fileName_score %>"></img>
			</div> 
			
			<div id="tab5" class="tab_content"> 
				<table>
				<tr>
					<td><span>企业名称：</span></td>
					<td><span>${user.companyinfo.name }</span></td>
				</tr>
				</table >
				
			  		<img src="<%= graphURL_Risk %>" width=500 height=300 border=0 usemap="<%= fileName_Risk %>"></img>
			  	</div>
			  <div id="tab6" class="tab_content"> 
			  	<table>
				<tr>
					<td><span>企业名称：</span></td>
					<td><span>${user.companyinfo.name }</span></td>
				</tr>
				</table>
				
			  		<img src="<%= graphURL_inRank %>" width=500 height=300 border=0 usemap="<%= fileName_inRank %>"></img>
			  	</div>
			  	<div id="tab7" class="tab_content"> 
			  		<table>
					<tr>
						<td><span>企业名称：</span></td>
						<td><span>${user.companyinfo.name }</span></td>
					</tr>
					</table>	<img src="<%= graphURL_Rank %>" width=500 height=300 border=0 usemap="<%= fileName_Rank %>"></img>  
			  	</div>
			  	
			 
			 <div id="tab8" class="tab_content"> 
			  	<form name="form1" style="padding-left: 3%;" action="${pageContext.request.contextPath}/companysearch.do" method="post">
			  		<table>
						<tr>
													
							<td align="center">
								查询日期：&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td>
							
							
								<input type="text"  name="lo" value="" size="12" />
									---
								<input type="text"  name="mo" value="" size="12"/>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="搜索" style="margin-right:100px;"/>
							</td>
						</tr>
			  		</table>
				</form>
				
				<div class="details">
			  		<table class="history_talbe">
							<tr>
								<td align="center" width="80">
									时间
								</td>
								<td align="center" width="80">
									风险等级
								</td>
								<td align="center" width="80">
									行业排名
								</td>
								<td align="center" width="80">
									分值
								</td>
								<td align="center" width="80">
									总排名
								</td>
							</tr>
							<c:forEach items="${sm}" var="sminfo"
								varStatus="varStatus">
								<tr>
									 <td align="center"> 
										${sminfo.time}
									</td>
								
									<td align="center" >
										${sminfo.risklevel}
									</td>
									<td align="center">
										${sminfo.industryrank}
									</td>
									<td align="center">
										${sminfo.score}
									</td>
									<td align="center">
										${sminfo.rank}
									</td>
									
								</tr>
							</c:forEach>
						</table>
			  		</div>
			</div> 
		</div> 
	</div>
	</div>
	<div id="tab3" class="tab_content"> 
			  	<form name="form1" style="padding-left: 3%;" action="${pageContext.request.contextPath}/companyModify.do" method="post">
				<br /><br /><h4>密码修改</h4><br /><br />
				<table border=1>
					<tr>
						<td align="center" width="100" height="35" >
							用户名：
						</td>
							<td  width="440">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.username}
							</td>					
					</tr>
					
					
					
					<tr>
						<td align="center" width="100" height="35">
							新密码：
						</td>
						<td width="340">
							<input type="password"  name="password" onblur="check_null(this);"/>
							<font color="red">密码由6-20个字母或数字组成</font>
						</td>
					</tr>	                    
				</table>
				<br />
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="确定" style="margin-right:100px;"/>
													&nbsp;
						<input type="reset" value="重置" />
												
				</form>
				<br />
			  </div>
			</div> 
		</div> 
		</div>
	</div> 
	
		<div class="right">
		<jsp:include page="right1.jsp"></jsp:include>
		</div>
		
		<div class="footer">
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</div>
</body>
</html>