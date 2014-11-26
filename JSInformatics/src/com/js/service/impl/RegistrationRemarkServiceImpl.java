package com.js.service.impl;

import java.util.List;

import com.js.dao.RegistrationRemarkDAO;
import com.js.dto.Remark;
import com.js.service.RegistrationRemarkService;

public class RegistrationRemarkServiceImpl implements RegistrationRemarkService{
	
	private RegistrationRemarkDAO registrationRemarkDAO;
	
	public RegistrationRemarkDAO getRegistrationRemarkDAO() {
		return registrationRemarkDAO;
	}
	public void setRegistrationRemarkDAO(RegistrationRemarkDAO registrationRemarkDAO) {
		this.registrationRemarkDAO = registrationRemarkDAO;
	}

	public String saveNewRemark(Remark remark) throws Exception{
		return registrationRemarkDAO.saveNewRemark(remark);
	}
	public List<Remark> getAllRemarkForAnRegistration(String registrationId) throws Exception{
		return registrationRemarkDAO.getAllRemarkForAnRegistration(registrationId);
	}
}
