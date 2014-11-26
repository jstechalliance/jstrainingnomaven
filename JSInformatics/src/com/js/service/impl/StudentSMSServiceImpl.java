package com.js.service.impl;

import java.sql.Connection;
import java.util.List;

import com.js.dao.StudentSMSDAO;
import com.js.dto.StudentSMSDTO;
import com.js.service.StudentSMSService;

public class StudentSMSServiceImpl implements StudentSMSService{

	private StudentSMSDAO studentSMSDAO;
	
	public StudentSMSDAO getStudentSMSDAO() {
		return studentSMSDAO;
	}
	public void setStudentSMSDAO(StudentSMSDAO studentSMSDAO) {
		this.studentSMSDAO = studentSMSDAO;
	}

	public String saveDetail(StudentSMSDTO smsdto) throws Exception {
		return studentSMSDAO.saveDetail(smsdto);
	}
	public String saveDetail(StudentSMSDTO smsdto, Connection con) throws Exception {
		return studentSMSDAO.saveDetail(smsdto, con);
	}
	public List<StudentSMSDTO> getNewSMSDetail() throws Exception {
		return studentSMSDAO.getNewSMSDetail();
	}
	public String updateDetail(StudentSMSDTO smsdto) throws Exception {
		return studentSMSDAO.updateDetail(smsdto);
	}
	public List<StudentSMSDTO> updateAllDetail(List<StudentSMSDTO> smsdtos)	throws Exception {
		return updateAllDetail(smsdtos);
	}

}
