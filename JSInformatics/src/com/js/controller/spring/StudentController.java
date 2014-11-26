package com.js.controller.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.js.utils.Constants;

@Controller
public class StudentController {

	@RequestMapping(value="/51",method=RequestMethod.GET)
	public String openHome(){
		return Constants.STUDENT_HOME_PATH+"home";
	}
	
	
}
