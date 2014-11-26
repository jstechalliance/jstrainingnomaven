package com.js.service;

import java.util.List;

import com.js.dto.College;

public interface CollegeService {
	
	public List<College> getAllEnquiryedCollege(String branchid) throws Exception;
	public List<College> getAllCollege() throws Exception;

}
