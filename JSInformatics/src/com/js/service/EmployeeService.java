package com.js.service;

import java.sql.Connection;

import com.js.dto.Employee;

public interface EmployeeService {
	
	public Employee getEmployeeDetailByEmployeeId(Employee employee) throws Exception;
	public Employee getEmployeeDetailByEmployeeId(Employee employee,Connection con) throws Exception ;

}
