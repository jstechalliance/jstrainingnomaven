<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@include file="../common/chk.jsp"%>
<%@page import="com.js.dto.*"%>
<%@page import="java.util.*"%>

<jsp:useBean id="searchEnquiry" class="com.js.dto.SearchEnquiry"></jsp:useBean>
<jsp:setProperty name="searchEnquiry" property="*" />

<%

	EnquiryController enquiryController = JSIBeanFactory.getBean(EnquiryController.class);

	String search_purpose = request.getParameter("search_purpose");

	request.getSession(false).setAttribute("SEARCHFIELD", searchEnquiry);
	
	if (search_purpose.equalsIgnoreCase("Training")) {
		enquiryController.searchTraningEnquiryBranchWise(searchEnquiry,
				request, response, (String) request.getSession(false)
						.getAttribute("BRANCHID"));
	} else if (search_purpose.equalsIgnoreCase("Academic Project")) {
		enquiryController.searchAcadenicEnquiryBranchWise(
				searchEnquiry, request, response, (String) request
						.getSession(false).getAttribute("BRANCHID"));
	} else if (search_purpose.equalsIgnoreCase("Visitor")) {
		enquiryController.searchVisitorEnquiryBranchWise(searchEnquiry,
				request, response, (String) request.getSession(false)
						.getAttribute("BRANCHID"));
	}
%>
