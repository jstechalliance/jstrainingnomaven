package com.js.service;

import com.js.dto.ChangePassword;
import com.js.dto.Login;

public interface LoginService {
	public Login loginVarify(Login login) throws Exception;
	public String changePassword(ChangePassword changePassword) throws Exception;
}
