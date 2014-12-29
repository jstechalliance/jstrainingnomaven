<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>JS Informatics</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="resources/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />

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
					<li><a href="https://www.facebook.com/pages/J-S-Informatics/139323982806197"><img src="resources/images/facebook.png" alt="facebook" /></a></li>
					<li><a href="#"><img src="resources/images/twitter.png" alt="twitter" /></a></li>
					<li><a href="#"><img src="resources/images/linkedin.png" alt="linkin" /></a></li>
					<li><a href="https://maps.google.co.in/maps?f=q&source=s_q&hl=en&geocode=&authuser=0&q=Trade%20Center,%20South%20Tukoganj,%20Tukoganj,%20Indore,%20MP&aq=&vps=3&jsv=470c&sll=22.725588,75.865818&sspn=0.00147,0.002411&vpsrc=6&ie=UTF8&oi=georefine&ct=clnk&cd=1&spell=1"><img src="resources/images/gmap-icon.png" alt="linkin" /></a></li>
					<p style="text-align: right; color: white;">+91-731-4263751</p>
				</ul>
				
                <div class="cleaner">             	
                </div>
            </div>
   
            <div id="wrap">
            
            	<%
								String requestedPagePath = request.getServletPath();
								String requestedPageName = new File(requestedPagePath).getName();
						
								String indexClass = "class=\"current-menu-item\"";
								String servicesClass = "";
								String careersClass = "";
								String aboutClass = "";
								String contactClass = "";
								String ourproductClass = "";
								String successStory="";
								if (requestedPageName.equalsIgnoreCase("index")) {
									indexClass = "class=\"current-menu-item\"";
									servicesClass = "";
									careersClass = "";
									ourproductClass = "";
									aboutClass = "";
									contactClass = "";
									successStory="";
								} else if (requestedPageName.equalsIgnoreCase("services.jsp")) {
									indexClass = "";
									servicesClass = "class=\"current-menu-item\"";
									careersClass = "";
									aboutClass = "";
									contactClass = "";
									ourproductClass = "";
									successStory="";
								} else if (requestedPageName.equalsIgnoreCase("ourproducts.jsp")) {
									indexClass = "";
									servicesClass = "";
									ourproductClass = "class=\"current-menu-item\"";
									careersClass = "";
									aboutClass = "";
									contactClass = "";
									successStory="";
								} else if (requestedPageName.equalsIgnoreCase("careers.jsp")) {
									indexClass = "";
									servicesClass = "";
									careersClass = "class=\"current-menu-item\"";
									aboutClass = "";
									ourproductClass = "";
									contactClass = "";
									successStory="";
								} else if (requestedPageName.equalsIgnoreCase("about.jsp")) {
									indexClass = "";
									servicesClass = "";
									careersClass = "";
									ourproductClass = "";
									aboutClass = "class=\"current-menu-item\"";
									contactClass = "";
									successStory="";
								} else if (requestedPageName.equalsIgnoreCase("contact.jsp")) {
									indexClass = "";
									servicesClass = "";
									careersClass = "";
									ourproductClass = "";
									aboutClass = "";
									successStory="";
									contactClass = "class=\"current-menu-item\"";
								}
								else if (requestedPageName.equalsIgnoreCase("successStory.jsp") || requestedPageName.equalsIgnoreCase("testimonials.jsp")) {
									indexClass = "";
									servicesClass = "";
									careersClass = "";
									ourproductClass = "";
									aboutClass = "";
									contactClass = "";
									successStory="class=\"current-menu-item\"";
								}
							%>
            
                <header>
                    <div class="inner relative">
                        <nav id="navigation">
                            <ul id="main-menu">
                                <li <%=indexClass%>><a href="index.jsp">Home</a></li>
								<li <%=servicesClass%>><a href="services.jsp" >Services</a></li>
								<li <%=ourproductClass%>><a href="ourproducts.jsi" >Products</a></li>
								<li <%=careersClass%>><a href="careers.jsp" >Careers</a></li>
								<li <%=aboutClass%>><a href="about.jsp" >Why us</a></li>
								<li  <%=successStory%>><a href="successStory.jsi">Success story</a>
									<ul class="sub-menu">
                                		<li><a href="successStory.jsi">Placement</a></li>
                                   	 <li><a href="testimonials.jsi">Testimonials</a></li>
                            		</ul>
								</li>
								<li <%=contactClass%>><a href="contact.jsp" >Contact</a></li>
								<li><a href="#login-box" class="login-window">Login</a></li>
                            </ul>
                        </nav>
                        <div class="clear"></div>
                    </div>
                </header>
            </div>

        <!-- end of templatemo_menu -->