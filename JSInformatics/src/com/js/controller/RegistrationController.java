package com.js.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.js.dto.NewAcademicProjectEnquiryDTO;
import com.js.dto.NewTrainingEnquiryDTO;
import com.js.dto.SearchEnquiry;
import com.js.dto.TrainingRegistrationDTO;
import com.js.exception.JSIException;
import com.js.service.EnquiryService;
import com.js.service.RegistrationService;
import com.js.service.TrainingRegistrationService;

public class RegistrationController {
	
	private RegistrationService registrationService;
	private EnquiryService enquiryService;
	private TrainingRegistrationService trainingRegistrationService;
	
	public RegistrationService getRegistrationService() {
		return registrationService;
	}

	public void setRegistrationService(RegistrationService registrationService) {
		this.registrationService = registrationService;
	}
	
	public EnquiryService getEnquiryService() {
		return enquiryService;
	}

	public void setEnquiryService(EnquiryService enquiryService) {
		this.enquiryService = enquiryService;
	}
	
	public TrainingRegistrationService getTrainingRegistrationService() {
		return trainingRegistrationService;
	}

	public void setTrainingRegistrationService(
			TrainingRegistrationService trainingRegistrationService) {
		this.trainingRegistrationService = trainingRegistrationService;
	}

	public void searchTranningRegistration(SearchEnquiry searchEnquiry,
			HttpServletRequest request, HttpServletResponse response,
			String branchid) throws Exception {
		try {
			searchEnquiry.setSearch_training_enquiry_status("Joined");
			searchEnquiry.setSearch_purpose("training");
			List<NewTrainingEnquiryDTO> enquiryList = enquiryService
					.searchTrainingEnquiryBranchWise(
							searchEnquiry,
							(String) request.getSession(false).getAttribute(
									"BRANCHID"));
			request.setAttribute("REGISTRATIONSEARCHRESULT", enquiryList);
			request.getRequestDispatcher("registration.jsp").forward(request,
					response);
		} catch (Exception ex) {
			new JSIException(ex).log();
			ex.printStackTrace();
		}
	}

	public void searchAcademicRegistration(SearchEnquiry searchEnquiry,
			HttpServletRequest request, HttpServletResponse response,
			String branchid) throws Exception {
		try {
			searchEnquiry.setSearch_academic_project_enquiry_status("Joined");
			searchEnquiry.setSearch_purpose("academic project");
			List<NewAcademicProjectEnquiryDTO> enquiryList = enquiryService
					.searchAcademicEnquiryBranchWise(searchEnquiry, branchid);
			request.setAttribute("ACADEMICREGISTRATIONSEARCHRESULT",
					enquiryList);
			request.getRequestDispatcher("registration_aca_project.jsp")
					.forward(request, response);
		} catch (Exception ex) {
			new JSIException(ex).log();
			ex.printStackTrace();
		}
	}

	public List<List<String>> getTrainningRegistationAllFollowUp(
			HttpServletRequest request) throws Exception {

		return registrationService
				.getTrainningRegistationAllFollowUp((String) request
						.getSession(false).getAttribute("BRANCHID"));
	}

	public List<List<String>> getAcademicRegistationAllFollowUp(
			HttpServletRequest request) throws Exception {

		return registrationService
				.getTrainningRegistationAllFollowUp((String) request
						.getSession(false).getAttribute("BRANCHID"));
	}

	public TrainingRegistrationDTO getRegistration(String regId)
			throws Exception {
		return trainingRegistrationService.getRegistration(regId);
	}

	public String saveTrainingRegistration(HttpServletRequest request,
			TrainingRegistrationDTO trainingRegistrationDTO) throws Exception {
		String ret = "error";

		trainingRegistrationDTO.setReg_date(new SimpleDateFormat("yyyy-MM-dd")
				.format(new Date()));
		String employeeId = (String) request.getSession(false).getAttribute(
				"USERNAME");
		trainingRegistrationDTO.setEmployee_id(employeeId);
		ret = registrationService
				.saveRegistration(trainingRegistrationDTO);
		
		if (ret.equalsIgnoreCase("success")) {
			ret = "Registration successfully saved";
		} else if (ret.equalsIgnoreCase("exist")) {
			ret = "Already registered";
		} else {
			ret = "Registration not save";
		}
		return ret;
	}
	public String updateTrainingRegistration(HttpServletRequest request,
			TrainingRegistrationDTO trainingRegistrationDTO) throws Exception {
		String ret = "error";

		trainingRegistrationDTO.setReg_date(new SimpleDateFormat("yyyy-MM-dd")
				.format(new Date()));
		String employeeId = (String) request.getSession(false).getAttribute(
				"USERNAME");
		trainingRegistrationDTO.setEmployee_id(employeeId);
		ret = registrationService
				.updateTrainingRegistration(trainingRegistrationDTO);
		
		if (ret.equalsIgnoreCase("success")) {
			ret = "Registration successfully updated";
		} else {
			ret = "Registration not update";
		}
		return ret;
	}
	
}
