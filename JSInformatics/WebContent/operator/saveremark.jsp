<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@page import="com.js.exception.JSIException"%>
<%@include file="../common/chk.jsp" %>
<%
	try{
		EnquiryController enquiryController = JSIBeanFactory.getBean(EnquiryController.class);
		enquiryController.saveNewRemark(request);		
		out.println("Remark successfully saved");
	}catch(Exception ex){	
		new JSIException(ex).log();
		out.println("Remark not saved");
		ex.printStackTrace();
	}
%>