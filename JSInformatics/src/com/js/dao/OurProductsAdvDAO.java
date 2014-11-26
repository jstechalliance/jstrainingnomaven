package com.js.dao;

import java.util.List;

import com.js.project.dto.OurProduct;

public interface OurProductsAdvDAO {
	
	public OurProduct getProject(int projectId) throws Exception;
	public List<Integer> getAllProductId() throws Exception;
	
}
