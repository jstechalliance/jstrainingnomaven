<%@include file="../common/chk.jsp"%>
<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.WebEnquiryController"%>
<%@page import="java.util.List"%>
<%@page import="com.js.dto.WebEnquiryDTO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>J S Informatics</title>
<meta name="keywords"
	content="glossy box, web design, colorful background, free templates, website templates, CSS, HTML" />
<meta name="description"
	content="Glossy Box | free website template with a colorful background" />
<link href="../templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="../css/jquery.ennui.contentslider.css" rel="stylesheet"
	type="text/css" media="screen,projection" />



</head>
<body>

	<div id="templatemo_wrapper_outer">
		<div id="templatemo_wrapper">

			<div id="templatemo_header">
				<div id="site_title">
					<h1>
						<a href="http://www.jsinformatis.com">J S Informatics<span>Passion
								to Excel</span></a>
					</h1>
				</div>
				<!-- end of site_title -->

				<ul id="social_box">
					<li><a href="#"><img src="../images/facebook.png"
							alt="facebook" /></a></li>
					<li><a href="#"><img src="../images/twitter.png"
							alt="twitter" /></a></li>
					<li><a href="#"><img src="../images/linkedin.png"
							alt="linkin" /></a></li>
					<li><a href="#"><img src="../images/technorati.png"
							alt="technorati" /></a></li>
					<li><a href="#"><img src="../images/myspace.png"
							alt="myspace" /></a></li>
				</ul>

				<div class="cleaner"></div>
			</div>

			<div id="templatemo_menu">
				<ul>
					<li><a href="home.jsp" class="current">Home</a></li>
					<li><a href="enquiry.jsp">Enquiry</a></li>
					<li><a href="registration.jsp">Registration</a></li>
					<li><a href="payment.jsp">Payment</a></li>
					<li><a href="expance.jsp">Expanse</a></li>
					<li><a href="employee.jsp">Employee</a></li>
					<li><a href="#" id="id_show_changePassword_dialog">Settings</a></li>
					<li><a href="../common/logout.jsp">Logout</a></li>
				</ul>
			</div>
			<!-- end of templatemo_menu -->
			



			<br />

			<div id="templatemo_content_wrapper">
				<div id="content">
					<div class="latestEvent">
						<div style="float: left;">
							<h6>Welcome <%=request.getSession(false).getAttribute("USERFULLNAME")%></h6>
						</div>
						
					</div>
					<div class="hr_divider"></div>

					<div class="leftContent" style="width: 840px;">

						<%
							WebEnquiryController webEnquiryController = JSIBeanFactory.getBean(WebEnquiryController.class);
							List<WebEnquiryDTO> dtos = webEnquiryController.getAllWebInquiryByDateWise();
						%>
						<h4
							style="font-size: 18px; text-align: center; width: 100%; font-style: normal; float: right;">Web
							Enquiry</h4>

						<div id="training_enquiry_active_list_div"
							style="height: 310px; display: block; width: 840px; border: solid 2px #222222; overflow-x: scroll; overflow-y: scroll;">
							<table border="4" cellpadding="0" cellspacing="0" width="1024px">
								<thead>
									<tr>
										<th width="4%"><a href="#">S.no</a></th>
										<th width="10%"><a href="#">Full Name</a></th>
										<th width="10%"><a href="#">Contact No</a></th>
										<th width="10%"><a href="#">Course</a></th>
										<th width="10%"><a href="#">Enquiry Date</a></th>
										<th width="10%"><a href="#">Reference</a></th>
										<th width="16%"><a href="#">Email</a></th>
										<th width="10%"><a href="#">Operation</a></th>
									</tr>
									<thead>
							</table>
							<%
								int count = 0;
								for (WebEnquiryDTO dto : dtos) {
							%>
							<table border='1' cellpadding='0' cellspacing='0' width="1024px">
								<tr>
									<td width="4%"><%=count%></td>
									<td width="10%"><%=dto.getName()%></td>
									<td width="10%"><%=dto.getContactno()%></td>
									<td width="10%"><%=dto.getCourse()%></td>
									<td width="10%"><%=dto.getEnquiry_date()%></td>
									<td width="10%"><%=dto.getReferance()%></td>
									<td width="16%"><%=dto.getEmail()%></td>
									<td width="10%" align="center"><a
										href="enquiry.jsp?web_enq_id=<%=dto.getId()%>">More
											Detail</td>
								</tr>
							</table>
							<%
								count++;
								}
							%>
							</table>
						</div>

					</div>

					<div class="rightContent">
						





					</div>

					<div class="cleaner"></div>
				</div>
				<div class="cleaner"></div>
			</div>

			<div id="templatemo_content_wrapper_bottm"></div>

			<div id="templatemo_footer">

				Copyright © 2013 <a href="http://www.jsinformatics.com">J S
					Informatics</a> | Designed by <a href="" target="_parent">Prashanna
					Gupta</a>

			</div>

		</div>
		<!-- end of wrapper -->
	</div>
	<!-- end of wrapper_outer -->

</body>
</html>