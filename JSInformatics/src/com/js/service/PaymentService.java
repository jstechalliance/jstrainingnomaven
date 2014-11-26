package com.js.service;

import java.util.List;
import java.util.Map;

import com.js.dto.Employee;
import com.js.dto.Payment;
import com.js.dto.PaymentRemark;
import com.js.dto.PaymentSearch;
import com.js.enums.EnquiryType;

public interface PaymentService {
	
	public Map<EnquiryType, List> searchResultForMakePayment(PaymentSearch search,String branchid, String employeeid) throws Exception ;
	public String savePaymentRemark(String branchcode, PaymentRemark remark) throws Exception;
	public List<PaymentRemark> paymentRemarkListById(String branchcode, String myid)throws Exception;
	public List<Payment> getAllPaymentDetailById(Payment payment,String branchcode) throws Exception ;
	public Payment makePayment(Payment payment, String branchcode)	throws Exception ;
	public int getDueAmount(String regId) throws Exception;
	public String approvePayment(Payment payment, String branchcode) throws Exception ;
	public Map<EnquiryType,List> getAllDueAmount(String branchId)throws Exception;
	public List<Employee> getApprovedbyList(String branchcode) throws Exception;
	public List<Employee> getRecievedbyList(String branchcode) throws Exception;
	public List getAllNotApproveInfo(String branch) throws Exception ;
}
