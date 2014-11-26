package com.js.service.impl;

import java.util.List;

import com.js.dao.WebEnquiryDAO;
import com.js.dto.WebEnquiryDTO;
import com.js.service.WebEnquiryService;

public class WebEnquiryServiceImpl implements WebEnquiryService{
	
	private WebEnquiryDAO webEnquiryDAO;
	
	public WebEnquiryDAO getWebEnquiryDAO() {
		return webEnquiryDAO;
	}

	public void setWebEnquiryDAO(WebEnquiryDAO webEnquiryDAO) {
		this.webEnquiryDAO = webEnquiryDAO;
	}

	public List<WebEnquiryDTO> getAllWebInquiryByDateWise() throws Exception {
		return webEnquiryDAO.getAllWebInquiryByDateWise();
	}

	public WebEnquiryDTO getWebEnquiryById(String id) throws Exception {
		return webEnquiryDAO.getWebEnquiryById(id);
	}
	public String saveWebInquiry(WebEnquiryDTO dto) throws Exception {
		return webEnquiryDAO.saveWebInquiry(dto);
	}
}
