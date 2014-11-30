<%@include file="../common/chk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.io.File"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>J S Informatics</title>
<meta name="keywords"
	content="glossy box, web design, colorful background, free templates, website templates, CSS, HTML" />
<meta name="description"
	content="Glossy Box | free website template with a colorful background" />
<link href="../resources/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/jquery.ennui.contentslider.css" rel="stylesheet"
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
					<li><a href="#"><img src="../resources/images/facebook.png"
							alt="facebook" /></a></li>
					<li><a href="#"><img src="../resources/images/twitter.png"
							alt="twitter" /></a></li>
					<li><a href="#"><img src="../resources/images/linkedin.png"
							alt="linkin" /></a></li>
					<li><a href="#"><img src="../resources/images/technorati.png"
							alt="technorati" /></a></li>
					<li><a href="#"><img src="../resources/images/myspace.png"
							alt="myspace" /></a></li>
				</ul>

				<div class="cleaner"></div>
			</div>

			<div id="templatemo_menu">
				<ul>
					<%
						String requestedPagePath = request.getServletPath();
						String requestedPageName = new File(requestedPagePath).getName();
						String homeClass = "class='current'";
						String enquiryClass = "";
						String registrationClass = "";
						String paymentClass = "";
						String expanceClass = "";
						String employeeClass = "";
						if (requestedPageName.equalsIgnoreCase("home.jsp")) {
							homeClass = "class='current'";
							enquiryClass = "";
							registrationClass = "";
							paymentClass = "";
							expanceClass = "";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("enquiry.jsp")
								|| requestedPageName
										.equalsIgnoreCase("enq_aca_project.jsp")
								|| requestedPageName
										.equalsIgnoreCase("enquiry_visitor.jsp")) {
							homeClass = "";
							enquiryClass = "class='current'";
							registrationClass = "";
							paymentClass = "";
							expanceClass = "";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("registration.jsp")) {
							homeClass = "";
							enquiryClass = "";
							registrationClass = "class='current'";
							paymentClass = "";
							expanceClass = "";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("payment.jsp")) {
							homeClass = "";
							enquiryClass = "";
							registrationClass = "";
							paymentClass = "class='current'";
							expanceClass = "";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("expance.jsp")) {
							homeClass = "";
							enquiryClass = "";
							registrationClass = "";
							paymentClass = "";
							expanceClass = "class='current'";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("employee.jsp")) {
							homeClass = "";
							enquiryClass = "";
							registrationClass = "";
							paymentClass = "";
							expanceClass = "";
							employeeClass = "class='current'";
						}
					%>
					<li><a href="home.jsp" <%=homeClass%>>Home</a></li>
					<li><a href="enquiry.jsp" <%=enquiryClass%>>Enquiry</a></li>
					<li><a href="registration.jsp" <%=registrationClass%>>Registration</a></li>
					<li><a href="payment.jsp" <%=paymentClass%>>Payment</a></li>
					<li><a href="expance.jsp" <%=expanceClass%>>Expanse</a></li>
					<li><a href="employee.jsp" <%=employeeClass%>>Employee</a></li>
					<li><a href="#" id="id_show_changePassword_dialog">Settings</a></li>
					<li><a href="../common/logout.jsp">Logout</a></li>
				</ul>
			</div>
			<!-- end of templatemo_menu -->
			<%
				
			%>