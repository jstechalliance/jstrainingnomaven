package com.js.dto;

public class WebEnquiryDTO {
	private String id = "";
	private String name = "";
	private String qualification = "";
	private String contactno = "";
	private String email = "";
	private String course = "";
	private String referance = "";
	private String enquiry_date = "1";
	private String status = "NEW_ENQ";

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEnquiry_date() {
		return enquiry_date;
	}

	public void setEnquiry_date(String enquiry_date) {
		this.enquiry_date = enquiry_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getContactno() {
		return contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getReferance() {
		return referance;
	}

	public void setReferance(String referance) {
		this.referance = referance;
	}

	@Override
	public String toString() {
		return "WebEnquiryDTO [id=" + id + ", name=" + name
				+ ", qualification=" + qualification + ", contactno="
				+ contactno + ", email=" + email + ", course=" + course
				+ ", referance=" + referance + ", enquiry_date=" + enquiry_date
				+ ", status=" + status + "]";
	}
	
}
