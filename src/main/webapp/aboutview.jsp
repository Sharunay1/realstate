<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddAbout" %>
<%@ page import="com.real.serviceimpl.AboutDAO" %>


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
        <title>LM Homes | About</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<link rel="stylesheet" href="css/bootstrap.min.css">
	 
	  <link rel="stylesheet" href="css/YouTubePopUp.css">
	  
    </head>
    <body>
	
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
								<h3 class="page-title">View About</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">View About</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">List Of About</h4>
									
								</div>
								<div class="card-body">

									<div class="table-responsive">
										<table class="table table-stripped">
											<thead>
												<tr>
													<th>Id</th>
													<th>Title</th>
													<th>Content</th>
													<th>Image</th>
													<th>Delete</th>	
												</tr>
											</thead>
											
											<tbody>
												    <%
												        int start = 0;
												        int limit = 25;
												        String usernameFilter = request.getParameter("username");
												        String idFilter = request.getParameter("id");
												
												        List<AddAbout> resultSet;
												
												        String whereClause = "";
												
												        if (usernameFilter != null && !usernameFilter.isEmpty()) {
												            whereClause = "username = '" + usernameFilter + "'";
												        }
												
												        if (idFilter != null && !idFilter.isEmpty()) {
												            if (!whereClause.isEmpty()) {
												                whereClause += " AND ";
												            }
												            whereClause += "id = '" + idFilter + "'";
												        }
												
												        AboutDAO aboutDao = new AboutDAO();
												
												        if (!whereClause.isEmpty()) {
												            resultSet = aboutDao.getAllAbouts();
												        } else {
												            resultSet = aboutDao.getAllAbouts();
												        }
												
												        for (int i = 0; i < resultSet.size(); i++) {
												            AddAbout about = resultSet.get(i);
												    %>
												    <tr>
												        <td><%= about.getId() %></td>
												        <td><%= about.getTitle() %></td>
												        <td><%= about.getContent() %></td>
												        <td><%= about.getImage() %></td>
												        <td>
												        
												            <a href="aboutdelete.jsp?id=<%= about.getId() %>">Delete</a>
												        </td>
												    </tr>
												    <%
												        }
												    %>
												</tbody>


												
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>			
			</div>
			</div>
			<!-- /Main Wrapper -->

		
		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
		
		
		
		<!-- Custom JS -->
		<script  src="js/script.js"></script>
		
    </body>
</html>
<%
   }
%>