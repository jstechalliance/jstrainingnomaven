package com.js.service.impl;

import java.util.List;

import com.js.dao.TrainingRegistrationDAO;
import com.js.dto.TrainingRegistrationDTO;
import com.js.service.RegistrationService;

public class RegistrationServiceImpl implements RegistrationService{

	private TrainingRegistrationDAO trainingRegistrationDAO;
	
	public TrainingRegistrationDAO getTrainingRegistrationDAO() {
		return trainingRegistrationDAO;
	}
	public void setTrainingRegistrationDAO(
			TrainingRegistrationDAO trainingRegistrationDAO) {
		this.trainingRegistrationDAO = trainingRegistrationDAO;
	}

	public String saveRegistration(TrainingRegistrationDTO registration) throws Exception{
		String ret=trainingRegistrationDAO.saveTraningRegistration(registration);
		return ret;
	}
	public String updateTrainingRegistration(TrainingRegistrationDTO registration) throws Exception{
		String ret=trainingRegistrationDAO.updateTrainingRegistration(registration);
		return ret;
	}
	
	public List<List<String>> getTrainningRegistationAllFollowUp(String request) throws Exception{		
		return trainingRegistrationDAO.getTrainningRegistationAllFollowUp(request);
	}
}
