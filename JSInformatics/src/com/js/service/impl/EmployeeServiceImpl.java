package com.js.service.impl;

import java.sql.Connection;

import com.js.dao.EmployeeDAO;
import com.js.dto.Employee;
import com.js.service.EmployeeService;

public class EmployeeServiceImpl implements EmployeeService{
	
	private EmployeeDAO employeeDAO;
	
	public EmployeeDAO getEmployeeDAO() {
		return employeeDAO;
	}
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	public Employee getEmployeeDetailByEmployeeId(Employee employee) throws Exception{
		return employeeDAO.getEmployeeDetailByEmployeeId(employee);
	}
	public Employee getEmployeeDetailByEmployeeId(Employee employee,
			Connection con) throws Exception {
		return employeeDAO.getEmployeeDetailByEmployeeId(employee,con);
	}
}
