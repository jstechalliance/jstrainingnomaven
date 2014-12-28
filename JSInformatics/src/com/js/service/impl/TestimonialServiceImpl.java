package com.js.service.impl;

import java.util.List;

import com.js.dao.TestimonialDAO;
import com.js.dto.Testimonial;
import com.js.service.TestimonialService;

public class TestimonialServiceImpl implements TestimonialService{


	private TestimonialDAO testimonialDAO;
	
	public TestimonialDAO getTestimonialDAO() {
		return testimonialDAO;
	}

	public void setTestimonialDAO(TestimonialDAO testimonialDAO) {
		this.testimonialDAO = testimonialDAO;
	}

	@Override
	public String writeTestimonial(Testimonial testimonial)	throws Exception {
		return testimonialDAO.writeTestimonial(testimonial);
	}

	@Override
	public String deleteTestimonial(Testimonial testimonial) throws Exception {
		return testimonialDAO.deleteTestimonial(testimonial);
	}

	@Override
	public List<Testimonial> gettAllTestimonial() throws Exception {
		return testimonialDAO.gettAllTestimonial();
	}
	
	@Override
	public Testimonial getTestimonialById(long oid) throws Exception{
		return testimonialDAO.getTestimonialById(oid);
	}

	@Override
	public String updateTestimonial(Testimonial testimonial) throws Exception {
		return testimonialDAO.updateTestimonial(testimonial);
	}
	
}
