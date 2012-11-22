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
						����
					</div>

					<div class="feat_prod_box_details">
						
						<div class="contact_form" style="margin-left: 150px; width: 65%;">
							<div class="form_subtitle">
								��������Ҫ�ıʼǱ�
							</div>

							<form style="padding-left: 5%;" 
							action="${pageContext.request.contextPath}/search.do"
								method="post">
								<table>
									<tr>
										<td>
											Ʒ�ƣ�
										</td>
										<td>
											<input name="category"/>
											<font color="red">���磺���������գ������</font>
										</td>
									</tr>
									<tr>
										<td>
											�ͺţ�
										</td>
										<td>
											<input name="model"/>
                                            <font color="red">���磺������'11z'</font>
										</td>
									</tr>
									<tr>
										<td>
											���ͣ�
										</td>
										<td>
											<select name = type>
											    <option value="100">
													����
												</option>
												<option>ȫ��ѧ����</option>
												<option>ʱ�����˱�</option>
												<option>��������</option>
												<option>��ϷӰ����</option>
												<option>�ճ��칫��</option>
											</select>                                           
										</td>
									</tr>
									<tr>
										<td>
											�۸����䣺
										</td>
										<td>
											<input type="text"  name="lo" value="1" size="6"/>
											Ԫ---
											<input type="text"  name="mo" value="9999999" size="6"/>
											Ԫ
										</td>
									</tr>
									<tr>
										<td>
											��Ļ�ߴ磺
										</td>
										<td>
											<select name="size">
												<option value="20">
													����
												</option>
												<option value="11">
													12����
												</option>
												<option value="12">
													12��
												</option>
                                                <option value="13">
													13��
												</option>
                                                <option value="14">
													14��
												</option>
                                                <option value="15">
													15��
												</option>
                                                <option value="16">
													16��
												</option>
												<option value="17">
													17������
												</option>
                                              </select>
										</td>
										
									</tr>
									<tr>
										<td>
											CPU�ͺţ�
										</td>
										<td>
											<input name="cpu" />
                                            <font color="red">�磺���2 7250</font>
										</td>
									</tr>
                                    <tr>
										<td>
											Ӳ��������
										</td>
										<td>
											<select name = disk>
												<option value="1">����</option>
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
									<input type="submit" value="����" style="margin-right:50px;"/>
									&nbsp;
									<input type="reset" value="����" />
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