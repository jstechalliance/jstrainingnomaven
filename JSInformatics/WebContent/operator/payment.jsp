<%@page import="com.js.controller.PaymentController"%>
<%@page import="com.js.service.impl.EmployeeServiceImpl"%>
<%@page import="com.js.service.impl.EnquiryServiceImpl"%>
<%@page import="com.js.service.impl.CollegeServiceImpl"%>
<%@page import="com.js.service.impl.CourseServiceImpl"%>
<%@page import="com.js.service.impl.PaymentServiceImpl"%>
<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.js.enums.EnquiryType"%>
<%@page import="com.js.enums.PaymentStatus"%>
<%@include file="../common/chk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.*"%>
<%@page import="com.js.dto.*"%>
<%@page import="com.js.service.*"%>
<%@page import="com.js.msg.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="operatortopheader.jsp"%>
<%@include file="../common/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JS Informatics</title>
<meta name="keywords"
	content="glossy box, web design, colorful background, free templates, website templates, CSS, HTML" />
<meta name="description"
	content="Glossy Box | free website template with a colorful background" />
<link href="../resources/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/jquery.ennui.contentslider.css" rel="stylesheet"
	type="text/css" media="screen,projection" />
<script type="text/javascript" src="../resources/js/enquiry.js"></script>
<script type="text/javascript" src="../resources/js/datepickr.js"></script>
<meta name="description"
	content="A lightweight, customizable jQuery timepicker plugin inspired by Google Calendar. Add a user-friendly timepicker dropdown to your app in minutes." />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="../resources/js/searchinq.js"></script>
<script src="../resources/js/payment.js"></script>
<script type="text/javascript" src="../resources/js/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/js/jquery.timepicker.css" />
<script type="text/javascript" src="../resources/js/jquery.validate.min.js"></script>



<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#myForm")
								.submit(
										function() {

											var search_enquiry_fullname = document
													.getElementById('id_search_enquiry_fullname');
											var search_enquiry_college = document
													.getElementById('id_search_enquiry_college');
											var search_enquiry_course = document
													.getElementById('id_search_enquiry_course');
											var search_enquiry_qualification = document
													.getElementById('id_search_enquiry_qualification');
											var search_enquiry_contactno = document
													.getElementById('id_search_enquiry_contactno');
											var search_start_date_doj = document
													.getElementById('id_search_start_date_doj');
											var search_end_date_doj = document
													.getElementById('id_search_end_date_doj');
											var search_enquiry_reference_name = document
													.getElementById('id_search_enquiry_reference_name');
											var search_start_date = document
													.getElementById('id_search_start_date');
											var search_end_date = document
													.getElementById('id_search_end_date');
											var search_semester = document
													.getElementById('id_search_semester');
											var search_enquiry_reference_no = document
													.getElementById('id_search_enquiry_reference_no');
											var search_enquiry_preferredtime_start = document
													.getElementById('id_search_enquiry_preferredtime_start');
											var search_enquiry_preferredtime_end = document
													.getElementById('id_search_enquiry_preferredtime_end');
											var search_enquiry_status = document
													.getElementById('id_search_enquiry_status');

											var val_search_enquiry_fullname = search_enquiry_fullname.value;
											var val_search_enquiry_college = search_enquiry_college.value;
											var val_search_enquiry_course = search_enquiry_course.value;
											var val_search_enquiry_qualification = search_enquiry_qualification.value;
											var val_search_enquiry_contactno = search_enquiry_contactno.value;
											var val_search_start_date_doj = search_start_date_doj.value;
											var val_search_end_date_doj = search_end_date_doj.value;
											var val_search_enquiry_reference_name = search_enquiry_reference_name.value;
											var val_search_start_date = search_start_date.value;
											var val_search_end_date = search_end_date.value;
											var val_search_semester = search_semester.value;
											var val_search_enquiry_reference_no = search_enquiry_reference_no.value;
											var val_search_enquiry_preferredtime_start = search_enquiry_preferredtime_start.value;
											var val_search_enquiry_preferredtime_end = search_enquiry_preferredtime_end.value;
											var val_search_enquiry_status = search_enquiry_status.value;

											if ((val_search_enquiry_fullname == "")
													&& (val_search_enquiry_college == "Select")
													&& (val_search_enquiry_course == "Select")
													&& (val_search_enquiry_qualification == 'Select')
													&& (val_search_enquiry_contactno == "")
													&& (val_search_start_date_doj == "")
													&& (val_search_end_date_doj == "")
													&& (val_search_enquiry_reference_name == "")
													&& (val_search_start_date == "")
													&& (val_search_end_date == "")
													&& (val_search_semester == 'Select')
													&& (val_search_enquiry_reference_no == "")
													&& (val_search_enquiry_preferredtime_start == "")
													&& (val_search_enquiry_preferredtime_end == "")
													&& (val_search_enquiry_status == 'Select')) {
												alert("Please specify search option");
												return false;
											}
											//if((val_search_enquiry_fullname=="")){
											//	alert("Please specify search option");
											//	return false;
											//}
											return true;
											//alert("Search");    
											return true;
										});
					});
</script>

<style type="text/css">
.calendar {
	font-family: 'Trebuchet MS', Tahoma, Verdana, Arial, sans-serif;
	font-size: 0.9em;
	background-color: #EEE;
	color: #333;
	border: 1px solid #DDD;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	padding: 0.2em;
	width: 14em;
}

.calendar .months {
	background-color: #F6AF3A;
	border: 1px solid #E78F08;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	color: #FFF;
	padding: 0.2em;
	text-align: center;
}

.calendar .prev-month,.calendar .next-month {
	padding: 0;
}

.calendar .prev-month {
	float: left;
}

.calendar .next-month {
	float: right;
}

.calendar .current-month {
	margin: 0 auto;
}

.calendar .months .prev-month,.calendar .months .next-month {
	color: #FFF;
	text-decoration: none;
	padding: 0 0.4em;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	cursor: pointer;
}

.calendar .months .prev-month:hover,.calendar .months .next-month:hover
	{
	background-color: #FDF5CE;
	color: #C77405;
}

.calendar table {
	border-collapse: collapse;
	padding: 0;
	font-size: 0.8em;
	width: 100%;
}

.calendar th {
	text-align: center;
}

.calendar td {
	text-align: right;
	padding: 1px;
	width: 14.3%;
}

.calendar td span {
	display: block;
	color: #1C94C4;
	background-color: #F6F6F6;
	border: 1px solid #CCC;
	text-decoration: none;
	padding: 0.2em;
	cursor: pointer;
}

.calendar td span:hover {
	color: #C77405;
	background-color: #FDF5CE;
	border: 1px solid #FBCB09;
}

.calendar td.today span {
	background-color: #FFF0A5;
	border: 1px solid #FED22F;
	color: #363636;
}
</style>
</head>
<body>

	

			<br />
			
			<%
			
				CourseService courseService = JSIBeanFactory.getBean(CourseServiceImpl.class);
				CollegeService collegeService = JSIBeanFactory.getBean(CollegeServiceImpl.class);
				EnquiryService enquiryService = JSIBeanFactory.getBean(EnquiryServiceImpl.class);
				PaymentService paymentService = JSIBeanFactory.getBean(PaymentServiceImpl.class);
				EmployeeService employeeService = JSIBeanFactory.getBean(EmployeeServiceImpl.class);
				PaymentController paymentController = JSIBeanFactory.getBean(PaymentController.class);
				
				
				
				MyMessage myMessage=(MyMessage)request.getAttribute("CANDIDATEFOUNDIN");
				String branchId=(String)request.getSession(false).getAttribute("BRANCHID");
							List <Employee>managerList = employeeService.getAllManagerOfBranch(branchId);
				        	List <Course>allCourseList=courseService.getAllCourse(branchId);
				        	List <Course>cList=courseService.getAllEnquiredCourse(branchId);
				        	List <College>collegeList=collegeService.getAllEnquiryedCollege(branchId);
				        	List <College>allCollegeList=collegeService.getAllCollege();
				        	List <String>qualificationList=enquiryService.getAllEnquiredQualification(branchId);
				        	List <String>statusList=enquiryService.getAllEnquiredStatus(branchId);
				        	PaymentSearch paymentSearch=null;
				        	if(myMessage!=null){
				        		paymentSearch=(PaymentSearch)myMessage.getObject();
				        	}
				        	String sourse[]=new String[]{"Select","Training","Academic Project"};
				        	String mysearch="";
				        	if(paymentSearch!=null){
				        		mysearch=paymentSearch.getDialog_source();
				        	}
			%>
			<div id="templatemo_content_wrapper">
				<div id="content">
					<div class="latestEvent">
						<form name="myForm" action="searchforpayment.jsp" method="post"
							id="myForm">
						<div><h4 style="float: left;">Search</h4><a style="float: right;background-color: white;padding-left: 10px;padding-right: 10px;padding-top: 3px;padding-bottom: 3px;cursor-pointer " href="#" id="id_show_payment_dialog">Make payment</a>
							
						</div>
							<table width="100%" border="1" align="left">
								<tr>
									<td width="12%">Full Name :</td>
									<%
								
						        	if(paymentSearch!=null){
						        		mysearch=paymentSearch.getDialog_name();
						        	}
									%>
									<td width="15%"><input type="text"
										name="dialog_name" id="id_dialog_name"
										style="width: 135px" value="<%=mysearch%>"/></td>
									<%
									if(paymentSearch!=null){
						        		mysearch=paymentSearch.getDialog_code();
						        	}
									%>
									<td width="12%">Registration Id :</td>
									<td width="18%"><input type="text" value="<%=mysearch%>" name="dialog_code" id="id_dialog_code" style="width: 135px"/> </td>
									<td width="12%">Source :</td>
									<td width="18%">
									<select name="dialog_source" id="id_dialog_source">
										<%
											mysearch = "Select";
											for(int i=0;i<sourse.length;i++){
												if(mysearch.equalsIgnoreCase(sourse[i])){
													out.println("<option selected='selected' value='"+sourse[i]+"'>"+sourse[i]+"</option>");	
												}else{
													out.println("<option value='"+sourse[i]+"'>"+sourse[i]+"</option>");
												}					
											}
											mysearch = "";
										%>
										</select>
									</td>
								</tr>
								
							
							</table>
							<input type="submit" value="Search"
										style="float: right; display: block; width: 100px; height: 25px; margin: 2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;" />
						</form>

					</div>
					<div class="hr_divider_enquiry"></div>

					<div class="leftContent">

						
						<script type="text/javascript" language="javascript">
							function changeColor(count) {
								var mytr = document
										.getElementById("tr" + count);
								mytr.style = '{color:#aabbcc;}';
							}
							function closeRemark(max) {
								for (var i = 1; i <= max; i++) {
									if ($("#" + i).is(":visible")) {
										$("#" + i).hide();
									}
								}
							}
							function showFeedBackAndEnquiryDetail(count) {
								document.getElementById("id_enquiry_id").value = document
										.getElementById("h_id_enquiryid"
												+ count).value;
								document.getElementById("id_fullname").value = document
										.getElementById("h_id_fullname" + count).value;
								document.getElementById("id_father_name").value = document
										.getElementById("h_id_father_name"
												+ count).value;
								var desiredValue = document
										.getElementById("h_id_qualification"
												+ count).value;
								var el = document
										.getElementById("id_qualification");
								var ii = 0;
								for (var i = 0; i < el.options.length; i++) {
									if (el.options[i].text == desiredValue) {
										el.selectedIndex = i;
										ii = 1;
										break;
									}
								}
								if (ii == 0) {
									el.options.add(new Option(desiredValue,
											desiredValue));
									for (var i = 0; i < el.options.length; i++) {
										if (el.options[i].text == desiredValue) {
											el.selectedIndex = i;
											ii = 1;
											break;
										}
									}
								}

								var desiredValue1 = document
										.getElementById("h_id_college" + count).value;
								var el1 = document.getElementById("id_college");
								var ii1 = 0;
								for (var i = 0; i < el1.options.length; i++) {
									if (el1.options[i].text == desiredValue1) {
										el1.selectedIndex = i;
										ii1 = 1;
										break;
									}
								}
								if (ii1 == 0) {
									el1.options.add(new Option(desiredValue1,
											desiredValue1));
									for (var i = 0; i < el1.options.length; i++) {
										if (el1.options[i].text == desiredValue1) {
											el1.selectedIndex = i;
											ii1 = 1;
											break;
										}
									}
								}

								var desiredValue2 = document
										.getElementById("h_id_semester" + count).value;
								var el2 = document
										.getElementById("id_semester");
								for (var i = 0; i < el2.options.length; i++) {
									if (el2.options[i].text == desiredValue2) {
										el2.selectedIndex = i;
										break;
									}
								}

								var desiredValue3 = document
										.getElementById("h_id_course" + count).value;
								var n = desiredValue3.split(",");
								var el3 = document.getElementById("id_course");
								for (var i = 0; i < el3.options.length; i++) {
									el3.options[i].selected = false;
								}
								for (var i = 0; i < n.length - 1; i++) {
									var val = n[i];
									var el4 = document
											.getElementById("id_course");
									for (var j = 0; j < el3.options.length; j++) {
										if (el4.options[j].text == val) {
											el4.options[j].selected = true;
											break;
										}
									}
								}

								var mydiv = document
										.getElementById('id_enquirymsg');
								mydiv.innerHTML = '<h4>Basic Detail</h4>';

								document.getElementById('id_status')
										.removeAttribute('disabled');

								var desiredValue5 = document
										.getElementById("h_id_status" + count).value;
								var el5 = document.getElementById("id_status");
								for (var i = 0; i < el5.options.length; i++) {
									if (el5.options[i].text == desiredValue5) {
										el5.selectedIndex = i;
										break;
									}
								}

								document.getElementById("id_contact_no").value = document
										.getElementById("h_id_contact_no"
												+ count).value;
								document.getElementById("id_email_id").value = document
										.getElementById("h_id_email_id" + count).value;
								document
										.getElementById("id_preferredtime_start").value = document
										.getElementById("h_id_preferredtime_start"
												+ count).value;
								document.getElementById("id_preferredtime_end").value = document
										.getElementById("h_id_preferredtime_end"
												+ count).value;
								document.getElementById("id_joining_date").value = document
										.getElementById("h_id_joining_date"
												+ count).value;
								document.getElementById("id_reference_name").value = document
										.getElementById("h_id_reference_name"
												+ count).value;
								document
										.getElementById("id_reference_contact_no").value = document
										.getElementById("h_id_reference_contact_no"
												+ count).value;
								document.getElementById("id_reference_note").value = document
										.getElementById("h_id_reference_note"
												+ count).value;
								document.getElementById("id_referenceid").value = document
										.getElementById("h_id_reference_id"
												+ count).value;
								document.getElementById("savenewenquiryBtn").value = "Update";
								document.getElementById("clearnewenquiryBtn").disabled = true;
								document.getElementById("id_joining_date").disabled = true;

							}
							function createDiv(item, max) {
								for (var i = 1; i <= max; i++) {
									if ($("#" + i).is(":visible")) {
										$("#" + i).hide();
									}
								}
								$("#" + item).show();
							}
							function checkfordisablity(val) {
								
								var mode = document
										.getElementById("id_payment_mode" + val).value;
								if (mode == "Cash") {
									document.getElementById("id_transfer_code"
											+ val).disabled = true;
									document
											.getElementById("id_transfer_bank_name"
													+ val).disabled = true;
									document
											.getElementById("id_transfer_code_msg"
													+ val).disabled = true;
								} else {
									document.getElementById("id_transfer_code"
											+ val).disabled = false;
									document
											.getElementById("id_transfer_bank_name"
													+ val).disabled = false;
									document
											.getElementById("id_transfer_code_msg"
													+ val).disabled = true;
									if (mode == "Cheque") {
										document
												.getElementById("id_transfer_code_msg"
														+ val).value = "Cheque No : ";
									}
									if (mode == "Draft") {
										document
												.getElementById("id_transfer_code_msg"
														+ val).value = "Draft No : ";
									}
									if (mode == "Online Transfer") {
										document
												.getElementById("id_transfer_code_msg"
														+ val).value = "Tranx Id : ";
									}
								}
							}
						</script>

						<%
							
							if(myMessage!=null){
								int count=1;
								String candidateListFrom=myMessage.getPaymentMessage();
								Map<EnquiryType, List> map = (Map<EnquiryType, List>)request.getAttribute("SEARCHFORPAYMENTCANDIDATELIST");
								out.println("<h4 style='font-size: 18px; font-style: normal;margin-left: 67%;'>Search Result</h4>");
								if(candidateListFrom.equalsIgnoreCase("Training")||candidateListFrom.equalsIgnoreCase("Select")){										                		
									List <TrainingRegistrationDTO>searchResultListForPayment=map.get(EnquiryType.Training);
									if(searchResultListForPayment!=null){
										if(searchResultListForPayment.size()>0){
											out.println("<h4 style='margin: 15px 0 0 0; font-size: 18px; font-style: normal;'>Trainning</h4>");
											out.println("<div style='height: 280px; width: 840px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;'>");
											%>
											<table border="4" cellpadding="0" cellspacing="0" width="1024px">
													<thead>
														<tr>
															<th width="4%"><a href="#">S.no</a></th>
															<th width="13%"><a href="#">Full Name</a></th>
															<th width="10%"><a href="#">Contact No</a></th>
															<th width="11%"><a href="#">Course</a></th>
															<th width="10%"><a href="#">Next Payment Date</a></th>
															<th width="12%"><a href="#">Batch Time</a></th>
															<th width="8%"><a href="#">Payable Amt</a></th>
															<th width="8%"><a href="#">Due Amt</a></th>
															<th width="12%"><a href="#">Reference Name</a></th>
															<th width="12%"><a href="#">Councillor</a></th>
														</tr>
													</thead>
												</table>
											<%
											
											int sno=0;
											for(TrainingRegistrationDTO trainingRegistrationDTO:searchResultListForPayment){
												int dueAmount=paymentService.getDueAmount(trainingRegistrationDTO.getRegistration_id());
												String maindivid="maindiv"+count;
												String subdivid="subdiv"+count;
												out.println("<div id='"+maindivid+"'>");
												sno++;
												out.println("<input type='hidden' name='h_enquiryid' id='h_id_enquiryid"+count+"' value='"+trainingRegistrationDTO.getEnquiry_id()+"'/>");
												out.println("<input type='hidden' name='h_fullname' id='h_id_fullname"+count+"' value='"+trainingRegistrationDTO.getFullname()+"'/>");
												out.println("<input type='hidden' name='h_father_name' id='h_id_father_name"+count+"' value='"+trainingRegistrationDTO.getFather_name()+"'/>");
												out.println("<input type='hidden' name='h_qualification' id='h_id_qualification"+count+"' value='"+trainingRegistrationDTO.getQualification()+"'/>");
												out.println("<input type='hidden' name='h_college' id='h_id_college"+count+"' value='"+trainingRegistrationDTO.getCollege()+"'/>");
												out.println("<input type='hidden' name='h_semester' id='h_id_semester"+count+"' value='"+trainingRegistrationDTO.getSemester()+"'/>");
												out.println("<input type='hidden' name='h_contact_no' id='h_id_contact_no"+count+"' value='"+trainingRegistrationDTO.getContact_no()+"'/>");
												out.println("<input type='hidden' name='h_email_id' id='h_id_email_id"+count+"' value='"+trainingRegistrationDTO.getEmail_id()+"'/>");
												String course_val="";
												for(int i=0;i<trainingRegistrationDTO.getCourse().length;i++){
													course_val=course_val+trainingRegistrationDTO.getCourse()[i]+"";
												}
												out.println("<input type='hidden' name='h_course' id='h_id_course"+count+"' value='"+course_val+"'/>");
												
												out.println("<input type='hidden' name='h_preferredtime_start' id='h_id_preferredtime_start"+count+"' value='"+trainingRegistrationDTO.getPreferredtime_start()+"'/>");
												out.println("<input type='hidden' name='h_preferredtime_end' id='h_id_preferredtime_end"+count+"' value='"+trainingRegistrationDTO.getPreferredtime_end()+"'/>");
												out.println("<input type='hidden' name='h_joining_date' id='h_id_joining_date"+count+"' value='"+trainingRegistrationDTO.getJoining_date()+"'/>");
												out.println("<input type='hidden' name='h_reference_id' id='h_id_reference_id"+count+"' value='"+trainingRegistrationDTO.getReferenceId()+"'/>");
												out.println("<input type='hidden' name='h_reference_name' id='h_id_reference_name"+count+"' value='"+trainingRegistrationDTO.getReference_name()+"'/>");
												out.println("<input type='hidden' name='h_reference_contact_no' id='h_id_reference_contact_no"+count+"' value='"+trainingRegistrationDTO.getReference_contact_no()+"'/>");
												out.println("<input type='hidden' name='h_reference_note' id='h_id_reference_note"+count+"' value='"+trainingRegistrationDTO.getReference_note()+"'/>");
												out.println("<input type='hidden' name='h_status' id='h_id_status"+count+"' value='"+trainingRegistrationDTO.getEnquiry_status()+"'/>");
												//System.out.println("Pref Start : "+newEnquiry.getPreferredtime_start());
												//System.out.println("Pref End : "+newEnquiry.getPreferredtime_end());
												
												out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+count+")' onmouseup='createDiv("+count+","+searchResultListForPayment.size()+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
												out.println("<td width='4%'>"+sno+"</td>");
												out.println("<td width='13%'>"+trainingRegistrationDTO.getFullname()+"</td>");
												out.println("<td width='10%'>"+trainingRegistrationDTO.getContact_no()+"</td>");
												out.println("<td width='11%'>");
												//String ces[]=trainingRegistrationDTO.getCourse();
												//for(String c:ces){
												out.println(trainingRegistrationDTO.getCoursename());
												//}
												out.println("</td>");
												out.println("<td width='10%'>"+trainingRegistrationDTO.getAlertDate()+"</td>");
												out.println("<td width='12%'>"+trainingRegistrationDTO.getBatch_time_start()+"-"+trainingRegistrationDTO.getBatch_time_end()+"</td>");
												
												out.println("<td width='8%'>"+trainingRegistrationDTO.getPayable_amount()+"</td>");
												if(dueAmount>0){
													out.println("<td width='8%'>"+dueAmount+"</td>");
												}else{
													out.println("<td width='8%'>No due</td>");
												}
												out.println("<div style='display:none'>"+dueAmount+"</div>");
												out.println("<td width='12%'>"+trainingRegistrationDTO.getReference_name()+"</td>");
												String reg_emp_id=trainingRegistrationDTO.getReg_employee_id();
												String dis_reg_emp_id=reg_emp_id.substring((reg_emp_id.indexOf(branchId)+branchId.length()),reg_emp_id.length());
												out.println("<td width='12%'>"+dis_reg_emp_id+"</td>");
												out.println("</tr></table>");
												
												
												out.println("<div id='"+count+"' style='display:none' >");
													out.println("<form action='#savepayment.jsp' id='makePaymentForm_"+count+"' method='post'>");
													out.println("<table border='1' width='850px' style='margin-left:50px; padding:3px'>");									
													out.println("<tr bgcolor='#aa1122'><td align='center' width='10%'><b>S.no</b></td><td align='center' width='15'><b>Amount</b></td><td align='center' width='10'><b>Mode</b></td><td align='center' width='20%'><b>Payment Date</b></td><td align='center' width='23%'><b>Received By</b></td><td align='center' width='12%'><b>Status</b></td><td align='center' width='12%'><b>Approved By</b></td><td align='center' width='10%'><b>Operation</b></td></tr>");
													Payment pay=new Payment();
													pay.setMyid(trainingRegistrationDTO.getRegistration_id());																								
													List <Payment>paymentDetailList=paymentService.getAllPaymentDetailById(pay,(String)request.getSession(false).getAttribute("BRANCHID"));
													int pdCount=0;
														for(Payment payment:paymentDetailList){
															pdCount++;
															out.println("<tr bgcolor='#330066'>");
														    String fdate=new SimpleDateFormat("dd/MM/yyyy").format(new Date());
														    
															out.println("<input type='hidden' value='"+payment.getPayment_id()+"' id='previous_paymentid"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getPayment_date()+"' id='previous_paymentdate"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+fdate+"' id='previous_paymenttime"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getMyid()+"' id='previous_myid"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getSource()+"' id='previous_source"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+trainingRegistrationDTO.getCoursename()+"' id='previous_cdetail"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getPayment_mode()+"' id='previous_id_payment_mode"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+trainingRegistrationDTO.getFullname()+"' id='previous_id_candidateName"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+employeeService.getEmployeeDetailByEmployeeId(new Employee(payment.getReceived_by())).getFull_name()+"' id='previous_id_receiverName"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getAmount()+"' id='previous_my_id_amount"+(count+"_"+pdCount)+"'>");
															
															out.println("<td width='10%'>");
																out.println(pdCount);													
															out.println("</td>");
															out.println("<td width='15%'>");
																out.println(payment.getAmount());														
															out.println("</td>");
															out.println("<td width='10%'>");
																out.println(payment.getPayment_mode());														
															out.println("</td>");
															out.println("<td width='20%'>");
																out.println(payment.getPayment_date());														
															out.println("</td>");													
															out.println("<td width='23%'>");
																out.println(payment.getReceived_by_name());														
															out.println("</td>");
															out.println("<td width='12%' align='center' id='p_approve_id_"+(count+""+pdCount)+"'>");
																
																	out.println(payment.getPayment_status());	
																
															out.println("</td>");
															out.println("<td width='12%' align='center'>");															
																out.println(payment.getApproved_by_name());															
															out.println("</td>");
															out.println("<td width='10%' align='center'>");
																out.println("<a href='#' onclick='printPreviousSlip(\""+(count+"_"+pdCount)+"\");'>Print</a>");														
															out.println("</td>");
															out.println("</tr>");
														}
														out.println("</table>");
														if(dueAmount>0){
															out.println("<table border='1' width='850px' style='margin-left:50px; padding:3px'>");
															out.println("<tr bgcolor='#999999'>");
															out.println("<td  bgcolor='#333333' width='675'>");
																out.println("<div style='float: left;'>");
																out.println("Mode: <select name='payment_mode' id='id_payment_mode"+count+"' onchange='checkfordisablity("+count+");'>");
													            	out.println("<option value='Select'>Select</option>");
													            	out.println("<option value='Cash'>Cash</option>");
													            	out.println("<option value='Cheque'>Cheque</option>");
													            	out.println("<option value='Draft'>Draft</option>");
													            	out.println("<option value='Online Transfer'>Online Transfer</option>");
													            out.println("</select>");
													            out.println("<input type='text' name='transfer_code_msg' id='id_transfer_code_msg"+count+"' size='8' value='Detail : ' disabled='disabled' style='border: 0px solid; background-color:#333333; color:#FFFFFF;'>");
													            out.println("<input type='text' name='transfer_code' id='id_transfer_code"+count+"' size='5'>");
													            out.println("Bank : <input type='text' name='transfer_bank_name' id='id_transfer_bank_name"+count+"' size='5'>");
													            Date pdate=new Date();
													            String fdate=new SimpleDateFormat("dd/MM/yyyy").format(pdate);
													            String ftime=new SimpleDateFormat("hh:mm:ss").format(pdate);
													            out.println("<input type='hidden' name='contactNo' value='"+trainingRegistrationDTO.getContact_no()+"'/>");
													            out.println("<input type='hidden' value='"+dueAmount+"' id='id_dueAmount"+count+"'/>");
													            out.println("<input type='hidden' name='paymentdate' value='"+fdate+"' id='paymentdate"+count+"' size='30'/>");
													            out.println("<input type='hidden' name='cdetail' value='"+trainingRegistrationDTO.getCoursename()+"' id='cdetail"+count+"' size='30'/>");
													            out.println("<input type='hidden' name='paymenttime' value='"+ftime+"' id='paymenttime"+count+"' size='30'/>");
													            out.println("<input type='hidden' name='source' value='Training' id='source"+count+"' size='30'/>");
																out.println("<input type='hidden' name='candidateName' id='id_candidateName"+count+"' value='"+trainingRegistrationDTO.getFullname()+"' size='30'/>");
																out.println("<input type='hidden' name='receiverName' id='id_receiverName"+count+"' value='"+(String)request.getSession(false).getAttribute("USERFULLNAME")+"' size='30'/>");
																out.println("<input type='hidden' name='myid' value='"+trainingRegistrationDTO.getRegistration_id()+"' id='myid"+count+"' size='30'/>");
																out.println("Amount : <input type='text' name='amount' id='my_id_amount"+count+"' value='' size='5' />");
																out.println("<input type='hidden' value='"+searchResultListForPayment.size()+"' id='maxvalue"+count+"'/>");
															 
																out.println("Manager : <select name='paymentSubmittedToId' id='id_manager_id"+count+"' style='width:110px;'>");
																out.println("<option value='Select'>Select</option>");
																for(Employee emp : managerList){
																	out.println("<option value='"+emp.getEmployee_id()+"'>"+emp.getFull_name()+"</option>");
												            	}
												            	out.println("</select>");
												            
															out.println("</td>");
															out.println("<td bgcolor='#333333'  width='175'>");	
															out.println("<input type='button' onclick='closeRemark("+searchResultListForPayment.size()+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(../images/templatemo_btn.png) no-repeat;'/>");
															out.println("<input onclick='makePaymentBtn(\""+count+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(../images/templatemo_btn.png) no-repeat;'/>");
															out.println("</div>");
															out.println("</td>");
															out.println("</tr>");
															out.println("</table>");
														}
													out.println("</form>");
													if(dueAmount>0){
														out.println("<div id='id_div_payment_remark_"+count+"'>");
														out.println("</div>");
														out.println("<input type='button' value='+ Add Remark' id='"+count+"' class='payment_remark_dialog_show_button'/>");
													}else{
														out.println("<input type='hidden' name='myid' value='"+trainingRegistrationDTO.getRegistration_id()+"' id='myid"+count+"' size='30'/>");
														out.println("<input type='button' value=' Create Certificate ' id='"+count+"' class='generate_certificate_dialog_show_button'/>");
													}
													out.println("</div>");
												out.println("</div>");
												count++;
											}
											out.println("</div>");
										}
									}
								}
								if(candidateListFrom.equalsIgnoreCase("Academic Project")||candidateListFrom.equalsIgnoreCase("Select")){										                		
									List <AcademicProjectDTO>searchResultListForPayment=map.get(EnquiryType.Academic_Project);
									if(searchResultListForPayment!=null){
										if(searchResultListForPayment.size()>0){
											out.println("<h4 style='margin: 15px 0 0 0;font-size: 18px; font-style: normal;'>Academic Project</h4>");
												out.println("<div style='height: 280px; width: 840px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;'>");
													out.println("<table border='4' cellpadding='0' cellspacing='0' width='1024px'><thead><tr>");
													out.println("<th width='4%'><a href='#'>S.no</a></th>");
													out.println("<th width='13%'><a href='#'>Full Name</a></th>");
													out.println("<th width='10%'><a href='#'>Contact No</a></th>");
													out.println("<th width='11%'><a href='#'>Priject Mame</a></th>");
													out.println("<th width='10%'><a href='#'>Next Payment Date</a></th>");
													out.println("<th width='12%'><a href='#'>Delevery Date</a></th>");
													out.println("<th width='8%'><a href='#'>Payable Amt</a></th>");
													out.println("<th width='8%'><a href='#'>Due Amt</a></th>");
													out.println("<th width='12%'><a href='#'>Reference Name</a></th>");
													out.println("<th width='12%'><a href='#'>Councillor</a></th>");
												out.println("</tr></thead></table>");
												
												int sno=0;
												int privioutotal=count;
												for(AcademicProjectDTO academicProjectDTO:searchResultListForPayment){
													NewAcademicProjectEnquiryDTO enquiryDTO = academicProjectDTO.getDto();
													int dueAmount=paymentService.getDueAmount(academicProjectDTO.getProject_id());
													String maindivid="maindiv"+count;
													String subdivid="subdiv"+count;
													out.println("<div id='"+maindivid+"'>");
													sno++;
													out.println("<input type='hidden' name='h_fullname' id='h_id_fullname"+count+"' value='"+enquiryDTO.getAcademic_project_enquiry_fullname()+"'/>");
													out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+count+")' onmouseup='createDiv("+count+","+(searchResultListForPayment.size()+privioutotal)+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
														out.println("<td width='4%'>"+sno+"</td>");
														out.println("<td width='13%'>"+enquiryDTO.getAcademic_project_enquiry_fullname()+"</td>");
														out.println("<td width='10%'>"+enquiryDTO.getAcademic_project_enquiry_contact_no()+"</td>");
														out.println("<td width='11%'>"+academicProjectDTO.getProject_name()+"</td>");
														out.println("<td width='10%'>"+academicProjectDTO.getAlertDate()+"</td>");
														out.println("<td width='12%'>"+academicProjectDTO.getDelivery_date()+"</td>");
														out.println("<td width='8%'>"+academicProjectDTO.getProject_cost()+"</td>");
														if(dueAmount>0){
															out.println("<td width='8%'>"+dueAmount+"</td>");
														}else{
															out.println("<td width='8%'>No Due</td>");
														}
														out.println("<td width='12%'>puran</td>");
														String reg_emp_id=academicProjectDTO.getEmploye_id();
														String dis_reg_emp_id=reg_emp_id.substring((reg_emp_id.indexOf(branchId)+branchId.length()),reg_emp_id.length());
														out.println("<td width='12%'>"+dis_reg_emp_id	+"</td>");
													out.println("</tr></table>");
													out.println("<div id='"+count+"' style='display:none' >");
													out.println("<form action='#savepayment.jsp' id='makePaymentForm_"+count+"' method='post'>");
													out.println("<table border='1' width='850px' style='margin-left:50px; padding:3px'>");									
													out.println("<tr bgcolor='#aa1122'><td align='center' width='10%'><b>S.no</b></td><td align='center' width='15'><b>Amount</b></td><td align='center' width='10'><b>Mode</b></td><td align='center' width='20%'><b>Payment Date</b></td><td align='center' width='23%'><b>Received By</b></td><td align='center' width='12%'><b>Status</b></td><td align='center' width='12%'><b>Approved By</b></td><td align='center' width='10%'><b>Operation</b></td></tr>");
													Payment pay=new Payment();
													pay.setMyid(academicProjectDTO.getProject_id());																								
													List <Payment>paymentDetailList=paymentService.getAllPaymentDetailById(pay,(String)request.getSession(false).getAttribute("BRANCHID"));
													int pdCount=0;
														for(Payment payment:paymentDetailList){
															pdCount++;
															out.println("<tr bgcolor='#330066'>");
														    String fdate=new SimpleDateFormat("dd/MM/yyyy").format(new Date());
														    
															out.println("<input type='hidden' value='"+payment.getPayment_id()+"' id='previous_paymentid"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getPayment_date()+"' id='previous_paymentdate"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+fdate+"' id='previous_paymenttime"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getMyid()+"' id='previous_myid"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getSource()+"' id='previous_source"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+academicProjectDTO.getProject_name()+"' id='previous_cdetail"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getPayment_mode()+"' id='previous_id_payment_mode"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+enquiryDTO.getAcademic_project_enquiry_fullname()+"' id='previous_id_candidateName"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+employeeService.getEmployeeDetailByEmployeeId(new Employee(payment.getReceived_by())).getFull_name()+"' id='previous_id_receiverName"+(count+"_"+pdCount)+"'>");
															out.println("<input type='hidden' value='"+payment.getAmount()+"' id='previous_my_id_amount"+(count+"_"+pdCount)+"'>");
															
															out.println("<td width='10%'>");
																out.println(pdCount);													
															out.println("</td>");
															out.println("<td width='15%'>");
																out.println(payment.getAmount());														
															out.println("</td>");
															out.println("<td width='10%'>");
																out.println(payment.getPayment_mode());														
															out.println("</td>");
															out.println("<td width='20%'>");
																out.println(payment.getPayment_date());														
															out.println("</td>");													
															out.println("<td width='23%'>");
																out.println(payment.getReceived_by_name());														
															out.println("</td>");
															out.println("<td width='12%' align='center' id='p_approve_id_"+(count+""+pdCount)+"'>");
																
																	out.println(payment.getPayment_status());	
																
															out.println("</td>");
															out.println("<td width='12%' align='center'>");															
																out.println(payment.getApproved_by_name());															
															out.println("</td>");
															out.println("<td width='10%' align='center'>");
																out.println("<a href='#' onclick='printPreviousSlip(\""+(count+"_"+pdCount)+"\");'>Print</a>");														
															out.println("</td>");
															out.println("</tr>");
														}
														out.println("</table>");
														if(dueAmount>0){
														out.println("<table border='1' width='850px' style='margin-left:50px; padding:3px'>");
															out.println("<tr bgcolor='#999999'>");
															out.println("<td  bgcolor='#333333' width='675'>");
																out.println("<div style='float: left;'>");
																out.println("Mode: <select name='payment_mode' id='id_payment_mode"+count+"' onchange='checkfordisablity("+count+");'>");
													            	out.println("<option value='Select'>Select</option>");
													            	out.println("<option value='Cash'>Cash</option>");
													            	out.println("<option value='Cheque'>Cheque</option>");
													            	out.println("<option value='Draft'>Draft</option>");
													            	out.println("<option value='Online Transfer'>Online Transfer</option>");
													            out.println("</select>");
													            out.println("<input type='text' name='transfer_code_msg' id='id_transfer_code_msg"+count+"' size='8' value='Detail : ' disabled='disabled' style='border: 0px solid; background-color:#333333; color:#FFFFFF;'>");
													            out.println("<input type='text' name='transfer_code' id='id_transfer_code"+count+"' size='5'>");
													            out.println("Bank : <input type='text' name='transfer_bank_name' id='id_transfer_bank_name"+count+"' size='5'>");
													            Date pdate=new Date();
													            String fdate=new SimpleDateFormat("dd/MM/yyyy").format(pdate);
													            String ftime=new SimpleDateFormat("hh:mm:ss").format(pdate);
													            out.println("<input type='hidden' name='contactNo' value='"+enquiryDTO.getAcademic_project_enquiry_contact_no()+"'/>");
													            out.println("<input type='hidden' value='"+dueAmount+"' id='id_dueAmount"+count+"'/>");
													            out.println("<input type='hidden' name='paymentdate' value='"+fdate+"' id='paymentdate"+count+"' size='30'/>");
													            out.println("<input type='hidden' name='cdetail' value='"+academicProjectDTO.getProject_name()+"' id='cdetail"+count+"' size='30'/>");
													            out.println("<input type='hidden' name='paymenttime' value='"+ftime+"' id='paymenttime"+count+"' size='30'/>");
													            out.println("<input type='hidden' name='source' value='Academic Project' id='source"+count+"' size='30'/>");
																out.println("<input type='hidden' name='candidateName' id='id_candidateName"+count+"' value='"+enquiryDTO.getAcademic_project_enquiry_fullname()+"' size='30'/>");
																out.println("<input type='hidden' name='receiverName' id='id_receiverName"+count+"' value='"+(String)request.getSession(false).getAttribute("USERFULLNAME")+"' size='30'/>");
																out.println("<input type='hidden' name='myid' value='"+academicProjectDTO.getProject_id()+"' id='myid"+count+"' size='30'/>");
																out.println("Amount : <input type='text' name='amount' id='my_id_amount"+count+"' value='' size='5' />");
																out.println("<input type='hidden' value='"+searchResultListForPayment.size()+"' id='maxvalue"+count+"'/>");
																
																out.println("Manager : <select name='paymentSubmittedToId' id='id_manager_id"+count+"' style='width:110px;'>");
																out.println("<option value='Select'>Select</option>");
																for(Employee emp : managerList){
																	out.println("<option value='"+emp.getEmployee_id()+"'>"+emp.getFull_name()+"</option>");
												            	}
												            	out.println("</select>");
																
															out.println("</td>");
															out.println("<td bgcolor='#333333' width='175'>");	
															out.println("<input type='button' onclick='closeRemark("+(searchResultListForPayment.size()+privioutotal)+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(../images/templatemo_btn.png) no-repeat;'/>");
															out.println("<input onclick='makePaymentBtn(\""+count+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(../images/templatemo_btn.png) no-repeat;'/>");
															out.println("</div>");
															out.println("</td>");
														out.println("</tr>");												
														out.println("</table>");	
														}
													out.println("</form>");	
													if(dueAmount>0){
														out.println("<div id='id_div_payment_remark_"+count+"'>");
														out.println("</div>");
														out.println("<input type='button' value='+ Add Remark' id='"+count+"' class='payment_remark_dialog_show_button'/>");
														out.println("</div>");		
													}
													out.println("</div>");
													count++;
																				
												}
											out.println("</div>");
										}
									}
								}
							}else{
						%>
						
						<h4 style="font-size: 18px; font-style: normal;margin-left: 67%;margin: 0 0 0 0;">Due Amount</h4>
						<%						
							Map<EnquiryType,List> map=paymentController.getAllDueAmount(request); 
						List <TrainingRegistrationDTO>searchResultListForPayment = map.get(EnquiryType.Training);
						List <AcademicProjectDTO>academicProjectDTOs = map.get(EnquiryType.Academic_Project);
						int count=1;
						if(searchResultListForPayment!=null&&searchResultListForPayment.size()>0){
							Collections.sort(searchResultListForPayment,
									TrainingRegistrationDTO.Order.ByAlertDate.ascending());
							out.println("<h4 style='font-size: 18px; font-style: normal;margin: 15px 0 0 0;'>Traning</h4>");
							out.println("<div style='height: 280px; width: 840px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;'>");
						%>
							<table border="4" cellpadding="0" cellspacing="0" width="1024px">
								<thead>
									<tr>
										<th width="4%"><a href="#">S.no</a></th>
										<th width="13%"><a href="#">Full Name</a></th>
										<th width="10%"><a href="#">Contact No</a></th>										
										<th width="8%"><a href="#">Payable Amt</a></th>
										<th width="8%"><a href="#">Due Amt</a></th>
										<th width="11%"><a href="#">Course</a></th>
										<th width="10%"><a href="#">Next Payment Date</a></th>
										<th width="12%"><a href="#">Batch Time</a></th>
										<th width="12%"><a href="#">Reference Name</a></th>
										<th width="12%"><a href="#">Councillor</a></th>
									</tr>
								</thead>
							</table>

							<%
							String candidateListFrom=EnquiryType.Training.name();
								
								int sno=0;
								for(TrainingRegistrationDTO trainingRegistrationDTO:searchResultListForPayment){
									int dueAmount=paymentService.getDueAmount(trainingRegistrationDTO.getRegistration_id());
									String maindivid="maindiv"+count;
									String subdivid="subdiv"+count;
									out.println("<div id='"+maindivid+"'>");
										sno++;
										out.println("<input type='hidden' name='h_enquiryid' id='h_id_enquiryid"+count+"' value='"+trainingRegistrationDTO.getEnquiry_id()+"'/>");
										out.println("<input type='hidden' name='h_fullname' id='h_id_fullname"+count+"' value='"+trainingRegistrationDTO.getFullname()+"'/>");
										out.println("<input type='hidden' name='h_father_name' id='h_id_father_name"+count+"' value='"+trainingRegistrationDTO.getFather_name()+"'/>");
										out.println("<input type='hidden' name='h_qualification' id='h_id_qualification"+count+"' value='"+trainingRegistrationDTO.getQualification()+"'/>");
										out.println("<input type='hidden' name='h_college' id='h_id_college"+count+"' value='"+trainingRegistrationDTO.getCollege()+"'/>");
										out.println("<input type='hidden' name='h_semester' id='h_id_semester"+count+"' value='"+trainingRegistrationDTO.getSemester()+"'/>");
										out.println("<input type='hidden' name='h_contact_no' id='h_id_contact_no"+count+"' value='"+trainingRegistrationDTO.getContact_no()+"'/>");
										out.println("<input type='hidden' name='h_email_id' id='h_id_email_id"+count+"' value='"+trainingRegistrationDTO.getEmail_id()+"'/>");
										
										out.println("<input type='hidden' name='h_course' id='h_id_course"+count+"' value='"+trainingRegistrationDTO.getCoursename()+"'/>");
										out.println("<input type='hidden' name='h_preferredtime_start' id='h_id_preferredtime_start"+count+"' value='"+trainingRegistrationDTO.getPreferredtime_start()+"'/>");
										out.println("<input type='hidden' name='h_preferredtime_end' id='h_id_preferredtime_end"+count+"' value='"+trainingRegistrationDTO.getPreferredtime_end()+"'/>");
										out.println("<input type='hidden' name='h_joining_date' id='h_id_joining_date"+count+"' value='"+trainingRegistrationDTO.getJoining_date()+"'/>");
										out.println("<input type='hidden' name='h_reference_id' id='h_id_reference_id"+count+"' value='"+trainingRegistrationDTO.getReferenceId()+"'/>");
										out.println("<input type='hidden' name='h_reference_name' id='h_id_reference_name"+count+"' value='"+trainingRegistrationDTO.getReference_name()+"'/>");
										out.println("<input type='hidden' name='h_reference_contact_no' id='h_id_reference_contact_no"+count+"' value='"+trainingRegistrationDTO.getReference_contact_no()+"'/>");
										out.println("<input type='hidden' name='h_reference_note' id='h_id_reference_note"+count+"' value='"+trainingRegistrationDTO.getReference_note()+"'/>");
										out.println("<input type='hidden' name='h_status' id='h_id_status"+count+"' value='"+trainingRegistrationDTO.getEnquiry_status()+"'/>");
										
										out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+count+")' onmouseup='createDiv("+count+","+searchResultListForPayment.size()+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
										out.println("<td width='4%'>"+sno+"</td>");
										out.println("<td width='13%'>"+trainingRegistrationDTO.getFullname()+"</td>");
										out.println("<td width='10%'>"+trainingRegistrationDTO.getContact_no()+"</td>");										
										out.println("<td width='8%'>"+trainingRegistrationDTO.getPayable_amount()+"</td>");
										if(dueAmount>0){
											out.println("<td width='8%'>"+dueAmount+"</td>");
										}else{
											out.println("<td width='8%'>No due</td>");
										}
										out.println("<td width='11%'>");
										out.println(trainingRegistrationDTO.getCoursename());
										out.println("</td>");
										out.println("<td width='10%'>"+trainingRegistrationDTO.getAlertDate()+"</td>");
										out.println("<td width='12%'>"+trainingRegistrationDTO.getBatch_time_start()+"-"+trainingRegistrationDTO.getBatch_time_end()+"</td>");
										
										out.println("<td width='12%'>"+trainingRegistrationDTO.getReference_name()+"</td>");
										String reg_emp_id=trainingRegistrationDTO.getReg_employee_id();
										String dis_reg_emp_id=reg_emp_id.substring((reg_emp_id.indexOf(branchId)+branchId.length()),reg_emp_id.length());
										out.println("<td width='12%'>"+dis_reg_emp_id+"</td>");
										out.println("</tr></table>");
										out.println("<div id='"+count+"' style='display:none' >");																	
										out.println("<form action='#savepayment.jsp' id='makePaymentForm_"+count+"' method='post'>");
											out.println("<table border='1' width='850px' style='margin-left:50px; padding:3px'>");									
											out.println("<tr bgcolor='#aa1122'><td align='center' width='10%'><b>S.no</b></td><td align='center' width='15'><b>Amount</b></td><td align='center' width='10'><b>Mode</b></td><td align='center' width='20%'><b>Payment Date</b></td><td align='center' width='23%'><b>Received By</b></td><td align='center' width='12%'><b>Status</b></td><td align='center' width='12%'><b>Approved By</b></td><td align='center' width='10%'><b>Operation</b></td></tr>");
											Payment pay=new Payment();
											pay.setMyid(trainingRegistrationDTO.getRegistration_id());																								
											List <Payment>paymentDetailList=paymentService.getAllPaymentDetailById(pay,(String)request.getSession(false).getAttribute("BRANCHID"));
											int pdCount=0;
											for(Payment payment:paymentDetailList){
												pdCount++;
												out.println("<tr bgcolor='#330066'>");
													Date pdate=new Date();
			                    							String fdate=pdate.getDate()+"/"+(1+pdate.getMonth())+"/"+(1900+pdate.getYear());
													out.println("<input type='hidden' value='"+payment.getPayment_id()+"' id='previous_paymentid"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getPayment_date()+"' id='previous_paymentdate"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+fdate+"' id='previous_paymenttime"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getMyid()+"' id='previous_myid"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getSource()+"' id='previous_source"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+trainingRegistrationDTO.getCoursename()+"' id='previous_cdetail"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getPayment_mode()+"' id='previous_id_payment_mode"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+trainingRegistrationDTO.getFullname()+"' id='previous_id_candidateName"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+employeeService.getEmployeeDetailByEmployeeId(new Employee(payment.getReceived_by())).getFull_name()+"' id='previous_id_receiverName"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getAmount()+"' id='previous_my_id_amount"+(count+"_"+pdCount)+"'>");
													
													out.println("<td width='10%'>");
														out.println(pdCount);													
													out.println("</td>");
													out.println("<td width='15%'>");
														out.println(payment.getAmount());														
													out.println("</td>");
													out.println("<td width='10%'>");
														out.println(payment.getPayment_mode());														
													out.println("</td>");
													out.println("<td width='20%'>");
														out.println(payment.getPayment_date());														
													out.println("</td>");													
													out.println("<td width='23%'>");
														out.println(payment.getReceived_by_name());														
													out.println("</td>");
													out.println("<td width='12%' align='center' id='p_approve_id_"+(count+""+pdCount)+"'>");
														out.println(payment.getPayment_status());	
													out.println("</td>");
													out.println("<td width='12%' align='center'>");															
														out.println(payment.getApproved_by_name());															
													out.println("</td>");
													out.println("<td width='10%' align='center'>");
														out.println("<a href='#' onclick='printPreviousSlip(\""+(count+"_"+pdCount)+"\");'>Print</a>");														
													out.println("</td>");
												out.println("</tr>");
											}
											out.println("</table>");
											if(dueAmount>0){
											out.println("<table border='1' width='850px' style='margin-left:50px; padding:3px'>");
												out.println("<tr bgcolor='#999999'>");
													out.println("<td  bgcolor='#333333' width='675'>");
														out.println("<div style='float: left;'>");
														out.println("Mode: <select name='payment_mode' id='id_payment_mode"+count+"' onchange='checkfordisablity("+count+");'>");
		                    							out.println("<option value='Select'>Select</option>");
		                    							out.println("<option value='Cash'>Cash</option>");
		                    							out.println("<option value='Cheque'>Cheque</option>");
		                    							out.println("<option value='Draft'>Draft</option>");
		                    							out.println("<option value='Online Transfer'>Online Transfer</option>");
		                    							out.println("</select>");
		                    							out.println("<input type='text' name='transfer_code_msg' id='id_transfer_code_msg"+count+"' size='8' value='Detail : ' disabled='disabled' style='border: 0px solid; background-color:#333333; color:#FFFFFF;'>");
		                    							out.println("<input type='text' name='transfer_code' id='id_transfer_code"+count+"' size='5'>");
		                    							out.println("Bank : <input type='text' name='transfer_bank_name' id='id_transfer_bank_name"+count+"' size='5'>");
		                    							Date pdate=new Date();
		                    							String fdate=pdate.getDate()+"/"+(1+pdate.getMonth())+"/"+(1900+pdate.getYear());
		                    							String ftime=pdate.getHours()+":"+pdate.getMinutes()+":"+pdate.getSeconds();
		                    							
		                    							out.println("<input type='hidden' name='contactNo' value='"+trainingRegistrationDTO.getContact_no()+"'/>");
		                    							out.println("<input type='hidden' value='"+dueAmount+"' id='id_dueAmount"+count+"'/>");
		                    							out.println("<input type='hidden' name='paymentdate' value='"+fdate+"' id='paymentdate"+count+"' size='30'/>");
		                    							out.println("<input type='hidden' name='cdetail' value='"+trainingRegistrationDTO.getCoursename()+"' id='cdetail"+count+"' size='30'/>");
		                    							out.println("<input type='hidden' name='paymenttime' value='"+ftime+"' id='paymenttime"+count+"' size='30'/>");
		                    							out.println("<input type='hidden' name='source' value='"+candidateListFrom+"' id='source"+count+"' size='30'/>");
														out.println("<input type='hidden' name='candidateName' id='id_candidateName"+count+"' value='"+trainingRegistrationDTO.getFullname()+"' size='30'/>");
														out.println("<input type='hidden' name='receiverName' id='id_receiverName"+count+"' value='"+(String)request.getSession(false).getAttribute("USERFULLNAME")+"' size='30'/>");
														out.println("<input type='hidden' name='myid' value='"+trainingRegistrationDTO.getRegistration_id()+"' id='myid"+count+"' size='30'/>");
														out.println("Amount : <input type='text' name='amount' id='my_id_amount"+count+"' value='' size='5' />");
														out.println("<input type='hidden' value='"+searchResultListForPayment.size()+"' id='maxvalue"+count+"'/>");
													
														out.println("Manager : <select name='paymentSubmittedToId' id='id_manager_id"+count+"' style='width:110px;'>");
														out.println("<option value='Select'>Select</option>");
														for(Employee emp : managerList){
															out.println("<option value='"+emp.getEmployee_id()+"'>"+emp.getFull_name()+"</option>");
										            	}
										            	out.println("</select>");
														
														out.println("</td>");
													out.println("<td bgcolor='#333333' width='175'>");
														out.println("<input type='button' onclick='closeRemark("+searchResultListForPayment.size()+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(../images/templatemo_btn.png) no-repeat;'/>");
														out.println("<input onclick='makePaymentBtn(\""+count+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(../images/templatemo_btn.png) no-repeat;'/>");
														out.println("</div>");
													out.println("</td>");
												out.println("</tr>");												
											out.println("</table>");	
											}
										out.println("</form>");
										if(dueAmount>0){
										out.println("<div id='id_div_payment_remark_"+count+"'>");
										out.println("</div>");
										out.println("<input type='button' value='+ Add Remark' id='"+count+"' class='payment_remark_dialog_show_button'/>");
										}
									out.println("</div>");
								out.println("</div>");
								count++;						
							}
							out.println("</div>");
						}
						if(academicProjectDTOs!=null&&academicProjectDTOs.size()>0){
							Collections.sort(academicProjectDTOs,
									AcademicProjectDTO.Order.ByAlertDate.ascending());
									out.println("<h4 style='margin: 15px 0 0 0;font-size: 18px; font-style: normal;'>Academic Project</h4>");
										out.println("<div style='height: 280px; width: 840px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;'>");
											out.println("<table border='4' cellpadding='0' cellspacing='0' width='1024px'><thead><tr>");
											out.println("<th width='4%'><a href='#'>S.no</a></th>");
											out.println("<th width='13%'><a href='#'>Full Name</a></th>");
											out.println("<th width='10%'><a href='#'>Contact No</a></th>");
											out.println("<th width='11%'><a href='#'>Priject Mame</a></th>");
											out.println("<th width='10%'><a href='#'>Next Payment Date</a></th>");
											out.println("<th width='12%'><a href='#'>Delevery Date</a></th>");
											out.println("<th width='8%'><a href='#'>Payable Amt</a></th>");
											out.println("<th width='8%'><a href='#'>Due Amt</a></th>");
											out.println("<th width='12%'><a href='#'>Reference Name</a></th>");
											out.println("<th width='12%'><a href='#'>Councillor</a></th>");
										out.println("</tr></thead></table>");
										int sno=0;
										int privioutotal=count;
										for(AcademicProjectDTO academicProjectDTO:academicProjectDTOs){
											NewAcademicProjectEnquiryDTO enquiryDTO = academicProjectDTO.getDto();
											int dueAmount=paymentService.getDueAmount(academicProjectDTO.getProject_id());
											String maindivid="maindiv"+count;
											String subdivid="subdiv"+count;
											out.println("<div id='"+maindivid+"'>");
											sno++;
											out.println("<input type='hidden' name='h_fullname' id='h_id_fullname"+count+"' value='"+enquiryDTO.getAcademic_project_enquiry_fullname()+"'/>");
											out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+count+")' onmouseup='createDiv("+count+","+(academicProjectDTOs.size()+privioutotal)+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
												out.println("<td width='4%'>"+sno+"</td>");
												out.println("<td width='13%'>"+enquiryDTO.getAcademic_project_enquiry_fullname()+"</td>");
												out.println("<td width='10%'>"+enquiryDTO.getAcademic_project_enquiry_contact_no()+"</td>");
												out.println("<td width='11%'>"+academicProjectDTO.getProject_name()+"</td>");
												out.println("<td width='10%'>"+academicProjectDTO.getAlertDate()+"</td>");
												out.println("<td width='12%'>"+academicProjectDTO.getDelivery_date()+"</td>");
												out.println("<td width='8%'>"+academicProjectDTO.getProject_cost()+"</td>");
												if(dueAmount>0){
													out.println("<td width='8%'>"+dueAmount+"</td>");
												}else{
													out.println("<td width='8%'>No Due</td>");
												}
												out.println("<td width='12%'>puran</td>");
												String reg_emp_id=academicProjectDTO.getEmploye_id();
												String dis_reg_emp_id=reg_emp_id.substring((reg_emp_id.indexOf(branchId)+branchId.length()),reg_emp_id.length());
												out.println("<td width='12%'>"+dis_reg_emp_id	+"</td>");
											out.println("</tr></table>");
											out.println("<div id='"+count+"' style='display:none' >");
											out.println("<form action='#savepayment.jsp' id='makePaymentForm_"+count+"' method='post'>");
											out.println("<table border='1' width='850px' style='margin-left:50px; padding:3px'>");									
											out.println("<tr bgcolor='#aa1122'><td align='center' width='10%'><b>S.no</b></td><td align='center' width='15'><b>Amount</b></td><td align='center' width='10'><b>Mode</b></td><td align='center' width='20%'><b>Payment Date</b></td><td align='center' width='23%'><b>Received By</b></td><td align='center' width='12%'><b>Status</b></td><td align='center' width='12%'><b>Approved By</b></td><td align='center' width='10%'><b>Operation</b></td></tr>");
											Payment pay=new Payment();
											pay.setMyid(academicProjectDTO.getProject_id());																								
											List <Payment>paymentDetailList=paymentService.getAllPaymentDetailById(pay,(String)request.getSession(false).getAttribute("BRANCHID"));
											int pdCount=0;
												for(Payment payment:paymentDetailList){
													pdCount++;
													out.println("<tr bgcolor='#330066'>");
												    String fdate=new SimpleDateFormat("dd/MM/yyyy").format(new Date());
												    
													out.println("<input type='hidden' value='"+payment.getPayment_id()+"' id='previous_paymentid"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getPayment_date()+"' id='previous_paymentdate"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+fdate+"' id='previous_paymenttime"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getMyid()+"' id='previous_myid"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getSource()+"' id='previous_source"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+academicProjectDTO.getProject_name()+"' id='previous_cdetail"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getPayment_mode()+"' id='previous_id_payment_mode"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+enquiryDTO.getAcademic_project_enquiry_fullname()+"' id='previous_id_candidateName"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+employeeService.getEmployeeDetailByEmployeeId(new Employee(payment.getReceived_by())).getFull_name()+"' id='previous_id_receiverName"+(count+"_"+pdCount)+"'>");
													out.println("<input type='hidden' value='"+payment.getAmount()+"' id='previous_my_id_amount"+(count+"_"+pdCount)+"'>");
													
													out.println("<td width='10%'>");
														out.println(pdCount);													
													out.println("</td>");
													out.println("<td width='15%'>");
														out.println(payment.getAmount());														
													out.println("</td>");
													out.println("<td width='10%'>");
														out.println(payment.getPayment_mode());														
													out.println("</td>");
													out.println("<td width='20%'>");
														out.println(payment.getPayment_date());														
													out.println("</td>");													
													out.println("<td width='23%'>");
														out.println(payment.getReceived_by_name());														
													out.println("</td>");
													out.println("<td width='12%' align='center' id='p_approve_id_"+(count+""+pdCount)+"'>");
														out.println(payment.getPayment_status());	
													out.println("</td>");
													out.println("<td width='12%' align='center'>");															
														out.println(payment.getApproved_by_name());															
													out.println("</td>");
													out.println("<td width='10%' align='center'>");
														out.println("<a href='#' onclick='printPreviousSlip(\""+(count+"_"+pdCount)+"\");'>Print</a>");														
													out.println("</td>");
													out.println("</tr>");
												}
												out.println("</table>");
												if(dueAmount>0){
												out.println("<table border='1' width='850px' style='margin-left:50px; padding:3px'>");
													out.println("<tr bgcolor='#999999'>");
													out.println("<td  bgcolor='#333333' width='675'>");
														out.println("<div style='float: left;'>");
														out.println("Mode: <select name='payment_mode' id='id_payment_mode"+count+"' onchange='checkfordisablity("+count+");'>");
											            	out.println("<option value='Select'>Select</option>");
											            	out.println("<option value='Cash'>Cash</option>");
											            	out.println("<option value='Cheque'>Cheque</option>");
											            	out.println("<option value='Draft'>Draft</option>");
											            	out.println("<option value='Online Transfer'>Online Transfer</option>");
											            out.println("</select>");
											            out.println("<input type='text' name='transfer_code_msg' id='id_transfer_code_msg"+count+"' size='8' value='Detail : ' disabled='disabled' style='border: 0px solid; background-color:#333333; color:#FFFFFF;'>");
											            out.println("<input type='text' name='transfer_code' id='id_transfer_code"+count+"' size='5'>");
											            out.println("Bank : <input type='text' name='transfer_bank_name' id='id_transfer_bank_name"+count+"' size='5'>");
											            Date pdate=new Date();
											            String fdate=new SimpleDateFormat("dd/MM/yyyy").format(pdate);
											            String ftime=new SimpleDateFormat("hh:mm:ss").format(pdate);
											            out.println("<input type='hidden' name='contactNo' value='"+enquiryDTO.getAcademic_project_enquiry_contact_no()+"'/>");
											            out.println("<input type='hidden' value='"+dueAmount+"' id='id_dueAmount"+count+"'/>");
											            out.println("<input type='hidden' name='paymentdate' value='"+fdate+"' id='paymentdate"+count+"' size='30'/>");
											            out.println("<input type='hidden' name='cdetail' value='"+academicProjectDTO.getProject_name()+"' id='cdetail"+count+"' size='30'/>");
											            out.println("<input type='hidden' name='paymenttime' value='"+ftime+"' id='paymenttime"+count+"' size='30'/>");
											            out.println("<input type='hidden' name='source' value='Academic Project' id='source"+count+"' size='30'/>");
														out.println("<input type='hidden' name='candidateName' id='id_candidateName"+count+"' value='"+enquiryDTO.getAcademic_project_enquiry_fullname()+"' size='30'/>");
														out.println("<input type='hidden' name='receiverName' id='id_receiverName"+count+"' value='"+(String)request.getSession(false).getAttribute("USERFULLNAME")+"' size='30'/>");
														out.println("<input type='hidden' name='myid' value='"+academicProjectDTO.getProject_id()+"' id='myid"+count+"' size='30'/>");
														out.println("Amount : <input type='text' name='amount' id='my_id_amount"+count+"' value='' size='5' />");
														out.println("<input type='hidden' value='"+searchResultListForPayment.size()+"' id='maxvalue"+count+"'/>");
													
														out.println("Manager : <select name='paymentSubmittedToId' id='id_manager_id"+count+"' style='width:110px;'>");
														out.println("<option value='Select'>Select</option>");
														for(Employee emp : managerList){
															out.println("<option value='"+emp.getEmployee_id()+"'>"+emp.getFull_name()+"</option>");
										            	}
										            	out.println("</select>");
														
														out.println("</td>");
													out.println("<td bgcolor='#333333' width='175'>");	
													out.println("<input type='button' onclick='closeRemark("+(academicProjectDTOs.size()+privioutotal)+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(../images/templatemo_btn.png) no-repeat;'/>");
													out.println("<input onclick='makePaymentBtn(\""+count+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(../images/templatemo_btn.png) no-repeat;'/>");
													out.println("</div>");
													out.println("</td>");
												out.println("</tr>");												
												out.println("</table>");	
												}
											out.println("</form>");	
											if(dueAmount>0){
												out.println("<div id='id_div_payment_remark_"+count+"'>");
												out.println("</div>");
												out.println("<input type='button' value='+ Add Remark' id='"+count+"' class='payment_remark_dialog_show_button'/>");
											}
												out.println("</div>");								
											out.println("</div>");
											count++;
																		
										}
									out.println("</div>");
								
						}
						%>
						
						
						<%
								List <Payment>payments=paymentController.getAllNotApproveInfo(request);
							%>
						<h4 style="font-size: 18px; font-style: normal;">Approval</h4>
						<div
							style="height: 280px; width: 840px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;">
							<table border="4" cellpadding="0" cellspacing="0" width="1024px">
								<thead>
									<tr>
										<th width="%"><a href="#">S.no</a></th>										
										<th width="%"><a href="#">Candidate Name</a></th>
										<th width="%"><a href="#">Amount</a></th>
										<th width="%"><a href="#">Payment Mode</a></th>
										<th width="%"><a href="#">Received By</a></th>
										<th width="%"><a href="#">Submitted to</a></th>
										<th width="%"><a href="#">Payment Date</a></th>	
										<th width="%"><a href="#">Source</a></th>										
										<th width="%"><a href="#">Status</a></th>
										<th width="%"><a href="#">Payment Id</a></th>
										
									</tr>
								</thead>
								<%
									 count=0;
									for(Payment payment : payments){
								%>
									<tr bgcolor="#333333"
										onmousedown="showFeedBackAndEnquiryDetail('count')"
										onmouseup="createDiv('+count+','+searchResultListForPayment.size()+')"
										onmouseover="this.style.backgroundColor='#666666';"
										onmouseout="this.style.backgroundColor='#333333';">
										<td width='%'><%=count+1 %></td>										
										<td width='%'><%=payment.getCandidateName() %></td>
										<td width='%'><%=payment.getAmount() %></td>
										<td width='%'><%=payment.getPayment_mode() %></td>
										<td width='%'><%=payment.getReceiverName() %></td>
										<td width='%'><%=payment.getPaymentSubmittedToName()%></td>
										<td width='%'><%=payment.getPayment_date() %></td>
										<td width='%'><%=payment.getSource() %></td>
										<td width='%'><%=payment.getPayment_status() %></td>
										<td width='%'><%=payment.getPayment_id() %></td>									
									</tr>
									<% 
										count++;
									}
									%>
								</table>							
						</div>
						
						
						</br>
						
						
						<% }%>
					</div>
					
					<div class="cleaner"></div>
				</div>
				<div class="cleaner"></div>
			</div>

			<div id="templatemo_content_wrapper_bottm"></div>

			<div id="templatemo_footer">

				Copyright © 2013 <a href="http://www.jsinformatics.com">J S
					Informatics</a> | Designed by <a href="" target="_parent">Prashanna
					Gupta</a>

			</div>

		</div>
		<!-- end of wrapper -->
	</div>
	<!-- end of wrapper_outer -->

</body>
</html>