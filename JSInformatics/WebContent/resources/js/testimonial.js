

function myOnClick(){
	var r = confirm("Do you want to delete.");
	if (r == true) {
	    return true;
	} else {
	    return false;
	}
}

function showTestimonial(oid) {

	var rep_name = document.getElementById('id_rep_name_' + oid);
	var rep_college = document.getElementById('id_rep_college_' + oid);
	var rep_content = document.getElementById('id_rep_content_' + oid);
	var rep_photoPath = document.getElementById('id_rep_photo_path_' + oid);
	
	var tempoid = document.getElementById('id_oid');
	var name = document.getElementById('id_name');
	var college = document.getElementById('id_college');
	var content = document.getElementById('id_content');
	var submit = document.getElementById('submit');
	var photoPath = document.getElementById('id_photoPath');
	
	tempoid.value = "" + oid;
	name.value = rep_name.value;
	college.value = rep_college.value;
	content.value = rep_content.value;
	photoPath.value=rep_photoPath.value;
	submit.disabled=false;
	
	alert(photoPath.value);
	
}

function validateWriteTestimonial() {
	var tempoid = document.getElementById('id_oid');
	var name = document.getElementById('id_name');
	var college = document.getElementById('id_college');
	var content = document.getElementById('id_content');
	//var filesize = document.forms[0].file.files[0].fileSize;
	
	if (name.value == "") {
		name.style.borderColor = 'red';
		alert("Please enter candidate name.");
		name.focus();
		return false;
	}
	if (college.value == "") {
		college.style.borderColor = 'red';
		alert("Please enter college name.");
		college.focus();
		return false;
	}
	if (content.value == "") {
		content.style.borderColor = 'red';
		alert("Please enter testimonial.");
		content.focus();
		return false;
	}
//	if (filesize == 0) {
//		alert("Please select file.");
//		return false;
//	}
}

$(document).ready(
	    function(){
	        $('#id_photo:file').change(
	            function(){
	                if ($(this).val()) {
	                    $('#submit:submit').attr('disabled',false);
	                } 
	            }
	            );
	    });

function validate(id) {

	var trainingStartDate = document.getElementById("id_trainingStartDate");
	var trainingEndDate = document.getElementById("id_trainingEndDate");

	if (trainingStartDate.value == "") {
		trainingStartDate.style.borderColor = 'red';
		alert("Please enter training start date.");
		trainingStartDate.focus();
		return false;
	}
	if (trainingEndDate.value == "") {
		trainingEndDate.style.borderColor = 'red';
		alert("Please enter training end date.");
		mode.focus();
		return false;
	}

	//	var amount = document.getElementById("my_id_amount" + id);
	//	var transfer_code = document.getElementById("id_transfer_code" + id);
	//	var mode = document.getElementById("id_payment_mode" + id);
	//	var manager = document.getElementById("id_manager_id" + id);
	//	var dueAmount = parseInt(document.getElementById("id_dueAmount" + id).value);
	//	
	//	
	//	
	//	if (mode.value == "Select") {
	//		mode.style.borderColor = 'red';
	//		alert("Please select payment mode");
	//		mode.focus();
	//		return false;
	//	}
	//
	//	if (mode.value != "Cash") {
	//		if (transfer_code.value.length == 0) {
	//			transfer_code.style.borderColor = 'red';
	//			alert("Please enter transfer code");
	//			transfer_code.focus();
	//			return false;
	//		}
	//	}
	//
	//	if (isBlank(amount, "amount")) {
	//		return false;
	//	}
	//
	//	if (isNumber(amount.value) == false) {
	//		amount.style.borderColor = 'red';
	//		alert("Please enter valid amount");
	//		amount.focus();
	//		return false;
	//	}
	//	if (manager.value == "Select") {
	//		manager.style.borderColor = 'red';
	//		alert("Please select manager");
	//		manager.focus();
	//		return false;
	//	}
	//	if (parseInt(amount.value) > dueAmount) {
	//		amount.style.borderColor = 'red';
	//		alert("Insufficient amount.");
	//		amount.focus();
	//		return false;
	//	}
}