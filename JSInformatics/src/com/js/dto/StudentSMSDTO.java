package com.js.dto;

public class StudentSMSDTO {
	private String id;
	private String fixid;
	private String number;
	private String forwhat;
	private String message;
	private String status;
	private String date;

	public StudentSMSDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudentSMSDTO(String id, String fixid, String status, String date) {
		super();
		this.id = id;
		this.fixid = fixid;
		this.status = status;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFixid() {
		return fixid;
	}

	public void setFixid(String fixid) {
		this.fixid = fixid;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getForwhat() {
		return forwhat;
	}

	public void setForwhat(String forwhat) {
		this.forwhat = forwhat;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
