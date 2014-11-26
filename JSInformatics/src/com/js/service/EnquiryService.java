package com.js.service;

import java.util.List;

import com.js.dto.AcademicProjectRemark;
import com.js.dto.EnquiryRemark;
import com.js.dto.NewAcademicProjectEnquiryDTO;
import com.js.dto.NewEnquiry;
import com.js.dto.NewTrainingEnquiryDTO;
import com.js.dto.NewVisitorEnquiryDTO;
import com.js.dto.Remark;
import com.js.dto.SearchEnquiry;

public interface EnquiryService {
	public String saveNewVisitorEnquiry(NewVisitorEnquiryDTO newEnquiry) throws Exception;
	public String saveNewTrainingEnquiry(NewTrainingEnquiryDTO newTrainingEnquiryDTO) throws Exception;
	public String saveNewAcademicProjectEnquiry(NewAcademicProjectEnquiryDTO newAcademicProjectEnquiryDTO) throws Exception;
		
	public List<String> getAllEnquiredQualification(String branchid) throws Exception;
	
	public List<String> getAllEnquiredStatus(String branchid) throws Exception;
	public List<EnquiryRemark> getAllRemarkForAnEnquiry(NewEnquiry newEnquiry) throws Exception;
	public String saveNewRemark(Remark remark) throws Exception;
	public String saveNewAcademicProjectRemark(AcademicProjectRemark academicProjectRemark) throws Exception;
	//************
	
	public List<List<NewEnquiry>> getAllFollowUp(String branchid) throws Exception;
	
	public String updateTrainingEnquiry(NewTrainingEnquiryDTO newEnquiry) throws Exception;
	public String updateAcademicProjectEnquiry(NewAcademicProjectEnquiryDTO newEnquiry) throws Exception;
	
	public List<List<NewTrainingEnquiryDTO>> getAllTrainingFollowUp(String branchid) throws Exception;
	public List<List<NewAcademicProjectEnquiryDTO>> getAllAcademicProjectFollowUp(String branchid) throws Exception;
	public List<List<NewVisitorEnquiryDTO>> getAllVisitorFollowUp(String branchid) throws Exception;
	public List<EnquiryRemark> getAllRemarkForAnTrainingEnquiry(NewTrainingEnquiryDTO newEnquiry) throws Exception;
	
	public List<NewAcademicProjectEnquiryDTO> searchAcademicEnquiryBranchWise(SearchEnquiry searchEnquiry,String branchid) throws Exception;
	public List<NewVisitorEnquiryDTO> searchVisitorEnquiryBranchWise(SearchEnquiry searchEnquiry,String branchid) throws Exception;
	public List<NewTrainingEnquiryDTO> searchTrainingEnquiryBranchWise(SearchEnquiry searchEnquiry,String branchid) throws Exception;
	public List<AcademicProjectRemark> getAllRemarkForAnAcademicProjectEnquiry(NewAcademicProjectEnquiryDTO newAcademicProjectEnquiryDTO) throws Exception;
	//saveNewAcademicProjectRemark(remark);
}
