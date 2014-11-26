<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@include file="../common/chk.jsp"%>
<%@page import="com.js.exception.JSIException"%>

<%
	
	try {
		
		EnquiryController enquiryController = JSIBeanFactory.getBean(EnquiryController.class);
		enquiryController.saveNewAcademicProjectRemark(request);
		out.println("Remark successfully saved");
	} catch (Exception ex) {
		new JSIException(ex).log();
		out.println("Remark not saved");
		ex.printStackTrace();
	}
%>