package com.js.service;

import java.util.List;

import com.js.project.dto.OurProduct;

public interface OurProductsAdvService {
	
	public OurProduct getProject(int projectId) throws Exception;
	public List<Integer> getAllProductId() throws Exception;
	
}
