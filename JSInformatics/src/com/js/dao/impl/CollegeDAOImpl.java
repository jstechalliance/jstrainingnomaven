package com.js.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import org.apache.commons.dbcp.BasicDataSource;

import com.js.dao.CollegeDAO;
import com.js.dto.*; 

public class CollegeDAOImpl implements CollegeDAO{
	
	private BasicDataSource basicDataSource;
	
	public BasicDataSource getBasicDataSource() {
		return basicDataSource;
	}

	public void setBasicDataSource(BasicDataSource basicDataSource) {
		this.basicDataSource = basicDataSource;
	}
	
	public List<College> getAllEnquiryedCollege(String branchid) throws Exception{
		List <College>collegeList=new ArrayList<College>();
		Connection con= basicDataSource.getConnection();
		Statement st= con.createStatement();
		ResultSet rs= st.executeQuery("select DISTINCT college from tbl_enquiry where enquiry_id like '"+branchid+"%'");
		while(rs.next()){
			College c=new College();
			c.setCollegeCode(rs.getString("college"));
			Statement tst=con.createStatement();
			ResultSet trs=tst.executeQuery("select * from tbl_college where college_code='"+c.getCollegeCode()+"'");
			if(trs.next()){
				c.setCollegeName(trs.getString("college_name"));
			}else{
				c.setCollegeName(c.getCollegeCode());
			}
			trs.close();
			tst.close();	
			collegeList.add(c);
		}
		rs.close();
		st.close();
		con.close();
		return collegeList;
	}
	public List<College> getAllCollege() throws Exception{
		List <College>collegeList=new ArrayList<College>();
		Connection con= basicDataSource.getConnection();
		Statement st= con.createStatement();
		ResultSet rs= st.executeQuery("select * from tbl_college order by college_name");
		while(rs.next()){
			College c=new College();			
			c.setCollegeCode(rs.getString("college_code"));
			c.setCollegeName(rs.getString("college_name"));
			collegeList.add(c);
		}
		rs.close();
		st.close();
		con.close();
		return collegeList;
	} 
}
