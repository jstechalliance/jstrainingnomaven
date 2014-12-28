<%@include file="../common/chk.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JS Informatics</title>
<meta name="keywords" content="glossy box, web design, colorful background, free templates, website templates, CSS, HTML" />
<meta name="description" content="Glossy Box | free website template with a colorful background" />
<link href="resources/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="resources/css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />

<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="resources/js/successstory.js"></script>

</head>
<body>

<div id="templatemo_wrapper_outer">
	<div id="templatemo_wrapper">
    
    	<div id="templatemo_header">
			<div id="site_title">
				<h1><a href="http://www.jsinformatis.com">JS Informatics<span>Passion to Excel</span></a></h1>
			</div> <!-- end of site_title -->

				<ul id="social_box">
					<li><a href="#"><img src="resources/images/facebook.png" alt="facebook" /></a></li>
					<li><a href="#"><img src="resources/images/twitter.png" alt="twitter" /></a></li>
					<li><a href="#"><img src="resources/images/linkedin.png" alt="linkin" /></a></li>
					<li><a href="#"><img src="resources/images/technorati.png" alt="technorati" /></a></li>
					<li><a href="#"><img src="resources/images/myspace.png" alt="myspace" /></a></li>                
				</ul>
			
			<div class="cleaner"></div>
		</div>
        
        <div id="templatemo_menu">
            <ul>
                <li><a href="11.jsi">Home</a></li>
                <li><a href="enquiry.jsp">Enquiry</a></li>
                <li><a href="registration.jsp">Registration</a></li>
                <li><a href="payment.jsp">Payment</a></li>
                <li><a href="expance.jsp">Expance</a></li>
				<li><a href="employee.jsp">Employee</a></li>
				<li><a href="12.jsi">Success story</a></li>
				<li><a href="logout.jsi">Logout</a></li>
				
            </ul>    	
        </div> <!-- end of templatemo_menu -->
        
        <br/>
                
                
               
                
        
     <div id="templatemo_content_wrapper">
			<div id="content">   
				<div class="latestEvent">
					<h4 style="float: left;">Add new candidate in success story</h4>
					<a href="15.jsi" style="float: right;">Testimonials</a>
					<form action="14.jsi" method="post" enctype="multipart/form-data" onsubmit="return validateAddSuccessStory();">
						<table border="1" width="100%">
							<tr>
								<td>
									Candidate Name
								</td>
								<td>
									<input type="text" name="candidateName" size="15" id="id_candidateName"/>
								</td>
								<td>
									Company Name
								</td>
								<td>
									<input type="text" name="companyName" size="15" id="id_companyName"/>
								</td>
								<td>
									Year
								</td>
								<td>
									<input type="text" name="year" size="15" id="id_year"/>
								</td>
							</tr>
							<tr>
								<td>
									College
								</td>
								<td>
									<input type="text" name="college" size="15" id="id_college"/>
								</td>
								<td>
									Photo
								</td>
								<td>
									<input type="file" name="file" id="id_photo" />
								</td>
								
								<td colspan="2">
									<input disabled="disabled" type="submit" value="Save" id="submit" style="float: right; display: block; width: 100px; height: 25px; margin: 2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;"/>
									
								</td>
							</tr>
						</table>
					</form>
				
                <br/>
                <br/>
                
                </div>
                <div class="hr_divider" style="padding-bottom: 5px; margin-bottom: 15px;"></div>
                
                <div class="leftContent" style="width: 840px;">
                
                	<c:if test="${not empty candidateList}">
				<table border="0" style="width: 800px; ">
					<tr>
							<c:forEach var="i" begin="1" end="${fn:length(candidateList)}">
	
								<td style="padding:10px;">
									<table border="0" style="width: 400px;top-margin:5px;box-shadow: 0px 0px 3px black;">
										<tr>
											<td colspan="2" style="width: 280px;" align="center">
												<div class="image_wrapper image_fl" style="margin:5px;">
													<img width="100" height="100"
														src="${candidateList[i-1].photoPath}" alt="Profile picture" />
												</div>
												<table>
													<tr>
														<td style="width: 70px;">Name</td>
														<td style="width: 200px;"><a href="#"><c:out
																	value="${candidateList[i-1].candidateName}" /></a></td>
													</tr>
													<tr>
														<td>Company</td>
														<td><c:out value="${candidateList[i-1].companyName}" />
														</td>
													</tr>
													<tr>
														<td>Year</td>
														<td><c:out value="${candidateList[i-1].year}" /></td>
													</tr>
												</table>
												<div class="btn_more" style="margin-right: 10px; margin-top: 10px;"><a onclick="return myOnClick();" href="13.jsi?oid=<c:out value="${candidateList[i-1].oid}"/>" >Delete</a></div>
												
												<c:if test="${candidateList[i-1].testimonial==null}">
													<div class="btn_more" style="margin-right: 120px; margin-top: 10px;"><a href="18.jsi?oid=<c:out value="${candidateList[i-1].oid}"/>" >Testimonial</a></div>
												</c:if>
												
											</td>
										</tr>
	
									</table>
	
								</td>
	
								<c:if test="${i%2==0}">
					</tr>
					<tr>
						</c:if>
						</c:forEach>
					</tr>
				</table>
			</c:if>
                	<br/>
                
					
                </div>
                
                <div class="rightContent">

					
                </div>
                
                <div class="cleaner"></div>                
            </div>			
            <div class="cleaner"></div>        
		</div>

		<div id="templatemo_content_wrapper_bottm"></div>
   
		<div id="templatemo_footer">
		
             Copyright © 2013 <a href="http://www.jsinformatics.com">JS Informatics</a> | Designed by <a href="" target="_parent">Prashanna Gupta</a>
			 
       </div>
        
	</div> <!-- end of wrapper -->
</div> <!-- end of wrapper_outer -->

</body>
</html>