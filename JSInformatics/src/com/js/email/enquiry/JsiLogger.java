package com.js.email.enquiry;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Calendar;

public class JsiLogger {
	public static void log(Class<?> c, Object object) {
		log("["+c+"] "+ object);
	}

	public static void log(Object object) {
		System.out.println(Calendar.getInstance().getTime()+ "  " + object);
	}

	private static StringWriter sw = new StringWriter();
	private static PrintWriter pw = new PrintWriter(sw);
	
	public static void err(Class<?> c, Object message) {
		err("["+c+"] "+ message);
	}
	
	public static void err(Object message) {
		if (message instanceof Exception) {
			((Exception)message).printStackTrace(pw);
			message = sw.toString();
		}
		System.err.println(Calendar.getInstance().getTime()+ "  " + message);
	}
}