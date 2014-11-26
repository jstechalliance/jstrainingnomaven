package com.js.dao;

import java.util.List;

import com.js.dto.College;

public interface CollegeDAO {
	
	public List<College> getAllEnquiryedCollege(String branchid) throws Exception;
	public List<College> getAllCollege() throws Exception;
}
