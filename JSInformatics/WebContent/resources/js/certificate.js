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