<%@page import="com.js.utils.JSIBeanFactory"%>
<%@include file="../common/chk.jsp" %>
<%@page import="com.js.exception.JSIException"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@page import="com.js.service.EnquiryService"%>

	<jsp:useBean id="newTrainingEnquiryDTO" class="com.js.dto.NewTrainingEnquiryDTO"/>
	<jsp:setProperty property="*" name="newTrainingEnquiryDTO"/>
	<%
		try{
			
			EnquiryController enquiryController = JSIBeanFactory.getBean(EnquiryController.class);
			
			String ret=enquiryController.saveNewTrainingEnquiry(newTrainingEnquiryDTO, request);
			out.println(ret);
		}catch(Exception e){
			new JSIException(e).log();
			out.println("Enquiry not saved");
		}
	%>