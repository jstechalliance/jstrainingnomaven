package com.js.service;

import java.sql.Connection;
import java.util.List;

import com.js.dto.StudentSMSDTO;

public interface StudentSMSService {

	public String saveDetail(StudentSMSDTO smsdto) throws Exception ;
	public String saveDetail(StudentSMSDTO smsdto, Connection con) throws Exception ;
	public List<StudentSMSDTO> getNewSMSDetail() throws Exception ;
	public String updateDetail(StudentSMSDTO smsdto) throws Exception ;
	public List<StudentSMSDTO> updateAllDetail(List<StudentSMSDTO> smsdtos)	throws Exception ;

}
