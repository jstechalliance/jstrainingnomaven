<%@page import="com.js.msg.MyMessage"%>
<%@include file="header.jsp" %>
<%@include file="visitorheader.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

        <br/>
                
                
               
                
        
        <div id="templatemo_content_wrapper">
			<div id="content">   
				<div class="latestEvent">
					<h4>Testimonials</h4>
					
               
                <br/>
                <br/>
                
                </div>
                <div class="hr_divider" style="padding-bottom: 5px; margin-bottom: 15px;"></div>
                
                <div class="leftContent" style="width: 840px;">
                
                	<c:if test="${not empty candidateList}">
                		<table border="1" style="width: 840px;">
                		<tr>
                		<c:forEach var="i" begin="1" end="${fn:length(candidateList)}" >
                			
                			<td style="width: 140px;">
                				<table border="1" style="width: 140px;">
                					<tr>
                						<td colspan="2" style="width: 140px; height: 120px;" align="center" >
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
                			<td align="left" valign="top" style="width: 700px;">
                				kdhroieoitueori
                			</td>
                			</tr>
                		<tr>
                			
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