package com.js.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import com.js.dto.ChangePassword;
import com.js.dto.Employee;
import com.js.dto.Login;
import com.js.dto.Permission;
import com.js.exception.JSIException;
import com.js.msg.MyMessage;
import com.js.service.EmployeeService;
import com.js.service.LoginService;
import com.js.service.PermissionService;

public class LoginController {
	
	private PermissionService permissionService;
	private LoginService loginService;
	private EmployeeService employeeService;
	
	public PermissionService getPermissionService() {
		return permissionService;
	}
	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}
	public LoginService getLoginService() {
		return loginService;
	}
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	public void loginVarify(HttpServletRequest request,HttpServletResponse response,Login login){
		Login tlogin=null;
		try{
			tlogin=loginService.loginVarify(login);
			if(tlogin==null){
				HttpSession https= request.getSession(true);
				https.setAttribute("LOGINMSG","Invalid username or passowrd");				
				response.sendRedirect("../index.jsp");				
			}else{
				
//				System.out.println("getRequestURL : "+request.getRequestURL());
//				System.out.println("getRequestURI : "+request.getRequestURI());
			
				Set <Permission>permissionList = permissionService.getAllPermissionOfAnyUser(tlogin.getEmail());
				
				String branchid=tlogin.getUnm().substring(0,12);
				HttpSession https= request.getSession(true);
				Employee emp=employeeService.getEmployeeDetailByEmployeeId(new Employee(tlogin.getUnm()));
				https.setAttribute("USERFULLNAME",emp.getFull_name());
				https.setAttribute("USERNAME",tlogin.getUnm());
				https.setAttribute("USERLEVEL",tlogin.getUl());		
				https.setAttribute("BRANCHID",branchid);	
				https.setAttribute("PERMISSIONSET",permissionList);
			
				if(tlogin.getUl().equalsIgnoreCase("admin")){ //1
					MyMessage myMessage=new MyMessage();
					request.setAttribute("LOGINMSG",myMessage);
					myMessage.setLoginMessage("Success");					
					response.sendRedirect("../11.jsi");
				}
				else if(tlogin.getUl().equalsIgnoreCase("manager")){ //2
					MyMessage myMessage=new MyMessage();
					request.setAttribute("LOGINMSG",myMessage);
					myMessage.setLoginMessage("Success");					
					response.sendRedirect("../manager/home.jsp");
				}
				else if(tlogin.getUl().equalsIgnoreCase("operator")){ //3
					MyMessage myMessage=new MyMessage();
					request.setAttribute("LOGINMSG",myMessage);
					myMessage.setLoginMessage("Success");
					response.sendRedirect("../operator/home.jsp");					
				}
				else if(tlogin.getUl().equalsIgnoreCase("faculty")){ //4
					MyMessage myMessage=new MyMessage();
					request.setAttribute("LOGINMSG",myMessage);
					myMessage.setLoginMessage("Success");
					response.sendRedirect("41.jsi");					
				}
				else if(tlogin.getUl().equalsIgnoreCase("student")){//5
					MyMessage myMessage=new MyMessage();
					request.setAttribute("LOGINMSG",myMessage);
					myMessage.setLoginMessage("Success");
					response.sendRedirect("51.jsi");					
				}
				else if(tlogin.getUl().equalsIgnoreCase("developer")){//6
					MyMessage myMessage=new MyMessage();
					request.setAttribute("LOGINMSG",myMessage);
					myMessage.setLoginMessage("Success");
					response.sendRedirect("61.jsi");					
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
			new JSIException(ex).log();
			HttpSession https= request.getSession(true);			
			https.setAttribute("LOGINMSG","Server side error");				
			try {
				response.sendRedirect("../index.jsp");
			} catch (IOException e) {
				new JSIException(e).log();
				e.printStackTrace();
			}
		}		
	}
	public String changePassword(HttpServletRequest request,HttpServletResponse response, ChangePassword changePassword) throws Exception{
		changePassword.setUsername((String)request.getSession(false).getAttribute("USERNAME"));
		return loginService.changePassword(changePassword);
	}
}

