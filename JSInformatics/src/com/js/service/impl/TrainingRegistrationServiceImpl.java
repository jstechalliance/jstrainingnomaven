package com.js.service.impl;

import java.util.List;

import com.js.dao.TrainingRegistrationDAO;
import com.js.dto.TrainingRegistrationDTO;
import com.js.service.TrainingRegistrationService;

public class TrainingRegistrationServiceImpl implements TrainingRegistrationService{
	
	private TrainingRegistrationDAO trainingRegistrationDAO;
	
	public TrainingRegistrationDAO getTrainingRegistrationDAO() {
		return trainingRegistrationDAO;
	}
	public void setTrainingRegistrationDAO(
			TrainingRegistrationDAO trainingRegistrationDAO) {
		this.trainingRegistrationDAO = trainingRegistrationDAO;
	}
	public String updateTrainingRegistration(TrainingRegistrationDTO registration) throws Exception {
		return trainingRegistrationDAO.updateTrainingRegistration(registration);
	}
	public String saveTraningRegistration(TrainingRegistrationDTO registration)	throws Exception {
		return trainingRegistrationDAO.saveTraningRegistration(registration);
	}
	public List<List<String>> getAcademicProjectRegistationAllFollowUp(String branchid) throws Exception {
		return trainingRegistrationDAO.getAcademicProjectRegistationAllFollowUp(branchid);
	}
	public List<List<String>> getTrainningRegistationAllFollowUp(String branchid) throws Exception{
		return trainingRegistrationDAO.getTrainningRegistationAllFollowUp(branchid);
	}
	public String getRegistrationIdByEnquiryId(String enqId) throws Exception {
		return trainingRegistrationDAO.getRegistrationIdByEnquiryId(enqId);
	}
	public TrainingRegistrationDTO getRegistration(String regId) throws Exception {
		return trainingRegistrationDAO.getRegistration(regId);
	}
	
}
