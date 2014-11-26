<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.LoginController"%>
<jsp:useBean id="changePassword" class="com.js.dto.ChangePassword"></jsp:useBean>
<jsp:setProperty property="*" name="changePassword"/>
<%

	LoginController loginController = JSIBeanFactory.getBean(LoginController.class); 
	String res=loginController.changePassword(request, response, changePassword);
	out.println(res);
	
%>
