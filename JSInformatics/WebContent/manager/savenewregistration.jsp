<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.RegistrationController"%>
<%@include file="../common/chk.jsp"%>
<%@page import="com.js.exception.JSIException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	
	<jsp:useBean id="trainingDTO"
		class="com.js.dto.TrainingRegistrationDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="trainingDTO" />
	<%
		RegistrationController registrationController = JSIBeanFactory.getBean(RegistrationController.class);
	
		String save_status = request.getParameter("save_status");
	
		if (save_status.equalsIgnoreCase("registration")&&trainingDTO.getRegistration_id().equalsIgnoreCase("registration_id")) {
			try {
				String ret = registrationController
						.saveTrainingRegistration(request, trainingDTO);
				out.println(ret);
				//request.setAttribute("REGMSG", ret);
				//request.getRequestDispatcher("registration.jsp").forward(
				//		request, response);
			} catch (Exception e) {
				new JSIException(e).log();
				out.println("Registration not save");
			}
		} else if (save_status.equalsIgnoreCase("update")) {
			try {
				String ret = registrationController
						.updateTrainingRegistration(request, trainingDTO);
				out.println(ret);
				//request.setAttribute("REGMSG", ret);
				//request.getRequestDispatcher("registration.jsp").forward(
				//		request, response);
			} catch (Exception e) {
				e.printStackTrace();
				new JSIException(e).log();
				out.println("Registration not update");
			}
		}
	%>
</body>
</html>