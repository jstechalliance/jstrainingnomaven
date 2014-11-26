package com.js.dao;

import java.sql.Connection;

import com.js.dto.Employee;

public interface EmployeeDAO {

	public Employee getEmployeeDetailByEmployeeId(Employee employee) throws Exception ;
	public Employee getEmployeeDetailByEmployeeId(Employee employee,Connection con) throws Exception ;

}
