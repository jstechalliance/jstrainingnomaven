package com.js.controller.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.js.utils.Constants;

@Controller
public class FacultyController {
	
	@RequestMapping(value="41",method=RequestMethod.GET)
	public String openFacultyHomePage(){
		return Constants.FACULTY_HOME_PATH+"home";
	}
	
}
