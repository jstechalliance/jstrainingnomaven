package com.js.email.enquiry;

import java.util.Properties;

import com.js.exception.JSIException;

public class PropertyLoader {
	public static String KEY_EMAIL_CONFIG_CONTACT_EMAIL = "email.config.contact.email";
	public static String KEY_EMAIL_CONFIG_CONTACT_PASSWORD = "email.config.contact.password";
	public static String KEY_EMAIL_CONTACT_EMAIL_ENQUIRY = "email.contact.email.enquiry";
	public static String KEY_EMAIL_CONTACT_EMAIL_PAYMENT = "email.contact.email.payment";
	public static String KEY_EMAIL_CONFIG_PAYMENT_EMAIL = "email.config.payment.email";
	public static String KEY_EMAIL_CONFIG_PAYMENT_PASSWORD = "email.config.payment.password";
	static Properties props = null;

	public static Properties getProps() {
		if (props == null) {
			props = new Properties();
			try {
				props.load(PropertyLoader.class
						.getResourceAsStream("/system.properties"));
			} catch (Exception e) {
				new JSIException(e).log();
				JsiLogger.err(PropertyLoader.class, e);
				try {
					throw new Exception(e);
				} catch (Exception e1) {
					new JSIException(e1).log();
				}
			}
		}
		return props;
	}

	public static String getProperty(String key) {
		return getProps() == null ? null : getProps().getProperty(key);
	}

	/*
	 * public static void main(String[] args) {
	 * System.err.println(getProperty(KEY_EMAIL_CONFIG_CONTACT_EMAIL)); }
	 */
}
