package com.js.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.js.email.enquiry.EmailUtil;
import com.js.email.enquiry.JsiLogger;
import com.js.email.enquiry.PropertyLoader;
import com.js.exception.JSIException;
import com.js.exception.LogFileWriter;

public class MyListener implements ServletContextListener {
	EmailUtil emailUtilEnqury, emailUtilPayment;

	public MyListener() {
		
//		JsiLogger.log(getClass(), "MyListener");
//		emailUtilEnqury = new EmailUtil(PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_CONTACT_EMAIL),PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_CONTACT_PASSWORD));
//		if (PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_CONTACT_EMAIL).equalsIgnoreCase(PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_PAYMENT_EMAIL))) {
//			emailUtilPayment = emailUtilEnqury;
//		} else {
//			emailUtilPayment = new EmailUtil(PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_PAYMENT_EMAIL),PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_PAYMENT_PASSWORD));
//		}
	
	}

	public void contextInitialized(ServletContextEvent arg0) {
	
//		LogFileWriter.PATH = arg0.getServletContext().getRealPath("/");
//		
//		emailUtilEnqury.getEmailDetails();
//		if (!PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_CONTACT_EMAIL).equalsIgnoreCase(PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_PAYMENT_EMAIL))) {
//			emailUtilPayment.getEmailDetails();
//		}
//		JsiLogger.log(getClass(), "contextInitialized");
		
	}

	public void contextDestroyed(ServletContextEvent arg0) {
		
//		JsiLogger.log(getClass(), "contextDestroyed");
//		emailUtilEnqury.closeConnection();
//		if (!PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_CONTACT_EMAIL).equalsIgnoreCase(PropertyLoader.getProperty(PropertyLoader.KEY_EMAIL_CONFIG_PAYMENT_EMAIL))) {
//			emailUtilPayment.closeConnection();
//		}
		
	}

}
