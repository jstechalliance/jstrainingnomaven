package com.js.service.impl;

import java.util.List;
import java.util.Map;

import com.js.dao.PaymentDAO;
import com.js.dto.Employee;
import com.js.dto.Payment;
import com.js.dto.PaymentRemark;
import com.js.dto.PaymentSearch;
import com.js.enums.EnquiryType;
import com.js.service.PaymentService;

public class PaymentServiceImpl implements PaymentService{
	
	private PaymentDAO paymentDAO;
	
	public PaymentDAO getPaymentDAO() {
		return paymentDAO;
	}
	public void setPaymentDAO(PaymentDAO paymentDAO) {
		this.paymentDAO = paymentDAO;
	}

	public Map<EnquiryType, List> searchResultForMakePayment(PaymentSearch search,String branchid, String employeeid) throws Exception {
		return paymentDAO.searchResultForMakePayment(search, branchid, employeeid);
	}
	public String savePaymentRemark(String branchcode, PaymentRemark remark) throws Exception{
		return paymentDAO.savePaymentRemark(branchcode, remark);
	}
	public List<PaymentRemark> paymentRemarkListById(String branchcode, String myid)throws Exception{
		return paymentDAO.getPaymentRemarkListById(branchcode, myid);
	}
	public List<Payment> getAllPaymentDetailById(Payment payment,String branchcode) throws Exception {
		return paymentDAO.getAllPaymentDetailById(payment,branchcode);
	}
	public Payment makePayment(Payment payment, String branchcode)throws Exception {
		return paymentDAO.makePayment(payment, branchcode);
	}
	public int getDueAmount(String regId) throws Exception {
		return paymentDAO.getDueAmount(regId);
	}
	public String approvePayment(Payment payment, String branchcode) throws Exception {
		return paymentDAO.approvePayment(payment, branchcode);
	}
	public Map<EnquiryType,List> getAllDueAmount(String branchId)throws Exception{
		return paymentDAO.getAllDueAmount(branchId);
	}
	public List<Employee> getApprovedbyList(String branchcode) throws Exception{
		return paymentDAO.getApprovedbyList(branchcode);
	}
	public List<Employee> getRecievedbyList(String branchcode) throws Exception{
		return paymentDAO.getRecievedbyList(branchcode);
	}
	public List getAllNotApproveInfo(String branch) throws Exception {
		return paymentDAO.getAllNotApproveInfo(branch);
	}
}
