package com.js.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.dbcp.BasicDataSource;

import com.js.dao.ReferanceDAO;
import com.js.dto.ReferanceDTO;

public class ReferanceDAOImpl implements ReferanceDAO {
	
	private BasicDataSource basicDataSource;
	
	public BasicDataSource getBasicDataSource() {
		return basicDataSource;
	}

	public void setBasicDataSource(BasicDataSource basicDataSource) {
		this.basicDataSource = basicDataSource;
	}

	public void saveReferance(Connection con,
			ReferanceDTO referanceDTO) throws SQLException {
		long reference_id_long = -1;
		Statement st = con.createStatement();
		String query="select * from tbl_reference where contact_no='"
				+ referanceDTO.getContact_no()
		+ "' and full_name='"
		+ referanceDTO.getFull_name() + "'";
		ResultSet rs = st
				.executeQuery(query);
		if (rs.next()) {
			reference_id_long = rs.getLong("reference_id");
		}
		rs.close();
		st.close();
		referanceDTO.setReference_id(""
				+ reference_id_long);
		if (reference_id_long == -1) {
			st = con.createStatement();
			rs = st.executeQuery("select * from tbl_counter");
			if (rs.next()) {
				reference_id_long = rs.getLong("reference_id");
			}
			rs.close();
			st.close();
			referanceDTO.setReference_id(""
					+ reference_id_long);
			st = con.createStatement();
			st.executeUpdate("insert into tbl_reference (reference_id,full_name,contact_no) values ('"
					+ referanceDTO.getReference_id()
					+ "','"
					+ referanceDTO
							.getFull_name()
					+ "','"
					+ referanceDTO
							.getContact_no() + "')");
			st.close();

			reference_id_long++;
			st = con.createStatement();
			st.executeUpdate("update tbl_counter set reference_id ="
					+ reference_id_long + " where myid=1");
			st.close();
		}

		st = con.createStatement();
		st.executeUpdate("insert into relation_with_reference (myid,note,reference_id) values ('"
				+ referanceDTO.getMyid()
				+ "','"
				+ referanceDTO.getNote()
				+ "','" + reference_id_long + "')");
		st.close();

	}
}
