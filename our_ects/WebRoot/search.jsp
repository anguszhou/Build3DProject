<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Auto Parts</title>
		<link rel="stylesheet" type="text/css" href="style.css" />

		<%@ page contentType="text/html; charset=gbk"%>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	</head>
	<body>
		<div id="wrap">

			<div class="header">
				<jsp:include page="common/menu.jsp"></jsp:include>
			</div>
			<div class="center_content">

				<div>
					<div class="title" style="margin-left: 150px;">
						<span class="title_icon"><img src="images/bullet1.gif" />
						</span>
						搜索
					</div>

					<div class="feat_prod_box_details">
						
						<div class="contact_form" style="margin-left: 150px; width: 65%;">
							<div class="form_subtitle">
								搜索我想要的笔记本
							</div>

							<form style="padding-left: 5%;" 
							action="${pageContext.request.contextPath}/search.do"
								method="post">
								<table>
									<tr>
										<td>
											品牌：
										</td>
										<td>
											<input name="category"/>
											<font color="red">例如：戴尔，惠普，联想等</font>
										</td>
									</tr>
									<tr>
										<td>
											型号：
										</td>
										<td>
											<input name="model"/>
                                            <font color="red">例如：戴尔的'11z'</font>
										</td>
									</tr>
									<tr>
										<td>
											类型：
										</td>
										<td>
											<select name = type>
											    <option value="100">
													不限
												</option>
												<option>全能学生本</option>
												<option>时尚丽人本</option>
												<option>沉稳商务本</option>
												<option>游戏影音本</option>
												<option>日常办公本</option>
											</select>                                           
										</td>
									</tr>
									<tr>
										<td>
											价格区间：
										</td>
										<td>
											<input type="text"  name="lo" value="1" size="6"/>
											元---
											<input type="text"  name="mo" value="9999999" size="6"/>
											元
										</td>
									</tr>
									<tr>
										<td>
											屏幕尺寸：
										</td>
										<td>
											<select name="size">
												<option value="20">
													不限
												</option>
												<option value="11">
													12以下
												</option>
												<option value="12">
													12寸
												</option>
                                                <option value="13">
													13寸
												</option>
                                                <option value="14">
													14寸
												</option>
                                                <option value="15">
													15寸
												</option>
                                                <option value="16">
													16寸
												</option>
												<option value="17">
													17寸以上
												</option>
                                              </select>
										</td>
										
									</tr>
									<tr>
										<td>
											CPU型号：
										</td>
										<td>
											<input name="cpu" />
                                            <font color="red">如：酷睿2 7250</font>
										</td>
									</tr>
                                    <tr>
										<td>
											硬盘容量：
										</td>
										<td>
											<select name = disk>
												<option value="1">不限</option>
												<option value="120G">120G</option>
												<option value="160G">160G</option>
												<option value="250G">250G</option>
												<option value="320G">320G</option>
												<option value="500G">500G</option>
											</select> 
										</td>
									</tr>
								</table>
								<div class="form_row"/>
								<center>
									<input type="submit" value="搜索" style="margin-right:50px;"/>
									&nbsp;
									<input type="reset" value="重置" />
								</center>
								<br />
							</form>
						</div>

					</div>
					<div class="clear"></div>
				</div>

				<div class="clear"></div>
			</div>
			<jsp:include page="common/footer.jsp"></jsp:include> 
		</div>

	</body>
</html>