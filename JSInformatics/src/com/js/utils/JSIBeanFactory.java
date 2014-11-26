package com.js.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class JSIBeanFactory {
	
	static ApplicationContext context;
	
	static{
		context = new ClassPathXmlApplicationContext("beanconfig.xml");
	}
	
	public static  <T>T getBean(Class<T> temp){
		return context.getBean(temp);
	}
	public static  <T>T getBean(String beanId){
		return (T)context.getBean(beanId);
	}
	
}
