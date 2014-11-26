function approvePayment(paymentid,id,count,p_apprive_id){
	
	$.post("approvepayment.jsp?payment_id="+paymentid+"").success(
			function(response) {				
				var res=trimExtraSpaces(response);		
				if(res.indexOf('SUCCESSFULLY')!=-1){
					document.getElementById("p_approve_id_"+p_apprive_id).innerHTML="Approved";
					var no_use=new Array();	
					ShowSuccessMessageDialog("Enquiry Message",res,no_use);
				}
				else if(res.indexOf('NOT')!=-1){
					ShowErrorMessageDialog("Enquiry Message",res);
				}		
				else{
					ShowErrorMessageDialog("Enquiry Message",res);
				}			
				var max=document.getElementById("maxvalue"+count).value;
				closeRemark(max);
			}).error(function(e) {
		alert(e);
	});
	
	return false;
	
}