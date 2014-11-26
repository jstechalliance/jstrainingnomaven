package com.js.service.impl;

import com.js.dao.LoginDAO;
import com.js.dto.ChangePassword;
import com.js.dto.Login;
import com.js.service.LoginService;

public class LoginServiceImpl implements LoginService{
	
	private LoginDAO loginDAO;
	
	public LoginDAO getLoginDAO() {
		return loginDAO;
	}
	public void setLoginDAO(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}
	
	public Login loginVarify(Login login) throws Exception{
		return loginDAO.loginVarify(login);
	}
	public String changePassword(ChangePassword changePassword) throws Exception{
		return loginDAO.changePassword(changePassword);
	}
}
