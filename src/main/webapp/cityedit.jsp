<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddAdmin" %>
<%@ page import="com.real.serviceimpl.AdminDAO" %>

<%
HttpSession sdsession = request.getSession(true);

// Retrieve the username attribute from the session
String username = (String) sdsession.getAttribute("username");
String roleIDString = (String) sdsession.getAttribute("RoleID");

// Check if the user is logged in or redirect to the login page
if (roleIDString == null) {
    response.sendRedirect("login.jsp"); // Change "login.jsp" to your actual login page
} else {
    // Rest of your content for the logged-in user
%>

<!DOCTYPE html>
<html lang="en">

<head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
        <title>Ventura - Data Tables</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<link rel="stylesheet" href="css/bootstrap.min.css">
	 
	  <link rel="stylesheet" href="css/YouTubePopUp.css">
    </head>
    <body>
	<form action="./EditCityServlet" method="post">
		<!-- Main Wrapper -->
		
		<div class="content container-fluid">
    <!-- Your page content remains the same -->
 
 <!-- Main Wrapper -->
    <div class="main-wrapper">
		
		
<!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
      
      <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
              

					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col">
								<h3 class="page-title">State</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
									<li class="breadcrumb-item active">State</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
				<!-- city add section --> 
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h1 class="card-title">Add City</h1>
									
								</div>
								
									<div class="card-body">
											<div class="row">
												<div class="col-xl-6">
													<h5 class="card-title">City Details</h5>
													<div class="form-group row">
														<label class="col-lg-3 col-form-label">City ID</label>
														<div class="col-lg-9">
															<input type="text" class="form-control" name="id">
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-lg-3 col-form-label">City Name</label>
														<div class="col-lg-9">
															<input type="text" class="form-control" name="ucity">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-lg-3 col-form-label">State Name</label>
														<div class="col-lg-9" >	
															<input type="text" class="form-control" name="statename">
														</div>
													</div>
												</div>
											</div>
											<div class="text-left">
												<input type="submit" class="btn btn-primary"  value="Submit" name="insert" style="margin-left:200px;">
											</div>
									</div>
								
							</div>
						</div>
					</div>
				<!----End City add section  --->

				</div>			
			</div>
		</div>	
			<!-- /Main Wrapper -->
			

		<!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Custom JS -->
    <script src="js/script.js"></script>
		</form>
    </body>
</html>

<%
   }
%>