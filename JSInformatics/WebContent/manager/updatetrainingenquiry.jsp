<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@include file="../common/chk.jsp" %>
<%@page import="com.js.exception.JSIException"%>

<jsp:useBean id="enquiryDTO" class="com.js.dto.NewTrainingEnquiryDTO"></jsp:useBean>
<jsp:setProperty property="*" name="enquiryDTO"/>
<%
	EnquiryController enquiryController = JSIBeanFactory.getBean(EnquiryController.class);

	try{
		enquiryController.updateTrainingEnquiry(enquiryDTO, request, response);
		out.println("Enquiry successfully updated");
	}catch(Exception ex){		
		new JSIException(ex).log();
		out.println("Enquiry not updated");
		ex.printStackTrace();
	}
%>
