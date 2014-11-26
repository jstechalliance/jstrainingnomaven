package com.js.service;

import java.util.List;

import com.js.dto.TrainingRegistrationDTO;

public interface RegistrationService {

	public String saveRegistration(TrainingRegistrationDTO registration) throws Exception;
	public String updateTrainingRegistration(TrainingRegistrationDTO registration) throws Exception;
	public List<List<String>> getTrainningRegistationAllFollowUp(String request) throws Exception;

}
