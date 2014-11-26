package com.js.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;

import com.js.dao.StudentSMSDAO;
import com.js.db.MyConnection;
import com.js.dto.StudentSMSDTO;
import com.js.exception.JSIException;

public class StudentSMSDAOImpl implements StudentSMSDAO{

	private BasicDataSource basicDataSource;
	
	public BasicDataSource getBasicDataSource() {
		return basicDataSource;
	}

	public void setBasicDataSource(BasicDataSource basicDataSource) {
		this.basicDataSource = basicDataSource;
	}

	public String saveDetail(StudentSMSDTO smsdto) throws Exception {
		String ret = "error";
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			st.execute("INSERT INTO tbl_sms(fixid,number,forwhat,message,sms_status,status_date)values('"
					+ smsdto.getFixid()
					+ "','"
					+ smsdto.getNumber()
					+ "','"
					+ smsdto.getForwhat()
					+ "','"
					+ smsdto.getMessage()
					+ "','"
					+ smsdto.getStatus() + "','" + smsdto.getDate() + "')");
			st.close();
			ret = "success";
		} finally {
			con.close();
		}
		return ret;
	}

	public String saveDetail(StudentSMSDTO smsdto, Connection con)
			throws Exception {
		String ret = "error";
		String query = "INSERT INTO tbl_sms(fixid,number,forwhat,message,sms_status,status_date)values('"
				+ smsdto.getFixid()
				+ "','"
				+ smsdto.getNumber()
				+ "','"
				+ smsdto.getForwhat()
				+ "','"
				+ smsdto.getMessage()
				+ "','"
				+ smsdto.getStatus() + "','" + smsdto.getDate() + "')";
		//System.out.println("" + query);
		Statement st = con.createStatement();
		st.execute(query);
		st.close();
		ret = "success";
		return ret;
	}

	public List<StudentSMSDTO> getNewSMSDetail() throws Exception {
		List<StudentSMSDTO> list = new ArrayList<StudentSMSDTO>();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			//System.out.println("select * from tbl_sms where number='new sms'");
			ResultSet rs = st
					.executeQuery("select * from tbl_sms where sms_status='new sms'");

			while (rs.next()) {
				StudentSMSDTO smsdto = new StudentSMSDTO();
				smsdto.setDate(rs.getString("status_date"));
				smsdto.setFixid(rs.getString("fixid"));
				smsdto.setForwhat(rs.getString("forwhat"));
				smsdto.setId(rs.getString("id"));
				smsdto.setMessage(rs.getString("message"));
				smsdto.setNumber(rs.getString("number"));
				smsdto.setStatus(rs.getString("sms_status"));
				list.add(smsdto);
			}
			st.close();
		} finally {
			con.close();
		}
		return list;
	}

	public String updateDetail(StudentSMSDTO smsdto) throws Exception {
		String ret = "error";
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("update tbl_sms set sms_status="
					+ smsdto.getStatus() + "',status_date=" + smsdto.getDate()
					+ "' where fixid='" + smsdto.getFixid() + "' and id='"
					+ smsdto.getId() + "'");
			st.close();
			ret = "success";
		} finally {
			con.close();
		}
		return ret;
	}

	public List<StudentSMSDTO> updateAllDetail(List<StudentSMSDTO> smsdtos)
			throws Exception {
		List<StudentSMSDTO> list = new ArrayList<StudentSMSDTO>();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			
			for (StudentSMSDTO smsdto : smsdtos) {
				try {
					Statement st = con.createStatement();
					st.executeUpdate("update tbl_sms set sms_status="
							+ smsdto.getStatus() + "',status_date="
							+ smsdto.getDate() + "' where fixid='"
							+ smsdto.getFixid() + "' and id='" + smsdto.getId()
							+ "'");
					st.close();
					list.add(new StudentSMSDTO(smsdto.getId(), smsdto.getFixid(), smsdto.getStatus(), smsdto.getDate()));
				} catch (Exception e) {
					new JSIException(e).log();
				}
			}
		} finally {
			con.close();
		}
		return list;
	}


}
