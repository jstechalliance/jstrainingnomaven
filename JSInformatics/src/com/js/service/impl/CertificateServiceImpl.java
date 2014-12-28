package com.js.service.impl;

import java.util.Map;

import com.js.dao.CertificateDAO;
import com.js.service.CertificateService;

public class CertificateServiceImpl implements CertificateService{
	
	private CertificateDAO certificateDAO;
	
	public CertificateDAO getCertificateDAO() {
		return certificateDAO;
	}

	public void setCertificateDAO(CertificateDAO certificateDAO) {
		this.certificateDAO = certificateDAO;
	}

	@Override
	public Map<String, String> getStudentInfoToGenerateCertificate(String erquiryId, String registrationId, String courseId)throws Exception {
		return certificateDAO.getStudentInfoToGenerateCertificate(erquiryId, registrationId, courseId);
	}
	
	
	
	
}
