package com.js.properties;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.js.exception.JSIException;

public class MessagePropertyReader {
	public final static String TRAINING_ENQUIRY = "msg.training.enquiry";
	public final static String TRAINING_REGISTRATION = "msg.training.registration";
	public final static String TRAINING_PAYMENT = "msg.training.payment";

	public String readMessage(String key) {
		String message = "";
		Properties prop = new Properties();
		InputStream in = getClass().getResourceAsStream("message.properties");
		try {
			prop.load(in);
			message = prop.getProperty(key);
		} catch (Exception exception) {
			new JSIException(exception).log();
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				new JSIException(e).log();
				e.printStackTrace();
			}
		}
		return message;
	}
	public static void main(String[] args) {
		String s=new MessagePropertyReader().readMessage(TRAINING_ENQUIRY);
		//System.out.println(s);
		
	}
}
