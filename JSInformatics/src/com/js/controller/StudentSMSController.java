package com.js.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.js.dao.StudentSMSDAO;
import com.js.dto.StudentSMSDTO;
import com.js.exception.JSIException;
import com.js.service.StudentSMSService;
import com.js.utils.JsonResponse;

public class StudentSMSController {
	
	private StudentSMSService studentSMSService;
	
	public StudentSMSService getStudentSMSService() {
		return studentSMSService;
	}
	public void setStudentSMSService(StudentSMSService studentSMSService) {
		this.studentSMSService = studentSMSService;
	}

	public JsonResponse getStudentForMessage(){
		JsonResponse jr=null;
		try{
			List<StudentSMSDTO>list = studentSMSService.getNewSMSDetail();
			if(list.size()!=0){
				jr=new JsonResponse(true, "", list);	
			}else{
				jr=new JsonResponse(false, "No message for send", "");
			}
		}catch(Exception ex){
			jr=new JsonResponse(false, ""+ex.getMessage(), "");
			new JSIException(ex).log();
		}
		return jr;
	}
	public JsonResponse updateDetail(Map<String ,String>params){
		JsonResponse jr=null;
		try{
			StudentSMSDTO smsdto=new StudentSMSDTO();
			smsdto.setId(params.get("id"));
			smsdto.setFixid(params.get("fixid"));
			smsdto.setStatus(params.get("status"));
			smsdto.setDate(params.get("date"));
			if(smsdto.getId()==null||smsdto.getFixid()==null||smsdto.getStatus()==null||smsdto.getDate()==null){
				return new JsonResponse(false, "id,fixid,status,date are mendatory", "");
			}
			String ret = studentSMSService.updateDetail(smsdto);
			if(ret.equalsIgnoreCase("success")){
				jr=new JsonResponse(true, "success", "");	
			}else{
				jr=new JsonResponse(false, "error", "");
			}
		}catch(Exception ex){
			jr=new JsonResponse(false, ""+ex.getMessage(), "");
			new JSIException(ex).log();
		}
		return jr;
	}
	public List<StudentSMSDTO> getArray(String jsonString) {
		Gson gson=new Gson();
		StudentSMSDTO[] myArray = gson.fromJson(jsonString,StudentSMSDTO[].class );
		List<StudentSMSDTO>list=new ArrayList<StudentSMSDTO>();
		for(StudentSMSDTO smsdto : myArray){
			list.add(smsdto);	
		}
		return list;
	}
	
	public JsonResponse updateAllDetail(Map<String ,String>params){
		JsonResponse jr=null;
		try{
			String data = params.get("data");
			List<StudentSMSDTO>list=new ArrayList<StudentSMSDTO>();
			
			if(data!=null){
				return new JsonResponse(false, "update data require", "");
			}
			try{
				list = getArray(data);
			}catch(Exception ex){
				return new JsonResponse(false, "array of att id,fixid,status,date are mendatory", "");
			}
			List<StudentSMSDTO>retList = studentSMSService.updateAllDetail(list);
			if(retList.size()==0){
				jr=new JsonResponse(true, "success", retList);	
			}else{
				jr=new JsonResponse(false, "error", "");
			}			
		}catch(Exception ex){
			jr=new JsonResponse(false, ""+ex.getMessage(), "");
			new JSIException(ex).log();
		}
		return jr;
	}
	
}
