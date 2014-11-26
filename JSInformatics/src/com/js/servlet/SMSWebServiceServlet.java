package com.js.servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.js.controller.StudentSMSController;
import com.js.utils.JsonResponse;

public class SMSWebServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public SMSWebServiceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String wsType = request.getParameter("ws_type");
		JsonResponse jr = filterForGet(wsType);
		response.getWriter().println(jr.getJson());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String wsType = request.getParameter("ws_type");
		Enumeration<String>paramNames = request.getParameterNames();		
		Map<String, String>params=new HashMap<String, String>();
		if(paramNames!=null){
			while(paramNames.hasMoreElements()){	
				String paramName = paramNames.nextElement();
				String value=request.getParameter(paramName);
				params.put(paramName, value);
			}
		}		
		JsonResponse jr = filterForPost(wsType,params);
		response.getWriter().println(jr.getJson());		
	}

	public JsonResponse filterForGet(String wsType){
		
		if(wsType==null){
			return new JsonResponse(false, "Invalid selection.", "");
		}else if(wsType.equalsIgnoreCase(STUDENT_FOR_MESSAGE)){
			return new StudentSMSController().getStudentForMessage();
		}else{
			return new JsonResponse(false, "Invalid selection.", "");	
		}
	}
	
	public JsonResponse filterForPost(String wsType,Map<String, String>params){
		if(wsType==null){
			return new JsonResponse(false, "Invalid selection.", "");
		}else if(wsType.equalsIgnoreCase(STUDENT_FOR_MESSAGE)){
			return new StudentSMSController().getStudentForMessage();
		}else if(wsType.equalsIgnoreCase(UPDATE_ALL_MESSAGE)){
			return new StudentSMSController().updateAllDetail(params);
		}else{
			return new JsonResponse(false, "Invalid selection.", "");	
		}
	}

	private final String  STUDENT_FOR_MESSAGE="STUDENT_FOR_MESSAGE";//method={get,post}
	private final String  UPDATE_ALL_MESSAGE="UPDATE_ALL_MESSAGE";//method={get,post}
	
}
