package com.js.dto;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

public class AcademicProjectDTO {
	private String project_id;
	private String project_name;
	private String project_cost;
	private String enquiry_id;
	private String delivery_date;
	private String project_description;
	private String project_docs_path;
	private String reg_date;
	private String employe_id;
	private String payment_status;

	public String getEmploye_id() {
		return employe_id;
	}

	public void setEmploye_id(String employe_id) {
		this.employe_id = employe_id;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	private NewAcademicProjectEnquiryDTO dto;

	public NewAcademicProjectEnquiryDTO getDto() {
		return dto;
	}

	public void setDto(NewAcademicProjectEnquiryDTO dto) {
		this.dto = dto;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProject_cost() {
		return project_cost;
	}

	public void setProject_cost(String project_cost) {
		this.project_cost = project_cost;
	}

	public String getEnquiry_id() {
		return enquiry_id;
	}

	public void setEnquiry_id(String enquiry_id) {
		this.enquiry_id = enquiry_id;
	}

	public String getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}

	public String getProject_description() {
		return project_description;
	}

	public void setProject_description(String project_description) {
		this.project_description = project_description;
	}

	public String getProject_docs_path() {
		return project_docs_path;
	}

	public void setProject_docs_path(String project_docs_path) {
		this.project_docs_path = project_docs_path;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public AcademicProjectDTO(String project_id, String project_name,
			String project_cost, String enquiry_id, String delivery_date,
			String project_description, String project_docs_path,
			String reg_date) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.project_cost = project_cost;
		this.enquiry_id = enquiry_id;
		this.delivery_date = delivery_date;
		this.project_description = project_description;
		this.project_docs_path = project_docs_path;
		this.reg_date = reg_date;
	}

	public AcademicProjectDTO() {
		super();
	}

	private String alertDate = new SimpleDateFormat("yyyy-MM-dd")
			.format(new Date());

	public String getAlertDate() {
		return alertDate;
	}

	public void setAlertDate(String alertDate) {
		this.alertDate = alertDate;
	}

	public static enum Order implements Comparator<AcademicProjectDTO> {
		ByAlertDate() {

			@Override
			public int compare(AcademicProjectDTO lhs, AcademicProjectDTO rhs) {
				return lhs.alertDate.compareTo(rhs.alertDate);
			}
		};

		public abstract int compare(AcademicProjectDTO lhs, AcademicProjectDTO rhs);

		public Comparator<AcademicProjectDTO> ascending() {
			return this;
		}

		public Comparator<AcademicProjectDTO> descending() {
			return Collections.reverseOrder(this);
		}
	}
}
