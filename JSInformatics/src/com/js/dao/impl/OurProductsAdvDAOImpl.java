package com.js.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.js.dao.OurProductsAdvDAO;
import com.js.project.dto.OurProduct;
import com.js.project.dto.ProductEnvironment;
import com.js.project.dto.ProductFeatures;
import com.js.project.dto.ProductImages;

public class OurProductsAdvDAOImpl implements OurProductsAdvDAO{
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public OurProduct getProject(int projectId) {
		OurProduct project = null;
		Session session = sessionFactory.openSession();
		project = (OurProduct) session.get(OurProduct.class, projectId);
		if (project != null) {
			for (ProductFeatures features : project.getProjectFeatures()) {
			}
			for (ProductEnvironment environment : project
					.getProjectEnvironments()) {
			}
			for (ProductImages images : project.getProjectImages()) {
			}
		}
		session.close();
		return project;
	}

	public List<Integer> getAllProductId() {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(OurProduct.class);
		criteria.setProjection(Projections.property("productId"));
		List<Integer> list = criteria.list();
		session.close();
		return list;
	}
	
	public static void main(String[] args) {
		for (Integer integer : new OurProductsAdvDAOImpl().getAllProductId()) {
			//System.out.println(integer);
		}
	}
}
