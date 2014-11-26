package com.js.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.js.dto.Remark;
import com.js.service.RegistrationRemarkService;
import com.js.service.RegistrationService;

public class RegistrationRemarkController {
	
	private RegistrationRemarkService registrationRemarkService;

	public RegistrationRemarkService getRegistrationRemarkService() {
		return registrationRemarkService;
	}
	public void setRegistrationRemarkService(RegistrationRemarkService registrationRemarkService) {
		this.registrationRemarkService = registrationRemarkService;
	}

	public String saveNewRemark(HttpServletRequest request) throws Exception{
		Remark remark=new Remark();
		String employeeId=(String)request.getSession(false).getAttribute("USERNAME");
		Date date=new Date();
		String c_date=(1900+date.getYear())+"-"+(1+date.getMonth())+"-"+date.getDate();
		remark.setEmployee_id(employeeId);
		remark.setRemark(request.getParameter("remark"));
		remark.setRemark_alert(request.getParameter("alertdate"));		
		remark.setRemark_date(c_date);
		remark.setEnquiry_id(request.getParameter("enquiryid"));		
		return registrationRemarkService.saveNewRemark(remark);
	}
	public List<Remark> getAllRemarkForAnRegistration(String registrationId) throws Exception{
		return registrationRemarkService.getAllRemarkForAnRegistration(registrationId);
	}
}
