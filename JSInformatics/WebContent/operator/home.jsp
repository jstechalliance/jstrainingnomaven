<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.WebEnquiryController"%>
<%@page import="java.util.List"%>
<%@page import="com.js.dto.WebEnquiryDTO"%>
<%@include file="../common/chk.jsp"%>
<%@include file="operatortopheader.jsp"%>
<%@include file="../common/header.jsp"%>

<br />


<div id="templatemo_content_wrapper">
	<div id="content">
		<div class="latestEvent">
			<div style="float: left;"><h3>Operator</h3></div>
			<div style="float: left;margin: 4px 0 0 20px;color: #3f8f98"><%=request.getSession(false).getAttribute("USERFULLNAME")%></div>
		</div>
		<div class="hr_divider_enquiry"></div>

		<div class="leftContent" style="width: 840px;">

			<%
				WebEnquiryController webEnquiryController = JSIBeanFactory.getBean(WebEnquiryController.class);
				List<WebEnquiryDTO> dtos = webEnquiryController.getAllWebInquiryByDateWise();
			%>
			<h4 style="font-size: 18px ; text-align:center;width:100% ;font-style: normal; float: right;">Web
				Enquiry</h4>

			<div id="training_enquiry_active_list_div"
				style="height: 310px; display: block; width: 840px; border: solid 2px #222222; overflow-x: scroll; overflow-y: scroll;">
				<table border="4" cellpadding="0" cellspacing="0" width="1024px">
					<thead>
						<tr>
							<th width="4%"><a href="#">S.no</a></th>
							<th width="10%"><a href="#">Full Name</a></th>
							<th width="10%"><a href="#">Contact No</a></th>
							<th width="10%"><a href="#">Course</a></th>
							<th width="10%"><a href="#">Enquiry Date</a></th>
							<th width="10%"><a href="#">Reference</a></th>
							<th width="16%"><a href="#">Email</a></th>
							<th width="10%"><a href="#">Operation</a></th>
						</tr>
					<thead>
				</table>
				<%
					int count = 0;
					for (WebEnquiryDTO dto : dtos) {
				%>
				<table border='1' cellpadding='0' cellspacing='0' width="1024px">
					<tr>
						<td width="4%"> <%=count%> </td>
						<td width="10%"> <%=dto.getName()%> </td>
						<td width="10%"> <%=dto.getContactno()%> </td>
						<td width="10%"> <%=dto.getCourse()%> </td>
						<td width="10%"> <%=dto.getEnquiry_date()%> </td>
						<td width="10%"> <%=dto.getReferance()%> </td>
						<td width="16%"> <%=dto.getEmail()%> </td>
						<td width="10%" align="center"><a href="enquiry.jsp?web_enq_id=<%=dto.getId() %>">More Detail</td>
					</tr>
				</table>
				<%
					count++;
					}
				%>
				</table>
			</div>
		
		</div>
		<div class="cleaner"></div>
	</div>
	<div class="cleaner"></div>
</div>

<div id="templatemo_content_wrapper_bottm"></div>

<div id="templatemo_footer">
	<%@include file="../footer.jsp"%>
</div>
</div>
<!-- end of wrapper -->
</div>
<!-- end of wrapper_outer -->

</body>
</html>