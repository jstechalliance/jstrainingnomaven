package com.js.dao;

import java.util.List;

import com.js.dto.Testimonial;

public interface TestimonialDAO {

	public String writeTestimonial(Testimonial Testimonial) throws Exception;
	public String deleteTestimonial(Testimonial Testimonial) throws Exception;
	public List<Testimonial> gettAllTestimonial() throws Exception;
	public Testimonial getTestimonialById(long oid) throws Exception;
	public String updateTestimonial(Testimonial testimonial) throws Exception;
	
}
