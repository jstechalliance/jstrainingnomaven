<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.RegistrationRemarkController"%>
<%@include file="../common/chk.jsp" %>
<%@page import="com.js.exception.JSIException"%>
<%
	try{
		
		RegistrationRemarkController registrationRemarkController = JSIBeanFactory.getBean(RegistrationRemarkController.class);
		registrationRemarkController.saveNewRemark(request);	
		out.println("Remark successfully saved");
	}catch(Exception ex){		
		new JSIException(ex).log();
		out.println("Remark not saved");
		ex.printStackTrace();
	}
%>