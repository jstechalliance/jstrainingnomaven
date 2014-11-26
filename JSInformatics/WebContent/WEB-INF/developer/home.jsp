<%@include file="../common/chk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.List"%>
<%@page import="com.js.controller.AdminUtility"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>J S Informatics</title>
<meta name="keywords"
	content="glossy box, web design, colorful background, free templates, website templates, CSS, HTML" />
<meta name="description"
	content="Glossy Box | free website template with a colorful background" />
<link href="resources/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="resources/css/jquery.ennui.contentslider.css" rel="stylesheet"
	type="text/css" media="screen,projection" />
<script src="resources/js/jquery-1.9.0.js"></script>
</head>
<body>

	<div id="templatemo_wrapper_outer">
		<div id="templatemo_wrapper">

			<div id="templatemo_header">
				<div id="site_title">
					<h1>
						<a href="http://www.jsinformatis.com">J S Informatics<span>Passion
								to Excel</span></a>
					</h1>
				</div>
				<!-- end of site_title -->

				<ul id="social_box">
					<li><a href="#"><img src="resources/images/facebook.png"
							alt="facebook" /></a></li>
					<li><a href="#"><img src="resources/images/twitter.png"
							alt="twitter" /></a></li>
					<li><a href="#"><img src="resources/images/linkedin.png"
							alt="linkin" /></a></li>
					<li><a href="#"><img src="resources/images/technorati.png"
							alt="technorati" /></a></li>
					<li><a href="#"><img src="resources/images/myspace.png"
							alt="myspace" /></a></li>
				</ul>

				<div class="cleaner"></div>
			</div>

			<div id="templatemo_menu">
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="logout.jsi">Logout</a></li>

				</ul>
			</div>
			<!-- end of templatemo_menu -->

			<br />





			<div id="templatemo_content_wrapper">
				<div id="content" style="height: 640px;">
					<div class="latestEvent">
						<h3>Developer</h3>
						<%=request.getSession(false).getAttribute("USERFULLNAME")%>



					</div>
					<div class="hr_divider"></div>
					<div class="leftContent" style="width: 200px;height: 500px;">
						<h2>Error Log</h2>
						<br />
						<script type="text/javascript">
							function loadfile(value) {
// 								$.ajax({
// 									url : '../DownloadErrorLog?filename=' + value,
// 									type : 'get',
// 									success : function(response) {
// 										$('#detail_id').html(response);
// 									}
// 								});
								window.open('../DownloadErrorLog?filename=' + value, "popupWindowName", 
								  "dependent=yes, menubar=no, scrollbars=yes, resizable=1, toolbar=no,width800,height=600");
							}
						</script>
						<div style="overflow-y: scroll; width: 100%; height: 100%;">
							<%
								List<String> errorLogs = new AdminUtility().getAllErrorLog(request);
								for (int count =0;count<errorLogs.size();count++) {
									String log=errorLogs.get(count);
							%>
							<div onclick="loadfile('<%=log%>');">
								<a onclick="return false;"><%=log%></a>
							</div>
							<%
								}
							%>
						</div>
					</div>

					<div class="rightContent" style="width: 630px; height: 500px;">
						<h2>new event</h2>
						<div content="text/txt" style="overflow-x: scroll; width: 100%; height: 100%;"
							id="detail_id"></div>
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