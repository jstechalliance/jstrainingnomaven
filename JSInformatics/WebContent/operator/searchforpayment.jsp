<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.PaymentController"%>
<%@page import="com.js.enums.EnquiryType"%>
<%@page import="com.js.msg.MyMessage"%>
<%@page import="java.util.*" %>
<jsp:useBean id="paymentSearch" class="com.js.dto.PaymentSearch"></jsp:useBean>
<jsp:setProperty property="*" name="paymentSearch"/>
<%
	PaymentController paymentController = JSIBeanFactory.getBean(PaymentController.class);
	Map<EnquiryType, List> map =paymentController.searchResultForMakePayment(request, response,paymentSearch);	
	request.setAttribute("SEARCHFORPAYMENTCANDIDATELIST",map);
	MyMessage myMessage=new MyMessage();
	myMessage.setPaymentMessage(paymentSearch.getDialog_source());
	myMessage.setObject(paymentSearch);
	request.setAttribute("CANDIDATEFOUNDIN",myMessage);
	request.getRequestDispatcher("payment.jsp").forward(request,response);
%>