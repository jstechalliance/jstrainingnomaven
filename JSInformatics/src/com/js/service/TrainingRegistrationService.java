package com.js.service;

import java.util.List;

import com.js.dto.TrainingRegistrationDTO;

public interface TrainingRegistrationService {
	
	public String updateTrainingRegistration(TrainingRegistrationDTO registration) throws Exception ;
	public String saveTraningRegistration(TrainingRegistrationDTO registration)	throws Exception ;
	public List<List<String>> getAcademicProjectRegistationAllFollowUp(String branchid) throws Exception ;
	public List<List<String>> getTrainningRegistationAllFollowUp(String branchid) throws Exception;
	public String getRegistrationIdByEnquiryId(String enqId) throws Exception ;
	public TrainingRegistrationDTO getRegistration(String regId) throws Exception ;
	
}
