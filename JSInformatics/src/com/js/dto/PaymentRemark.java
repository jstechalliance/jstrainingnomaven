package com.js.dto;

public class PaymentRemark {
	private String myid;
	private String remark_date;
	private String remark;
	private String payment_alert;
	private String employee_id;
	private String status;

	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public String getRemark_date() {
		return remark_date;
	}

	public void setRemark_date(String remark_date) {
		this.remark_date = remark_date;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getPayment_alert() {
		return payment_alert;
	}

	public void setPayment_alert(String payment_alert) {
		this.payment_alert = payment_alert;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public PaymentRemark(String myid, String remark_date, String remark,
			String payment_alert, String employee_id, String status) {
		super();
		this.myid = myid;
		this.remark_date = remark_date;
		this.remark = remark;
		this.payment_alert = payment_alert;
		this.employee_id = employee_id;
		this.status = status;
	}

	public PaymentRemark() {
		super();
		// TODO Auto-generated constructor stub
	}

}
