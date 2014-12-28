package com.js.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;

import com.js.dao.CertificateDAO;

public class CertificateDAOImpl implements CertificateDAO{
	
	private BasicDataSource basicDataSource;
	
	public BasicDataSource getBasicDataSource() {
		return basicDataSource;
	}

	public void setBasicDataSource(BasicDataSource basicDataSource) {
		this.basicDataSource = basicDataSource;
	}
	
	public Map<String,String> getStudentInfoToGenerateCertificate(String enquiryId,String registrationId,String courseId) throws Exception{
		
		Map <String,String>response = new HashMap<String,String>();
		Connection con = null;
		try{
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from tbl_enquiry where enquiry_id='"+enquiryId+"'");
			String collegeCode = "";
			if(rs.next()){
				String fullName = rs.getString("full_name");
				String fatherName = rs.getString("father_name");
				String qualification = rs.getString("qualification");
				collegeCode = rs.getString("college");
				
				response.put("fullName",fullName);
				response.put("fatherName",fatherName);
				response.put("qualification",qualification);
				response.put("collegeName",collegeCode);
			}
			rs.close();
			st.close();
			
			Statement cst = con.createStatement();
			ResultSet crs = cst.executeQuery("select * from tbl_college where college_code='"+collegeCode+"'");
			if(crs.next()){
				String collegeName = crs.getString("college_name");
				response.put("collegeName",collegeName);
			}
			crs.close();
			cst.close();
				
			Statement regSt = con.createStatement();
			ResultSet regRs = regSt.executeQuery("select * from tbl_registration where registration_id='"+registrationId+"'");
			String registrationDate="";
			if(regRs.next()){
				registrationDate = regRs.getString("reg_date");
				response.put("registrationDate",registrationDate);
			}
			regRs.close();
			regSt.close();
				
			Statement courseSt = con.createStatement();
			ResultSet courseRs = courseSt.executeQuery("select * from tbl_cource where course_id='"+courseId+"'");
			if(courseRs.next()){
				String courseName = courseRs.getString("course_name");
				response.put("courseName",courseName);
			}
			courseRs.close();
			courseSt.close();
				
			response.put("registrationNo",registrationId);
			
			Date currentDate = new Date();
			DateFormat dateFormat = new SimpleDateFormat("dd MMM YYYY");
			String issueDate=dateFormat.format(currentDate);
			
			response.put("issueDate", issueDate);
			
		}finally{
			if(con!=null){
				con.close();
			}
		}
		
		return response;
	}
}
