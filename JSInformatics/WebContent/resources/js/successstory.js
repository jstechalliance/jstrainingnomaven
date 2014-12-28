
function myOnClick(){
	var r = confirm("Do you want to delete.");
	if (r == true) {
	    return true;
	} else {
	    return false;
	}
}

function validateAddSuccessStory() {
	
	var candidateName = document.getElementById('id_candidateName');
	var companyName = document.getElementById('id_companyName');
	var year = document.getElementById('id_year');
	var college = document.getElementById('id_college');
	var photo = document.getElementById('id_photo');
	
	
	//var filesize = document.forms[0].file.files[0].fileSize;
	
	if (candidateName.value == "") {
		candidateName.style.borderColor = 'red';
		alert("Please enter candidate name.");
		candidateName.focus();
		return false;
	}
	if (companyName.value == "") {
		companyName.style.borderColor = 'red';
		alert("Please enter company name.");
		companyName.focus();
		return false;
	}
	if (year.value == "") {
		year.style.borderColor = 'red';
		alert("Please enter year.");
		year.focus();
		return false;
	}
	if (college.value == "") {
		college.style.borderColor = 'red';
		alert("Please enter college.");
		college.focus();
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