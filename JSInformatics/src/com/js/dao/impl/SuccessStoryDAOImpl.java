package com.js.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.js.dao.SuccessStoryDAO;
import com.js.dto.SuccessStory;

public class SuccessStoryDAOImpl implements SuccessStoryDAO{

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public SuccessStory getCandidateFromSuccessStoryById(long oid) throws Exception{
		SuccessStory successStory = null;
		Session session=null;
		try{
			session = sessionFactory.openSession();
			successStory = (SuccessStory)session.get(SuccessStory.class,oid);
		}
		catch(Throwable ex){
			throw new Exception(ex);
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		return successStory;
	}
	
	@Override
	public String addCandidateInSuccessStory(SuccessStory successStory)	throws Exception {
		String res="error";
		Session session=null;
		Transaction tra=null;
		try{
			session = sessionFactory.openSession();
			tra=session.beginTransaction();
			session.save(successStory);
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
	public String deleteCandidateFromSuccessStory(SuccessStory successStory) throws Exception {
		String res="error";
		Session session=null;
		Transaction tra=null;
		try{
			session = sessionFactory.openSession();
			tra=session.beginTransaction();
			session.delete(successStory);
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
	public List<SuccessStory> gettAllCandidateOfSuccessStory() throws Exception {
		List <SuccessStory>candidateList = new ArrayList<SuccessStory>();
		Session session=null;
		try{
			session = sessionFactory.openSession();
			Query query = session.createQuery("from com.js.dto.SuccessStory");
			List <SuccessStory>temp=query.list();
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
