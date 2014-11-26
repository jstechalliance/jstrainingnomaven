package com.js.dto;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;



public class Payment {
	private String payment_id;
	private Integer amount;
	private String payment_date;
	private String myid;
	private String received_by;
	private String received_by_name;
	private String source;
	private String payment_mode;
	private String transfer_code;
	private String candidateName;
	private String receiverName;
	private String transfer_bank_name;
	private String payment_status;
	private String approvel_date;
	private String approved_by;
	private String approved_by_name;
	private String contactNo;
	
	

	public String getApproved_by_name() {
		return approved_by_name;
	}

	public void setApproved_by_name(String approved_by_name) {
		this.approved_by_name = approved_by_name;
	}

	public String getReceived_by_name() {
		return received_by_name;
	}

	public void setReceived_by_name(String received_by_name) {
		this.received_by_name = received_by_name;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public Payment(String myid, String received_by) {
		super();
		this.myid = myid;
		this.received_by = received_by;
	}

	public Payment(String payment_id, Integer amount, String payment_date,
			String myid, String received_by, String source) {
		super();
		this.payment_id = payment_id;
		this.amount = amount;
		this.payment_date = payment_date;
		this.myid = myid;
		this.received_by = received_by;
		this.source = source;
	}

	public Payment(String payment_id, Integer amount, String payment_date,
			String myid, String received_by) {
		super();
		this.payment_id = payment_id;
		this.amount = amount;
		this.payment_date = payment_date;
		this.myid = myid;
		this.received_by = received_by;
	}

	public Payment(String payment_id) {
		super();
		this.payment_id = payment_id;
	}

	public Payment() {
		super();
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public String getReceived_by() {
		return received_by;
	}

	public void setReceived_by(String received_by) {
		this.received_by = received_by;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}

	public String getTransfer_code() {
		return transfer_code;
	}

	public void setTransfer_code(String transfer_code) {
		this.transfer_code = transfer_code;
	}

	public String getCandidateName() {
		return candidateName;
	}

	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getTransfer_bank_name() {
		return transfer_bank_name;
	}

	public void setTransfer_bank_name(String transfer_bank_name) {
		this.transfer_bank_name = transfer_bank_name;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public String getApprovel_date() {
		return approvel_date;
	}

	public void setApprovel_date(String approvel_date) {
		this.approvel_date = approvel_date;
	}

	public String getApproved_by() {
		return approved_by;
	}

	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}
	
	private String alertDate = new SimpleDateFormat("yyyy-MM-dd")
			.format(new Date());

	public String getAlertDate() {
		return alertDate;
	}

	public void setAlertDate(String alertDate) {
		this.alertDate = alertDate;
	}

	public static enum Order implements Comparator<Payment> {
		ByAlertDate() {

			@Override
			public int compare(Payment lhs, Payment rhs) {
				return lhs.alertDate.compareTo(rhs.alertDate);
			}
		};

		public abstract int compare(Payment lhs, Payment rhs);

		public Comparator<Payment> ascending() {
			return this;
		}

		public Comparator<Payment> descending() {
			return Collections.reverseOrder(this);
		}
	}
	
}
