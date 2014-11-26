package com.js.dao;

import java.util.List;

import com.js.dto.Remark;

public interface RegistrationRemarkDAO {
	
	public String saveNewRemark(Remark remark) throws Exception ;
	public List<Remark> getAllRemarkForAnRegistration(String registrationId)
			throws Exception ;
}
