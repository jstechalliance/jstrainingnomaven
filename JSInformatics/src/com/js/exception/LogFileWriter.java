package com.js.exception;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LogFileWriter {
	static final String PATTERN = "dd-MM-yyyy HH:mm:ss";
	static final String DATEPATTERN = "yyyy-MM-dd";
	static FileOutputStream fos = null;
	static public String PATH = "";

	public static void log(Object obj) {
		String msg = "";
		if (obj != null && obj instanceof Throwable) {
			msg = exceptionToString((Throwable) obj);
		} else if (obj != null) {
			msg = "" + obj;
		}
		try {
			FileOutputStream fos = getFileOutputStream();
			fos.write(("*******************************************************\n"+new SimpleDateFormat(PATTERN).format(new Date())
					+ ": \n" + msg + "\n").getBytes());
			fos.flush();
		} catch (Exception e) {
			System.out.print(msg);
		}
	}

	public static String exceptionToString(Throwable t) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		t.printStackTrace(pw);
		return sw.toString();
	}

	public static FileOutputStream getFileOutputStream() throws Exception {
		if (fos == null) {
			//System.out.println(PATH);
			File file = new File(PATH, "jsi_error");
			if (!file.exists()) {
				file.mkdirs();
			}
			File f = new File(file,
					new SimpleDateFormat(DATEPATTERN).format(new Date())
							+ "_Error.log");
			fos = new FileOutputStream(f, true);
		}
		return fos;
	}
}
