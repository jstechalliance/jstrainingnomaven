<%@page import="com.js.service.impl.EnquiryServiceImpl"%>
<%@page import="com.js.service.impl.CollegeServiceImpl"%>
<%@page import="com.js.service.impl.CourseServiceImpl"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.service.CourseService"%>
<%@page import="com.js.service.CollegeService"%>
<%@page import="com.js.service.EnquiryService"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@page import="java.util.*"%>
<%@page import="com.js.dto.*"%>
<%@page import="com.js.msg.*"%>
<%@include file="managerheader.jsp"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="../resources/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/jquery.ennui.contentslider.css" rel="stylesheet"
	type="text/css" media="screen,projection" />
<script type="text/javascript" src="../resources/js/enquiry.js"></script>
<script type="text/javascript" src="../resources/js/datepickr.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="../resources/js/searchinq.js"></script>
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


<script type="text/javascript" src="../js/datepickr.js"></script>



<br />

<%

	CourseService courseService=JSIBeanFactory.getBean(CourseServiceImpl.class);
	CollegeService collegeService=JSIBeanFactory.getBean(CollegeServiceImpl.class);
	EnquiryService enquiryService=JSIBeanFactory.getBean(EnquiryServiceImpl.class);
	EnquiryController enquiryController = JSIBeanFactory.getBean(EnquiryController.class);
	
	List <Course>allCourseList=courseService.getAllCourse((String)request.getSession(false).getAttribute("BRANCHID"));
        	List <Course>cList=courseService.getAllEnquiredCourse((String)request.getSession(false).getAttribute("BRANCHID"));
        	List <College>collegeList=collegeService.getAllEnquiryedCollege((String)request.getSession(false).getAttribute("BRANCHID"));
        	List <College>allCollegeList=collegeService.getAllCollege();
        	List <String>qualificationList=enquiryService.getAllEnquiredQualification((String)request.getSession(false).getAttribute("BRANCHID"));
        	List <String>statusList=enquiryService.getAllEnquiredStatus((String)request.getSession(false).getAttribute("BRANCHID"));
%>
<div id="templatemo_content_wrapper">
	<div id="content">
		<div class="latestEvent">

			<form name="myForm" action="searchenquiry.jsp" method="post"
				onsubmit="return mySearchFormValidation();" id="myForm">
				<table>
					<td width="20%"
						style="border: none; color: white; font-size: 18px;"><strong>Enquiry
							For :</strong></td>
					<td width="80%" style="border: none;"><select
						name="search_purpose" id="id_serch_purpose"
						onchange="showSearchForm(this)">
							<option value='Training'>Training</option>
							<option value='Academic Project' selected='selected'>Academic
								Project</option>
							<option value='Visitor'>Visitor</option>
<!-- 							<option value='Live Project'>Live Project</option> -->
<!-- 							<option value='Certificate'>Certificate</option> -->
<!-- 							<option value='Experience'>Experience</option> -->
					</select></td>
				</table>
				</br>
				<table width="100%" border="1" align="left">
					<tr>
						<td width="14%" style="border: none;"><B
							style="font-size: 18px; color: #59aaff;">Search</B></td>
						<td width="19%" style="border: none;"></td>

						<td width="30%" style="border: none;"></td>
						<td width="12%" style="border: none;" align="right">Time :</td>
						<td width="18%" style="border: none;"><input type="text"
							id="id_search_enquiry_common_start_time"
							name="search_enquiry_common_start_time" size="5" /> <script>
								$(function() {
									$('#id_search_enquiry_common_start_time')
											.timepicker({
												'timeFormat' : 'H:i:s'
											});
								});
							</script> <b>-</b> <input type="text"
							id="id_search_enquiry_common_end_time"
							name="search_enquiry_common_end_time" size="5" /> <script>
								$(function() {
									$('#id_search_enquiry_common_end_time')
											.timepicker({
												'timeFormat' : 'H:i:s'
											});
								});
							</script></td>
					</tr>
					<table width="100%" border="1" align="left"
						id="search_academic_project_enquiry">
						<tr>
							<td width="14%">Full Name :</td>
							<td width="18%"><input type="text"
								name="search_academic_project_enquiry_fullname"
								id="id_search_academic_project_enquiry_fullname"
								style="width: 140px;" /></td>
							<td width="14%">Contact No :</td>
							<td width="18%"><input type="text"
								name="search_academic_project_enquiry_contactno"
								id="id_search_academic_project_enquiry_contactno"
								style="width: 140px;" /></td>
							<td width="13%">Enquiry Date :</td>
							
							<td width="18%"><input type="text"
								name="search_academic_project_enquiry_start_date"
								id="id_search_academic_project_enquiry_start_date" size="5" />
								<b>-</b>&nbsp;<input type="text"
								name="search_academic_project_enquiry_end_date"
								id="id_search_academic_project_enquiry_end_date" size="5" /> <script
									type="text/javascript">
									new datepickr(
											'id_search_academic_project_enquiry_start_date',
											{
												'dateFormat' : 'm/d/y'
											});
								</script> <script type="text/javascript">
									new datepickr(
											'id_search_academic_project_enquiry_end_date',
											{
												'dateFormat' : 'm/d/y'
											});
								</script></td>
						</tr>
						<tr>
							<td>Reference Name :</td>
							<td><input type="text"
								name="search_academic_project_enquiry_reference_name"
								id="id_search_academic_project_enquiry_reference_name"
								style="width: 140px;" /></td>
							<td>Ref-Contact No :</td>
							<td><input type="text"
								name="search_academic_project_enquiry_reference_no"
								id="id_search_academic_project_enquiry_reference_no"
								style="width: 140px;" /></td>
							<td>Address :</td>
							<td><input type="text"
								name="search_academic_project_enquiry_address"
								id="id_search_academic_project_enquiry_reference_no"
								style="width: 140px;" /></td>
						</tr>
						<tr>
							<td>Qualification :</td>
							<td><select
								name="search_academic_project_enquiry_qualification"
								id="id_search_academic_project_enquiry_qualification">
									<option value="Select">Select</option>
									<%
										for(String qualification:qualificationList){
																		out.println("<option value='"+qualification+"'>"+qualification+"</option>");		
																	}
									%>
							</select></td>
							<td>College :</td>
							<td><select name="search_academic_project_enquiry_college"
								id="id_search_academic_project_enquiry_college"
								style="width: 140px;">
									<option value="Select">Select</option>
									<%
										for(College c:collegeList){
																		out.println("<option value='"+c.getCollegeCode()+"'>"+c.getCollegeName()+"</option>");		
																	}
									%>
							</select></td>
							<td>Semester :</td>
							<td><select name="search_academic_project_enquiry_semester"
								id="id_search_academic_project_enquiry_semester">
									<option value="Select">Select</option>
									<option value="First">First</option>
									<option value="Second">Second</option>
									<option value="Third">Third</option>
									<option value="Four">Four</option>
									<option value="Five">Five</option>
									<option value="Six">Six</option>
									<option value="Seven">Seven</option>
									<option value="Eight">Eight</option>
									<option value="Pass Out">Pass Out</option>
									<option value="Not Applicable">Not Applicable</option>
							</select></td>
						</tr>
						<tr>
							<td>Proect Title :</td>
							<td><input type="text"
								name="search_academic_project_enquiry_project_title"
								id="id_search_academic_project_enquiry_project_title"
								style="width: 140px;" /></td>
							<td>Date Of Delivery :</td>
							<td><input type="text"
								name="search_academic_project_enquiry_delivery_start_date"
								id="id_search_academic_project_enquiry_delivery_start_date"
								size="5" /> <b>-</b>&nbsp;<input type="text"
								name="search_academic_project_enquiry_delivery_end_date"
								id="id_search_academic_project_enquiry_delivery_end_date"
								size="5" /> <script type="text/javascript">
									new datepickr(
											'id_search_academic_project_enquiry_delivery_start_date',
											{
												'dateFormat' : 'm/d/y'
											});
								</script> <script type="text/javascript">
									new datepickr(
											'id_search_academic_project_enquiry_delivery_end_date',
											{
												'dateFormat' : 'm/d/y'
											});
								</script></td>
							<td>Status :</td>
							<td><select name="search_academic_project_enquiry_status"
								id="id_search_academic_project_enquiry_status">
									<option value="Select">Select</option>
									<%
										for(String status:statusList){
																		out.println("<option value='"+status+"'>"+status+"</option>");		
																	}
									%>
							</select></td>
						</tr>
						<tr>
							<td>Meeting Date :</td>
							<td><input type="text"
								name="search_academic_project_enquiry_meeting_start_date"
								id="id_search_academic_project_enquiry_meeting_start_date"
								size="5" /> <b>-</b>&nbsp;<input type="text"
								name="search_academic_project_enquiry_meeting_end_date"
								id="id_search_academic_project_enquiry_meeting_end_date"
								size="5" /> <script type="text/javascript">
									new datepickr(
											'id_search_academic_project_enquiry_meeting_start_date',
											{
												'dateFormat' : 'm/d/y'
											});
								</script> <script type="text/javascript">
									new datepickr(
											'id_search_academic_project_enquiry_meeting_end_date',
											{
												'dateFormat' : 'm/d/y'
											});
								</script></td>
							<td>Meeting Time :</td>
							<td><input type="text"
								id="id_search_academic_project_enquiry_meeting_start_time"
								name="search_academic_project_enquiry_meeting_start_time"
								size="5" /> <script>
									$(function() {
										$(
												'#id_search_academic_project_enquiry_meeting_start_time')
												.timepicker({
													'timeFormat' : 'H:i:s'
												});
									});
								</script> <b>-</b> <input type="text"
								id="id_search_academic_project_enquiry_meeting_end_time"
								name="search_academic_project_enquiry_meeting_start_time"
								size="5" /> <script>
									$(function() {
										$(
												'#id_search_academic_project_enquiry_meeting_end_time')
												.timepicker({
													'timeFormat' : 'H:i:s'
												});
									});
								</script></td>
							<td>Meeting With :</td>
							<td><input type="text"
								name="search_academic_project_enquiry_meeting_with"
								id="id_search_academic_project_enquiry_meeting_with"
								style="width: 140px;" /></td>
						</tr>
					</table>

					<input type="submit" value="Search"
						style="float: right; display: block; width: 100px; height: 25px; margin: 2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;" />
					</form>

					</div>
					<div class="hr_divider_enquiry"></div>
					<%
						//List <NewTrainingEnquiryDTO>enquiryList =(List <NewTrainingEnquiryDTO>)request.getAttribute("TRAININGENQUIRYSEARCHRESULT");
					%>
					<script type="text/javascript" language="javascript">
						function changeColor(count) {
							var mytr = document.getElementById("tr" + count);
							mytr.style = '{color:#aabbcc;}';
						}

						function abc(count) {
							//document.getElementById("id_alertdate_"+count).value="Test";
							//new datepickr("'id_alertdate_"+count+"'", {
							//	'dateFormat': 'm/d/y'
							//});
							//alert(val);
						}
						function closeRemark(max) {
							for (var i = 1; i <= max; i++) {
								if ($("#" + i).is(":visible")) {
									$("#" + i).hide();
								}
							}
						}
						function showFeedBackAndEnquiryDetail(count) {

							document.getElementById("id_enquiry_purpose").disabled = false;

							document
									.getElementById("id_academic_project_enquiry_enquiry_id").value = document
									.getElementById("h_id_academic_enquiryid"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_fullname").value = document
									.getElementById("h_id_academic_fullname"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_father_name").value = document
									.getElementById("h_id_academic_father_name"
											+ count).value;

							document
									.getElementById("id_academic_project_enquiry_project_name").value = document
									.getElementById("h_id_academic_project_name"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_description").value = document
									.getElementById("h_id_academic_description"
											+ count).value;

							var desiredValue = document
									.getElementById("h_id_academic_qualification"
											+ count).value;
							var el = document
									.getElementById("id_academic_project_enquiry_college");
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
									.getElementById("h_id_academic_college"
											+ count).value;
							var el1 = document
									.getElementById("id_academic_project_enquiry_college");
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
									.getElementById("h_id_academic_semester"
											+ count).value;
							var el2 = document
									.getElementById("id_academic_project_enquiry_semester");
							for (var i = 0; i < el2.options.length; i++) {
								if (el2.options[i].text == desiredValue2) {
									el2.selectedIndex = i;
									break;
								}
							}

							var mydiv = document
									.getElementById('id_enquirymsg');
							mydiv.innerHTML = '<h4>Basic Detail</h4>';

							var enquirypurpose = document
									.getElementById("h_id_academic_purpose"
											+ count).value;
							var eeee = document
									.getElementById("id_enquiry_purpose");
							var iiii = 0;
							for (var i = 0; i < eeee.options.length; i++) {
								if (eeee.options[i].text == enquirypurpose) {
									eeee.selectedIndex = i;
									iiii = 1;
									break;
								}
							}
							showEnquiryForm(eeee);

							document
									.getElementById(
											'id_academic_project_enquiry_enquiry_status')
									.removeAttribute('disabled');
							var desiredValue5 = document
									.getElementById("h_id_academic_status"
											+ count).value;
							var el5 = document
									.getElementById("id_academic_project_enquiry_enquiry_status");
							for (var i = 0; i < el5.options.length; i++) {
								if (el5.options[i].text == desiredValue5) {
									el5.selectedIndex = i;
									break;
								}
							}

							document
									.getElementById("id_academic_project_enquiry_contact_no").value = document
									.getElementById("h_id_academic_contact_no"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_email_id").value = document
									.getElementById("h_id_academic_email_id"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_delivery_date").value = document
									.getElementById("h_id_academic_enquiry_delivery_date"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_reference_name").value = document
									.getElementById("h_id_academic_reference_name"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_reference_contact_no").value = document
									.getElementById("h_id_academic_reference_contact_no"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_reference_note").value = document
									.getElementById("h_id_academic_reference_note"
											+ count).value;
							document
									.getElementById("id_academic_project_enquiry_referenceId").value = document
									.getElementById("h_id_academic_reference_id"
											+ count).value;

							document.getElementById("savenewenquiryBtn").value = "Update";
							document.getElementById("clearnewenquiryBtn").disabled = true;
							document.getElementById("id_enquiry_purpose").disabled = true;
							document.getElementById("id_enquiry_purpose").value = "Academic Project";
							showEnquiryForm(document
									.getElementById("id_enquiry_purpose"));

						}
						function createDiv(item, max) {

							for (var i = 1; i <= max; i++) {
								if ($("#academic_project_remark_div" + i).is(
										":visible")) {
									$("#academic_project_remark_div" + i)
											.hide();
								}
							}
							$("#academic_project_remark_div" + item).show();

						}
					</script>


					<div class="leftContent">

						<%
							List <NewAcademicProjectEnquiryDTO>academicProjectEnquiryList =(List <NewAcademicProjectEnquiryDTO>)request.getAttribute("ACADEMICENQUIRYSEARCHRESULT");;
										
						                		if(academicProjectEnquiryList==null){							List <List<NewAcademicProjectEnquiryDTO>>allAcademicProjectEnquiryList=enquiryController.getAllAcademicProjectFollowUp(request);
						                		academicProjectEnquiryList =new ArrayList<NewAcademicProjectEnquiryDTO>();
						                			List <NewAcademicProjectEnquiryDTO>activeAcademicEnquiryList=allAcademicProjectEnquiryList.get(0);
						                			List <NewAcademicProjectEnquiryDTO>passiveAcademicEnquiryList=allAcademicProjectEnquiryList.get(1);
						                			
						                			academicProjectEnquiryList=activeAcademicEnquiryList;
						%>

						<h4 style="font-size: 18px; font-style: normal; float: left;">Today's
							Follow Up</h4>

						<h4 style="font-size: 18px; font-style: normal; float: right;">Active
							List</h4>

						<div id="academic_enquiry_active_list_div"
							style="height: 310px; width: 520px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;">
							<table border="4" cellpadding="0" cellspacing="0" width="1024px">
								<thead>
									<tr>
										<th width="4%"><a href="#">S.no</a></th>
										<th width="13%"><a href="#">Full Name</a></th>
										<th width="11%"><a href="#">Contact No</a></th>
										<th width="11%"><a href="#">Project Name</a></th>
										<th width="12%"><a href="#">Date Of Delivery</a></th>
										<th width="11%"><a href="#">Enquiry Date</a></th>
										<th width="12%"><a href="#">Reference Name</a></th>
										<th width="12%"><a href="#">Councillor</a></th>
									</tr>
								</thead>
							</table>

							<%
								int apecount=1;
													int apemycount=0;
													int apemysno=0;
													for(apemycount=0;apemycount<academicProjectEnquiryList.size();apemycount++){
														apemysno++;
														//NewEnquiry newEnquiry=enquiryList.get(mycount);
														NewAcademicProjectEnquiryDTO newEnquiry=academicProjectEnquiryList.get(apemycount);
														String maindivid="maindiv"+apecount;
														String subdivid="subdiv"+apecount;
														out.println("<div id='"+maindivid+"'>");
														
														
														
														out.println("<input type='hidden' name='h_academic_purpose' id='h_id_academic_purpose"+apecount+"' value='"+newEnquiry.getEnquiry_purpose()+"'/>");
														
														out.println("<input type='hidden' name='h_academic_enquiry_delivery_date' id='h_id_academic_enquiry_delivery_date"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"'/>");
														out.println("<input type='hidden' name='h_academic_enquiryid' id='h_id_academic_enquiryid"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_id()+"'/>");
														out.println("<input type='hidden' name='h_academic_fullname' id='h_id_academic_fullname"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_fullname()+"'/>");
														out.println("<input type='hidden' name='h_academic_father_name' id='h_id_academic_father_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_father_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_qualification' id='h_id_academic_qualification"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_qualification()+"'/>");
														out.println("<input type='hidden' name='h_academic_college' id='h_id_academic_college"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_college()+"'/>");
														out.println("<input type='hidden' name='h_academic_semester' id='h_id_academic_semester"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_semester()+"'/>");
														out.println("<input type='hidden' name='h_academic_contact_no' id='h_id_academic_contact_no"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_academic_email_id' id='h_id_academic_email_id"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_email_id()+"'/>");
														
														out.println("<input type='hidden' name='h_academic_project_name' id='h_id_academic_project_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_project_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_description' id='h_id_academic_description"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_description()+"'/>");
														
														/*String course_val="";
														for(int i=0;i<newEnquiry.getTraining_enquiry_course().length;i++){
															course_val=course_val+newEnquiry.getTraining_enquiry_course()[i]+",";
														}
														out.println("<input type='hidden' name='h_academic_course' id='h_id_academic_course"+apecount+"' value='"+course_val+"'/>");
														*/
														out.println("<input type='hidden' name='h_academic_joining_date' id='h_id_academic_joining_date"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_id' id='h_id_academic_reference_id"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_referenceId()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_name' id='h_id_academic_reference_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_contact_no' id='h_id_academic_reference_contact_no"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_note' id='h_id_academic_reference_note"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_note()+"'/>");
														out.println("<input type='hidden' name='h_academic_status' id='h_id_academic_status"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_status()+"'/>");
														//System.out.println("Pref Start : "+newEnquiry.getPreferredtime_start());
														//System.out.println("Pref End : "+newEnquiry.getPreferredtime_end());
														
														out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+apecount+")' onmouseup='createDiv("+apecount+","+(activeAcademicEnquiryList.size()+passiveAcademicEnquiryList.size())+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
														out.println("<td width='4%'>"+apemysno+"</td>");
														out.println("<td width='13%'>"+newEnquiry.getAcademic_project_enquiry_fullname()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_contact_no()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_project_name()+"</td>");
														
														out.println("<td width='12%'>"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_date()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getAcademic_project_enquiry_reference_name()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getEmployee_id()+"</td>");
														out.println("</tr></table>");
														//out.println("<div id='"+subdivid+"'>");
														
														out.println("<div id='academic_project_remark_div"+apecount+"' style='display:none' >");
															out.println("<form action='#saveremarkAcademic.jsp' id='subFormAPR_"+apecount+"' method='post'>");
																out.println("<table border='1' width='1070px' style='margin-left:50px; padding:3px'>");									
																	out.println("<tr bgcolor='#aa1122'><td align='center'><b>Remark</b></td><td align='center'><b>Remarked Date</b></td><td align='center'><b>Next meeting date</b></td><td align='center'><b>Meeting time start</b></td><td align='center'><b>Meeting time end</b></td><td align='center'><b>Councillor</b></td></tr>");
																	//List <EnquiryRemark>remarkList=enquiryService.getAllRemarkForAnEnquiry(newEnquiry);
																	List <AcademicProjectRemark>remarkList=enquiryService.getAllRemarkForAnAcademicProjectEnquiry(newEnquiry);
																	for(AcademicProjectRemark enquiryRemark:remarkList){
																		
																	out.println("<tr bgcolor='#330066'>");
																		out.println("<td width='32%'>");
																			out.println(enquiryRemark.getRemark());
																			//out.println("<input name='name' type='text' value='"+count+"'/>");
																		out.println("</td>");
																		out.println("<td width='9%'>");
																			out.println(enquiryRemark.getRemark_date());
																			//out.println("<input name='' type='text' value='' />");
																			out.println("</td>");
																		out.println("<td width='12%'>");
																			out.println(enquiryRemark.getNext_meeting_date());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																		out.println("<td width='9%'>");
																			out.println(enquiryRemark.getNext_meeting_time_start());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																		out.println("<td width='9%'>");
																			out.println(enquiryRemark.getNext_meeting_time_end());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																		out.println("<td width='14%'>");
																			out.println(enquiryRemark.getCouncillor());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																	out.println("</tr>");
																	}
																	out.println("<tr bgcolor='#999999'>");
																		out.println("<td width='32%'>");
																			out.println("<input type='hidden' name='enquiryid' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_id()+"' size='52'/>");
																			out.println("<input type='hidden' name='project_id' value='"+newEnquiry.getAcademic_project_enquiry_project_id()+"' size='52'/>");
																			
																			out.println("<input type='text' name='remark' id='id_remark"+apecount+"' value='' size='52'/>");
																		out.println("</td>");
																		out.println("<td width='9%'>");														
																		Date date=new Date();
																		String c_date=(1900+date.getYear())+"-"+(1+date.getMonth())+"-"+date.getDate();
																			out.println("<input type='text' name='remark_date' value='"+c_date+"' size='10' readonly='readonly'/>");
																		out.println("</td>");
																		
																		out.println("<td width='12%'>");
																			out.println("<input type='date' name='next_meeting_date' id='id_next_meeting_date"+apecount+"' size='25'/>");
																			out.println("<script type=\"text/javascript\">");
																				out.println("new datepickr('id_academic_project_remark_nextmeeting_date"+apecount+"',{");
																					out.println("'dateFormat': 'm/d/y'");
																				out.println("});");			
																			out.println("</script>");
																		out.println("</td>");
																		
																		out.println("<td width='9%'>");
																			out.println("<input type='text' name='next_meeting_time_start' id='id_next_meeting_time_start"+apecount+"' size='10'/>");
																			out.println("<script type=\"text/javascript\">");
																				out.println("$(function() {");
																					out.println("$('#id_next_meeting_time_start"+apecount+"').timepicker({ 'timeFormat': 'H:i:s' });");
																				out.println("});");			
																			out.println("</script>");
																		out.println("</td>");
																		out.println("<td width='9%'>");
																			out.println("<input type='text' name='next_meeting_time_end' id='id_next_meeting_time_end"+apecount+"' size='10'/>");
																			out.println("<script type='text/javascript'>");
																				out.println("$(function() {");
																					out.println("$('#id_next_meeting_time_end"+apecount+"').timepicker({ 'timeFormat': 'H:i:s' });");
																				out.println("});");			
																			out.println("</script>");																			
																		out.println("</td>");
																		
																		out.println("<td width='14%' bgcolor='#333333'>");
																			out.println("<input type='hidden' value='"+academicProjectEnquiryList.size()+"' id='maxvalue"+apecount+"'/>");
																			out.println("<input type='button' onclick='closeRemark("+(activeAcademicEnquiryList.size()+passiveAcademicEnquiryList.size())+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");
																			out.println("<input onclick='subSubmitBtnAPR(\""+apecount+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");														
																		out.println("</td>");
																	out.println("</tr>");												
																out.println("</table>");											
															out.println("</form>");									
													 	out.println("</div>");	
														
														//out.println("</div>");
														out.println("</div>");
														apecount++;
													}
							%>

						</div>


						<br />
						<h4 style="font-size: 18px; font-style: normal; float: left;">Today's
							Follow Up</h4>
						<h4 style="font-size: 18px; font-style: normal; float: right;">Passive
							List</h4>

						<div id="academic_enquiry_passive_list_div"
							style="height: 310px; width: 520px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;">
							<table border="4" cellpadding="0" cellspacing="0" width="1024px">
								<thead>
									<tr>
										<th width="4%"><a href="#">S.no</a></th>
										<th width="13%"><a href="#">Full Name</a></th>
										<th width="11%"><a href="#">Contact No</a></th>
										<th width="11%"><a href="#">Project Name</a></th>
										<th width="12%"><a href="#">Date Of Delivery</a></th>
										<th width="11%"><a href="#">Enquiry Date</a></th>
										<th width="12%"><a href="#">Reference Name</a></th>
										<th width="12%"><a href="#">Councillor</a></th>
									</tr>
								</thead>
							</table>

							<%
								//int apecount=1;
													//int apemycount=0;
													academicProjectEnquiryList=passiveAcademicEnquiryList;
													int apesno=0;
													for(apemycount=0;apemycount<academicProjectEnquiryList.size();apemycount++){
														apesno++;
														//NewEnquiry newEnquiry=enquiryList.get(mycount);
														NewAcademicProjectEnquiryDTO newEnquiry=academicProjectEnquiryList.get(apemycount);
														String maindivid="maindiv"+apecount;
														String subdivid="subdiv"+apecount;
														out.println("<div id='"+maindivid+"'>");
														
														out.println("<input type='hidden' name='h_academic_purpose' id='h_id_academic_purpose"+apecount+"' value='"+newEnquiry.getEnquiry_purpose()+"'/>");
														out.println("<input type='hidden' name='h_purpose' id='h_id_purpose"+apecount+"' value='"+newEnquiry.getEnquiry_purpose()+"'/>");

														out.println("<input type='hidden' name='h_academic_enquiry_delivery_date' id='h_id_academic_enquiry_delivery_date"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"'/>");

														out.println("<input type='hidden' name='h_academic_enquiryid' id='h_id_academic_enquiryid"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_id()+"'/>");
														out.println("<input type='hidden' name='h_academic_fullname' id='h_id_academic_fullname"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_fullname()+"'/>");
														out.println("<input type='hidden' name='h_academic_father_name' id='h_id_academic_father_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_father_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_qualification' id='h_id_academic_qualification"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_qualification()+"'/>");
														out.println("<input type='hidden' name='h_academic_college' id='h_id_academic_college"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_college()+"'/>");
														out.println("<input type='hidden' name='h_academic_semester' id='h_id_academic_semester"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_semester()+"'/>");
														out.println("<input type='hidden' name='h_academic_contact_no' id='h_id_academic_contact_no"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_academic_email_id' id='h_id_academic_email_id"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_email_id()+"'/>");
														
														out.println("<input type='hidden' name='h_academic_project_name' id='h_id_academic_project_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_project_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_description' id='h_id_academic_description"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_description()+"'/>");
														
														/*String course_val="";
														for(int i=0;i<newEnquiry.getTraining_enquiry_course().length;i++){
															course_val=course_val+newEnquiry.getTraining_enquiry_course()[i]+",";
														}
														out.println("<input type='hidden' name='h_academic_course' id='h_id_academic_course"+apecount+"' value='"+course_val+"'/>");
														*/
														out.println("<input type='hidden' name='h_academic_joining_date' id='h_id_academic_joining_date"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_id' id='h_id_academic_reference_id"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_referenceId()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_name' id='h_id_academic_reference_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_contact_no' id='h_id_academic_reference_contact_no"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_note' id='h_id_academic_reference_note"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_note()+"'/>");
														out.println("<input type='hidden' name='h_academic_status' id='h_id_academic_status"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_status()+"'/>");
														//System.out.println("Pref Start : "+newEnquiry.getPreferredtime_start());
														//System.out.println("Pref End : "+newEnquiry.getPreferredtime_end());
														
														out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+apecount+")' onmouseup='createDiv("+apecount+","+(activeAcademicEnquiryList.size()+passiveAcademicEnquiryList.size())+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
														out.println("<td width='4%'>"+apesno+"</td>");
														out.println("<td width='13%'>"+newEnquiry.getAcademic_project_enquiry_fullname()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_contact_no()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_project_name()+"</td>");
														
														out.println("<td width='12%'>"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_date()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getAcademic_project_enquiry_reference_name()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getEmployee_id()+"</td>");
														out.println("</tr></table>");
														//out.println("<div id='"+subdivid+"'>");
														
														out.println("<div id='academic_project_remark_div"+apecount+"' style='display:none' >");
														out.println("<form action='#saveremarkAcademic.jsp' id='subFormAPR_"+apecount+"' method='post'>");
															out.println("<table border='1' width='1070px' style='margin-left:50px; padding:3px'>");									
																out.println("<tr bgcolor='#aa1122'><td align='center'><b>Remark</b></td><td align='center'><b>Remarked Date</b></td><td align='center'><b>Next meeting date</b></td><td align='center'><b>Meeting time start</b></td><td align='center'><b>Meeting time end</b></td><td align='center'><b>Councillor</b></td></tr>");
																//List <EnquiryRemark>remarkList=enquiryService.getAllRemarkForAnEnquiry(newEnquiry);
																List <AcademicProjectRemark>remarkList=enquiryService.getAllRemarkForAnAcademicProjectEnquiry(newEnquiry);
																for(AcademicProjectRemark enquiryRemark:remarkList){
																	
																out.println("<tr bgcolor='#330066'>");
																	out.println("<td width='32%'>");
																		out.println(enquiryRemark.getRemark());
																		//out.println("<input name='name' type='text' value='"+count+"'/>");
																	out.println("</td>");
																	out.println("<td width='9%'>");
																		out.println(enquiryRemark.getRemark_date());
																		//out.println("<input name='' type='text' value='' />");
																		out.println("</td>");
																	out.println("<td width='12%'>");
																		out.println(enquiryRemark.getNext_meeting_date());
																		//out.println("<input type='submit' title='Update' />");
																	out.println("</td>");
																	out.println("<td width='9%'>");
																		out.println(enquiryRemark.getNext_meeting_time_start());
																		//out.println("<input type='submit' title='Update' />");
																	out.println("</td>");
																	out.println("<td width='9%'>");
																		out.println(enquiryRemark.getNext_meeting_time_end());
																		//out.println("<input type='submit' title='Update' />");
																	out.println("</td>");
																	out.println("<td width='14%'>");
																		out.println(enquiryRemark.getCouncillor());
																		//out.println("<input type='submit' title='Update' />");
																	out.println("</td>");
																out.println("</tr>");
																}
																out.println("<tr bgcolor='#999999'>");
																	out.println("<td width='32%'>");
																		out.println("<input type='hidden' name='enquiryid' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_id()+"' size='52'/>");
																		out.println("<input type='hidden' name='project_id' value='"+newEnquiry.getAcademic_project_enquiry_project_id()+"' size='52'/>");
																		
																		out.println("<input type='text' name='remark' id='id_remark"+apecount+"' value='' size='52'/>");
																	out.println("</td>");
																	out.println("<td width='9%'>");														
																	Date date=new Date();
																	String c_date=(1900+date.getYear())+"-"+(1+date.getMonth())+"-"+date.getDate();
																		out.println("<input type='text' name='remark_date' value='"+c_date+"' size='10' readonly='readonly'/>");
																	out.println("</td>");
																	
																	out.println("<td width='12%'>");
																		out.println("<input type='date' name='next_meeting_date' id='id_next_meeting_date"+apecount+"' size='25'/>");
																		out.println("<script type=\"text/javascript\">");
																			out.println("new datepickr('id_academic_project_remark_nextmeeting_date"+apecount+"',{");
																				out.println("'dateFormat': 'm/d/y'");
																			out.println("});");			
																		out.println("</script>");
																	out.println("</td>");
																	
																	out.println("<td width='9%'>");
																		out.println("<input type='text' name='next_meeting_time_start' id='id_next_meeting_time_start"+apecount+"' size='10'/>");
																		out.println("<script type=\"text/javascript\">");
																			out.println("$(function() {");
																				out.println("$('#id_next_meeting_time_start"+apecount+"').timepicker({ 'timeFormat': 'H:i:s' });");
																			out.println("});");			
																		out.println("</script>");
																	out.println("</td>");
																	out.println("<td width='9%'>");
																		out.println("<input type='text' name='next_meeting_time_end' id='id_next_meeting_time_end"+apecount+"' size='10'/>");
																		out.println("<script type=\"text/javascript\">");
																			out.println("$(function() {");
																				out.println("$('#id_next_meeting_time_end"+apecount+"').timepicker({ 'timeFormat': 'H:i:s' });");
																			out.println("});");
																		out.println("</script>");
																	out.println("</td>");
																	
																	out.println("<td width='14%' bgcolor='#333333'>");
																		out.println("<input type='hidden' value='"+academicProjectEnquiryList.size()+"' id='maxvalue"+apecount+"'/>");
																		out.println("<input type='button' onclick='closeRemark("+(activeAcademicEnquiryList.size()+passiveAcademicEnquiryList.size())+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");
																		out.println("<input onclick='subSubmitBtnAPR(\""+apecount+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");														
																	out.println("</td>");
																out.println("</tr>");												
															out.println("</table>");											
														out.println("</form>");									
												 	out.println("</div>");
													//out.println("</div>");
													out.println("</div>");
													apecount++;
												}
							%>

						</div>


						<%
							}
						                		else if(academicProjectEnquiryList!=null){
						%>
						<h4 style="font-size: 18px; font-style: normal;">Search
							Result</h4>
						<%
							if(academicProjectEnquiryList.size()>0){
						%>


						<div
							style="height: 670px; width: 520px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;">
							<table border="4" cellpadding="0" cellspacing="0" width="1024px">
								<thead>
									<tr>
										<th width="4%"><a href="#">S.no</a></th>
										<th width="13%"><a href="#">Full Name</a></th>
										<th width="11%"><a href="#">Contact No</a></th>
										<th width="11%"><a href="#">Course</a></th>
										<th width="12%"><a href="#">Date Of Joining</a></th>
										<th width="14%"><a href="#">Preferred Time</a></th>
										<th width="11%"><a href="#">Enquiry Date</a></th>
										<th width="12%"><a href="#">Reference Name</a></th>
										<th width="12%"><a href="#">Councillor</a></th>
									</tr>
								</thead>
							</table>
							<%
								int apecount=1;
													int apemycount=0;
													int apemysno=0;
													for(apemycount=0;apemycount<academicProjectEnquiryList.size();apemycount++){
														apemysno++;
														//NewEnquiry newEnquiry=enquiryList.get(mycount);
														NewAcademicProjectEnquiryDTO newEnquiry=academicProjectEnquiryList.get(apemycount);
														String maindivid="maindiv"+apecount;
														String subdivid="subdiv"+apecount;
														out.println("<div id='"+maindivid+"'>");
														
														
														
														out.println("<input type='hidden' name='h_academic_purpose' id='h_id_academic_purpose"+apecount+"' value='"+newEnquiry.getEnquiry_purpose()+"'/>");
														
														out.println("<input type='hidden' name='h_academic_enquiry_delivery_date' id='h_id_academic_enquiry_delivery_date"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"'/>");
														out.println("<input type='hidden' name='h_academic_enquiryid' id='h_id_academic_enquiryid"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_id()+"'/>");
														out.println("<input type='hidden' name='h_academic_fullname' id='h_id_academic_fullname"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_fullname()+"'/>");
														out.println("<input type='hidden' name='h_academic_father_name' id='h_id_academic_father_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_father_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_qualification' id='h_id_academic_qualification"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_qualification()+"'/>");
														out.println("<input type='hidden' name='h_academic_college' id='h_id_academic_college"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_college()+"'/>");
														out.println("<input type='hidden' name='h_academic_semester' id='h_id_academic_semester"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_semester()+"'/>");
														out.println("<input type='hidden' name='h_academic_contact_no' id='h_id_academic_contact_no"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_academic_email_id' id='h_id_academic_email_id"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_email_id()+"'/>");
														
														out.println("<input type='hidden' name='h_academic_project_name' id='h_id_academic_project_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_project_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_description' id='h_id_academic_description"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_description()+"'/>");
														
														/*String course_val="";
														for(int i=0;i<newEnquiry.getTraining_enquiry_course().length;i++){
															course_val=course_val+newEnquiry.getTraining_enquiry_course()[i]+",";
														}
														out.println("<input type='hidden' name='h_academic_course' id='h_id_academic_course"+apecount+"' value='"+course_val+"'/>");
														*/
														out.println("<input type='hidden' name='h_academic_joining_date' id='h_id_academic_joining_date"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_id' id='h_id_academic_reference_id"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_referenceId()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_name' id='h_id_academic_reference_name"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_name()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_contact_no' id='h_id_academic_reference_contact_no"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_academic_reference_note' id='h_id_academic_reference_note"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_reference_note()+"'/>");
														out.println("<input type='hidden' name='h_academic_status' id='h_id_academic_status"+apecount+"' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_status()+"'/>");
														//System.out.println("Pref Start : "+newEnquiry.getPreferredtime_start());
														//System.out.println("Pref End : "+newEnquiry.getPreferredtime_end());
														
														out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+apecount+")' onmouseup='createDiv("+apecount+","+(academicProjectEnquiryList.size())+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
														out.println("<td width='4%'>"+apemysno+"</td>");
														out.println("<td width='13%'>"+newEnquiry.getAcademic_project_enquiry_fullname()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_contact_no()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_project_name()+"</td>");
														
														out.println("<td width='12%'>"+newEnquiry.getAcademic_project_enquiry_delivery_date()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getAcademic_project_enquiry_date()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getAcademic_project_enquiry_reference_name()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getEmployee_id()+"</td>");
														out.println("</tr></table>");
														//out.println("<div id='"+subdivid+"'>");
														
														out.println("<div id='academic_project_remark_div"+apecount+"' style='display:none' >");
															out.println("<form action='#saveremarkAcademic.jsp' id='subFormAPR_"+apecount+"' method='post'>");
																out.println("<table border='1' width='1070px' style='margin-left:50px; padding:3px'>");									
																	out.println("<tr bgcolor='#aa1122'><td align='center'><b>Remark</b></td><td align='center'><b>Remarked Date</b></td><td align='center'><b>Next meeting date</b></td><td align='center'><b>Meeting time start</b></td><td align='center'><b>Meeting time end</b></td><td align='center'><b>Councillor</b></td></tr>");
																	//List <EnquiryRemark>remarkList=enquiryService.getAllRemarkForAnEnquiry(newEnquiry);
																	List <AcademicProjectRemark>remarkList=enquiryService.getAllRemarkForAnAcademicProjectEnquiry(newEnquiry);
																	for(AcademicProjectRemark enquiryRemark:remarkList){
																		
																	out.println("<tr bgcolor='#330066'>");
																		out.println("<td width='32%'>");
																			out.println(enquiryRemark.getRemark());
																			//out.println("<input name='name' type='text' value='"+count+"'/>");
																		out.println("</td>");
																		out.println("<td width='9%'>");
																			out.println(enquiryRemark.getRemark_date());
																			//out.println("<input name='' type='text' value='' />");
																			out.println("</td>");
																		out.println("<td width='12%'>");
																			out.println(enquiryRemark.getNext_meeting_date());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																		out.println("<td width='9%'>");
																			out.println(enquiryRemark.getNext_meeting_time_start());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																		out.println("<td width='9%'>");
																			out.println(enquiryRemark.getNext_meeting_time_end());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																		out.println("<td width='14%'>");
																			out.println(enquiryRemark.getCouncillor());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																	out.println("</tr>");
																	}
																	out.println("<tr bgcolor='#999999'>");
																		out.println("<td width='32%'>");
																			out.println("<input type='hidden' name='enquiryid' value='"+newEnquiry.getAcademic_project_enquiry_enquiry_id()+"' size='52'/>");
																			out.println("<input type='hidden' name='project_id' value='"+newEnquiry.getAcademic_project_enquiry_project_id()+"' size='52'/>");
																			
																			out.println("<input type='text' name='remark' id='id_remark"+apecount+"' value='' size='52'/>");
																		out.println("</td>");
																		out.println("<td width='9%'>");														
																		Date date=new Date();
																		String c_date=(1900+date.getYear())+"-"+(1+date.getMonth())+"-"+date.getDate();
																			out.println("<input type='text' name='remark_date' value='"+c_date+"' size='10' readonly='readonly'/>");
																		out.println("</td>");
																		
																		out.println("<td width='12%'>");
																			out.println("<input type='date' name='next_meeting_date' id='id_next_meeting_date"+apecount+"' size='25'/>");
																			out.println("<script type=\"text/javascript\">");
																				out.println("new datepickr('id_academic_project_remark_nextmeeting_date"+apecount+"',{");
																					out.println("'dateFormat': 'm/d/y'");
																				out.println("});");			
																			out.println("</script>");
																		out.println("</td>");
																		
																		out.println("<td width='9%'>");
																			out.println("<input type='text' name='next_meeting_time_start' id='id_next_meeting_time_start"+apecount+"' size='10'/>");
																			out.println("<script type=\"text/javascript\">");
																				out.println("$(function() {");
																					out.println("$('#id_next_meeting_time_start"+apecount+"').timepicker({ 'timeFormat': 'H:i:s' });");
																				out.println("});");			
																			out.println("</script>");
																		out.println("</td>");
																		out.println("<td width='9%'>");
																			out.println("<input type='text' name='next_meeting_time_end' id='id_next_meeting_time_end"+apecount+"' size='10'/>");
																			out.println("<script type=\"text/javascript\">");
																				out.println("$(function() {");
																					out.println("$('#id_next_meeting_time_end"+apecount+"').timepicker({ 'timeFormat': 'H:i:s' });");
																				out.println("});");			
																			out.println("</script>");
																		out.println("</td>");
																		
																		out.println("<td width='14%' bgcolor='#333333'>");
																			out.println("<input type='hidden' value='"+academicProjectEnquiryList.size()+"' id='maxvalue"+apecount+"'/>");
																			out.println("<input type='button' onclick='closeRemark("+(academicProjectEnquiryList.size())+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");
																			out.println("<input onclick='subSubmitBtnAPR(\""+apecount+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");														
																		out.println("</td>");
																	out.println("</tr>");												
																out.println("</table>");											
															out.println("</form>");									
													 	out.println("</div>");	
														
														//out.println("</div>");
														out.println("</div>");
														apecount++;
													}
							%>

						</div>

						<%
							}
						                	else{
						%>
						<table width="100%">
							<tr>
								<td align="center">
									<h4
										style="font-size: 14px; font-style: normal; color: #ffaabb;">Record
										not found</h4>
								</td>
							</tr>
						</table>
						<%
							}
						                	}
						%>
					</div>
					<script type="text/javascript">
						function showEnquiryForm(select) {
							if (select.value == 'Academic Project') {
								$("#training_enquiry_div").hide();
								$("#visitor_enquiry_div").hide();
								$("#academic_project_enquiry_div").show();
							}
							if (select.value == "Training") {
								$("#academic_project_enquiry_div").hide();
								$("#visitor_enquiry_div").hide();
								$("#training_enquiry_div").show();
							}
							if (select.value == "Visitor") {
								$("#academic_project_enquiry_div").hide();
								$("#training_enquiry_div").hide();
								$("#visitor_enquiry_div").show();
							}
						}
					</script>
					<form action="#" id="savenewenquiryForm">
						<div class="rightContent">
							<table width="100%" border="0" align="right">
								<tr>
									<td align="center">
										<div id="id_enquirymsg">
											<h4>New Enquiry</h4>
										</div>
									</td>
								</tr>
							</table>

							<table width="100%" align="right" border="1">
								<tr>
									<td width="40%" align="right">Enquiry Purpose :</td>
									<td width="60%"><select name="enquiry_purpose"
										id="id_enquiry_purpose" style="width: 160px;"
										onchange="showSearchForm(this);">
											<option value="Visitor">Visitor</option>
											<option value="Training">Training</option>
											<option value="Academic Project" selected="selected">Academic
												Project</option>
<!-- 											<option value="Certificate">Certificate</option> -->
<!-- 											<option value="Experience">Experience</option> -->
<!-- 											<option value="Live Project">Live Project</option> -->
									</select></td>
								</tr>
							</table>

							<div id="academic_project_enquiry_div"">
								<table width="100%" align="right" border="1">
									<tr>
										<td width="40%" align="right">Full Name :</td>
										<td width="60%"><input type="hidden"
											name="academic_project_enquiry_enquiry_id"
											id="id_academic_project_enquiry_enquiry_id" size="20" /> <input
											type="text" style="width: 160px;" name="academic_project_enquiry_fullname"
											id="id_academic_project_enquiry_fullname" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Father Name :</td>
										<td width="60%"><input type="text" style="width: 160px;"
											name="academic_project_enquiry_father_name"
											id="id_academic_project_enquiry_father_name" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Qualification :</td>
										<td width="60%"><select
											name="academic_project_enquiry_qualification"
											id="id_academic_project_enquiry_qualification"
											onchange="academic_project_enquiry_qualification_other1()"
											style="width: 160px;">
												<option value='B.E'>B.E</option>
												<option value='B.Tech'>B.Tech</option>
												<option value='M.E'>M.E</option>
												<option value='M.Tech'>M.Tech</option>
												<option value='B.C.A'>B.C.A</option>
												<option value='M.C.A'>M.C.A</option>
												<option value='Other'>Other</option>
										</select>
											<div id="id_academic_project_enquiry_qualification_other_div">

											</div></td>
									</tr>
									<tr>
										<td width="40%" align="right">College :</td>
										<td width="60%"><select
											name="academic_project_enquiry_college"
											id="id_academic_project_enquiry_college"
											onchange="academic_project_enquiry_college_other1()"
											style="width: 160px;">
												<%
													for(College c:allCollegeList){
																					out.println("<option value='"+c.getCollegeCode()+"'>"+c.getCollegeName()+"</option>");		
																				}
												%>
												<option value="Other">Other</option>
										</select>
											<div id="id_academic_project_enquiry_college_other_div"></div>
										</td>
									</tr>
									<tr>
										<td width="40%" align="right">Semester :</td>
										<td width="60%"><select
											name="academic_project_enquiry_semester"
											id="id_academic_project_enquiry_semester"
											style="width: 160px;">
												<option value="First">First</option>
												<option value="Second">Second</option>
												<option value="Third">Third</option>
												<option value="Four">Four</option>
												<option value="Five">Five</option>
												<option value="Six">Six</option>
												<option value="Seven">Seven</option>
												<option value="Eight">Eight</option>
												<option value="Pass Out">Pass Out</option>
												<option value="Not Applicable">Not Applicable</option>
										</select></td>
									</tr>
									<tr>
										<td width="40%" align="right">Contact No :</td>
										<td width="60%"><input type="text" style="width: 160px;"
											name="academic_project_enquiry_contact_no"
											id="id_academic_project_enquiry_contact_no" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Email-Id :</td>
										<td width="60%"><input type="text" style="width: 160px;"
											name="academic_project_enquiry_email_id"
											id="id_academic_project_enquiry_email_id" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Project Description :</td>
										<td width="60%"><textarea rows="3" cols="21"
												name="academic_project_enquiry_description"
												id="id_academic_project_enquiry_description"
												style="width: 155px;"></textarea></td>
									</tr>
									<tr>
										<td width="40%" align="right">Project Name :</td>
										<td width="60%"><input type="text" style="width: 160px;"
											name="academic_project_enquiry_project_name"
											id="id_academic_project_enquiry_project_name" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Delivery Date :</td>
										<td width="60%"><input type="text" style="width: 160px;"
											name="academic_project_enquiry_delivery_date"
											id="id_academic_project_enquiry_delivery_date" />
											
											  <script type="text/javascript">
									new datepickr(
											'id_academic_project_enquiry_delivery_date',
											{
												'dateFormat' : 'm/d/y'
											});
											
								</script> 
											
											</td>
									</tr>
									<tr>
										<td width="40%" align="right">Status :</td>
										<td width="60%"><select
											name="academic_project_enquiry_enquiry_status"
											id="id_academic_project_enquiry_enquiry_status"
											disabled="disabled" style="width: 160px;">
												<option value="Fresh">Fresh</option>
												<option value="Under Process">Under Process</option>
												<option value="Complited">Completed</option>
												<option value="Not Intrested">Not Interested</option>
										</select></td>
									</tr>
								</table>
								
								

 
								<p>&nbsp;</p>
								<table width="60%" border="0" align="center">
									<tr>
										<td align="center">
											<h4>Reference</h4>
										</td>
									</tr>
								</table>
								<p>&nbsp;</p>
								<table width="100%" border="1" align="right">

									<tr>
										<td width="40%" align="right">Full Name :</td>
										<td width="60%"><input type="text"
											name="academic_project_enquiry_reference_name"
											id="id_academic_project_enquiry_reference_name"
											value="Not Applicable" size="21" /> <input type="hidden"
											name="academic_project_enquiry_referenceId"
											id="id_academic_project_enquiry_referenceId" value=""
											size="20" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Contact No :</td>
										<td width="60%"><input type="text"
											name="academic_project_enquiry_reference_contact_no"
											id="id_academic_project_enquiry_reference_contact_no"
											value="0000000000" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Note :</td>
										<td width="60%"><textarea style="width: 175px;" rows="3" cols="17"
												name="academic_project_enquiry_reference_note"
												id="id_academic_project_enquiry_reference_note">self</textarea>
										</td>
									</tr>
								</table>
							</div>

							<table width="100%" border="0" align="right">
								<tr>
									<td width="40%" align="left"><input type="reset"
										value="Clear" id="clearnewenquiryBtn"
										style="float: left; display: block; width: 100px; height: 26px; margin-top: 10px; padding-top: 4px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;" />
									</td>
									<td width="60%" align="right"><input type="button"
										value="Save" id="savenewenquiryBtn"
										style="float: right; display: block; width: 100px; height: 26px; margin-top: 10px; padding-top: 4px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;" />
									</td>
								</tr>
							</table>

						</div>
					</form>
					<div class="cleaner"></div>
					</div>
					<div class="cleaner"></div>
					</div>

					<div id="templatemo_content_wrapper_bottm"></div>

					<div id="templatemo_footer">
						<%@include file="../footer.jsp"%>
					</div>

					</div>
					<!-- end of wrapper -->
					</div>
					<!-- end of wrapper_outer -->

					</body>
					</html>