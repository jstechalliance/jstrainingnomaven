<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.controller.PaymentController"%>
<%@page import="java.util.List"%>
<%@page import="com.js.dto.PaymentRemark"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function isBlankValue(input, msg) {
		var data = input.val();
		if (data.length == 0) {
			//input.style.borderColor = 'red';
			alert("Please fill " + msg + " field");
			//input.focus();
			return true;
		}
		return false;
	}

	$("#id_form_payment_remark")
			.submit(
					function(e) {
						var id_paymentremark_payment_alert = $(this).find(
								"#id_paymentremark_payment_alert");
						var id_paymentremark_remark = $(this).find(
								"#id_paymentremark_remark");

						if (isBlankValue(id_paymentremark_remark,
								"payment remark") == true) {
							return false;
						}
						if (isBlankValue(id_paymentremark_payment_alert,
								"payment alert date") == true) {
							return false;
						}
						var submitButton = $(this).find(
								"#id_submit_payment_remark");
						var idsend = $(this).find("#id_componentId").val();
						var myidsend = $(this).find("#id_myid").val();
						var myname = $(this).find("#id_name").val();
						submitButton.attr('disabled', 'disabled');
						$("#id_img_payment_remark_dialog_loader").show();
						var postData = $(this).serializeArray();
						var formURL = $(this).attr("action");
						$
								.ajax({
									url : formURL,
									type : "POST",
									data : postData,
									success : function(data, textStatus, jqXHR) {
										$(
												"#id_img_payment_remark_dialog_loader")
												.hide();
										loadPaymentRemarkList(idsend, myidsend,
												myname);
										submitButton.removeAttr('disabled');
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										$(
												"#id_img_payment_remark_dialog_loader")
												.hide();
										loadPaymentRemarkList(idsend, myidsend,
												myname);
										submitButton.removeAttr('disabled');
									}
								});
						e.preventDefault(); //STOP default action
						e.unbind(); //unbind. to stop multiple form submit.
					});
	function paymentRemarkForm() {
		$("#id_form_payment_remark").submit();
		return false;
	}
</script>
</head>
<body>
	<jsp:useBean id="paymentRemark" class="com.js.dto.PaymentRemark"></jsp:useBean>
	<jsp:setProperty property="*" name="paymentRemark" />
	<%
		String name = request.getParameter("name");
		String componentId = request.getParameter("componentId");
		String branch = (String) request.getSession(false).getAttribute("BRANCHID");
		PaymentController paymentController = JSIBeanFactory.getBean(PaymentController.class);
		List<PaymentRemark> list = paymentController.getPaymentRemarkListById(branch, paymentRemark.getMyid());
	%>
	<table width="100%">
		<tr>
			<td align="left"><%=name%></td>
			<td align="right"><%=paymentRemark.getMyid()%></td>
		</tr>
	</table>
	<div style="overflow: auto;height: 246px;">
		<table border="1" width="100%">
			<tbody>
				<tr bgcolor="#aa1122">
					<td align="center" style="width: 40%;"><b>Remark</b></td>
					<td align="center" style="width: 20%;"><b>Remarked Date</b></td>
					<td align="center" style="width: 25%;"><b>Alert Date</b></td>
					<td align="center" style="width: 20%;"><b>Councillor</b></td>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
						PaymentRemark remark = list.get(i);
				%>
				<tr bgcolor="#330066">
					<td align="center" width="40%"><%=remark.getRemark()%></td>
					<td align="center" width="20%"><%=remark.getRemark_date()%></td>
					<td align="center" width="20%"><%=remark.getPayment_alert()%></td>
					<td align="center" width="20%"><%=remark.getEmployee_id().replace(branch, "")%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

		<form id="id_form_payment_remark"
			action="remark/save_payment_remark.jsp"
			onsubmit="retern paymentRemarkForm();" method="post">
			<table>
				<tr bgcolor="#999999">
					<td align="center" style="width: 40%;"><input type="hidden"
						name="myid" value="<%=paymentRemark.getMyid()%>"> <input
						id="id_paymentremark_remark" type="text" name="remark"
						style="width: 92%;" /></td>
					<td align="center" style="width: 20%;"><input
						style="width: 92%; text-align: center;" type="text"
						name="remark_date"
						value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"
						readonly="readonly"></td>
					<td align="center" style="width: 25%;"><input
						id="id_paymentremark_payment_alert" style="width: 92%;"
						type="date" name="payment_alert"></td>
					<td align="center" style="width: 20%;" bgcolor="#333333"><input
						type="submit" id="id_submit_payment_remark" value="Save"
						style="float: right; display: block; width: 75px; height: 25px; margin: 2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;">
					</td>
				</tr>
			</table>
			<input type="hidden" id="id_name" value="<%=name%>" /> <input
				type="hidden" id="id_myid" value="<%=paymentRemark.getMyid()%>" />
			<input type="hidden" id="id_componentId" value="<%=componentId%>" />
		</form>
	</div>
</body>
</html>