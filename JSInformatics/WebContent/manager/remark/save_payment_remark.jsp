
<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.PaymentController"%>
<jsp:useBean id="paymentRemark" class="com.js.dto.PaymentRemark"></jsp:useBean>
<jsp:setProperty property="*" name="paymentRemark" />
<%
	PaymentController paymentController = JSIBeanFactory.getBean(PaymentController.class);
	String ret=paymentController.savePaymentRemark(request, paymentRemark);
	out.println(ret);
%>
