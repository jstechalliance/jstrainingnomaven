package com.js.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.commons.dbcp.BasicDataSource;

import com.js.dao.EmployeeDAO;
import com.js.dto.Employee;

public class EmployeeDAOImpl implements EmployeeDAO{
	
	private BasicDataSource basicDataSource;
	
	public BasicDataSource getBasicDataSource() {
		return basicDataSource;
	}

	public void setBasicDataSource(BasicDataSource basicDataSource) {
		this.basicDataSource = basicDataSource;
	}

	public Employee getEmployeeDetailByEmployeeId(Employee employee)
			throws Exception {
		Employee tEmployee = null;
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select * from tbl_employee where employee_id='"
							+ employee.getEmployee_id() + "'");
			if (rs.next()) {
				employee.setEmployee_id(rs.getString("employee_id"));
				employee.setFull_name(rs.getString("full_name"));
				tEmployee = employee;
			}
			rs.close();
			st.close();
		} finally {
			con.close();
		}
		return tEmployee;
	}

	public Employee getEmployeeDetailByEmployeeId(Employee employee,
			Connection con) throws Exception {
		Employee tEmployee = null;

		Statement st = con.createStatement();
		String query="select * from tbl_employee where employee_id='"
				+ employee.getEmployee_id() + "'";
//		System.out.println(query);
		ResultSet rs = st
				.executeQuery(query);
		if (rs.next()) {
			employee.setEmployee_id(rs.getString("employee_id"));
			employee.setFull_name(rs.getString("full_name"));
			tEmployee = employee;
		}
		rs.close();
		st.close();

		return tEmployee;
	}
}
