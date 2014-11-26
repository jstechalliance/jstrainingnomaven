<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.RegistrationRemarkController"%>
<%@page import="com.js.exception.JSIException"%>
<%@include file="../common/chk.jsp" %>
<%
	RegistrationRemarkController registrationRemarkController = JSIBeanFactory.getBean(RegistrationRemarkController.class);
	try{
		registrationRemarkController.saveNewRemark(request);	
		out.println("Remark successfully saved");
	}catch(Exception ex){		
		new JSIException(ex).log();
		out.println("Remark not saved");
		ex.printStackTrace();
	}
%>