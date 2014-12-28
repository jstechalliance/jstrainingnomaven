<%@page import="java.util.Map"%>
<%@page import="com.js.controller.CertificateController"%>
<%@page import="com.js.utils.JSIBeanFactory"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="../resources/js/certificate.js" type="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<%
		CertificateController certificateController =  JSIBeanFactory.getBean("certificateController");
		Map <String,String>map = certificateController.getStudentInfoToGenerateCertificate(request, response);
	%>
	<table width="100%">
		<tr>
			<td align="center"><br />
				<h4>Create certificate form</h4></td>
		</tr>
	</table>

	<form action="../certificate.jsi" target="_blank" id="id_certificates_form"
		method="post" onsubmit="return validate();">
		<table width="98%" align="center">
			<tr>
				<td>Registration No :</td>
				<td align="right"><input type="text" readonly="readonly"
					name="registrationNo" value="<%=map.get("registrationNo")%>" /></td>
				<td>Full Name :</td>
				<td align="right"><input type="text" readonly="readonly"
					name="fullName" value="<%=map.get("fullName")%>" /></td>
			</tr>

			<tr>
				<td>Gender :</td>
				<td align="right"><select name="gender">
						<option value="M">M</option>
						<option value="F">F</option>
				</select></td>
				<td>Father Name :</td>
				<td align="right"><input type="text" readonly="readonly"
					name="fatherName" value="<%=map.get("fatherName")%>" /></td>

			</tr>

			<tr>
				<td>Qualification :</td>
				<td align="right"><input type="text" readonly="readonly"
					name="qualification" value="<%=map.get("qualification")%>" /></td>
				<td>Branch :</td>
				<td align="right"><input type="text" name="branch" /></td>

			</tr>

			<tr>
				<td>College Name :</td>
				<td align="right"><input type="text" readonly="readonly"
					name="collegeName" value="<%=map.get("collegeName")%>" /></td>
				<td>College Address :</td>
				<td align="right"><input type="text" name="collegeAddress" />
				</td>

			</tr>
			<tr>
				<td>Training Start Date :</td>
				<td align="right"><input type="text" name="registrationDate"
					value="<%=map.get("registrationDate")%>" id="id_trainingStartDate" /></td>
				<td>Training End Date :</td>
				<td align="right"><input type="text" name="trainingEndDate"  id="id_trainingEndDate"/>
				</td>

			</tr>
			<tr>
				<td>Course :</td>
				<td align="right"><input type="text" readonly="readonly"
					name="course" value="<%=map.get("courseName")%>" /></td>
				<td>Course suffix:</td>
				<td align="right"><input type="text" name="courseSuffix" /></td>
			</tr>
			<tr>
				<td>Authorized Signatory :</td>
				<td align="right"><input type="text" name="authorizedSignatory"
					value="Prashanna Gupta"></td>
				<td>Issue Date :</td>
				<td align="right"><input type="text" readonly="readonly"
					name="issuedate" value="<%=map.get("issueDate")%>" /></td>
			</tr>
			<tr>
				<td></td>
				<td align="right"></td>
				<td></td>
				<td align="right"><input type="submit" id="id_certificate_button" value="Generate" /></td>
			</tr>
		</table>
	</form>
</body>
</html>