package com.js.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.js.dao.PaymentDAO;
import com.js.dto.AcademicProjectDTO;
import com.js.dto.Employee;
import com.js.dto.Payment;
import com.js.dto.PaymentRemark;
import com.js.dto.PaymentSearch;
import com.js.dto.TrainingRegistrationDTO;
import com.js.enums.EnquiryType;
import com.js.exception.JSIException;
import com.js.service.PaymentService;

@SuppressWarnings("deprecation")
public class PaymentController {
	
	private PaymentService paymentService;
	
	public PaymentService getPaymentService() {
		return paymentService;
	}

	public void setPaymentService(PaymentService paymentService) {
		this.paymentService = paymentService;
	}

	public List<Employee> getApprovedbyList(HttpServletRequest request) {
		String branchid = (String) request.getSession(false).getAttribute("BRANCHID");
		List<Employee> employees = new ArrayList<Employee>();
		try {
			employees=paymentService.getApprovedbyList(branchid);	
		} catch (Exception ex) {
			new JSIException(ex).log();
			employees = new ArrayList<Employee>();
		}
		return employees;
		
	}

	public List<Employee> getRecievedbyList(HttpServletRequest request) {
		String branchid = (String) request.getSession(false).getAttribute(
				"BRANCHID");
		List<Employee> employees = new ArrayList<Employee>();
		try {
			employees = paymentService.getRecievedbyList(branchid);
		} catch (Exception ex) {
			new JSIException(ex).log();
			employees = new ArrayList<Employee>();
		}
		return employees;
	}

	public Map<EnquiryType, List> searchResultForMakePayment(
			HttpServletRequest request, HttpServletResponse response,
			PaymentSearch search) {
		Map<EnquiryType, List> map = new HashMap<EnquiryType, List>();
		List<TrainingRegistrationDTO> candidateList = new ArrayList<TrainingRegistrationDTO>();
		List<AcademicProjectDTO> list = new ArrayList<AcademicProjectDTO>();
		map.put(EnquiryType.Training, candidateList);
		map.put(EnquiryType.Academic_Project, list);
		String branchid = (String) request.getSession(false).getAttribute(
				"BRANCHID");
		// System.out.println(branchid + " : " + search.getDialog_name() + " : "
		// + search.getDialog_code() + " : " + search.getDialog_source());
		String employeeid = (String) request.getSession(false).getAttribute(
				"USERNAME");
		try {
			map = paymentService.searchResultForMakePayment(
					search, branchid, employeeid);
		} catch (Exception ex) {
			ex.printStackTrace();
			new JSIException(ex).log();
		}
		return map;
	}

	public Payment makePayment(HttpServletRequest request,
			HttpServletResponse response, Payment payment) {
		Payment payment2 = null;
		String branchcode = (String) request.getSession(false).getAttribute(
				"BRANCHID");
		// System.out.println(branchcode);
		payment.setReceived_by((String) request.getSession(false).getAttribute(
				"USERNAME"));
		payment.setPayment_date(new SimpleDateFormat("yyyy-MM-dd")
				.format(new Date()));
		try {
			payment2 = paymentService.makePayment(payment,
					branchcode);
		} catch (Exception ex) {
			ex.printStackTrace();
			new JSIException(ex).log();
		}
		return payment2;
	}

	public String approvePayment(Payment payment, HttpServletRequest request) {
		String ret = "error";
		String branchid = (String) request.getSession(false).getAttribute(
				"BRANCHID");
		String employeeid = (String) request.getSession(false).getAttribute(
				"USERNAME");
		payment.setApproved_by(employeeid);
		payment.setApprovel_date(new SimpleDateFormat("yyyy-MM-dd")
				.format(new Date()));
		try {
			ret = paymentService.approvePayment(payment,
					branchid);
		} catch (Exception ex) {
			new JSIException(ex).log();
		}
		return ret;
	}

	public List getAllNotApproveInfo(HttpServletRequest request)
			throws Exception {
		List list = new ArrayList();
		String branchid = (String) request.getSession(false).getAttribute(
				"BRANCHID");
		try {
			list = paymentService.getAllNotApproveInfo(branchid);
		} catch (Exception ex) {
			ex.printStackTrace();
			new JSIException(ex).log();
		}
		return list;
	}

	public Map<EnquiryType, List> getAllDueAmount(HttpServletRequest request) {
		String branchid = (String) request.getSession(false).getAttribute(
				"BRANCHID");
		Map<EnquiryType, List> map = new HashMap<EnquiryType, List>();
		List<TrainingRegistrationDTO> list = new ArrayList<TrainingRegistrationDTO>();
		map.put(EnquiryType.Training, list);
		try {
			map = paymentService.getAllDueAmount(branchid);
		} catch (Exception ex) {
			ex.printStackTrace();
			new JSIException(ex).log();
		}
		return map;
	}

	public String savePaymentRemark(HttpServletRequest request,
			PaymentRemark remark) {
		String ret = "error";
		String branchid = (String) request.getSession(false).getAttribute(
				"BRANCHID");
		String userName = (String) request.getSession(false).getAttribute(
				"USERNAME");
		remark.setEmployee_id(userName);
		remark.setStatus("new remark");
		try {
			ret = paymentService.savePaymentRemark(branchid, remark);
			if (ret.equalsIgnoreCase("error")) {
				ret = "Remark not saved";
			} else if (ret.equalsIgnoreCase("success")) {
				ret = "Remark successfully saved";
			}
		} catch (Exception ex) {
			new JSIException(ex).log();
			ret = "Server side error";
		}
		return ret;
	}

	public List<PaymentRemark> getPaymentRemarkListById(String branchcode,
			String myid) {
		try {
			return paymentService.paymentRemarkListById(branchcode, myid);
		} catch (Exception ex) {
			new JSIException(ex).log();
			ex.printStackTrace();
			return new ArrayList<PaymentRemark>();
		}
	}

	public static void main(String[] args) {

	}
}
