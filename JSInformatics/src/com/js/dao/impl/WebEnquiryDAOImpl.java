package com.js.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;

import com.js.dao.WebEnquiryDAO;
import com.js.dto.WebEnquiryDTO;

public class WebEnquiryDAOImpl implements WebEnquiryDAO{
	
	private BasicDataSource basicDataSource;
	
	public BasicDataSource getBasicDataSource() {
		return basicDataSource;
	}

	public void setBasicDataSource(BasicDataSource basicDataSource) {
		this.basicDataSource = basicDataSource;
	}

	public List<WebEnquiryDTO> getAllWebInquiryByDateWise() throws Exception {
		List<WebEnquiryDTO> dtos = new ArrayList<WebEnquiryDTO>();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("SELECT * FROM jsinformatics.tbl_web_enquiry where enq_status='NEW_ENQ' order by enquiry_date DESC");
			while (rs.next()) {
				WebEnquiryDTO dto = new WebEnquiryDTO();
				dto.setContactno(rs.getString("contactno"));
				dto.setCourse(rs.getString("course"));
				dto.setEmail(rs.getString("email"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("full_name"));
				dto.setQualification(rs.getString("qualification"));
				dto.setReferance(rs.getString("referance"));
				dtos.add(dto);
			}
			rs.close();
			st.close();
		} finally {
			con.close();
		}
		return dtos;
	}

	public String saveWebInquiry(WebEnquiryDTO dto) throws Exception {
		String ret = "error";
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			st.execute("insert into tbl_web_enquiry(full_name,qualification,contactno,email,course,referance,enquiry_date,enq_status)values('"
					+ dto.getName()
					+ "','"
					+ dto.getQualification()
					+ "','"
					+ dto.getContactno()
					+ "','"
					+ dto.getEmail()
					+ "','"
					+ dto.getCourse()
					+ "','"
					+ dto.getReferance()
					+ "','"
					+ dto.getEnquiry_date() + "','" + dto.getStatus() + "')");
			st.close();
			ret="success";
		} finally {
			con.close();
		}
		return ret;
	}

	public WebEnquiryDTO getWebEnquiryById(String id) throws Exception {
		WebEnquiryDTO dto = null;
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("SELECT * FROM jsinformatics.tbl_web_enquiry where enq_status='NEW_ENQ' and id='"
							+ id + "' order by enquiry_date DESC");
			while (rs.next()) {
				dto = new WebEnquiryDTO();
				dto.setContactno(rs.getString("contactno"));
				dto.setCourse(rs.getString("course"));
				dto.setEmail(rs.getString("email"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("full_name"));
				dto.setQualification(rs.getString("qualification"));
				dto.setReferance(rs.getString("referance"));
				dto.setEnquiry_date(rs.getString("enquiry_date"));
				dto.setStatus(rs.getString("enq_status"));
			}
			rs.close();
			st.close();
		} finally {
			con.close();
		}
		return dto;
	}
	public static void main(String[] args) throws Exception{
		//new WebEnquiryDAOImpl().saveWebInquiry(new WebEnquiryDTO());
	}
}
