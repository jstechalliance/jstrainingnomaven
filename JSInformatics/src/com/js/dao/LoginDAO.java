package com.js.dao;

import com.js.dto.ChangePassword;
import com.js.dto.Login;

public interface LoginDAO {
	
	public Login loginVarify(Login login) throws Exception ;
	public String changePassword(ChangePassword changePassword) throws Exception ;
	
}
