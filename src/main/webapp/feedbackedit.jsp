<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>

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
        <title>LM HOMES | About</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
       <link rel="stylesheet" href="css/bootstrap.min.css">
	 
	  <link rel="stylesheet" href="css/YouTubePopUp.css">
		
		 <!-- Fontawesome CSS
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		Feathericon CSS
        <link rel="stylesheet" href="css/feathericon.min.css">
		
		Select2 CSS
		<link rel="stylesheet" href="css/select2.min.css">
		
		Main CSS
        <link rel="stylesheet" href="css/style.css">
		 
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
	<form action="./EditFeedbackServlet" method="post">
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
								<h3 class="page-title">Feedback</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Feedback</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h2 class="card-title">Update Feedback</h2>
								</div>
								
								
								<div class="card-body">
										<div class="row">
											<div class="col-xl-12">
												<h5 class="card-title">Update Feedback</h5>
												
												
												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Feedback Id</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="id">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Name</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="name">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Email</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="email">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Description</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="description">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-2 col-form-label">Status</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="status">
													</div>
												</div>
												<div class="form-group">
														<label>Date</label>
														<div class="cal-icon">
															<input class="form-control datetimepicker" name="date" type="text">
														</div>
													</div>
												
											</div>
										</div>
										<div class="text-left">
											<input type="submit" class="btn btn-primary"  value="Submit" name="update" style="margin-left:200px;">
										</div>
										</div>
									
									
								</div>
								
							</div>
						</div>
					</div>
					
					</div>
				</div>
			
			<!-- /Page Wrapper -->
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