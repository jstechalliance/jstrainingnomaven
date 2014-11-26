package com.js.dao;

import java.util.List;

import com.js.dto.Course;

public interface CourseDAO {
	public List<Course> getAllCourse(String branchid) throws Exception;
	public List<Course> getAllEnquiredCourse(String branchid) throws Exception;
}
