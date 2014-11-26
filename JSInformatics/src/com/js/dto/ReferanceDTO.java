package com.js.dto;

public class ReferanceDTO {
	private String reference_id;
	private String full_name;
	private String contact_no;
	private String note;
	private String myid;

	public ReferanceDTO() {
	}

	public ReferanceDTO(String reference_id, String full_name,
			String contact_no, String note, String myid) {
		this.reference_id = reference_id;
		this.full_name = full_name;
		this.contact_no = contact_no;
		this.note = note;
		this.myid = myid;
	}

	public String getReference_id() {
		return reference_id;
	}

	public void setReference_id(String reference_id) {
		this.reference_id = reference_id;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

}
