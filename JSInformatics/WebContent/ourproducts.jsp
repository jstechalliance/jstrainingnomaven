<%@page import="com.js.project.dto.ProductFeatures"%>
<%@page import="com.js.project.dto.OurProduct"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>
<%@include file="visitorheader.jsp"%>
<style>
.product_images_div {
	height: 400px;
	width: 225px;
}

.product_image {
	display: none;
	height: 400px;
	width: 225px;
	z-index: 99999;
	box-shadow: 0px 0px 20px #999;
	-moz-box-shadow: 0px 0px 20px #999;
	-webkit-box-shadow: 0px 0px 20px #999;
	border-radius: 3px 3px 3px 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	background-color: #000000;
}

.product_div_class {
	display: none;
	position: absolute;
	height: 400px;
	width: 856px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript">
var productArray= new Array();
<%

	List<Integer>productIdList= (List<Integer>)request.getAttribute("productIdList");
	for (int i=0; i<productIdList.size(); i++) {%>	
		productArray[productArray.length] ="<%=productIdList.get(i)%>";
<%}%>
	
</script>
<div id="templatemo_slider_wrapper" style="height: 440px;">
	<div style="width: 940px; height: 440px;">
		<div style="margin-top: 200px; position: absolute;">
			<img id="right_js_product_id" src="resources/images/templatemo_left_nav.png" />
		</div>
		<div style="float: right; margin-top: 200px;">
			<img id="left_js_product_id" src="resources/images/templatemo_right_nav.png" />
		</div>
		<div
			style="width: 856px; height: 410px; vertical-align: middle; padding: 15px 0; background-color: #000000; margin-left: auto; border-radius: 5px; margin-right: auto; opacity: 0.9;"
			align="center">
			<div style="width: 856px; height: 400px;" id="parent_product_div">

			</div>
		</div>

	</div>
</div>
<script type="text/javascript">
	var productImageCounts= new Array();
	$("#right_js_product_id").click(function() {
		privJSProductSlide('product_div_class');
	});
	$("#left_js_product_id").click(function() {
		nextJSProductSlide('product_div_class');
	});
	function imageCounterReset(){
		for(var i=0;i<productImageCounts.length;i++){
			productImageCounts[i]=0;
		}
	}
	function animationGallery(imageParentDiv) {
		var elements = $("#" + imageParentDiv).children();
		var count = 0;		
		var nextPCount0000 = 0;
		var divNoString = imageParentDiv.substr(17, imageParentDiv.length - 1);
		productImageCounts[divNoString]=count;
		setInterval(
				function() {
					if ($("#product_div_id" + divNoString).css('display') == "none") {
						productImageCounts[divNoString] = 0;
						for (var i = 0; i < elements.length; i++) {
							if ($(elements[i]).is(':visible')) {
								$(elements[i]).hide();
							}
						}
						$(elements[0]).show();
						return;
					}
					count=productImageCounts[divNoString];
					if (count == 0 && nextPCount0000 > 0) {
						if ($("#product_div_id" + divNoString).css('display') == "block") {
							nextJSProductSlide('product_div_class');
						}
					}
					/*if ($("#product_div_id" + divNoString).css('display') == "none") {
						for (var i = 0; i < elements.length; i++) {
							if ($(elements[i]).is(':visible')) {
								$(elements[i]).hide();
							}
						}
						return;
					}	*/
					var priCount = count - 1;
					if (priCount < 0) {
						priCount = elements.length - 1;
					}
					if ($("#product_div_id" + divNoString).css('display') == "block") {
						$(elements[priCount]).fadeOut(1000);
					}
					if ($("#product_div_id" + divNoString).css('display') == "block") {
						$(elements[count]).delay(1050).fadeIn(1000);
					}
					count++;
					if (count >= elements.length) {
						count = 0;
						nextPCount0000++;
					}
					productImageCounts[divNoString]=count;
				}, 5000);
	}
	var productDivElements;
	var productDivCount = 0;
	var nextPrivHolder = 0;
	var isProductLaoding = false;
	
	function nextJSProductSlide(divClass) {
		/*if(productArray.length==1){
			return;
		}*/
		if (nextPrivHolder != 0) {
			return;
		}
		nextPrivHolder++;	
		imageCounterReset();	
		setTimeout(function() {
			nextPrivHolder = 0;
		}, 1500);
		productDivElements = $("." + divClass);

		if (("" + productDivElements[productDivCount + 1]) == "undefined") {
			if ((productDivElements.length == (productDivCount + 1))
					&& (productDivElements.length < productArray.length)) {
				loadProductData(productArray[productDivCount + 1],
						productDivCount + 1);
			}
		}
		if (isProductLaoding == true) {
			setTimeout(function() {
				setTimeout(function() {
					hideAllImage();
				}, 0);
				productDivElements = $("." + divClass);
				//alert(productDivElements.length);
				$(productDivElements[productDivCount]).hide('slide', {
					direction : 'left'
				}, 1000);//slideLeftHide
				var count = productDivCount + 1;

				if (count >= productDivElements.length) {
					count = 0;
				}
				$(productDivElements[count]).show('slide', {
					direction : 'right'
				}, 1000);//slideRightShow
				productDivCount++;
				if (productDivCount >= productDivElements.length) {
					productDivCount = 0;
				}
				var imageEles = $("#id_product_images" + productDivCount).children();	
				setTimeout(function() {
					$(imageEles[0]).show();
				}, 100);			
				
			}, 500);
		} else {
			setTimeout(function() {
				hideAllImage();
			}, 0);
			productDivElements = $("." + divClass);
			//alert(productDivElements.length);
			$(productDivElements[productDivCount]).hide('slide', {
				direction : 'left'
			}, 1000);//slideLeftHide
			var count = productDivCount + 1;

			if (count >= productDivElements.length) {
				count = 0;
			}
			$(productDivElements[count]).show('slide', {
				direction : 'right'
			}, 1000);//slideRightShow
			productDivCount++;
			if (productDivCount >= productDivElements.length) {
				productDivCount = 0;
			}
			var imageEles = $("#id_product_images" + productDivCount).children();					
			setTimeout(function() {
				$(imageEles[0]).show();
			}, 100);	
		}
	}
	function hideAllImage() {
		var imageEles = $(".product_image");
		for (var i = 0; i < imageEles.length; i++) {
			$(imageEles[i]).hide();
		}		
	}
	function privJSProductSlide(divClass) {
		if (nextPrivHolder != 0) {
			return;
		}
		nextPrivHolder++;
		imageCounterReset();
		setTimeout(function() {
			hideAllImage();
		}, 0);
		setTimeout(function() {
			nextPrivHolder = 0;
		}, 1500);
		productDivElements = $("." + divClass);
		$(productDivElements[productDivCount]).hide('slide', {
			direction : 'right'
		}, 1000);//slideRightHide
		var count = productDivCount - 1;
		if (count <= 0) {
			count = productDivElements.length - 1;
		}
		$(productDivElements[count]).show('slide', {
			direction : 'left'
		}, 1000);//slideLeftShow
		productDivCount--;
		if (productDivCount <= 0) {
			productDivCount = productDivElements.length - 1;
		}
		var imageEles = $("#id_product_images" + productDivCount).children();
		setTimeout(function() {
			$(imageEles[0]).show();
		}, 100);	
	}
	function loadProductData(productId, productCount) {
		isProductLaoding = true;
		nextPrivHolder = 1;
		$.ajax({
			url : "productdiv.jsi?productId=" + productId + "&productCount="
					+ productCount,
			success : function(data) {
				$("#parent_product_div").append(data);
			}
		});
		setTimeout(function() {
			isProductLaoding = false;
			animationGallery("id_product_images" + productCount);
		}, 500);
	}

	if (productArray.length > 0) {
		loadProductData(productArray[0], 0);
		nextPrivHolder = 0;
	}

	//animationGallery("id_product_images0");
</script>
<%@include file="footer.jsp"%>
</div>
</div>
</body>
</html>