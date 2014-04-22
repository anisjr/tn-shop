+<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>
<%@ page import="cloudupload.Upload"%>
<!--gmail -->
<%@ page import="com.google.appengine.api.users.*"%>
<%
	UserService userService = UserServiceFactory.getUserService();
%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="Head.jsp"%>
</head>
<body>
	<div id="header">
		<jsp:include page="Header.jsp" />
	</div>
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<%@ include file="Sidebar.jsp"%>
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
						<li><a href="products.jsp">Products</a> <span class="divider">/</span></li>
						<li class="active">product Details</li>
					</ul>
						<%
								Upload uploads = (Upload) request.getAttribute("uploads");
							%>
					<div class="row">
						<div id="gallery" class="span3">
							 <img
								src="<%=uploads.getUrl() %>"
								 />
							</a>
							
						</div>

						<div class="span6">
						
							<h3><%=uploads.getTitle()%>
							</h3>
							<small>-<%=uploads.getDescription()%></small>
							<hr class="soft" />
							<form class="form-horizontal qtyFrm">
								<div class="control-group">
									<label class="control-label"><span><%=uploads.getprix()%></span></label>
									<div class="controls">
										<input type="number" class="span1" placeholder="Qty." />
										<button type="submit"
											class="btn btn-large btn-primary pull-right">
											Add to cart <i class=" icon-shopping-cart"></i>
										</button>
									</div>
								</div>
							</form>

							<hr class="soft" />
							<form class="form-horizontal qtyFrm pull-right">
								<div class="control-group">
									<label class="control-label"><span>Color</span></label>
									<div class="controls">
										<select class="span2">
											<option>Black</option>
											<option>Red</option>
											<option>Blue</option>
											<option>Brown</option>
										</select>
									</div>
								</div>
							</form>
							<hr class="soft clr" />
							<p><%=uploads.getDescription_d()%>.</p>
							<br class="clr" />

							<hr class="soft" />

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->
	<!-- Footer ================================================================== -->
	<%@ include file="Footer.jsp"%>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>

	<!-- Themes switcher section ============================================================================================= -->
	<%@ include file="ThemeSwitcher.jsp"%>
	<span id="themesBtn"></span>
</body>
</html>