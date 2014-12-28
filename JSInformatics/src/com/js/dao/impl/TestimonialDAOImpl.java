package com.js.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.js.dao.TestimonialDAO;
import com.js.dto.Testimonial;

public class TestimonialDAOImpl implements TestimonialDAO{

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Testimonial getTestimonialById(long oid) throws Exception{
		Testimonial testimonial = null;
		Session session=null;
		try{
			session = sessionFactory.openSession();
			testimonial = (Testimonial)session.get(Testimonial.class,oid);
		}
		catch(Throwable ex){
			throw new Exception(ex);
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		return testimonial;
	}
	
	@Override
	public String writeTestimonial(Testimonial testimonial)	throws Exception {
		String res="error";
		Session session=null;
		Transaction tra=null;
		try{
			session = sessionFactory.openSession();
			tra=session.beginTransaction();
			session.save(testimonial);
			tra.commit();
			res="success";
		}
		catch(Throwable ex){
			if(tra!=null){
				tra.commit();
			}
			throw new Exception(ex);
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		return res;
	}

	@Override
	public String deleteTestimonial(Testimonial testimonial) throws Exception {
		String res="error";
		Session session=null;
		Transaction tra=null;
		try{
			session = sessionFactory.openSession();
			tra=session.beginTransaction();
			session.delete(testimonial);
			tra.commit();
			res="success";
		}
		catch(Throwable ex){
			if(tra!=null){
				tra.commit();
			}
			throw new Exception(ex);
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		return res;
	}
	public String updateTestimonial(Testimonial testimonial) throws Exception{
		String res="error";
		Session session=null;
		Transaction tra=null;
		try{
			session = sessionFactory.openSession();
			tra=session.beginTransaction();
			Testimonial temp = (Testimonial)session.get(Testimonial.class,testimonial.getOid());
			if(temp!=null){
				temp.setCandidateName(testimonial.getCandidateName());
				temp.setCollege(testimonial.getCollege());
				temp.setContent(testimonial.getContent());
				if(testimonial.getPhotoPath()!=null){
					temp.setPhotoPath(testimonial.getPhotoPath());
				}
			}
			tra.commit();
			res="success";
		}
		catch(Throwable ex){
			if(tra!=null){
				tra.commit();
			}
			throw new Exception(ex);
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		return res;
	}
	@Override
	public List<Testimonial> gettAllTestimonial() throws Exception {
		List <Testimonial>candidateList = new ArrayList<Testimonial>();
		Session session=null;
		try{
			session = sessionFactory.openSession();
			Query query = session.createQuery("from com.js.dto.Testimonial");
			List <Testimonial>temp=query.list();
			if(temp!=null && !temp.isEmpty()){
				candidateList.addAll(temp);
			}
		}
		catch(Throwable ex){
			throw new Exception(ex);
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		
		return candidateList;
	}
	
	
}
