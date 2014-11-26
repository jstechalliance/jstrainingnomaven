package com.js.controller.spring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.js.exception.JSIException;
import com.js.project.dto.OurProduct;
import com.js.service.OurProductsAdvService;

@Controller
public class OurProductsAdvController {
	
	@Autowired
	private OurProductsAdvService ourProductsAdvService;
	
	public OurProductsAdvService getOurProductsAdvService() {
		return ourProductsAdvService;
	}

	public void setOurProductsAdvService(OurProductsAdvService ourProductsAdvService) {
		this.ourProductsAdvService = ourProductsAdvService;
	}
	
	public List<OurProduct> getAllProject() {
		return null;//new ProjectDAO().getAllProject();
	}
	
	@RequestMapping(value="/productdiv",method=RequestMethod.GET)
	public ModelAndView getProject(int productId,int productCount){
		OurProduct ourProduct = null;
		Map <String,Object>response = new HashMap<String,Object>();
		response.put("ourProduct", ourProduct);
		response.put("productCount",productCount);
		ModelAndView modelAndView = new ModelAndView("productdiv",response);
		try{
			ourProduct = ourProductsAdvService.getProject(productId);
			response.put("ourProduct",ourProduct);
			modelAndView = new ModelAndView("productdiv",response);
		}catch(Throwable th){
			new JSIException(th).log();
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/ourproducts",method=RequestMethod.GET)
	public ModelAndView getAllProductId(){
		List<Integer> productIdList = new ArrayList<Integer>();
		ModelAndView modelAndView = new ModelAndView("ourproducts","productIdList",productIdList);
		try{
			productIdList = ourProductsAdvService.getAllProductId();
			modelAndView = new ModelAndView("ourproducts","productIdList",productIdList);
		}catch(Throwable th){
			new JSIException(th).log();
		}
		return modelAndView;
	}
	
}