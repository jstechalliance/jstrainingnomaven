package com.js.service;

import java.util.List;

import com.js.dto.Course;

public interface CourseService {
	
	public List<Course> getAllCourse(String branchid) throws Exception;
	public List<Course> getAllEnquiredCourse(String branchid) throws Exception;

}
