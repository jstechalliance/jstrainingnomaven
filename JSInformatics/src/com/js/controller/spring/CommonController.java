package com.js.controller.spring;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.js.dto.SuccessStory;
import com.js.dto.Testimonial;
import com.js.exception.JSIException;
import com.js.service.SuccessStoryService;
import com.js.service.TestimonialService;
import com.js.utils.Constants;

@Controller
public class CommonController {

	@Autowired
	private SuccessStoryService successStoryService;
	
	public SuccessStoryService getSuccessStoryService() {
		return successStoryService;
	}

	public void setSuccessStoryService(SuccessStoryService successStoryService) {
		this.successStoryService = successStoryService;
	}

	@Autowired
	TestimonialService testimonialService;
	
	public TestimonialService getTestimonialService() {
		return testimonialService;
	}

	public void setTestimonialService(TestimonialService testimonialService) {
		this.testimonialService = testimonialService;
	}

	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(){
		return "/WEB-INF/common/logout";
	}
	
	@RequestMapping(value="/successStory",method=RequestMethod.GET)
	public ModelAndView openSuccessStory(){
		ModelAndView modelAndView = new ModelAndView("/successStory");
		
		try{
			List <SuccessStory>candidateList = new ArrayList<SuccessStory>();
			List <SuccessStory>temp = successStoryService.gettAllCandidateOfSuccessStory();
			if(temp!=null){
				candidateList.addAll(temp);
			}
			modelAndView.addObject("candidateList", candidateList);
		}catch(Throwable th){
			new JSIException(th).log();
		}
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/testimonials",method=RequestMethod.GET)
	public ModelAndView openTestimonials(String testimonialId){
		ModelAndView modelAndView = new ModelAndView("/testimonials");
		try{
			List <Testimonial>candidateList = new ArrayList<Testimonial>();
			List <Testimonial>temp = testimonialService.gettAllTestimonial();
			if(temp!=null){
				candidateList.addAll(temp);
			}
			modelAndView.addObject("candidateList", candidateList);
			if(testimonialId!=null){
				modelAndView.addObject("testimonialId", testimonialId);
			}
		}catch(Throwable th){
			new JSIException(th).log();
		}
		
		return modelAndView;
	}
	
	
//	@RequestMapping(value="/successStory.jsi",method=RequestMethod.GET)
//	public String addCandidateInSuccessStory(){
//		return "/successStory";
//	}
	
//	@RequestMapping(value="/successStory.jsi",method=RequestMethod.GET)
//	public String getAllCandidateOfSuccessStory(){
//		return "/successStory";
//	}
}
