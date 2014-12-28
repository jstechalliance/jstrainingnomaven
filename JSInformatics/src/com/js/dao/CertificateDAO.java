package com.js.dao;

import java.util.Map;

public interface CertificateDAO {
	public Map<String,String> getStudentInfoToGenerateCertificate(String erquiryId,String registrationId,String courseId) throws Exception;
}
