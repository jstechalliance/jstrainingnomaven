package com.js.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LikeAndInImpl {
	public static String getInContact(String whereClause, Connection con,
			String contact_no) throws Exception {
		List<String> list = new ArrayList<String>();
		Statement st = con.createStatement();
		ResultSet rs = st
				.executeQuery("select my_id from tbl_contact where contact_no like '%"
						+ contact_no + "%'");
		while (rs.next()) {
			list.add("'" + rs.getString("my_id") + "'");
		}
		String s = list.toString().replace("[", "(");
		s = s.replace("]", ")");
		if (list.size() > 0) {
			s = " and " + whereClause + " in " + s;
		} else {
			s = "";
		}
		return s;
	}

	public static String getInReferanceByName(String whereClause,
			Connection con, String referenceFullName) throws Exception {
		List<String> list = new ArrayList<String>();
		Statement st = con.createStatement();
		ResultSet rs = st
				.executeQuery("select reference_id from tbl_reference where full_name like '%"
						+ referenceFullName + "%'");
		while (rs.next()) {
			list.add("'" + rs.getString("reference_id") + "'");
		}
		String s = list.toString().replace("[", "(");
		s = s.replace("]", ")");
		if (list.size() > 0) {
			s = " and " + whereClause + " in " + s;
		} else {
			s = "";
		}
		return s;
	}
	public static String getInReferanceByContactNo(String whereClause,
			Connection con, String contactNo) throws Exception {
		List<String> list = new ArrayList<String>();
		Statement st = con.createStatement();
		ResultSet rs = st
				.executeQuery("select reference_id from tbl_reference where contact_no like '%"
						+ contactNo + "%'");
		while (rs.next()) {
			list.add("'" + rs.getString("reference_id") + "'");
		}
		String s = list.toString().replace("[", "(");
		s = s.replace("]", ")");
		if (list.size() > 0) {
			s = " and " + whereClause + " in " + s;
		} else {
			s = "";
		}
		return s;
	}

	public static String getInReferanceByNo(String whereClause, Connection con,
			String search_enquiry_reference_no) throws Exception {
		List<String> list = new ArrayList<String>();
		Statement st = con.createStatement();
		ResultSet rs = st
				.executeQuery("select reference_id from tbl_reference where contact_no like '%"
						+ search_enquiry_reference_no + "%'");
		while (rs.next()) {
			list.add("'" + rs.getString("reference_id") + "'");
		}
		String s = list.toString().replace("[", "(");
		s = s.replace("]", ")");
		if (list.size() > 0) {
			s = " and " + whereClause + " in " + s;
		} else {
			s = "";
		}
		return s;
	}

	public static String getInEnquiry_idByCourse_code(String whereClause,
			Connection con, String course_code) throws Exception {
		List<String> list = new ArrayList<String>();
		Statement st = con.createStatement();
		ResultSet rs = st
				.executeQuery("select enquiry_id from tbl_intrested_course where course_id ='"
						+ course_code + "'");
		while (rs.next()) {
			list.add("'" + rs.getString("enquiry_id") + "'");
		}
		String s = list.toString().replace("[", "(");
		s = s.replace("]", ")");
		if (list.size() > 0) {
			s = " and " + whereClause + " in " + s;
		} else {
			s = "";
		}
		return s;

	}

	public static String getInCourse_idByEnquiry_id(String whereClause,
			Connection con, String enquiry_id) throws Exception {
		List<String> list = new ArrayList<String>();
		Statement st = con.createStatement();
		ResultSet rs = st
				.executeQuery("select course_id from tbl_intrested_course where enquiry_id='"
						+ enquiry_id + "'");
		while (rs.next()) {
			list.add("'" + rs.getString("course_id") + "'");
		}
		String s = list.toString().replace("[", "(");
		s = s.replace("]", ")");
		if (list.size() > 0) {
			s = " and " + whereClause + " in " + s;
		} else {
			s = "";
		}
		return s;
	}

}
