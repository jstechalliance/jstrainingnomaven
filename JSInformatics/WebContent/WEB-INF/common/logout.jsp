<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession https= request.getSession(false);
		if(https!=null){
			https.removeAttribute("USERNAME");
			https.removeAttribute("USERLEVEL");
			https.removeAttribute("BRANCHID");
			https.removeAttribute("USERFULLNAME");	
			https.removeAttribute("PERMISSIONSET");	
			https.invalidate();
		}
		response.sendRedirect("index.jsp");	
	%>
</body>
</html>