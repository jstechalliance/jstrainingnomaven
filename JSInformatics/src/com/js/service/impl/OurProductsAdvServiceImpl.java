package com.js.service.impl;

import java.util.List;

import com.js.dao.OurProductsAdvDAO;
import com.js.project.dto.OurProduct;
import com.js.service.OurProductsAdvService;

public class OurProductsAdvServiceImpl implements OurProductsAdvService{
	
	private OurProductsAdvDAO ourProductsAdvDAO;
	
	public OurProductsAdvDAO getOurProductsAdvDAO() {
		return ourProductsAdvDAO;
	}
	
	public void setOurProductsAdvDAO(OurProductsAdvDAO ourProductsAdvDAO) {
		this.ourProductsAdvDAO = ourProductsAdvDAO;
	}
	
	public OurProduct getProject(int projectId) throws Exception{
		return ourProductsAdvDAO.getProject(projectId);
	}
	
	public List<Integer> getAllProductId() throws Exception{
		return ourProductsAdvDAO.getAllProductId();
	}
	
}
