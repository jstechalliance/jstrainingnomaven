<%@page import="com.js.service.impl.EnquiryServiceImpl"%>
<%@page import="com.js.service.impl.CollegeServiceImpl"%>
<%@page import="com.js.service.impl.CourseServiceImpl"%>
<%@page import="com.js.controller.EnquiryController"%>
<%@page import="com.js.utils.JSIBeanFactory"%>
<%@page import="com.js.service.CourseService"%>
<%@page import="com.js.service.CollegeService"%>
<%@page import="com.js.service.EnquiryService"%>
<%@page import="java.util.*"%>
<%@page import="com.js.dto.*"%>
<%@page import="com.js.msg.*"%>
<%@include file="managerheader.jsp"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="../templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="../css/jquery.ennui.contentslider.css" rel="stylesheet"
	type="text/css" media="screen,projection" />
<script type="text/javascript" src="../js/enquiry.js"></script>
<script type="text/javascript" src="../js/datepickr.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="../js/searchinq.js"></script>
<script type="text/javascript" src="../js/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css"	href="../js/jquery.timepicker.css" />
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>



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
	//EnquiryController enquiryController = JSIBeanFactory.getBean(EnquiryController.class);
	
	EnquiryController enquiryController=JSIBeanFactory.getBean("enquiryController");
	
	System.out.println(enquiryController);
	
	List <Course>allCourseList=courseService.getAllCourse((String)request.getSession(false).getAttribute("BRANCHID"));
    List <Course>cList=courseService.getAllEnquiredCourse((String)request.getSession(false).getAttribute("BRANCHID"));
   	List <College>collegeList=collegeService.getAllEnquiryedCollege((String)request.getSession(false).getAttribute("BRANCHID"));
   	List <College>allCollegeList=collegeService.getAllCollege();
   	List <String>qualificationList=enquiryService.getAllEnquiredQualification((String)request.getSession(false).getAttribute("BRANCHID"));
    List <String>statusList=enquiryService.getAllEnquiredStatus((String)request.getSession(false).getAttribute("BRANCHID"));

	System.out.println("All Load done.");

%>



<div id="templatemo_content_wrapper">
	<div id="content">
		<div class="latestEvent">
			<form name="myForm" action="searchenquiry.jsp" method="post"
				onsubmit="return mySearchFormValidation();" id="myForm">
				<% 
				SearchEnquiry searchEnquiry = (SearchEnquiry)request.getSession(false).getAttribute("SEARCHFIELD");
				String searchvalue;
				if(searchEnquiry==null){
					searchEnquiry=new SearchEnquiry();
				}
				%>
				<table>
					<td width="20%"
						style="border: none; color: white; font-size: 18px;"><strong>Enquiry
							For :</strong></td>
					<td width="90%" style="border: none;"><select
						name="search_purpose" id="id_serch_purpose"
						onchange="showSearchForm(this)">
							<option value='Training' selected='selected'>Training</option>
							<option value='Academic Project'>Academic Project</option>
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
						<td width="18%" style="border: none;">
						<%
						searchvalue=searchEnquiry.getSearch_enquiry_common_start_time();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
						<input type="text"
							id="id_search_enquiry_common_start_time"
							name="search_enquiry_common_start_time" size="5" value="<%=searchvalue %>"/> <script>
								$(function() {
									$('#id_search_enquiry_common_start_time')
											.timepicker({
												'timeFormat' : 'H:i:s'
											});
								});
							</script> <b>-</b> 
							<%
						searchvalue=searchEnquiry.getSearch_enquiry_common_end_time();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
							<input type="text"
							id="id_search_enquiry_common_end_time"
							name="search_enquiry_common_end_time" size="5" value="<%=searchvalue %>"/> <script>
								$(function() {
									$('#id_search_enquiry_common_end_time')
											.timepicker({
												'timeFormat' : 'H:i:s'
											});
								});
							</script></td>
					</tr>


					<table width="100%" border="1" align="left"
						id="search_training_enquiry">
						<tr>
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_fullname();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
							<td width="14%">Full Name :</td>
							<td width="18%"><input type="text"
								name="search_training_enquiry_fullname"
								id="id_search_training_enquiry_fullname" value="<%=searchvalue %>" style="width: 140px;" />
							</td>
							<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_contactno();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
							<td width="14%">Contact No :</td>
							<td width="18%"><input type="text"
								name="search_training_enquiry_contactno"
								id="id_search_training_enquiry_contactno" value="<%=searchvalue %>" style="width: 140px;" />
							</td>
							<td width="13%">Enquiry Date :</td>
							<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_start_date();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
							<td width="18%"><input type="text"
								name="search_training_enquiry_start_date"
								id="id_search_training_enquiry_start_date" size="5" value="<%=searchvalue %>" /> <b>-</b>&nbsp;
								
								<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_end_date();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
								<input
								type="text" name="search_training_enquiry_end_date" value="<%=searchvalue %>"
								id="id_search_training_enquiry_end_date" size="5" /> <script
									type="text/javascript">
									new datepickr(
											'id_search_training_enquiry_start_date',
											{
												'dateFormat' : 'm/d/y'
											});
								</script> <script type="text/javascript">
									new datepickr(
											'id_search_training_enquiry_end_date',
											{
												'dateFormat' : 'm/d/y'
											});
								</script></td>
						</tr>
						<tr>
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_reference_name();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
							<td>Reference Name :</td>
							<td><input type="text"
								name="search_training_enquiry_reference_name" value="<%=searchvalue %>"
								id="id_search_training_enquiry_reference_name"
								style="width: 140px;" /></td>
								<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_reference_no();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
							<td>Ref-Contact No :</td>
							<td><input type="text" value="<%=searchvalue %>"
								name="search_training_enquiry_reference_no"
								id="id_search_training_enquiry_reference_no"
								style="width: 140px;" /></td>
								
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_start_date_doj();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
							<td>Date Of Join :</td>
							<td><input type="text"
								name="search_training_enquiry_start_date_doj" value="<%=searchvalue %>"
								id="id_search_training_enquiry_start_date_doj" size="5" /> <b>-</b>&nbsp;
								
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_end_date_doj();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
								<input
								type="text" name="search_training_enquiry_end_date_doj" value="<%=searchvalue %>"
								id="id_search_training_enquiry_end_date_doj" size="5" /> <script
									type="text/javascript">
									new datepickr(
											'id_search_training_enquiry_start_date_doj',
											{
												'dateFormat' : 'm/d/y'
											});
								</script> <script type="text/javascript">
									new datepickr(
											'id_search_training_enquiry_end_date_doj',
											{
												'dateFormat' : 'm/d/y'
											});
								</script></td>
						</tr>
						<tr>
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_qualification();
						if(searchvalue==null){
							searchvalue="Select";
						}
						%>
							<td>Qualification :</td>
							<td><select name="search_training_enquiry_qualification"
								id="id_search_training_enquiry_qualification">
									<option value="Select">Select</option>
									<%
										for(String qualification:qualificationList){
											if(searchvalue.equalsIgnoreCase(qualification)){
												out.println("<option selected='selected' value='"+qualification+"'>"+qualification+"</option>");
											}else{
												out.println("<option value='"+qualification+"'>"+qualification+"</option>");		
											}
										}
									%>
							</select></td>
							<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_college();
						if(searchvalue==null){
							searchvalue="Select";
						}
						%>
							<td>College :</td>
							<td><select name="search_training_enquiry_college"
								id="id_search_training_enquiry_college" style="width: 140px;">
									<option value="Select">Select</option>
									<%
										for(College c:collegeList){
											if(searchvalue.equalsIgnoreCase(c.getCollegeCode())){
												out.println("<option selected='selected' value='"+c.getCollegeCode()+"'>"+c.getCollegeName()+"</option>");			
											}else{
												out.println("<option value='"+c.getCollegeCode()+"'>"+c.getCollegeName()+"</option>");
											}
										}
									%>
							</select></td>
							<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_semester();
						if(searchvalue==null){
							searchvalue="Select";
						}
						%>
							<td>Semester :</td>
							<td><select name="search_training_enquiry_semester"
								id="id_search_training_enquiry_semester">
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
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_preferredtime_start();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
							<td>Preferred Time :</td>
							<td><input type="text"
								id="id_search_training_enquiry_preferredtime_start" value="<%=searchvalue %>"
								name="search_training_enquiry_preferredtime_start" size="5" />

								<script>
									$(function() {
										$(
												'#id_search_training_enquiry_preferredtime_start')
												.timepicker({
													'timeFormat' : 'H:i:s'
												});
									});
								</script> <b>-</b> 
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_preferredtime_end();
						if(searchvalue==null){
							searchvalue="";
						}
						%>
								<input type="text"
								id="id_search_training_enquiry_preferredtime_end"  value="<%=searchvalue %>"
								name="search_training_enquiry_preferredtime_end" size="5" /> <script>
									$(function() {
										$(
												'#id_search_training_enquiry_preferredtime_end')
												.timepicker({
													'timeFormat' : 'H:i:s'
												});
									});
								</script></td>
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_preferredtime_end();
						if(searchvalue==null){
							searchvalue="Select";
						}
						%>
							<td>Course :</td>
							<td><select name="search_training_enquiry_course"
								id="id_search_training_enquiry_course">
									<option value="Select">Select</option>
									<%
										for(Course c:cList){
											if(searchvalue.equalsIgnoreCase(c.getCourse_Id())){
												out.println("<option selected='selected' value='"+c.getCourse_Id()+"'>"+c.getCourse_Name()+"</option>");
											}else{
												out.println("<option value='"+c.getCourse_Id()+"'>"+c.getCourse_Name()+"</option>");
											}
										}
									%>
							</select></td>
						<%
						searchvalue=searchEnquiry.getSearch_training_enquiry_preferredtime_end();
						if(searchvalue==null){
							searchvalue="Select";
						}
						%>
							<td>Status :</td>
							<td><select name="search_training_enquiry_status"
								id="id_search_training_enquiry_status">
									<option value="Select">Select</option>
									<%
										for(String status:statusList){
											if(searchvalue.equalsIgnoreCase(status)){
												out.println("<option selected='selected' value='"+status+"'>"+status+"</option>");
											}else{
												out.println("<option value='"+status+"'>"+status+"</option>");
											}
										}
									%>
							</select></td>
						</tr>
					</table>


					<input type="submit" value="Search"
						style="float: right; display: block; width: 100px; height: 25px; margin: 2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;" />

					</form>
					</div>
					<div class="hr_divider_enquiry"></div>
					<%
					request.getSession(false).removeAttribute("SEARCHFIELD");
						//List <NewEnquiry>enquiryList =new ArrayList<NewEnquiry>(); //(List <NewEnquiry>)request.getAttribute("ENQUIRYSEARCHRESULT");
					                	List <NewTrainingEnquiryDTO>enquiryList =(List <NewTrainingEnquiryDTO>)request.getAttribute("TRAININGENQUIRYSEARCHRESULT");
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
								if ($("#training_enquiry_remark_div" + i).is(":visible")) {
									$("#training_enquiry_remark_div" + i).hide();
								}
							}
// 							for (var i = 1; i <= max; i++) {
// 								if ($("#" + i).is(":visible")) {
// 									$("#" + i).hide();
// 								}
// 							}
						}
						function showFeedBackAndEnquiryDetail(count) {

							document.getElementById("id_enquiry_purpose").disabled = true;

							document
									.getElementById("id_training_enquiry_enquiry_id").value = document
									.getElementById("h_id_enquiryid" + count).value;
							document
									.getElementById("id_training_enquiry_fullname").value = document
									.getElementById("h_id_fullname" + count).value;
							document
									.getElementById("id_training_enquiry_father_name").value = document
									.getElementById("h_id_father_name" + count).value;
							var desiredValue = document
									.getElementById("h_id_qualification"
											+ count).value;
							var el = document
									.getElementById("id_training_enquiry_qualification");
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
							var el1 = document
									.getElementById("id_training_enquiry_college");
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
									.getElementById("id_training_enquiry_semester");
							for (var i = 0; i < el2.options.length; i++) {
								if (el2.options[i].text == desiredValue2) {
									el2.selectedIndex = i;
									break;
								}
							}

							var desiredValue3 = document
									.getElementById("h_id_course" + count).value;
							var n = desiredValue3.split(",");
							var el3 = document
									.getElementById("id_training_enquiry_course");
							for (var i = 0; i < el3.options.length; i++) {
								el3.options[i].selected = false;
							}
							for (var i = 0; i < n.length - 1; i++) {
								var val = n[i];
								var el4 = document
										.getElementById("id_training_enquiry_course");
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

							var enquirypurpose = document
									.getElementById("h_id_purpose" + count).value;
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

							document.getElementById(
									'id_training_enquiry_enquiry_status')
									.removeAttribute('disabled');
							var desiredValue5 = document
									.getElementById("h_id_status" + count).value;
							var el5 = document
									.getElementById("id_training_enquiry_enquiry_status");
							for (var i = 0; i < el5.options.length; i++) {
								if (el5.options[i].text == desiredValue5) {
									el5.selectedIndex = i;
									break;
								}
							}

							document
									.getElementById("id_training_enquiry_contact_no").value = document
									.getElementById("h_id_contact_no" + count).value;
							document
									.getElementById("id_training_enquiry_email_id").value = document
									.getElementById("h_id_email_id" + count).value;
							document
									.getElementById("id_training_enquiry_preferredtime_start").value = document
									.getElementById("h_id_preferredtime_start"
											+ count).value;
							document
									.getElementById("id_training_enquiry_preferredtime_end").value = document
									.getElementById("h_id_preferredtime_end"
											+ count).value;
							document
									.getElementById("id_training_enquiry_joining_date").value = document
									.getElementById("h_id_joining_date" + count).value;
							document
									.getElementById("id_training_enquiry_reference_name").value = document
									.getElementById("h_id_reference_name"
											+ count).value;
							document
									.getElementById("id_training_enquiry_reference_contact_no").value = document
									.getElementById("h_id_reference_contact_no"
											+ count).value;
							document
									.getElementById("id_training_enquiry_reference_note").value = document
									.getElementById("h_id_reference_note"
											+ count).value;
							document
									.getElementById("id_training_enquiry_referenceId").value = document
									.getElementById("h_id_reference_id" + count).value;

							document.getElementById("savenewenquiryBtn").value = "Update";
							document.getElementById("clearnewenquiryBtn").disabled = true;
							document
									.getElementById("id_training_enquiry_joining_date").disabled = true;
							document.getElementById("id_enquiry_purpose").disabled = true;
							document.getElementById("id_enquiry_purpose").value = "Training";
							showEnquiryForm(document
									.getElementById("id_enquiry_purpose"));

						}
						function createDiv(item, max) {
							for (var i = 1; i <= max; i++) {
								if ($("#training_enquiry_remark_div" + i).is(":visible")) {
									$("#training_enquiry_remark_div" + i).hide();
								}
							}
							$("#training_enquiry_remark_div" + item).show();
						}
					</script>


					<div class="leftContent">

						<!--             	             	
                		<iframe align="top" name="hotmessage" id="hotmessage" style="margin-top: 5px; width: 520px; height:604px; overflow-y: scroll;" frameborder="0" src="" scrolling="auto">
                		</iframe>
                	-->
						<script type="text/javascript">
							function showActivePassivForm(select) {
								if (select.value == 'Academic Project') {
									$("#training_enquiry_active_list_div")
											.hide();
									$("#training_enquiry_passive_list_div")
											.hide();

									$("#academic_enquiry_active_list_div")
											.show();
									$("#academic_enquiry_passive_list_div")
											.show();

								}
								if (select.value == 'Training') {
									$("#academic_enquiry_active_list_div")
											.hide();
									$("#academic_enquiry_passive_list_div")
											.hide();

									$("#training_enquiry_active_list_div")
											.show();
									$("#training_enquiry_passive_list_div")
											.show();

								}
							}
						</script>
						<%
							if(enquiryList==null){
						                        	List <NewAcademicProjectEnquiryDTO>academicProjectEnquiryList =new ArrayList<NewAcademicProjectEnquiryDTO>();

						                			
											List <List<NewTrainingEnquiryDTO>>allEnquiryList=enquiryController.getAllTrainingFollowUp(request);
						                			List <NewTrainingEnquiryDTO>activeEnquiryList=allEnquiryList.get(0);
						                			List <NewTrainingEnquiryDTO>passiveEnquiryList=allEnquiryList.get(1);
						                			
											
											enquiryList=activeEnquiryList;
						%>
						<h4 style="font-size: 18px; font-style: normal; float: left;">Today's
							Follow Up</h4>
						<h4 style="font-size: 18px; font-style: normal; float: right;">Active
							List</h4>
						<div id="training_enquiry_active_list_div"
							style="height: 310px; display: block; width: 520px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;">
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
								int count=1;
													int mycount=0;
													int mysno=0;
													
													for(mycount=0;mycount<enquiryList.size();mycount++){
														mysno++;
														//NewEnquiry newEnquiry=enquiryList.get(mycount);
														NewTrainingEnquiryDTO newEnquiry=enquiryList.get(mycount);
														String maindivid="maindiv"+count;
														String subdivid="subdiv"+count;
														out.println("<div id='"+maindivid+"'>");
														
														out.println("<input type='hidden' name='h_purpose' id='h_id_purpose"+count+"' value='"+newEnquiry.getEnquiry_purpose()+"'/>");
														

														out.println("<input type='hidden' name='h_enquiryid' id='h_id_enquiryid"+count+"' value='"+newEnquiry.getTraining_enquiry_enquiry_id()+"'/>");
														out.println("<input type='hidden' name='h_fullname' id='h_id_fullname"+count+"' value='"+newEnquiry.getTraining_enquiry_fullname()+"'/>");
														out.println("<input type='hidden' name='h_father_name' id='h_id_father_name"+count+"' value='"+newEnquiry.getTraining_enquiry_father_name()+"'/>");
														out.println("<input type='hidden' name='h_qualification' id='h_id_qualification"+count+"' value='"+newEnquiry.getTraining_enquiry_qualification()+"'/>");
														out.println("<input type='hidden' name='h_college' id='h_id_college"+count+"' value='"+newEnquiry.getTraining_enquiry_college()+"'/>");
														out.println("<input type='hidden' name='h_semester' id='h_id_semester"+count+"' value='"+newEnquiry.getTraining_enquiry_semester()+"'/>");
														out.println("<input type='hidden' name='h_contact_no' id='h_id_contact_no"+count+"' value='"+newEnquiry.getTraining_enquiry_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_email_id' id='h_id_email_id"+count+"' value='"+newEnquiry.getTraining_enquiry_email_id()+"'/>");
														String course_val="";
														for(int i=0;i<newEnquiry.getTraining_enquiry_course().length;i++){
															course_val=course_val+newEnquiry.getTraining_enquiry_course()[i]+",";
														}
														out.println("<input type='hidden' name='h_course' id='h_id_course"+count+"' value='"+course_val+"'/>");
														
														out.println("<input type='hidden' name='h_preferredtime_start' id='h_id_preferredtime_start"+count+"' value='"+newEnquiry.getTraining_enquiry_preferredtime_start()+"'/>");
														out.println("<input type='hidden' name='h_preferredtime_end' id='h_id_preferredtime_end"+count+"' value='"+newEnquiry.getTraining_enquiry_preferredtime_end()+"'/>");
														out.println("<input type='hidden' name='h_joining_date' id='h_id_joining_date"+count+"' value='"+newEnquiry.getTraining_enquiry_joining_date()+"'/>");
														out.println("<input type='hidden' name='h_reference_id' id='h_id_reference_id"+count+"' value='"+newEnquiry.getTraining_enquiry_referenceId()+"'/>");
														out.println("<input type='hidden' name='h_reference_name' id='h_id_reference_name"+count+"' value='"+newEnquiry.getTraining_enquiry_reference_name()+"'/>");
														out.println("<input type='hidden' name='h_reference_contact_no' id='h_id_reference_contact_no"+count+"' value='"+newEnquiry.getTraining_enquiry_reference_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_reference_note' id='h_id_reference_note"+count+"' value='"+newEnquiry.getTraining_enquiry_reference_note()+"'/>");
														out.println("<input type='hidden' name='h_status' id='h_id_status"+count+"' value='"+newEnquiry.getTraining_enquiry_enquiry_status()+"'/>");
														//System.out.println("Pref Start : "+newEnquiry.getPreferredtime_start());
														//System.out.println("Pref End : "+newEnquiry.getPreferredtime_end());
														
														out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+count+")' onmouseup='createDiv("+count+","+(activeEnquiryList.size()+passiveEnquiryList.size())+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
														out.println("<td width='4%'>"+mysno+"</td>");
														out.println("<td width='13%'>"+newEnquiry.getTraining_enquiry_fullname()+"</td>");
														out.println("<td width='11%'>"+newEnquiry.getTraining_enquiry_contact_no()+"</td>");
														out.println("<td width='11%'>");
														String ces[]=newEnquiry.getTraining_enquiry_course();
														for(String c:ces){
															out.println(c+", ");
														}
														out.println("</td>");
														out.println("<td align='center' width='12%'>"+newEnquiry.getTraining_enquiry_joining_date()+"</td>");
														out.println("<td align='center' width='14%'>"+newEnquiry.getTraining_enquiry_preferredtime_start()+" - "+newEnquiry.getTraining_enquiry_preferredtime_end()+"</td>");
														out.println("<td align='center' width='11%'>"+newEnquiry.getTraining_enquiry_date()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getTraining_enquiry_reference_name()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getEmployee_id()+"</td>");
														out.println("</tr></table>");
														//out.println("<div id='"+subdivid+"'>");
														
														out.println("<div id='training_enquiry_remark_div"+count+"' style='display:none' >");
															out.println("<form action='#saveremark.jsp' id='subForm_"+count+"' method='post'>");
																out.println("<table border='1' width='924px' style='margin-left:50px; padding:3px'>");									
																	out.println("<tr bgcolor='#aa1122'><td align='center'><b>Remark</b></td><td align='center'><b>Remarked Date</b></td><td align='center'><b>Alert Date</b></td><td align='center'><b>Councillor</b></td></tr>");
																	//List <EnquiryRemark>remarkList=enquiryService.getAllRemarkForAnEnquiry(newEnquiry);
																	List <EnquiryRemark>remarkList=enquiryService.getAllRemarkForAnTrainingEnquiry(newEnquiry);
																	for(EnquiryRemark enquiryRemark:remarkList){
																	out.println("<tr bgcolor='#330066'>");
																		out.println("<td width='50%'>");
																			out.println(enquiryRemark.getRemark());
																			//out.println("<input name='name' type='text' value='"+count+"'/>");
																		out.println("</td>");
																		out.println("<td align='center' width='12%'>");
																			out.println(enquiryRemark.getRemark_date());
																			//out.println("<input name='' type='text' value='' />");
																			out.println("</td>");
																		out.println("<td align='center' width='13%'>");
																			out.println(enquiryRemark.getRemark_alert());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																		out.println("<td width='25%'>");
																			out.println(enquiryRemark.getCouncillor());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																	out.println("</tr>");
																	}
																	out.println("<tr bgcolor='#999999'>");
																		out.println("<td align='center' width='50%'>");
																			out.println("<input type='hidden' name='enquiryid' value='"+newEnquiry.getTraining_enquiry_enquiry_id()+"'/>");
																			out.println("<input type='text' name='remark' id='my_id_remark"+count+"' value=''  style='width: 97%;'/>");
																		out.println("</td>");
																		out.println("<td align='center' width='12%'>");														
																		Date date=new Date();
																		String c_date=(1900+date.getYear())+"-"+(1+date.getMonth())+"-"+date.getDate();
																			out.println("<input type='text' name='remarkdate' value='"+c_date+"' style='width: 97%;' readonly='readonly'/>");
																		out.println("</td>");
																		out.println("<td align='center' width='13%'>");																					
																			out.println("<input type='date' name='alertdate' id='id_alertdate_"+count+"' style='width: 130px; margin-left: 3px; margin-right: 3px;'/>");
																			out.println("<script type=\"text/javascript\">");
																				out.println("new datepickr('id_alertdate_"+count+"',{");
																					out.println("'dateFormat': 'm/d/y'");
																				out.println("});");
																			out.println("</script>");
																		out.println("</td>");
																		out.println("<td align='center' width='25%' bgcolor='#333333'>");
																			out.println("<input type='hidden' value='"+enquiryList.size()+"' id='maxvalue"+count+"'/>");
																			out.println("<input type='button' onclick='closeRemark("+(activeEnquiryList.size()+passiveEnquiryList.size())+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");
																			out.println("<input onclick='subSubmitBtn(\""+count+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");														
																		out.println("</td>");
																	out.println("</tr>");												
																out.println("</table>");											
															out.println("</form>");									
													 	out.println("</div>");	
														
														//out.println("</div>");
														out.println("</div>");
														count++;
													}
							%>

						</div>
						<br />
						<h4 style="font-size: 18px; font-style: normal; float: left;">Today's
							Follow Up</h4>
						<h4 style="font-size: 18px; font-style: normal; float: right;">Passive
							List</h4>

						<div id="training_enquiry_passive_list_div"
							style="height: 310px; display: block; width: 520px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;">
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
								//int count=1;
													//int mycount=0;
													enquiryList=passiveEnquiryList;
													int sno=0;
													for(mycount=0;mycount<enquiryList.size();mycount++){
														sno++;
														//NewEnquiry newEnquiry=enquiryList.get(mycount);
														NewTrainingEnquiryDTO newEnquiry=enquiryList.get(mycount);
														String maindivid="maindiv"+count;
														String subdivid="subdiv"+count;
														out.println("<div id='"+maindivid+"'>");
														out.println("<input type='hidden' name='h_purpose' id='h_id_purpose"+count+"' value='"+newEnquiry.getEnquiry_purpose()+"'/>");
														out.println("<input type='hidden' name='h_enquiryid' id='h_id_enquiryid"+count+"' value='"+newEnquiry.getTraining_enquiry_enquiry_id()+"'/>");
														out.println("<input type='hidden' name='h_fullname' id='h_id_fullname"+count+"' value='"+newEnquiry.getTraining_enquiry_fullname()+"'/>");
														out.println("<input type='hidden' name='h_father_name' id='h_id_father_name"+count+"' value='"+newEnquiry.getTraining_enquiry_father_name()+"'/>");
														out.println("<input type='hidden' name='h_qualification' id='h_id_qualification"+count+"' value='"+newEnquiry.getTraining_enquiry_qualification()+"'/>");
														out.println("<input type='hidden' name='h_college' id='h_id_college"+count+"' value='"+newEnquiry.getTraining_enquiry_college()+"'/>");
														out.println("<input type='hidden' name='h_semester' id='h_id_semester"+count+"' value='"+newEnquiry.getTraining_enquiry_semester()+"'/>");
														out.println("<input type='hidden' name='h_contact_no' id='h_id_contact_no"+count+"' value='"+newEnquiry.getTraining_enquiry_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_email_id' id='h_id_email_id"+count+"' value='"+newEnquiry.getTraining_enquiry_email_id()+"'/>");
														String course_val="";
														for(int i=0;i<newEnquiry.getTraining_enquiry_course().length;i++){
															course_val=course_val+newEnquiry.getTraining_enquiry_course()[i]+",";
														}
														out.println("<input type='hidden' name='h_course' id='h_id_course"+count+"' value='"+course_val+"'/>");
														
														out.println("<input type='hidden' name='h_preferredtime_start' id='h_id_preferredtime_start"+count+"' value='"+newEnquiry.getTraining_enquiry_preferredtime_start()+"'/>");
														out.println("<input type='hidden' name='h_preferredtime_end' id='h_id_preferredtime_end"+count+"' value='"+newEnquiry.getTraining_enquiry_preferredtime_end()+"'/>");
														out.println("<input type='hidden' name='h_joining_date' id='h_id_joining_date"+count+"' value='"+newEnquiry.getTraining_enquiry_joining_date()+"'/>");
														out.println("<input type='hidden' name='h_reference_id' id='h_id_reference_id"+count+"' value='"+newEnquiry.getTraining_enquiry_referenceId()+"'/>");
														out.println("<input type='hidden' name='h_reference_name' id='h_id_reference_name"+count+"' value='"+newEnquiry.getTraining_enquiry_reference_name()+"'/>");
														out.println("<input type='hidden' name='h_reference_contact_no' id='h_id_reference_contact_no"+count+"' value='"+newEnquiry.getTraining_enquiry_reference_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_reference_note' id='h_id_reference_note"+count+"' value='"+newEnquiry.getTraining_enquiry_reference_note()+"'/>");
														out.println("<input type='hidden' name='h_status' id='h_id_status"+count+"' value='"+newEnquiry.getTraining_enquiry_enquiry_status()+"'/>");
														//System.out.println("Pref Start : "+newEnquiry.getPreferredtime_start());
														//System.out.println("Pref End : "+newEnquiry.getPreferredtime_end());
														
														out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+count+")' onmouseup='createDiv("+count+","+(activeEnquiryList.size()+passiveEnquiryList.size())+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
														out.println("<td width='4%'>"+sno+"</td>");
														out.println("<td width='13%'>"+newEnquiry.getTraining_enquiry_fullname()+"</td>");									
														out.println("<td width='11%'>"+newEnquiry.getTraining_enquiry_contact_no()+"</td>");
														out.println("<td width='11%'>");
														String ces[]=newEnquiry.getTraining_enquiry_course();
														for(String c:ces){
															out.println(c+", ");
														}
														out.println("</td>");
														out.println("<td align='center' width='12%'>"+newEnquiry.getTraining_enquiry_joining_date()+"</td>");
														out.println("<td align='center' width='14%'>"+newEnquiry.getTraining_enquiry_preferredtime_start()+" - "+newEnquiry.getTraining_enquiry_preferredtime_end()+"</td>");
														out.println("<td align='center' width='11%'>"+newEnquiry.getTraining_enquiry_date()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getTraining_enquiry_reference_name()+"</td>");
														out.println("<td width='12%'>"+newEnquiry.getEmployee_id()+"</td>");
														out.println("</tr></table>");
														//out.println("<div id='"+subdivid+"'>");
														
														out.println("<div id='training_enquiry_remark_div"+count+"' style='display:none' >");
															out.println("<form action='#saveremark.jsp' id='subForm_"+count+"' method='post'>");
																out.println("<table border='1' width='924px' style='margin-left:50px; padding:3px'>");									
																	out.println("<tr bgcolor='#aa1122'><td align='center'><b>Remark</b></td><td align='center'><b>Remarked Date</b></td><td align='center'><b>Alert Date</b></td><td align='center'><b>Councillor</b></td></tr>");
																	//List <EnquiryRemark>remarkList=enquiryService.getAllRemarkForAnEnquiry(newEnquiry);
																	List <EnquiryRemark>remarkList=enquiryService.getAllRemarkForAnTrainingEnquiry(newEnquiry);
																	for(EnquiryRemark enquiryRemark:remarkList){
																	out.println("<tr bgcolor='#330066'>");
																		out.println("<td width='50%'>");
																			out.println(enquiryRemark.getRemark());
																			//out.println("<input name='name' type='text' value='"+count+"'/>");
																		out.println("</td>");
																		out.println("<td align='center' width='12%'>");
																			out.println(enquiryRemark.getRemark_date());
																			//out.println("<input name='' type='text' value='' />");
																			out.println("</td>");
																		out.println("<td align='center' width='13%'>");
																			out.println(enquiryRemark.getRemark_alert());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																		out.println("<td width='25%'>");
																			out.println(enquiryRemark.getCouncillor());
																			//out.println("<input type='submit' title='Update' />");
																		out.println("</td>");
																	out.println("</tr>");
																	}
																	out.println("<tr bgcolor='#999999'>");
																		out.println("<td align='center' width='50%'>");
																			//out.println("<input type='hidden' name='commonid' value='"+count+"' id='id_common_id' size='52'/>");
																			out.println("<input type='hidden' name='enquiryid' value='"+newEnquiry.getTraining_enquiry_enquiry_id()+"' />");
																			out.println("<input type='text' name='remark' id='my_id_remark"+count+"' value='' style='width : 97%;'/>");
																		out.println("</td>");
																		out.println("<td align='center' width='12%'>");														
																		Date date=new Date();
																		String c_date=(1900+date.getYear())+"-"+(1+date.getMonth())+"-"+date.getDate();
																			out.println("<input type='text' name='remarkdate' value='"+c_date+"'  style='width : 90%;' readonly='readonly'/>");
																		out.println("</td>");
																		out.println("<td align='center' width='13%'>");
																					
																			out.println("<input type='date' name='alertdate' id='id_alertdate_"+count+"'  style='width: 130px; margin-left: 3px; margin-right: 3px;'/>");
																			out.println("<script type=\"text/javascript\">");
																				out.println("new datepickr('id_alertdate_"+count+"',{");
																					out.println("'dateFormat': 'm/d/y'");
																				out.println("});");			
																			out.println("</script>");
																		out.println("</td>");
																		out.println("<td width='25%' bgcolor='#333333'>");
																			out.println("<input type='hidden' value='"+(activeEnquiryList.size()+passiveEnquiryList.size())+"' id='maxvalue"+count+"'/>");
																			out.println("<input type='button' onclick='closeRemark("+(activeEnquiryList.size()+passiveEnquiryList.size())+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");
																			out.println("<input onclick='subSubmitBtn(\""+count+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");														
																		out.println("</td>");
																	out.println("</tr>");												
																out.println("</table>");											
															out.println("</form>");									
													 	out.println("</div>");	
														
														//out.println("</div>");
														out.println("</div>");
														count++;
													}
							%>

						</div>









						<%
							}
						                		else if(enquiryList!=null){
						%>
						<h4 style="font-size: 18px; font-style: normal;">Search
							Result</h4>
						<%
							if(enquiryList.size()>0){
						%>

						<div
							style="height: 600px; width: 520px; border: solid 2px #222222; overflow: scroll; overflow-x: scroll; overflow-y: scroll;">
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
								int count=1;
													int sno=0;
													for(NewTrainingEnquiryDTO newTrainingEnquiryDTO:enquiryList){
														String maindivid="maindiv"+count;
														String subdivid="subdiv"+count;
														out.println("<div id='"+maindivid+"'>");
														sno++;
														out.println("<input type='hidden' name='h_purpose' id='h_id_purpose"+count+"' value='"+newTrainingEnquiryDTO.getEnquiry_purpose()+"'/>");
														out.println("<input type='hidden' name='h_enquiryid' id='h_id_enquiryid"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_enquiry_id()+"'/>");
														out.println("<input type='hidden' name='h_fullname' id='h_id_fullname"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_fullname()+"'/>");
														out.println("<input type='hidden' name='h_father_name' id='h_id_father_name"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_father_name()+"'/>");
														out.println("<input type='hidden' name='h_qualification' id='h_id_qualification"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_qualification()+"'/>");
														out.println("<input type='hidden' name='h_college' id='h_id_college"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_college()+"'/>");
														out.println("<input type='hidden' name='h_semester' id='h_id_semester"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_semester()+"'/>");
														out.println("<input type='hidden' name='h_contact_no' id='h_id_contact_no"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_email_id' id='h_id_email_id"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_email_id()+"'/>");
														String course_val="";
														for(int i=0;i<newTrainingEnquiryDTO.getTraining_enquiry_course().length;i++){
															course_val=course_val+newTrainingEnquiryDTO.getTraining_enquiry_course()[i]+",";
														}
														out.println("<input type='hidden' name='h_course' id='h_id_course"+count+"' value='"+course_val+"'/>");
														
														out.println("<input type='hidden' name='h_preferredtime_start' id='h_id_preferredtime_start"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_preferredtime_start()+"'/>");
														out.println("<input type='hidden' name='h_preferredtime_end' id='h_id_preferredtime_end"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_preferredtime_end()+"'/>");
														out.println("<input type='hidden' name='h_joining_date' id='h_id_joining_date"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_joining_date()+"'/>");
														out.println("<input type='hidden' name='h_reference_id' id='h_id_reference_id"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_referenceId()+"'/>");
														out.println("<input type='hidden' name='h_reference_name' id='h_id_reference_name"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_reference_name()+"'/>");
														out.println("<input type='hidden' name='h_reference_contact_no' id='h_id_reference_contact_no"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_reference_contact_no()+"'/>");
														out.println("<input type='hidden' name='h_reference_note' id='h_id_reference_note"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_reference_note()+"'/>");
														out.println("<input type='hidden' name='h_status' id='h_id_status"+count+"' value='"+newTrainingEnquiryDTO.getTraining_enquiry_enquiry_status()+"'/>");
														//System.out.println("Pref Start : "+newEnquiry.getPreferredtime_start());
														//System.out.println("Pref End : "+newEnquiry.getPreferredtime_end());
														
														out.println("<table border='1' cellpadding='0' cellspacing='0' width='1024px' ><tr bgcolor='#333333' onmousedown='showFeedBackAndEnquiryDetail("+count+")' onmouseup='createDiv("+count+","+enquiryList.size()+")' onmouseover=\"this.style.backgroundColor='#666666';\" onmouseout=\"this.style.backgroundColor='#333333';\">");
														out.println("<td width='4%'>"+sno+"</td>");
														out.println("<td width='13%'>"+newTrainingEnquiryDTO.getTraining_enquiry_fullname()+"</td>");
														out.println("<td width='11%'>"+newTrainingEnquiryDTO.getTraining_enquiry_contact_no()+"</td>");
														out.println("<td width='11%'>");
														String ces[]=newTrainingEnquiryDTO.getTraining_enquiry_course();
														for(String c:ces){
															out.println(c+", ");
														}
														out.println("</td>");
														out.println("<td align='center' width='12%'>"+newTrainingEnquiryDTO.getTraining_enquiry_joining_date()+"</td>");
														out.println("<td align='center' width='14%'>"+newTrainingEnquiryDTO.getTraining_enquiry_preferredtime_start()+" - "+newTrainingEnquiryDTO.getTraining_enquiry_preferredtime_end()+"</td>");
														out.println("<td align='center' width='11%'>"+newTrainingEnquiryDTO.getTraining_enquiry_date()+"</td>");
														out.println("<td width='12%'>"+newTrainingEnquiryDTO.getTraining_enquiry_reference_name()+"</td>");
														out.println("<td width='12%'>"+newTrainingEnquiryDTO.getEmployee_id()+"</td>");
														out.println("</tr></table>");
														//out.println("<div id='"+subdivid+"'>");
														
														out.println("<div id='training_enquiry_remark_div"+count+"' style='display:none' >");
															out.println("<form action='#saveremark.jsp' id='subForm_"+count+"' method='post'>");
																out.println("<table border='1' width='924px' style='margin-left:50px; padding:3px'>");									
																	out.println("<tr bgcolor='#aa1122'><td align='center'><b>Remark</b></td><td align='center'><b>Remarked Date</b></td><td align='center'><b>Alert Date</b></td><td align='center'><b>Councillor</b></td></tr>");
																	List <EnquiryRemark>remarkList=enquiryService.getAllRemarkForAnTrainingEnquiry(newTrainingEnquiryDTO);
																	for(EnquiryRemark enquiryRemark:remarkList){
																	out.println("<tr bgcolor='#330066'>");
																		out.println("<td width='50%'>");
																			out.println(enquiryRemark.getRemark());
																		out.println("</td>");
																		out.println("<td align='center' width='12%'>");
																			out.println(enquiryRemark.getRemark_date());
																		out.println("</td>");
																		out.println("<td align='center' width='13%'>");
																			out.println(enquiryRemark.getRemark_alert());
																		out.println("</td>");
																		out.println("<td width='25%'>");
																			out.println(enquiryRemark.getCouncillor());
																		out.println("</td>");
																	out.println("</tr>");
																	}
																	out.println("<tr bgcolor='#999999'>");
																		out.println("<td align='center' width='50%'>");
																			out.println("<input type='hidden' name='enquiryid' value='"+newTrainingEnquiryDTO.getTraining_enquiry_enquiry_id()+"'/>");
																			out.println("<input type='text' name='remark' id='my_id_remark"+count+"' value='' style='width: 97%;'/>");
																		out.println("</td>");
																		out.println("<td align='center' width='12%'>");	
																		Date date=new Date();
																		String c_date=(1900+date.getYear())+"-"+(1+date.getMonth())+"-"+date.getDate();
																			out.println("<input type='text' name='remarkdate' value='"+c_date+"' style='width: 90%;' readonly='readonly'/>");
																		out.println("</td>");
																		out.println("<td align='center' width='13%'>");
																			out.println("<input type='date' name='alertdate' id='id_alertdate_"+count+"' style='width: 130px; margin-left: 3px; margin-right: 3px;' onclick='abc("+count+");'/>");														
																		out.println("</td>");
																		out.println("<td width='25%' bgcolor='#333333'>");
																			out.println("<input type='hidden' value='"+enquiryList.size()+"' id='maxvalue"+count+"'/>");
																			out.println("<input type='button' onclick='closeRemark("+enquiryList.size()+")' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");
																			out.println("<input onclick='subSubmitBtn(\""+count+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");
																			
																			//out.println("<input type='button' value='Close' style='float: left; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");
																			//out.println("<input onclick='subSubmitBtn(\""+newEnquiry.getEnquiry_id()+"\");' type='button' value='Save' style='float: right; display: block; width: 75px; height: 25px; margin:2px; padding-top: 1px; font-size: 12px; font-weight: bold; color: #a9a9a9; text-align: center; background: url(images/templatemo_btn.png) no-repeat;'/>");														
																		out.println("</td>");
																	out.println("</tr>");	
																out.println("</table>");											
															out.println("</form>");									
													 	out.println("</div>");	
														
														//out.println("</div>");
														out.println("</div>");
														count++;
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
									<td width="60%"><select 
										name="enquiry_purpose" id="id_enquiry_purpose"
										style="width: 160px;" onchange="showSearchForm(this);">
											<option value="Select">Select</option>
											<option value="Visitor">Visitor</option>
											<option selected="selected" value="Training">Training</option>
											<option value="Academic Project">Academic Project</option>
<!-- 											<option value="Certificate">Certificate</option> -->
<!-- 											<option value="Experience">Experience</option> -->
<!-- 											<option value="Live Project">Live Project</option> -->
									</select></td>
								</tr>
							</table>
							<div id="training_enquiry_div">
								<table width="100%" align="right" border="1">
									<tr>
										<td width="40%" align="right">Full Name :</td>
										<td width="60%"><input type="hidden"
											name="training_enquiry_enquiry_id"
											id="id_training_enquiry_enquiry_id" size="20" /> <input
											type="text" name="training_enquiry_fullname" style="width: 160px;"
											id="id_training_enquiry_fullname" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Father Name :</td>
										<td width="60%"><input type="text" style="width: 160px;"
											name="training_enquiry_father_name"
											id="id_training_enquiry_father_name" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Qualification :</td>
										<td width="60%"><select
											name="training_enquiry_qualification"
											id="id_training_enquiry_qualification"
											onchange="check_training_enquiry_qualification_other()"
											style="width: 160px;">
												<option value='B.E'>B.E</option>
												<option value='B.Tech'>B.Tech</option>
												<option value='M.E'>M.E</option>
												<option value='M.Tech'>M.Tech</option>
												<option value='B.C.A'>B.C.A</option>
												<option value='M.C.A'>M.C.A</option>
												<option value='Other'>Other</option>
										</select>
											<div id="id_training_enquiry_qualification_other_div"></div>
										</td>
									</tr>
									<tr>
										<td width="40%" align="right">College :</td>
										<td width="60%"><select name="training_enquiry_college"
											id="id_training_enquiry_college"
											onchange="check_for_training_college_other()"
											style="width: 160px;">
												<%
													for(College c:allCollegeList){
																						out.println("<option value='"+c.getCollegeCode()+"'>"+c.getCollegeName()+"</option>");		
																					}
												%>
												<option value="Other">Other</option>
										</select>
											<div id="id_training_enquiry_college_div"></div></td>
									</tr>
									<tr>
										<td width="40%" align="right">Semester :</td>
										<td width="60%"><select name="training_enquiry_semester"
											id="id_training_enquiry_semester" style="width: 160px;">
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
										<td width="60%"><input type="text"  style="width: 160px;"
											name="training_enquiry_contact_no"
											id="id_training_enquiry_contact_no" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Email-Id :</td>
										<td width="60%"><input type="text" style="width: 160px;"
											name="training_enquiry_email_id"
											id="id_training_enquiry_email_id" size="21" /></td>
									</tr>
									<tr id="id_row_enquiry_course">
										<td width="40%" align="right">Course :</td>
										<td width="60%"><select name="training_enquiry_course"
											id="id_training_enquiry_course" multiple="multiple" size="3"
											style="width: 160px;">
												<%
													for(Course c:allCourseList){
																					out.println("<option value='"+c.getCourse_Id()+"'>"+c.getCourse_Name()+"</option>");		
																				}
												%>
										</select></td>
									</tr>
									<tr>
										<td width="40%" align="right">Preferred Time :</td>
										<td width="60%"><input type="text"
											id="id_training_enquiry_preferredtime_start"
											name="training_enquiry_preferredtime_start" size="5" /> <script>
												$(function() {
													$(
															'#id_training_enquiry_preferredtime_start')
															.timepicker(
																	{
																		'timeFormat' : 'H:i:s'
																	});
												});
											</script> <b>-</b> <input type="text"
											id="id_training_enquiry_preferredtime_end"
											name="training_enquiry_preferredtime_end" size="5" /> <script>
												$(function() {
													$(
															'#id_training_enquiry_preferredtime_end')
															.timepicker(
																	{
																		'timeFormat' : 'H:i:s'
																	});
												});
											</script></td>
									</tr>
									<tr>
										<td width="40%" align="right">Joining Date :</td>
										<td width="60%"><input type="date" style="width: 160px;"	
											name="training_enquiry_joining_date"
											id="id_training_enquiry_joining_date" size="21" /> Date
											Formate( MM/DD/YYYY)</td>

									</tr>

									<tr>
										<td width="40%" align="right">Status :</td>
										<td width="60%"><select
											name="training_enquiry_enquiry_status"
											id="id_training_enquiry_enquiry_status" disabled="disabled"
											style="width: 160px;">
												<option value="Fresh">Fresh</option>
												<option value="Under Process">Under Process</option>
												<option value="Joined">Joined</option>
												<option value="Not Intrested">Not Intrested</option>
										</select></td>
									</tr>
								</table>

								<script>
									$('#id_training_enquiry_joining_date')
											.DatePicker(
													{
														format : 'm/d/Y',
														date : $(
																'#id_training_enquiry_joining_date')
																.val(),
														current : $(
																'#id_training_enquiry_joining_date')
																.val(),
														starts : 1,
														position : 'r',
														onBeforeShow : function() {
															var d = new Date();
															var strDate = (d
																	.getMonth() + 1)
																	+ "/"
																	+ d
																			.getDate()
																	+ "/"
																	+ d
																			.getFullYear();
															$(
																	'#id_training_enquiry_joining_date')
																	.DatePickerSetDate(
																			strDate,
																			true);
														},
														onChange : function(
																formated, dates) {
															$(
																	'#id_training_enquiry_joining_date')
																	.val(
																			formated);
															$(
																	'#id_training_enquiry_joining_date')
																	.DatePickerHide();
														}
													});
									//$(function() {
									//  $( "#id_training_enquiry_joining_date" ).datepicker();
									//});
								</script>
								<script type="text/javascript">
									//new datepickr('id_training_enquiry_joining_date', {
									//	'dateFormat': 'm/d/y'
									//});
								</script>

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
											name="training_enquiry_reference_name"
											id="id_training_enquiry_reference_name"
											value="Not Applicable" size="21" /> <input type="hidden"
											name="training_enquiry_referenceId"
											id="id_training_enquiry_referenceId" value="" size="20" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Contact No :</td>
										<td width="60%"><input type="text"
											name="training_enquiry_reference_contact_no"
											id="id_training_enquiry_reference_contact_no"
											value="0000000000" size="21" /></td>
									</tr>
									<tr>
										<td width="40%" align="right">Note :</td>
										<td width="60%"><textarea style="width: 175px;" rows="3" cols="17"
												name="training_enquiry_reference_note"
												id="id_training_enquiry_reference_note">self</textarea></td>
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