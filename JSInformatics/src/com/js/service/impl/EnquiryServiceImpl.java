package com.js.service.impl;

import java.util.List;

import com.js.dao.EnquiryDAO;
import com.js.dto.AcademicProjectRemark;
import com.js.dto.EnquiryRemark;
import com.js.dto.NewAcademicProjectEnquiryDTO;
import com.js.dto.NewEnquiry;
import com.js.dto.NewTrainingEnquiryDTO;
import com.js.dto.NewVisitorEnquiryDTO;
import com.js.dto.Remark;
import com.js.dto.SearchEnquiry;
import com.js.service.EnquiryService;

public class EnquiryServiceImpl implements EnquiryService{
	
	private EnquiryDAO enquiryDAO;
	
	public EnquiryDAO getEnquiryDAO() {
		return enquiryDAO;
	}
	public void setEnquiryDAO(EnquiryDAO enquiryDAO) {
		this.enquiryDAO = enquiryDAO;
	}

	public String saveNewVisitorEnquiry(NewVisitorEnquiryDTO newEnquiry) throws Exception{
		String ret=enquiryDAO.saveNewVistorEnquiry(newEnquiry);
		return ret;
	}
	public String saveNewTrainingEnquiry(NewTrainingEnquiryDTO newTrainingEnquiryDTO) throws Exception{
		String ret=enquiryDAO.saveNewTrainingEnquiry(newTrainingEnquiryDTO);
		return ret;
	}
	public String saveNewAcademicProjectEnquiry(NewAcademicProjectEnquiryDTO newAcademicProjectEnquiryDTO) throws Exception{
		String ret=enquiryDAO.saveNewAcademicProjectEnquiry(newAcademicProjectEnquiryDTO);
		return ret;
	}
		
	public List<String> getAllEnquiredQualification(String branchid) throws Exception{
		return enquiryDAO.getAllEnquiredQualification(branchid);
	}
	/*public List<NewEnquiry> searchEnquiryBranchWise(SearchEnquiry searchEnquiry,String branchid) throws Exception{
		return new com.js.dao.EnquiryDAO().searchEnquiryBranchWise(searchEnquiry,branchid);
	}*/
	public List<String> getAllEnquiredStatus(String branchid) throws Exception{
		return enquiryDAO.getAllEnquiredStatus(branchid);
	}
	public List<EnquiryRemark> getAllRemarkForAnEnquiry(NewEnquiry newEnquiry) throws Exception{
		return enquiryDAO.getAllRemarkForAnEnquiry(newEnquiry);
	}
	public String saveNewRemark(Remark remark) throws Exception{
		return enquiryDAO.saveNewRemark(remark);
	}
	public String saveNewAcademicProjectRemark(AcademicProjectRemark academicProjectRemark) throws Exception{
		return enquiryDAO.saveNewAcademicProjectRemark(academicProjectRemark);
	}
	//************
	
	public List<List<NewEnquiry>> getAllFollowUp(String branchid) throws Exception{
		return enquiryDAO.getAllFollowUp(branchid);
	}
	/*public String updateEnquiry(NewEnquiry newEnquiry) throws Exception{
		return new EnquiryDAO().updateEnquiry(newEnquiry);
	}*/
	public String updateTrainingEnquiry(NewTrainingEnquiryDTO newEnquiry) throws Exception{
		return enquiryDAO.updateTrainingEnquiry(newEnquiry);
	}
	public String updateAcademicProjectEnquiry(NewAcademicProjectEnquiryDTO newEnquiry) throws Exception{
		return enquiryDAO.updateAcademicProjectEnquiry(newEnquiry);
	}
	
	public List<List<NewTrainingEnquiryDTO>> getAllTrainingFollowUp(String branchid) throws Exception{
		return enquiryDAO.getTrainingAllFollowUp(branchid);
	}
	public List<List<NewAcademicProjectEnquiryDTO>> getAllAcademicProjectFollowUp(String branchid) throws Exception{
		return enquiryDAO.getAllAcademicProjectFollowUp(branchid);
	}
	public List<List<NewVisitorEnquiryDTO>> getAllVisitorFollowUp(String branchid) throws Exception{
		return enquiryDAO.getAllVisitorFollowUp(branchid);
	}
	public List<EnquiryRemark> getAllRemarkForAnTrainingEnquiry(NewTrainingEnquiryDTO newEnquiry) throws Exception{
		return enquiryDAO.getAllRemarkForAnTrainingEnquiry(newEnquiry);
	}
	public List<NewAcademicProjectEnquiryDTO> searchAcademicEnquiryBranchWise(SearchEnquiry searchEnquiry,String branchid) throws Exception{
		return enquiryDAO.searchAcademicEnquiryBranchWise(searchEnquiry,branchid);
	}
	public List<NewVisitorEnquiryDTO> searchVisitorEnquiryBranchWise(SearchEnquiry searchEnquiry,String branchid) throws Exception{
		return enquiryDAO.searchVisitorEnquiryBranchWise(searchEnquiry,branchid);
	}
	public List<NewTrainingEnquiryDTO> searchTrainingEnquiryBranchWise(SearchEnquiry searchEnquiry,String branchid) throws Exception{
		return enquiryDAO.searchTraininEnquiryBranchWise(searchEnquiry,branchid);
	}
	public List<AcademicProjectRemark> getAllRemarkForAnAcademicProjectEnquiry(NewAcademicProjectEnquiryDTO newAcademicProjectEnquiryDTO) throws Exception{
		return enquiryDAO.getAllRemarkForAnAcademicProjectEnquiry(newAcademicProjectEnquiryDTO);
	}
	//saveNewAcademicProjectRemark(remark);
}
