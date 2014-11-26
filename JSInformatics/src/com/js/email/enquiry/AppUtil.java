package com.js.email.enquiry;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import com.js.exception.JSIException;

public class AppUtil {
	
	public static final String PATTERN_NEW_LINE = "\\r?\\n";
	public static final String REPLACE_PATTERN_NEW_LINE = "\\r|\\n";
	public static final String SPACE = " ";
	public static final String BLANK = "";
	
	
	public static boolean isInArray(String[] arr, String str) {
		boolean isInArray = false;
		if (arr != null && str != null) {
			for (String st : arr) {
				if (st.equals(str)) {
					isInArray = true;
					break;
				}
			}
		}
		return isInArray;
	}

	public static boolean isContainInArray(String[] arr, String str) {
		boolean isInArray = false;
		if (arr != null && str != null) {
			for (String st : arr) {
				if (str.trim().toLowerCase().contains(st.trim().toLowerCase())) {
					isInArray = true;
					break;
				}
			}
		}
		return isInArray;
	}

	public static String readStreamIntoStringUsingReader(InputStream in) {
		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(in));
			StringBuilder out = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				out.append(line);
			}
			reader.close();
			return out.toString();
		} catch (Exception e) {
			new JSIException(e).log();
			JsiLogger.err(e);
		}
		return null;
	}
	
	public static boolean isContain(String str, String pattern) {
		boolean isContain = false;
		if(StringUtil.isNotBlank(str) && str.split(pattern).length > 0) {
			isContain = true;
		}
		return isContain;
	}
	
	public static String removeNewLineChars(String str) {
		
		if(StringUtil.isNotBlank(str)) {
			/*String strArr[] = str.split(PATTERN_NEW_LINE);
			if(strArr.length > 1) {
				StringBuilder sb = new StringBuilder();
				for(String st : strArr) {
					sb.append(st);
					sb.append(BLANK);
				}
				str = sb.toString().trim();
			}*/
			str = str.replaceAll(REPLACE_PATTERN_NEW_LINE, SPACE);
		}
		return str;
	}
	public static String removeChar(String str,String str1){
		if(StringUtil.isNotBlank(str) && StringUtil.isNotBlank(str1)) {
			return str.replace(str1, BLANK);
		}else{
			return str;
		}
	}
	public static String removeColon(String str){
		return removeChar(str, ":");
	}
	public static String removeStar(String str){
		return removeChar(str, "*");
	}
}
