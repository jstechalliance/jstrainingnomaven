<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@page import="com.js.exception.JSIException"%>

<%@page import="com.js.service.EnquiryService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>