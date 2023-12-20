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
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Admin RealEstate</title>

   <link rel="stylesheet" href="css/bootstrap.min.css">

    <title>Admin List</title>
</head>
<body>

<div class="content container-fluid">
   
 <!-- Main Wrapper -->
    <div class="main-wrapper">

    <!-- Include your header -->
    <jsp:include page="header.jsp" />
    <!-- header end -->
    
     <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->

    <!-- Main content -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Admin List</h3>
                        <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                                Welcome <%= username %>😊😊
                              </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <!-- /Page Header -->

            <!-- Admin List Table -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Admin List</h4>
                        </div>
                        <div class="card-body">
                            <table id="admin-datatable" class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                        <th>Phone</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int start = 0;
                                        int limit = 25;
                                        String usernameFilter = request.getParameter("username");
                                        String idFilter = request.getParameter("id");

                                        List<AddAdmin> adminList;

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

                                        AdminDAO adminDao = new AdminDAO();

                                        if (!whereClause.isEmpty()) {
                                            adminList = adminDao.getAllAdmins();
                                        } else {
                                            adminList = adminDao.getAllAdmins();
                                        }

                                        for (int i = 0; i < adminList.size(); i++) {
                                            AddAdmin admin = adminList.get(i);
                                    %>
                                    <tr>
                                        <td><%= admin.getAid() %></td>
                                        <td><%= admin.getAuser() %></td>
                                        <td><%= admin.getAemail() %></td>
                                        <td><%= admin.getApass() %></td>
                                        <td><%= admin.getAphone() %></td>
                                       
                                        <td>
                                            <a href="admindelete.jsp?id=<%= admin.getAid() %>">Delete</a>
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
            <!-- /Admin List Table -->
        </div>
    </div>
    </div>
    </div>
    <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Custom JS -->
    <script src="js/script.js"></script>
</body>
</html>

<%
   }
%>
