package com.js.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.js.service.CertificateService;

public class CertificateController {
	
	private CertificateService certificateService;
	
	public CertificateService getCertificateService() {
		return certificateService;
	}

	public void setCertificateService(CertificateService certificateService) {
		this.certificateService = certificateService;
	}

	public Map<String,String> getStudentInfoToGenerateCertificate(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> res = new HashMap<String, String>();
		try{
			
			String registrationId = request.getParameter("myid");
			String courseId = request.getParameter("courseId");
			String erquiryId = request.getParameter("enquiryId");
			
			res = certificateService.getStudentInfoToGenerateCertificate(erquiryId, registrationId, courseId);
			
		}catch(Throwable th){
			th.printStackTrace();
		}
		return res;
	}
	
}
