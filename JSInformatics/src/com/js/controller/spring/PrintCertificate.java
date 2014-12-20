package com.js.controller.spring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.js.dto.CertificateDTO;

@Controller
public class PrintCertificate {
	
	String his_her ="his";
	String he_she="he";
	String He_She="He";
	String him = "him";
	
	@RequestMapping(value = "certificate", method = RequestMethod.GET)
	public ModelAndView doSalesReportPDF(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("index");
//		HttpSession httpSession = request.getSession(false);
//		if(httpSession==null){
//			return modelAndView;
//		}else{
//			String userlevel = (String)httpSession.getAttribute("USERLEVEL");
//			if((userlevel==null) || (!userlevel.equalsIgnoreCase("operator")) || (!userlevel.equalsIgnoreCase("manager"))){
//				return modelAndView;
//			}
//		}
		
		
		
		
		
		List<CertificateDTO> items = new ArrayList<CertificateDTO>();

		// Create first item
		CertificateDTO certificateDTO = new CertificateDTO();
		certificateDTO.setCourseName("Android Technology");
		certificateDTO.setAuthorizedSignatory("Kumar Anand");
		certificateDTO.setIssueDate("Indore 16th of May 2013");
		certificateDTO.setRegistrationNo("Reg No : 123456789");
		certificateDTO.setGender("M");
		
		String studentFullName = "Prashanna Gupta";
		String fatherFullName = "Mr. Dilip Kumar Gupta";
		String so_do ="S/o";
		String degree = "B.E";
		String stream = "Information Technology";
		String college = "J.I.T";
		String collegeAddress = "Khargone";
		String trainingStartDate = "11/12/2014";
		String trainingEndDate = "31/12/2014";
		
		if(certificateDTO.getGender().equalsIgnoreCase("M")){
			his_her ="his";
			he_she="he";
			He_She="He";
			him = "him";
		}else{
			his_her ="her";
			he_she="she";
			He_She="She";
			him = "her";
		}
		
		
		String firstParagraph = "This is certified that "+studentFullName+" "+so_do+" of "+fatherFullName+" student of "+degree+" "+stream+" from "+college+", "+collegeAddress+" has completed certification course in our Organization from "+trainingStartDate+" to "+trainingEndDate+" with our entire satisfaction.";
		String secondParagraph = "During "+his_her+" training period we found "+he_she+" is sincere, honest, hard working, dedicated with professional attitude and very good knowledge. "+He_She+" is amiable in nature and character is well.";
		String thirdParagraph = "We have found "+him+" to be self starter who is motivated duty bound high committed team player with strong conceptual knowledge of mentioned technology.";
		String fourthParagraph = "The management wishes "+his_her+" good luck for "+his_her+" bright future.";
		
		certificateDTO.setFirstParagraph(firstParagraph);
		certificateDTO.setSecondParagraph(secondParagraph);
		certificateDTO.setThirdParagraph(thirdParagraph);
		certificateDTO.setFourthParagraph(fourthParagraph);
		
		
		items.add(certificateDTO);
		

		JRDataSource datasource = new JRBeanCollectionDataSource(items);
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("datasource", datasource);
		modelAndView = new ModelAndView("pdfReport", parameterMap);
		return modelAndView;
	}

}
