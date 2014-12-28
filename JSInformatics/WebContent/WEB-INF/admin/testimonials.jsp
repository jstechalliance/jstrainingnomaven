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
<script type="text/javascript" src="resources/js/testimonial.js"></script>

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
					<h4>Write new testimonial</h4>
				
					<form action="16.jsi" method="post" enctype="multipart/form-data" onsubmit="return validateWriteTestimonial();">
						<table border="1" width="100%">
							<c:if test="${successStory!=null}">
								<tr>
									<td>
										Candidate Name : 
										<input type="hidden" name="successStory.oid" value="<c:out value="${successStory.oid}"/>"/>
										<input type="text" name="candidateName" id="id_name" size="20" value="<c:out value="${successStory.candidateName}" />" readonly="readonly"/>
									</td>
									<td>
										College : 
										<input type="text" name="college" size="20" id="id_college" value="<c:out value="${successStory.college}" />" readonly="readonly"/>
									</td>
									<td>
										Photo : 
										<input type="file" name="file"  style="float: right;" disabled="disabled"/>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<textarea rows="6" name="content" id="id_content" style="min-width: 99%; max-width: 99%; resize:none;"></textarea>
									</td>
								</tr>
							
							</table>
							<input type="submit" id="submit" value="Save" style="float: right; display: block; width: 100px; height: 25px; margin: 2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;"/>
							</c:if>
							<c:if test="${successStory==null}">
								<tr>
									<td width="15%">
										Candidate Name : 
										</td>
									<td width="20%">
										<input type="hidden" name="oid" id="id_oid" />
										<input type="hidden" name="photoPath" id="id_photoPath"/>
										<input type="text" name="candidateName" size="20" id="id_name" value="<c:out value="${successStory.candidateName}" />"  style="min-width: 98%; max-width: 98%; resize:none;"/>
									</td>
									<td width="10%">
										College : 
									</td>
									<td width="20%">
										<input type="text" name="college" size="20" id="id_college" value="<c:out value="${successStory.college}" />" style="min-width: 98%; max-width: 98%; resize:none;" />
									</td>
									<td colspan="2" width="35%">
										Photo : 
										<input type="file" name="file" id="id_photo" style="float: right;"/>
									</td>
								</tr>
								<tr>
								<td colspan="5">
									<textarea rows="6" name="content" id="id_content" style="min-width: 99%; max-width: 99%; resize:none;"></textarea>
								</td>
							</tr>
							
							</table>
							<input disabled type="submit" id="submit" value="Save" style="float: right; display: block; width: 100px; height: 25px; margin: 2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;"/>
					
						</c:if>
							
							
					
					</form>
					
                <br/>
                <br/>
                
                </div>
                <div class="hr_divider" style="padding-bottom: 5px; margin-bottom: 15px;"></div>
                
                <div class="leftContent" style="width: 840px;">
                
                	
                	<c:if test="${not empty candidateList}">
                		
                		<c:forEach var="i" begin="1" end="${fn:length(candidateList)}" >
                			<input type="hidden" id="id_rep_photo_path_<c:out value="${candidateList[i-1].oid}"/>" value="<c:out value="${candidateList[i-1].photoPath}"/>"  />
                			<input type="hidden" id="id_rep_name_<c:out value="${candidateList[i-1].oid}"/>" value="<c:out value="${candidateList[i-1].candidateName}"/>"/>
                			<input type="hidden" id="id_rep_college_<c:out value="${candidateList[i-1].oid}"/>" value="<c:out value="${candidateList[i-1].college}"/>" />
                			<input type="hidden" id="id_rep_content_<c:out value="${candidateList[i-1].oid}"/>" value="<c:out value="${candidateList[i-1].content}"/>" />
                			
                			<table border="0" style="width: 840px; margin-bottom: 10px;">
                		<tr>
                			<td style="width: 600; top-margin:5px;box-shadow: 0px 0px 3px black;"  align="left">
                				<table  border="0" style="float:left;margin-top:-1px;margin-bottom:-1px;box-shadow: 0px 0px 3px black;">
                					<tr>
                					<td colspan="2">
                						<div class="image_wrapper image_fl" style="margin:0px;">
													<img style="width: 150px; height: 150px;"
														src="${candidateList[i-1].photoPath}" alt="Profile picture" />
												</div>
                						</td>
                					</tr>
                					<tr>
                						<td style="width: 60px;" valign="top">
                							Name : 
                						</td>
                						<td style="width: 100px;" valign="top">
                							<a href=""><c:out value="${candidateList[i-1].candidateName}"/></a>
                						</td>
                					</tr>
                					<tr>
                						<td valign="top">
                							College : 
                						</td>
                						<td valign="top">
                							<c:out value="${candidateList[i-1].college}"/>
                						</td>
                					</tr>
                				</table>
                				<table style="float:left;width:640px;margin-left: 10px; height: 100%;">
                					<tr>
                						<td style="height: 100%;" valign="top">
                							<p style="height: 165px; margin-bottom: 0px;overflow-y:auto; text-align: justify;">
                								<c:out value="${candidateList[i-1].content}"/>
                							</p>
                							<div class="btn_more" style="margin-top: 0px; float: right;"><a onclick="return myOnClick();" href="17.jsi?oid=<c:out value="${candidateList[i-1].oid}"/>" >Delete</a></div>
                							<div class="btn_more" style="margin-top: 0px; float: right; margin-right: 10px;"><a href="#" onclick="showTestimonial('<c:out value="${candidateList[i-1].oid}"/>');" >Update</a></div>
                						</td>
                					</tr>
                				</table>
                			</td>
                			</tr>
                		</table>
                		</c:forEach>
                		
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