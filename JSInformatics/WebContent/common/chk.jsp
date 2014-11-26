<%@page import="com.js.dto.Permission"%>
<%@page import="java.util.*" %>
<%
	response.addHeader("Cache-Control","no-cache");
	response.addHeader("Cache-Control","no-store");
	
	HttpSession httpSession =request.getSession(false);
	if(httpSession==null){
		response.sendRedirect("index.jsp");
		return;
	}else{
		String myusername=(String)httpSession.getAttribute("USERNAME");
		if(myusername==null){
			response.sendRedirect("index.jsp");
			return;
		}
	}	
	
	/* Set <Permission>permissionSet = (Set<Permission>)httpSession.getAttribute("PERMISSIONSET");
	if(permissionSet==null || permissionSet.isEmpty()){
		response.sendRedirect("../index.jsp");
		return;
	}
	String requestedPage = request.getServletPath();
	Permission permission = new Permission(requestedPage);
	if(!permissionSet.contains(permission)){
		String userLevel = (String)httpSession.getAttribute("USERLEVEL");
		if(userLevel==null){
			response.sendRedirect("../index.jsp");
		}
		userLevel=userLevel.toLowerCase();
		httpSession.setAttribute("ERRORMSG","Access denied.");
		response.sendRedirect("../"+userLevel+"/home.jsp");
		//out.println("Access denied.");
		return;
	} */
	
	
	
	
	
%>
