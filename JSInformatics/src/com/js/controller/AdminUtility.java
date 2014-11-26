package com.js.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class AdminUtility {
	public List<String> getAllErrorLog(HttpServletRequest request) {
		List<String> list = new ArrayList<String>();
		String root = request.getRealPath("/");
		File path = new File(root, "jsi_error/");
		
		if(path.exists()){
			File files[]=path.listFiles();
			if(files!=null){
				
				for(int i=files.length-1;i>=0;i--){
					File file = files[i];
					list.add(file.getName());
				}
			}
		}
		
		return list;
	}
}
