package com.js.service.impl;

import java.util.List;

import com.js.dao.CollegeDAO;
import com.js.dto.College;
import com.js.service.CollegeService;

public class CollegeServiceImpl implements CollegeService{
	
	private CollegeDAO collegeDAO;
	
	public CollegeDAO getCollegeDAO() {
		return collegeDAO;
	}
	public void setCollegeDAO(CollegeDAO collegeDAO) {
		this.collegeDAO = collegeDAO;
	}

	public List<College> getAllEnquiryedCollege(String branchid) throws Exception{
		return collegeDAO.getAllEnquiryedCollege(branchid);
	}
	public List<College> getAllCollege() throws Exception{
		return collegeDAO.getAllCollege();
	}	
}
