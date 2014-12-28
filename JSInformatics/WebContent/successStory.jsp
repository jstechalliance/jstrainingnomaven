<%@page import="com.js.msg.MyMessage"%>
<%@include file="header.jsp"%>
<%@include file="visitorheader.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<br />





<div id="templatemo_content_wrapper">
	<div id="content">
		<div class="latestEvent">
			<h4>Our success story</h4>
			<a href="testimonials.jsi" style="float: right;">Testimonials</a> <strong>Real
				stories from real students -- of academic success, and how you can
				achieve it!</strong> <br /> These stories will show you what these
			high-achieving students do to ensure their academic success --
			activities that you too can easily do to improve your grades and
			success in school. Besides reading each student's story, you can also
			read tips on specific study and academic success topics that most
			interest you. <br /> <br />
		</div>

		<br /> <br />

		<div class="hr_divider"
			style="padding-bottom: 5px; margin-bottom: 15px;"></div>

		<div class="leftContent" style="width: 840px; margin-left: auto; margin-right: auto;">

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
												
												<c:if test="${candidateList[i-1].testimonial!=null}">
													<div class="btn_more" style="margin-right: 10px; margin-top: 10px;"><a href="testimonials.jsi?testimonialId=<c:out value="${candidateList[i-1].testimonial.oid}"/>" >Read more</a></div>
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

			<br />


		</div>

		<div class="rightContent"></div>

		<div class="cleaner"></div>
	</div>
	<div class="cleaner"></div>
</div>

<div id="templatemo_content_wrapper_bottm"></div>

<div id="templatemo_footer">

	Copyright &copy; 2013 <a href="http://www.jsinformatics.com">JS
		Informatics</a> | Designed by <a href="" target="_parent">Prashanna
		Gupta</a>

</div>

</div>
<!-- end of wrapper -->
</div>
<!-- end of wrapper_outer -->

</body>
</html>