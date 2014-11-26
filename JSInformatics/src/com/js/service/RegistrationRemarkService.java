package com.js.service;

import java.util.List;

import com.js.dto.Remark;

public interface RegistrationRemarkService {
	
	public String saveNewRemark(Remark remark) throws Exception;
	public List<Remark> getAllRemarkForAnRegistration(String registrationId) throws Exception;
	
}
