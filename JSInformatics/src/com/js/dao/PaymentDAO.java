package com.js.dao;

import java.util.List;
import java.util.Map;

import com.js.dto.Employee;
import com.js.dto.Payment;
import com.js.dto.PaymentRemark;
import com.js.dto.PaymentSearch;
import com.js.enums.EnquiryType;


@SuppressWarnings("deprecation")
public interface PaymentDAO {
	public Map<EnquiryType, List> searchResultForMakePayment(
			PaymentSearch search, String branchid, String employeeid)
			throws Exception ;

	public List<Employee> getApprovedbyList(String branchcode) throws Exception;

	public List<Employee> getRecievedbyList(String branchcode) throws Exception;
	public String savePaymentRemark(String branchcode, PaymentRemark remark)
			throws Exception ;

	public List<PaymentRemark> getPaymentRemarkListById(String branchcode,
			String myid) throws Exception ;

	public Map<EnquiryType, List> getAllDueAmount(String branchId)
			throws Exception ;
	public Payment makePayment(Payment payment, String branchcode)
			throws Exception;

	public String approvePayment(Payment payment, String branchcode)
			throws Exception ;

	public String updatePaymentDetail(Payment payment, String branchcode)
			throws Exception;

	public Payment getPaymentDetailByPaymentId(Payment payment,
			String branchcode) throws Exception;

	public List<Payment> getAllPaymentDetailById(Payment payment,
			String branchcode) throws Exception ;

	public int getDueAmount(String regId) throws Exception ;

	public List getAllNotApproveInfo(String branch) throws Exception ;

	public List get(String branch) throws Exception ;

}