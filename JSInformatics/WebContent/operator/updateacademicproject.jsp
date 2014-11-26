<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@page import="com.js.exception.JSIException"%>
<%@include file="../common/chk.jsp" %>

<jsp:useBean id="projectDTO" class="com.js.dto.NewAcademicProjectEnquiryDTO"></jsp:useBean>
<jsp:setProperty property="*" name="projectDTO"/>
<%
	try{
		EnquiryController enquiryController = JSIBeanFactory.getBean(EnquiryController.class);
		enquiryController.updateAcademicProjectEnquiry(projectDTO, request, response);
		out.println("Enquiry successfully updated");
	}catch(Exception ex){			
		new JSIException(ex).log();
		out.println("Enquiry not updated");
		ex.printStackTrace();
	}
%>
