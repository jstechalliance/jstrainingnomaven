package com.js.service;

import java.util.List;

import com.js.dto.WebEnquiryDTO;

public interface WebEnquiryService {
	
	public List<WebEnquiryDTO> getAllWebInquiryByDateWise() throws Exception;
	public WebEnquiryDTO getWebEnquiryById(String id) throws Exception ;
	public String saveWebInquiry(WebEnquiryDTO dto) throws Exception ;

}
