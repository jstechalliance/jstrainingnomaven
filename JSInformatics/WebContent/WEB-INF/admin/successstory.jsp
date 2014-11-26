<%@include file="../common/chk.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>J S Informatics</title>
<meta name="keywords" content="glossy box, web design, colorful background, free templates, website templates, CSS, HTML" />
<meta name="description" content="Glossy Box | free website template with a colorful background" />
<link href="resources/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="resources/css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />

</head>
<body>

<div id="templatemo_wrapper_outer">
	<div id="templatemo_wrapper">
    
    	<div id="templatemo_header">
			<div id="site_title">
				<h1><a href="http://www.jsinformatis.com">J S Informatics<span>Passion to Excel</span></a></h1>
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
					<h4>Add new candidate in success story</h4>
				
					<form action="14.jsi" method="post" enctype="multipart/form-data">
						<table border="1" width="100%">
							<tr>
								<td>
									Candidate Name
								</td>
								<td>
									<input type="text" name="candidateName" size="15"/>
								</td>
								<td>
									Company Name
								</td>
								<td>
									<input type="text" name="companyName" size="15"/>
								</td>
								<td>
									Year
								</td>
								<td>
									<input type="text" name="year" size="15"/>
								</td>
							</tr>
							<tr>
								<td>
									College
								</td>
								<td>
									<input type="text" name="college" size="15"/>
								</td>
								<td>
									Photo
								</td>
								<td>
									<input type="file" name="file" />
								</td>
								<td>
									
								</td>
								<td>
									<input type="submit" value="Save"/>
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
                		<table border="0" style="width: 840px;">
                		<tr>
                		<c:forEach var="i" begin="1" end="${fn:length(candidateList)}" >
                			
                			<td>
                				<table border="1" style="width: 280px;">
                					<tr>
                						<td colspan="2" style="width: 280px;" align="center">
                							<a href="13.jsi?oid=<c:out value="${candidateList[i-1].oid}"/>" style="z-index: 1;float: right;vertical-align: text-top;">Delete</a>
                						
                							<img alt="" src="${candidateList[i-1].photoPath}" style="width: 240;height: 200px;">
                						</td>
                					</tr>
                					<tr>
                						<td style="width: 100px;">
                							Name 
                						</td>
                						<td style="width: 180px;">
                							<a href=""><c:out value="${candidateList[i-1].candidateName}"/></a>
                						</td>
                					</tr>
                					<tr>
                						<td>
                							Company 
                						</td>
                						<td>
                							<c:out value="${candidateList[i-1].companyName}"/>
                						</td>
                					</tr>
                					<tr>
                						<td>
                							Year 
                						</td>
                						<td>
                							<c:out value="${candidateList[i-1].year}"/>
                						</td>
                					</tr>
                				</table>
                			
                			</td>
                				
                			<c:if test="${i%3==0}">
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
		
             Copyright © 2013 <a href="http://www.jsinformatics.com">J S Informatics</a> | Designed by <a href="" target="_parent">Prashanna Gupta</a>
			 
       </div>
        
	</div> <!-- end of wrapper -->
</div> <!-- end of wrapper_outer -->

</body>
</html>