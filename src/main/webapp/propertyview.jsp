<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.real.bean.AddProperty" %>
<%@ page import="com.real.serviceimpl.PropertyDAO" %>

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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Ventura - Data Tables</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
		
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
		
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
	
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
								<h3 class="page-title">Property</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Property</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					
					
					
					<div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">

                                        <h4 class="header-title mt-0 mb-4">Property View</h4>
										
                                        <table id="datatable-buttons" class="table table-striped dt-responsive nowrap">
                                            <thead>
                                                <tr>
                                                    <th>P ID</th>
                                                    <th>Title</th>
                                                    <th>Description</th>
                                                    <th>Type</th>
                                                    <th>BHK</th>
                                                    <th>Selling Type</th>
													<th>Bedroom</th>
                                                    <th>Bathroom</th>
                                                    <th>Balcony</th>
                                                    <th>Kitchen</th>
                                                    <th>Hall</th>
                                                    <th>Floor</th>
													<th>Area Size</th>
                                                    <th>Price</th>
                                                    <th>Location</th>
                                                    <th>City</th>
                                                    <th>State</th>
                                                    <th>Feature</th>
													<th>Image1</th>
                                                    <th>Image2</th>
                                                    <th>Image3</th>
                                                    <th>Image4</th>
                                                    <th>Image5</th>
                                                    <th>Uid</th>
													<th>Status</th>
                                                    <th>Floor Plan</th>
                                                    <th>Basement Plan</th>
													<th>Ground Floor Plan</th>
                                                    <th>Total Floor</th>
                                                    <th>Date</th>
                                                    <th>Edit</th>
                                                    <th>Delete</th>
                                                    
                                                </tr>
                                            </thead>
                                        
                                        
                                           <tbody>
										    <%
										        int start = 0;
										        int limit = 25;
										        String usernameFilter = request.getParameter("username");
										        String idFilter = request.getParameter("id");
										
										        List<AddProperty> resultSet;
										
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
										
										        PropertyDAO propertyDao = new PropertyDAO();
										
										        if (!whereClause.isEmpty()) {
										            resultSet = propertyDao.getAllProperties();
										        } else {
										            resultSet = propertyDao.getAllProperties();
										        }
										
										        for (int i = 0; i < resultSet.size(); i++) {
										            AddProperty property = resultSet.get(i);
										    %>
										    <tr>
										        <td><%= property.getPid() %></td>
										        <td><%= property.getTitle() %></td>
										        <td><%= property.getPcontent() %></td>
										        <td><%= property.getType() %></td>
										        <td><%= property.getBhk() %></td>
										        <td><%= property.getStype() %></td>
										        <td><%= property.getBedroom() %></td>
										        <td><%= property.getBathroom() %></td>
										        <td><%= property.getBalcony() %></td>
										        <td><%= property.getKitchen() %></td>
										        <td><%= property.getHall() %></td>
										        <td><%= property.getFloor() %></td>
										        <td><%= property.getSize() %></td>
										        <td><%= property.getPrice() %></td>
										        <td><%= property.getLocation() %></td>
										        <td><%= property.getCity() %></td>
										        <td><%= property.getState() %></td>
										        <td><%= property.getFeature() %></td>
										        <td><%= property.getPimage() %></td>
										        <td><%= property.getPimage1() %></td>
										        <td><%= property.getPimage2() %></td>
										        <td><%= property.getPimage3() %></td>
										        <td><%= property.getPimage4() %></td>
										        <td><%= property.getUid() %></td>
										        <td><%= property.getStatus() %></td>
										        <td><%= property.getMapimage() %></td>
										        <td><%= property.getTopmapimage() %></td>
										        <td><%= property.getGroundmapimage() %></td>
										        <td><%= property.getTotalfloor() %></td>
										        <td><%= property.getDate() %></td>
										        <td>
										            <a href="propertydelete.jsp?id=<%= property.getPid() %>">Delete</a>
										        </td>
										    </tr>
										    <%
										        }
										    %>
										</tbody>                                   
										     </table>
                                        
                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->
					
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
		
    </body>
</html>
