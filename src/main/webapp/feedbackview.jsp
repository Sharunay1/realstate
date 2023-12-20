<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddFeedback" %>
<%@ page import="com.real.serviceimpl.FeedbackDAO" %>

<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>LM Homes | Admin</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="css/feathericon.min.css">
		
		<!-- Datatables CSS -->
		<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" href="css/responsive.bootstrap4.min.css">
		<link rel="stylesheet" href="css/select.bootstrap4.min.css">
		<link rel="stylesheet" href="css/buttons.bootstrap4.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
		
    </head>
    <body>
	<form action="./AddFeedbackSevlet" method="post">
		<!-- Main Wrapper -->
		
			<!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
      
      <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->
		 
			<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">

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
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Feedback List</h4>
									
								</div>
								<div class="card-body">
                                                 <div class="form-group row">
													<label class="col-lg-2 col-form-label">Feedback Id</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="fid">
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
												<div>
										<button type="submit" value="send message" name="send" class="btn btn-primary">Submit</button>
												
												</div>
												
									<table id="basic-datatable" class="table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Feedback</th>
													<th>Status</th>
                                                    <th>Date</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            
                                        	<tbody>
                                          <%
											    int start = 0;
											    int limit = 25;
											    String usernameFilter = request.getParameter("username");
											    String idFilter = request.getParameter("id");
											
											    List<AddFeedback> resultSet;
											
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
											
											    FeedbackDAO feedbackDao = new FeedbackDAO();
											
											    if (!whereClause.isEmpty()) {
											        resultSet = feedbackDao.getAllFeedbacks();
											    } else {
											        resultSet = feedbackDao.getAllFeedbacks();
											    }
											
											        for (int i = 0; i < resultSet.size(); i++) {
											            AddFeedback feedback = resultSet.get(i);
											    %>
											    <tr>
											        <td><%= feedback.getFid() %></td>
											        <td><%= feedback.getName() %></td>
											        <td><%= feedback.getEmail() %></td>
											        <td><%= feedback.getFdescription() %></td>
											        <td><%= feedback.getStatus() %></td>
											        <td><%= feedback.getDate() %></td>
											        <td>
											            <a href="feedbackdelete.jsp?id=<%= feedback.getFid() %>">Delete</a>
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
			<!-- /Main Wrapper -->

		
		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Datatables JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>
		<script src="js/dataTables.responsive.min.js"></script>
		<script src="js/responsive.bootstrap4.min.js"></script>
		
		<script src="js/dataTables.select.min.js"></script>
		
		<script src="js/dataTables.buttons.min.js"></script>
		<script src="js/buttons.bootstrap4.min.js"></script>
		<script src="js/buttons.html5.min.js"></script>
		<script src="js/buttons.flash.min.js"></script>
		<script src="js/buttons.print.min.js"></script>
		
		<!-- Custom JS -->
		<script  src="js/script.js"></script>
		</form>
    </body>
</html>
