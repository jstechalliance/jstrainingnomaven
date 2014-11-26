<%@page import="com.js.project.dto.ProductImages"%>
<%@page import="java.util.Set"%>
<%@page import="com.js.project.dto.ProductEnvironment"%>
<%@page import="com.js.project.dto.ProductFeatures"%>
<%@page import="com.js.project.dto.OurProduct"%>
<%@page import="java.util.List"%>

<%
	//int productId = Integer.parseInt((request.getParameter("productId").trim()));
	//int pCount001 = Integer.parseInt((request.getParameter("productCount").trim()));
	
	int pCount001 = Integer.parseInt(""+request.getAttribute("productCount"));
	OurProduct project = (OurProduct)request.getAttribute("ourProduct");
	if (project != null) {
		String hideDisplay = "";
		if (pCount001 == 0) {
			hideDisplay = "style='display: block;'";
		}
%>
<div <%=hideDisplay%> class="product_div_class"
	id="product_div_id<%=pCount001%>">
	<table
		style="height: 400px; width: 300px; vertical-align: middle; float: left;">
		<tr>
			<td align="center">
				<div class="product_images_div" id="id_product_images<%=pCount001%>">
					<%
						Set<ProductImages> images = project.getProjectImages();
																int t=0;
																for (ProductImages projectImages : images) {
																	String si="";
																	if(t==0){
																		si="style='display: block;'";
																	}
					%> 
					<img <%=si%> class="product_image"
						src="<%=projectImages.getImagePath()%>" align="middle" />
					<%
						t++;}
					%>
				</div>
			</td>
		</tr>
	</table>
	<div style="height: 400px; padding-top: 15px; padding-right: 20px;">
		<h3><%=project.getProductTitle()%></h3>
		<br>
		<p style="text-align: justify; color: #59aaff;">Feature :</p>
		<table width="64%">
			<tbody style="line-height: 15px;color: white;">
				<%
					int featureCount = 0;
										for (ProductFeatures features : project.getProjectFeatures()) {
											if (featureCount % 2 == 0) {
												out.println("<tr>");
											}
				%>
				<td valign="top"><b style="color: #FFFFFF;"><%=(featureCount + 1)%>.</b> <%=features.getFeatureName()%></td>
				<%
					if (featureCount % 2 == 1) {
										out.println("</tr>");
									}
									featureCount++;
								}
				%>
			</tbody>
		</table>
		<br>
		<p style="text-align: justify; color: #59aaff;">Environment :</p>
		<table width="64%" style="color: white;">
			<tr>
				<td>
					<%
						for (ProductEnvironment environment : project
												.getProjectEnvironments()) {
											out.println(environment.getEnvName() + ", ");
										}
					%>

				</td>
			</tr>
		</table>
	</div>
</div>
<%
	}
%>