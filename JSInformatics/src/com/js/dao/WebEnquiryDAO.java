package com.js.dao;

import java.util.List;

import com.js.dto.WebEnquiryDTO;

public interface WebEnquiryDAO {
	
	public List<WebEnquiryDTO> getAllWebInquiryByDateWise() throws Exception ;
	public String saveWebInquiry(WebEnquiryDTO dto) throws Exception ;
	public WebEnquiryDTO getWebEnquiryById(String id) throws Exception ;
	
}
