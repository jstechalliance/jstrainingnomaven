<%@page import="java.io.*"%>
<%@include file="../common/chk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>JS Informatics</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="../resources/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
</head>
<body>
 
 <div id="templatemo_wrapper_outer">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title">
                    <h1><a href="http://www.jsinformatics.com">JS Informatics<span>Passion to Excel...</span></a></h1>
                </div>
                <!-- end of site_title -->
				
				<ul id="social_box" style="margin-bottom: -10px;">
					<li><a href="https://www.facebook.com/pages/J-S-Informatics/139323982806197"><img src="../resources/images/facebook.png" alt="facebook" /></a></li>
					<li><a href="#"><img src="../resources/images/twitter.png" alt="twitter" /></a></li>
					<li><a href="#"><img src="../resources/images/linkedin.png" alt="linkin" /></a></li>
					<li><a href="https://maps.google.co.in/maps?f=q&source=s_q&hl=en&geocode=&authuser=0&q=Trade%20Center,%20South%20Tukoganj,%20Tukoganj,%20Indore,%20MP&aq=&vps=3&jsv=470c&sll=22.725588,75.865818&sspn=0.00147,0.002411&vpsrc=6&ie=UTF8&oi=georefine&ct=clnk&cd=1&spell=1"><img src="../resources/images/gmap-icon.png" alt="linkin" /></a></li>
					<p style="text-align: right; color: white;">+91-731-4263751</p>
				</ul>
				
                <div class="cleaner">             	
                </div>
            </div>

			<div id="wrap">
				
					<%
						String requestedPagePath = request.getServletPath();
						String requestedPageName = new File(requestedPagePath).getName();
						String homeClass = "class='current-menu-item'";
						String enquiryClass = "";
						String registrationClass = "";
						String paymentClass = "";
						String expanceClass = "";
						String employeeClass = "";
						if (requestedPageName.equalsIgnoreCase("home.jsp")) {
							homeClass = "class='current-menu-item'";
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
							enquiryClass = "class='current-menu-item'";
							registrationClass = "";
							paymentClass = "";
							expanceClass = "";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("registration.jsp")) {
							homeClass = "";
							enquiryClass = "";
							registrationClass = "class='current-menu-item'";
							paymentClass = "";
							expanceClass = "";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("payment.jsp")) {
							homeClass = "";
							enquiryClass = "";
							registrationClass = "";
							paymentClass = "class='current-menu-item'";
							expanceClass = "";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("expance.jsp")) {
							homeClass = "";
							enquiryClass = "";
							registrationClass = "";
							paymentClass = "";
							expanceClass = "class='current-menu-item'";
							employeeClass = "";
						} else if (requestedPageName.equalsIgnoreCase("employee.jsp")) {
							homeClass = "";
							enquiryClass = "";
							registrationClass = "";
							paymentClass = "";
							expanceClass = "";
							employeeClass = "class='current-menu-item'";
						}
					%>
					<header>
                    <div class="inner relative">
                        <nav id="navigation"> 
				<ul id="main-menu">
					<li <%=homeClass%>><a href="home.jsp" >Home</a></li>
					<li <%=enquiryClass%>><a href="enquiry.jsp" >Enquiry</a></li>
					<li <%=registrationClass%>><a href="registration.jsp" >Registration</a></li>
					<li <%=paymentClass%>><a href="payment.jsp" >Payment</a></li>
					<li <%=expanceClass%>><a href="expance.jsp" >Expense</a></li>
					<li><a href="employee.jsp">Employee</a></li>
					<li><a href="#" id="id_show_changePassword_dialog">Settings</a></li>
					<li><a href="../common/logout.jsp">Logout</a></li>
				</ul>
				
				 
                        </nav>
                        <div class="clear"></div>
                    </div>
                </header> 
				
			</div>
			<!-- end of templatemo_menu -->
			