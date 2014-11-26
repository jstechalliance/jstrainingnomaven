<%@include file="../common/chk.jsp"%>
<%@page import="com.js.controller.PaymentController" %>
<%@page import="com.js.utils.JSIBeanFactory"%>

<jsp:useBean id="payment" class="com.js.dto.Payment"></jsp:useBean>
<jsp:setProperty property="*" name="payment"/>

<%
	try{
		
		PaymentController paymentController =  JSIBeanFactory.getBean(PaymentController.class);
		
		String ret=paymentController.approvePayment(payment,request);
		if(ret.equalsIgnoreCase("success")){
			out.println("Payment successfully approved");	
		}else{
			out.println("Payment not approved");
		}		
	}catch(Exception ex){
		ex.printStackTrace();
		out.println("Payment not approved");		
	}
%>
