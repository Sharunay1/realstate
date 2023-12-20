<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
<link rel="shortcut icon" href="images/favicon.ico">

<!--	Fonts
	========================================================-->
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,500,600,700&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">

<!--	Css Link
	========================================================-->

<link rel="stylesheet" href="css/bootstrap.min.css">
	 
	  <link rel="stylesheet" href="css/YouTubePopUp.css">
	  
<link rel="stylesheet" type="text/css" href="css/bootstrap-slider.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/layerslider.css">
<link rel="stylesheet" type="text/css" href="css/color.css">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/flaticon.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<!--	Title
	=========================================================-->
<title>Homex - Real Estate Template</title>
</head>
<body>

<!--	Page Loader
=============================================================
<div class="page-loader position-fixed z-index-9999 w-100 bg-white vh-100">
	<div class="d-flex justify-content-center y-middle position-relative">
	  <div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
	  </div>
	</div>
</div>
--> 


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
        
       
        
        <!--	Banner   --->
        <div class="banner-full-row page-banner" style="background-image:url('images/breadcromb.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="page-name float-left text-white text-uppercase mt-1 mb-0"><b>Profile</b></h2>
                    </div>
                    <div class="col-md-6">
                        <nav aria-label="breadcrumb" class="float-left float-md-right">
                            <ol class="breadcrumb bg-transparent m-0 p-0">
                                <li class="breadcrumb-item text-white"><a href="index.jsp">Home</a></li>
                                <li class="breadcrumb-item active">Profile</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
         <!--	Banner   --->
		 
		 
		<!--	Submit property   -->
        <div class="full-row">
            <div class="container">
                    <div class="row">
						<div class="col-lg-12">
							<h2 class="text-secondary double-down-line text-center">Profile</h2>
                        </div>
					</div>
                <div class="dashboard-personal-info p-5 bg-white">
                    <form action="#" method="post">
                        <h5 class="text-secondary border-bottom-on-white pb-3 mb-4">Feedback Form</h5>
					
                        <div class="row">
                            <div class="col-lg-6 col-md-12">
                                <div class="form-group">
                                    <label for="user-id">Name</label>
                                    <input type="text" name="name" class="form-control" placeholder="Enter Name">
                                </div>                
                                
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="text" name="phone"  class="form-control" placeholder="Enter Phone" maxlength="10">
                                </div>

                                <div class="form-group">
                                    <label for="about-me">Description</label>
                                    <textarea class="form-control" name="content" rows="7" placeholder="Enter Description"></textarea>
                                </div>
                                <input type="submit" class="btn btn-primary mb-4" name="insert" value="Send">
                            </div>
                            </div>
							</form>
                            <div class="col-lg-1"></div>
                            <div class="col-lg-5 col-md-12">
							        <div class="user-info mt-md-50"> <img src="admin/user/1.jpg" alt="userimage">
                                    <div class="mb-4 mt-3">
								    <%
								       
								        ResultSet rs = (ResultSet) request.getAttribute("resultSet"); 
								
								        // Check if rs is not null before using it
								        if (rs != null && rs.next()) {
								    %>
								</div>
								<div class="font-18">
								    <div class="mb-1 text-capitalize"><b>Name:</b> <%= rs.getString("1") %></div>
								    <div class="mb-1 text-capitalize"><b>Email:</b> <%= rs.getString("2") %></div>
								    <div class="mb-1 text-capitalize"><b>Phone:</b> <%= rs.getString("3") %></div>
								    <div class="mb-1 text-capitalize"><b>Role:</b> <%= rs.getString("5") %></div>
								</div>
								<%
								        } else {
								%>
								    
								<%
								        }
								%>

									
                                </div>
                            </div>
                        </div>
                    
                </div>            
            </div>
        </div>
	<!--	Submit property   -->
        
        
        <!--	Footer   start-->
		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start-->
        
        <!-- Scroll to top --> 
        <a href="#" class="bg-secondary text-white hover-text-secondary" id="scroll"><i class="fas fa-angle-up"></i></a> 
        <!-- End Scroll To top --> 
    </div>

<!-- Wrapper End --> 

<!--	Js Link
============================================================--> 
<script src="js/jquery.min.js"></script> 
<!--jQuery Layer Slider --> 
<script src="js/greensock.js"></script> 
<script src="js/layerslider.transitions.js"></script> 
<script src="js/layerslider.kreaturamedia.jquery.js"></script> 
<!--jQuery Layer Slider --> 
<script src="js/popper.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/owl.carousel.min.js"></script> 
<script src="js/tmpl.js"></script> 
<script src="js/jquery.dependClass-0.1.js"></script> 
<script src="js/draggable-0.1.js"></script> 
<script src="js/jquery.slider.js"></script> 
<script src="js/wow.js"></script> 
<script src="js/custom.js"></script>

<!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Custom JS -->
    <script src="js/script.js"></script>
</body>
</html>

<%
   }
%>