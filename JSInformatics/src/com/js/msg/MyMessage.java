package com.js.msg;

public class MyMessage {
	private String loginMessage;
	private String enquiryMessage;
	private String paymentMessage;
	private Object object;
	
	
	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public String getLoginMessage() {
		return loginMessage;
	}

	public void setLoginMessage(String loginMessage) {
		this.loginMessage = loginMessage;
	}

	public String getEnquiryMessage() {
		return enquiryMessage;
	}

	public void setEnquiryMessage(String enquiryMessage) {
		this.enquiryMessage = enquiryMessage;
	}

	public String getPaymentMessage() {
		return paymentMessage;
	}

	public void setPaymentMessage(String paymentMessage) {
		this.paymentMessage = paymentMessage;
	}	
	
}
