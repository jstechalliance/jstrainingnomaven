package com.js.controller.spring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.js.utils.Constants;

@Controller
public class DeveloperController {

	@RequestMapping(value="/61",method=RequestMethod.GET)
	public String openDeveloperHomePage(){
		return Constants.DEVELOPER_HOME_PATH+"home";
	}
	
}
