<%@page import="com.js.msg.MyMessage"%>
<%@include file="header.jsp" %>
<%@include file="visitorheader.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

        <br/>
                
                
               
                
        
        <div id="templatemo_content_wrapper">
			<div id="content">   
				<div class="latestEvent">
					<h4>Our success story</h4>
					<a href="testimonials.jsi" style="float: right;">Testimonials</a>
                <strong>Real stories from real students -- of academic success, and how you can achieve it!</strong>
 				<br/>
				
				These stories will show you what these high-achieving students do to ensure their academic success -- activities that you too can easily do to improve your grades and success in school.
				Besides reading each student's story, you can also read tips on specific study and academic success topics that most interest you.
				
				<br/>
				<br/>
                </div>
                
                <br/>
                <br/>
                
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