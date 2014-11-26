package com.js.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.js.dto.WebEnquiryDTO;
import com.js.exception.JSIException;
import com.js.service.WebEnquiryService;
import com.js.utils.Constants;

public class WebEnquiryController {
	
	private WebEnquiryService webEnquiryService;
	
	public WebEnquiryService getWebEnquiryService() {
		return webEnquiryService;
	}

	public void setWebEnquiryService(WebEnquiryService webEnquiryService) {
		this.webEnquiryService = webEnquiryService;
	}

	public List<WebEnquiryDTO> getAllWebInquiryByDateWise() {
		List<WebEnquiryDTO> dtos = new ArrayList<WebEnquiryDTO>();
		try {
			dtos = webEnquiryService.getAllWebInquiryByDateWise();
		} catch (Exception ex) {
			ex.printStackTrace();
			new JSIException(ex).log();
		}
		return dtos;
	}

	public WebEnquiryDTO getWebEnquiryById(String id, HttpServletRequest request) {
		WebEnquiryDTO enquiryDTO = new WebEnquiryDTO();
		if (id == null) {
			return enquiryDTO;
		}
		try {
			enquiryDTO = webEnquiryService.getWebEnquiryById(id);
			if (enquiryDTO == null) {
				enquiryDTO = new WebEnquiryDTO();
				request.setAttribute("WEBENQUIRYREQUEST",
						Constants.WEB_ENQUIRY_DUPLICATE_ENTRY);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			new JSIException(ex).log();
		}
		return enquiryDTO;
	}

	public void saveWebInquiry(WebEnquiryDTO dto){
		try {
			String ret=webEnquiryService.saveWebInquiry(dto);
			if(ret.equalsIgnoreCase("error")){
				new JSIException("Email enquiry not save").log();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			new JSIException(ex).log();
		}
	}
}
