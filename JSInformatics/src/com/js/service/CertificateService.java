package com.js.service;

import java.util.Map;

public interface CertificateService {
	public Map<String,String> getStudentInfoToGenerateCertificate(String erquiryId,String registrationId,String courseId) throws Exception;
}
