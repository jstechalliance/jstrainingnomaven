<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.RegistrationController"%>
<%@include file="../common/chk.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="searchEnquiry" class="com.js.dto.SearchEnquiry"></jsp:useBean>
	<jsp:setProperty name="searchEnquiry" property="*"/>
	<%
	
	RegistrationController registrationController = JSIBeanFactory.getBean(RegistrationController.class);
	
	String searchPurpose = searchEnquiry.getSearch_purpose();
	out.println(searchPurpose);
	if(searchPurpose.equalsIgnoreCase("Academic Project")){
		registrationController.searchAcademicRegistration(searchEnquiry,request,response,(String)request.getSession(false).getAttribute("BRANCHID"));	
	}else{
		registrationController.searchTranningRegistration(searchEnquiry,request,response,(String)request.getSession(false).getAttribute("BRANCHID"));
	}
		
	%>
</body>
</html>