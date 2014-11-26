<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Asynchronous file Upload in Java Web Application</title>
<script src="resources/js/jquery-1.9.0.js"></script>
<script src="resources/js/jquery.ajaxfileupload.js"></script>
<script language="Javascript">
	$(document).ready(function() {
		$('#studentImage').ajaxfileupload({
			'action' : 'UploadFile',
			'Content-Type' : 'application/json',
			'onComplete' : function(res) {
				$('#upload').hide();
				
				if (res == 'faild') {
					alert("File upload faild.");
				} else {
					$('#my_image').attr("src", "../../student_image/"+ res);
				}
				
			},
			'onStart' : function() {
				$('#upload').show();
			}
		});
	});
	function trimExtraSpaces(theField) {
		var trimValue = "";
		trimValue = theField.toUpperCase();
		trimValue = trimValue.replace(/\s+/g, " ");
		trimValue = trimValue.replace(/^\s+|\s+$/g, "");
		return trimValue;
	}
</script>
</head>
<body>

	<div>
		<input id="studentImage" type="file" name="datafile" /> <img
			id="my_image" alt="" src="">
		<div id="upload" style="display: none;">Uploading..</div>
	</div>

</body>
</html>