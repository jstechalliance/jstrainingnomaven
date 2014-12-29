<%@page import="com.js.msg.MyMessage"%>
<%@include file="header.jsp" %>
<%@include file="visitorheader.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <div id="templatemo_slider_wrapper">
        
        	<div id="templatemo_slider">
            
				<div id="one" class="contentslider">
                    <div class="cs_wrapper">                    
                        <div class="cs_slider">
                        	<div class="cs_article">
                            	<div class="slider_content_wrapper">
									<div class="slider_image">
										<img src="resources/images/slider/home.jpeg" alt="Maecenas venenatis viverra nisi" />
									</div>
									<div class="slider_content">
                                        <h3>Overview</h3>
                                        <p style="text-align: justify;">
                                        	Founded in 2009, JS Informatics maintains software development center is located in Indore ,India. Basing on our proven methodology, and engineering concepts, we deliver software outsourcing and IT services. We integrate software, data and services to help customers realize and implement they needs, drive more insightful decisions.We differentiate our self in two basic verticals. IT Training and Software Development .
                                        </p>
                                    </div>
								</div>
                            </div><!-- End cs_article -->
                    	</div><!-- End cs_slider -->                    	
                    </div><!-- End cs_wrapper -->
                </div><!-- End contentslider -->
                
                <!-- Site JavaScript -->
                <script type="text/javascript" src="resources/js/jquery-1.3.1.min.js"></script>
                <script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
                <script type="text/javascript" src="resources/js/jquery.ennui.contentslider.js"></script>
                <script type="text/javascript">
                    $(function() {
                    $('#one').ContentSlider({
                    width : '940px',
                    height : '240px',
                    speed : 400,
                    easing : 'easeOutSine'
                    });
                    });
                </script>
                <script src="resources/js/jquery.chili-2.2.js" type="text/javascript"></script>
                <script src="resources/js/chili/recipes.js" type="text/javascript"></script>
                <div class="cleaner"></div>
            	
            </div>
        
        </div>
        
        <div id="templatemo_content_wrapper">
			<div id="content">   
				<div class="latestEvent">
					<h4>Testimonials</h4>
                </div>
                
                <div class="hr_divider" style="padding-bottom: 5px; margin-bottom: 15px;"></div>
                
                <div class="leftContent" style="width: 840px;">
                		
                	<c:if test="${testimonialId!=null}">
                		<script type="text/javascript">
                		 $( document ).ready(function() { 
                			 $('html, body').animate({
                			        scrollTop: $("#<c:out value="${testimonialId}"></c:out>").offset().top
                			    }, 0);
                		}); 
                		</script>
                	</c:if>
                
                	<c:if test="${not empty candidateList}">
                		
                		<c:forEach var="i" begin="1" end="${fn:length(candidateList)}" >
                			<table border="0" style="width: 840px; margin-bottom: 10px;" id="<c:out value="${candidateList[i-1].oid}"/>">
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
                				<table style="float:left;width:640px;margin-left: 10px;">
                					<tr>
                						<td>
                							<p style="height:198px; margin-bottom: 5px; overflow-y:auto; margin-top: 5px; text-align: justify; ">
												<c:out value="${candidateList[i-1].content}"/>                							
                							</p>
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
   
		<%@include file="footer.jsp" %>
        
	</div> <!-- end of wrapper -->
</div> <!-- end of wrapper_outer -->

</body>
</html>