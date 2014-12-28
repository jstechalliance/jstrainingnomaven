package com.js.controller.spring;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
public class AdminController {

	@Autowired
	private SuccessStoryService successStoryService;
	
	public SuccessStoryService getSuccessStoryService() {
		return successStoryService;
	}

	public void setSuccessStoryService(SuccessStoryService successStoryService) {
		this.successStoryService = successStoryService;
	}

	@Autowired
	private TestimonialService testimonialService;
	
	public TestimonialService getTestimonialService() {
		return testimonialService;
	}

	public void setTestimonialService(TestimonialService testimonialService) {
		this.testimonialService = testimonialService;
	}

	@RequestMapping(value="/11",method=RequestMethod.GET)
	public String openAdminHomePage(){
		return Constants.ADMIN_HOME_PATH+"home";
	}

	@RequestMapping(value="/12",method=RequestMethod.GET)
	public ModelAndView openSuccessStoryForAdmin(){
		ModelAndView modelAndView = new ModelAndView(Constants.ADMIN_HOME_PATH+"successstory");
		
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
	
	@RequestMapping(value="/13",method=RequestMethod.GET)
	public ModelAndView deleteCandidateFromSuccessStory(SuccessStory successStory,HttpServletRequest request){
		try{
			String rpath=request.getRealPath("/");
			SuccessStory temp = successStoryService.getCandidateFromSuccessStoryById(successStory.getOid());
			if(temp!=null){
				File file=new File(rpath,temp.getPhotoPath());
                System.out.println("Delete Path : "+file);
                successStoryService.deleteCandidateFromSuccessStory(temp);
                file.delete();
			}
		}catch(Throwable th){
			new JSIException(th).log();
		}
		return openSuccessStoryForAdmin();
	}
	
	@RequestMapping(value="/14",method=RequestMethod.POST)
	public ModelAndView addNewCandidateInSuccessStory(SuccessStory successStory,HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView(Constants.ADMIN_HOME_PATH+"successstory");
		String res="Record not saved.";
		try{
			String fileName="";
			if (!successStory.getFile().isEmpty()) {
	            try {
	                byte[] bytes = successStory.getFile().getBytes();
	                String name=successStory.getFile().getOriginalFilename();
	                String ext=name.substring(name.lastIndexOf("."),name.length());
	                fileName=""+System.currentTimeMillis()+ext;
	                String rpath=request.getRealPath("/");
	                System.out.println(rpath);
	                File file=new File(rpath,Constants.SUCCESS_STORY_FOLDER_NAME);
	                if(!file.exists()){
	                	file.mkdirs();
	                }
	                File temp=new File(file,fileName);
	                FileOutputStream fos= new FileOutputStream(temp);
	                fos.write(bytes);
	                fos.close();
	            }catch(Exception ex){
	            		ex.printStackTrace();
	            }
			}
			successStory.setPhotoPath(Constants.SUCCESS_STORY_FOLDER_NAME+"/"+fileName);
			String tempRes=successStoryService.addCandidateInSuccessStory(successStory);
			if(tempRes.equalsIgnoreCase("success")){
				res="Record successfully saved.";
			}else{
				res="Record not saved.";
			}
		}catch(Throwable ex){
			new JSIException(ex).log();
			res="Server side error";
			ex.printStackTrace();
		}
		
		modelAndView = openSuccessStoryForAdmin();
		modelAndView.addObject("msg",res);
		return modelAndView;
	}
	
	
	
	@RequestMapping(value="/15",method=RequestMethod.GET)
	public ModelAndView openTestimonials(){
		ModelAndView modelAndView=new ModelAndView(Constants.ADMIN_HOME_PATH+"testimonials");
		try{
			List <Testimonial>candidateList = new ArrayList<Testimonial>();
			List <Testimonial>temp = testimonialService.gettAllTestimonial();
			if(temp!=null){
				candidateList.addAll(temp);
			}
			modelAndView.addObject("candidateList", candidateList);
		}catch(Throwable th){
			new JSIException(th).log();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="/16",method=RequestMethod.POST)
	public ModelAndView writeTestimonial(Testimonial testimonial,HttpServletRequest request){
		
		System.out.println(testimonial);
		
		ModelAndView modelAndView=new ModelAndView(Constants.ADMIN_HOME_PATH+"testimonials");
		String res="Record not saved.";
		try{
			String fileName="";
			if (testimonial.getFile()!=null && !testimonial.getFile().isEmpty()) {
	            try {
	                byte[] bytes = testimonial.getFile().getBytes();
	                String name=testimonial.getFile().getOriginalFilename();
	                String ext=name.substring(name.lastIndexOf("."),name.length());
	                fileName=""+System.currentTimeMillis()+ext;
	                String rpath=request.getRealPath("/");
	                System.out.println(rpath);
	                File file=new File(rpath,Constants.SUCCESS_STORY_FOLDER_NAME);
	                if(!file.exists()){
	                	file.mkdirs();
	                }
	                
	                System.out.println("T : P : Path : "+testimonial.getPhotoPath());
	                
	                if(testimonial.getPhotoPath()!=null && !testimonial.getPhotoPath().equals("")){
	                	fileName = new File(testimonial.getPhotoPath()).getName();
	                }
	                
	                File temp=new File(file,fileName);
	                FileOutputStream fos= new FileOutputStream(temp);
	                fos.write(bytes);
	                fos.close();
	                testimonial.setPhotoPath(Constants.SUCCESS_STORY_FOLDER_NAME+"/"+fileName);
	            }catch(Exception ex){
	            		ex.printStackTrace();
	            }
			}
			
			if(testimonial.getSuccessStory()!=null){
				Long successStoryId=testimonial.getSuccessStory().getOid();
				SuccessStory temp = successStoryService.getCandidateFromSuccessStoryById(successStoryId);
				if(temp!=null){
					testimonial.setPhotoPath(temp.getPhotoPath());
					testimonial.setSuccessStory(temp);
					temp.setTestimonial(testimonial);
				}
			}
			testimonial.setCreatedDate(new Date().getTime());
			testimonial.setStatus("Approved");
			
			String tempRes="";
			if(testimonial.getOid()==null){
				tempRes=testimonialService.writeTestimonial(testimonial);
			}
			else{
				tempRes=testimonialService.updateTestimonial(testimonial);
			}
			
			if(tempRes.equalsIgnoreCase("success")){
				res="Record successfully saved.";
			}else{
				res="Record not saved.";
			}
		}catch(Throwable ex){
			new JSIException(ex).log();
			res="Server side error";
			ex.printStackTrace();
		}
		
		modelAndView = openTestimonials();
		modelAndView.addObject("msg",res);
		return modelAndView;
	}
	
	@RequestMapping(value="/17",method=RequestMethod.GET)
	public ModelAndView deleteTestimonial(Testimonial testimonial,HttpServletRequest request){
		try{
			String rpath=request.getRealPath("/");
			Testimonial temp = testimonialService.getTestimonialById(testimonial.getOid());
			if(temp!=null){
                testimonialService.deleteTestimonial(testimonial);
                if(temp.getPhotoPath()!=null){
                	 File file=new File(rpath,temp.getPhotoPath());
                     file.delete();
                }
			}
		}catch(Throwable th){
			new JSIException(th).log();
		}
		return openTestimonials();
	}
	
	@RequestMapping(value="/18",method=RequestMethod.GET)
	public ModelAndView openTestimonialsToWrite(SuccessStory successStory,HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView(Constants.ADMIN_HOME_PATH+"testimonials");
		try{
			SuccessStory story = successStoryService.getCandidateFromSuccessStoryById(successStory.getOid());
			
			List <Testimonial>candidateList = new ArrayList<Testimonial>();
			List <Testimonial>temp = testimonialService.gettAllTestimonial();
			if(temp!=null){
				candidateList.addAll(temp);
			}
			modelAndView.addObject("candidateList", candidateList);
			modelAndView.addObject("successStory", story);
		}catch(Throwable th){
			new JSIException(th).log();
		}
		
		return modelAndView;
	}
	
}
