package com.js.utils;

import com.google.gson.Gson;

public class JsonResponse {
	private boolean status;
	private String message;
	private Object response;

	public JsonResponse(boolean status, String message, Object response) {
		super();
		this.status = status;
		this.message = message;
		this.response = response;
	}

	public String getJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}

}
