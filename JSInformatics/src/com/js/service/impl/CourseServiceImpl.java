package com.js.service.impl;

import java.util.List;

import com.js.dao.CourseDAO;
import com.js.dto.Course;
import com.js.service.CourseService;

public class CourseServiceImpl implements CourseService{
	
	private CourseDAO courseDAO;
	
	public CourseDAO getCourseDAO() {
		return courseDAO;
	}
	public void setCourseDAO(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	public List<Course> getAllCourse(String branchid) throws Exception{
		return courseDAO.getAllCourse(branchid);
	}
	public List<Course> getAllEnquiredCourse(String branchid) throws Exception{
		return courseDAO.getAllEnquiredCourse(branchid);
	}
}
