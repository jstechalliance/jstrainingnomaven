<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@page import="java.io.File;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>JS Informatics</title>
<meta name="keywords"
	content="java, Android, PHP, Software, Programming,JS Informatics, JEE, Struts, Spring, Hibernate" />
<meta name="description" content="" />
<link href="resources/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="resources/css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
</head>
<body>
	<div id="templatemo_wrapper_outer">
		<div id="templatemo_wrapper">
			<div id="templatemo_header">
				<div id="site_title">
					<h1>
						<a href="http://www.jsinformatics.com">J S Informatics<span>Passion
								to Excel...</span></a>
					</h1>
				</div>
				<!-- end of site_title -->

				<ul id="social_box">
					<li><a href="https://www.facebook.com/pages/J-S-Informatics/139323982806197"><img src="resources/images/facebook.png" alt="facebook" /></a></li>
					<li><a href="#"><img src="resources/images/twitter.png" alt="twitter" /></a></li>
					<li><a href="#"><img src="resources/images/linkedin.png" alt="linkin" /></a></li>
					<li><a href="https://maps.google.co.in/maps?f=q&source=s_q&hl=en&geocode=&authuser=0&q=Trade%20Center,%20South%20Tukoganj,%20Tukoganj,%20Indore,%20MP&aq=&vps=3&jsv=470c&sll=22.725588,75.865818&sspn=0.00147,0.002411&vpsrc=6&ie=UTF8&oi=georefine&ct=clnk&cd=1&spell=1"><img src="resources/images/gmap-icon.png" alt="linkin" /></a></li>
					<p style="text-align: right; color: white;">+91-731-4263751</p>
				</ul>
				<div class="cleaner"></div>
			</div>
			<div id="templatemo_menu">
				<ul>
					<%
						String requestedPagePath = request.getServletPath();
						String requestedPageName = new File(requestedPagePath).getName();
						
						String indexClass = "class=\"current\"";
						String servicesClass = "";
						String careersClass = "";
						String aboutClass = "";
						String contactClass = "";
						String ourproductClass = "";
						String successStory="";
						if (requestedPageName.equalsIgnoreCase("index")) {
							indexClass = "class=\"current\"";
							servicesClass = "";
							careersClass = "";
							ourproductClass = "";
							aboutClass = "";
							contactClass = "";
							successStory="";
						} else if (requestedPageName.equalsIgnoreCase("services.jsp")) {
							indexClass = "";
							servicesClass = "class=\"current\"";
							careersClass = "";
							aboutClass = "";
							contactClass = "";
							ourproductClass = "";
							successStory="";
						} else if (requestedPageName.equalsIgnoreCase("ourproducts.jsp")) {
							indexClass = "";
							servicesClass = "";
							ourproductClass = "class=\"current\"";
							careersClass = "";
							aboutClass = "";
							contactClass = "";
							successStory="";
						} else if (requestedPageName.equalsIgnoreCase("careers.jsp")) {
							indexClass = "";
							servicesClass = "";
							careersClass = "class=\"current\"";
							aboutClass = "";
							ourproductClass = "";
							contactClass = "";
							successStory="";
						} else if (requestedPageName.equalsIgnoreCase("about.jsp")) {
							indexClass = "";
							servicesClass = "";
							careersClass = "";
							ourproductClass = "";
							aboutClass = "class=\"current\"";
							contactClass = "";
							successStory="";
						} else if (requestedPageName.equalsIgnoreCase("contact.jsp")) {
							indexClass = "";
							servicesClass = "";
							careersClass = "";
							ourproductClass = "";
							aboutClass = "";
							successStory="";
							contactClass = "class=\"current\"";
						}
						else if (requestedPageName.equalsIgnoreCase("successStory.jsp") || requestedPageName.equalsIgnoreCase("testimonials.jsp")) {
							indexClass = "";
							servicesClass = "";
							careersClass = "";
							ourproductClass = "";
							aboutClass = "";
							contactClass = "";
							successStory="class=\"current\"";
						}
					%>
					<li><a href="index.jsp" <%=indexClass%>>Home</a></li>
					<li><a href="services.jsp" <%=servicesClass%>>Services</a></li>
					<li><a href="ourproducts.jsi" <%=ourproductClass%>>Our Products</a></li>
					<li><a href="careers.jsp" <%=careersClass%>>Careers</a></li>
					<li><a href="about.jsp" <%=aboutClass%>>Why us</a></li>
					<li><a href="successStory.jsi" <%=successStory%>>Success Story</a></li>
					<li><a href="contact.jsp" <%=contactClass%>>Contact</a></li>
					<li><a href="#login-box" class="login-window">Login</a></li>
				</ul>
			</div>
			<!-- end of templatemo_menu -->