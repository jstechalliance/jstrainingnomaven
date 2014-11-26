package com.js.dto;

public class PaymentSearch {
	private String dialog_source = "";
	private String dialog_name = "";
	private String dialog_code = "";
	private String dueAmountFrom = "";
	private String dueAmountTo = "";
	private String paymentDateFrom = "";
	private String paymentDateTo = "";	
	private String approvel="";
	private String approvalDateStart="";
	private String approvalDateEnd="";
	private String payingDateStart="";
	private String payingDateEnd="";
	private String recievedBy="";
	private String approvedBy="";
	
	
	public String getApprovalDateStart() {
		return approvalDateStart;
	}

	public void setApprovalDateStart(String approvalDateStart) {
		this.approvalDateStart = approvalDateStart;
	}

	public String getApprovalDateEnd() {
		return approvalDateEnd;
	}

	public void setApprovalDateEnd(String approvalDateEnd) {
		this.approvalDateEnd = approvalDateEnd;
	}

	public String getPayingDateStart() {
		return payingDateStart;
	}

	public void setPayingDateStart(String payingDateStart) {
		this.payingDateStart = payingDateStart;
	}

	public String getPayingDateEnd() {
		return payingDateEnd;
	}

	public void setPayingDateEnd(String payingDateEnd) {
		this.payingDateEnd = payingDateEnd;
	}

	public String getRecievedBy() {
		return recievedBy;
	}

	public void setRecievedBy(String recievedBy) {
		this.recievedBy = recievedBy;
	}

	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	public String getApprovel() {
		return approvel;
	}

	public void setApprovel(String approvel) {
		this.approvel = approvel;
	}

	public String getPaymentDateFrom() {
		return paymentDateFrom;
	}

	public void setPaymentDateFrom(String paymentDateFrom) {
		this.paymentDateFrom = paymentDateFrom;
	}

	public String getPaymentDateTo() {
		return paymentDateTo;
	}

	public void setPaymentDateTo(String paymentDateTo) {
		this.paymentDateTo = paymentDateTo;
	}

	public String getDueAmountFrom() {
		return dueAmountFrom;
	}

	public void setDueAmountFrom(String dueAmountFrom) {
		this.dueAmountFrom = dueAmountFrom;
	}

	public String getDueAmountTo() {
		return dueAmountTo;
	}

	public void setDueAmountTo(String dueAmountTo) {
		this.dueAmountTo = dueAmountTo;
	}

	public String getDialog_source() {
		return dialog_source;
	}

	public void setDialog_source(String dialog_source) {
		this.dialog_source = dialog_source;
	}

	public String getDialog_name() {
		return dialog_name;
	}

	public void setDialog_name(String dialog_name) {
		this.dialog_name = dialog_name;
	}

	public String getDialog_code() {
		return dialog_code;
	}

	public void setDialog_code(String dialog_code) {
		this.dialog_code = dialog_code;
	}

}
