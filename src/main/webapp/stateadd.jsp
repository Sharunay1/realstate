
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
        <link rel="stylesheet" href="assets/css/style.css">
		
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
	
	<form action="./AddStateServlet" method="post">
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
								<h3 class="page-title">State</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">State</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
				<!-- state add section --> 
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h1 class="card-title">Add State</h1>
									<?jsp echo $error;?>
									<?jsp echo $msg;?>
									<?jsp 
										if(isset($_GET['msg']))	
										echo $_GET['msg'];	
									?>
								</div>
								
									<div class="card-body">
											<div class="row">
												<div class="col-xl-6">
													<h5 class="card-title">State Details</h5>
													<div class="form-group row">
														<label class="col-lg-3 col-form-label">State Name</label>
														<div class="col-lg-9">
															<input type="text" class="form-control" name="state">
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
				<!----End state add section  --->
				
				<!----view state  --->
				<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">State List</h4>
									
								</div>
								<div class="card-body">

									<table id="basic-datatable" class="table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>State Name</th>
													<th>Edit</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                        
                                        
                                            <tbody>
											<?jsp
													
												$query=mysqli_query($con,"select * from state");
												
												while($row=mysqli_fetch_row($query))
													{
											?>
                                                <tr>
                                                    
                                                    <td><?jsp echo $row['0']; ?></td>
                                                    <td><?jsp echo $row['1']; ?></td>
													<td><a href="stateedit.jsp?id=<?jsp echo $row['0']; ?>">Edit</a></td>
                                                    <td><a href="statedelete.jsp?id=<?jsp echo $row['0']; ?>">Delete</a></td>
                                                </tr>
                                                <?jsp } ?>

                                            </tbody>
                                        </table>
								</div>
							</div>
						</div>
					</div>
				<!-- view state -->
				</div>			
			</div>
			<!-- /Main Wrapper -->
			<!---
			
			<label class="col-lg-3 col-form-label">State Name</label>
													<div class="col-lg-9">	
														<select class="form-control">
															<option>Select</option>
															<option>Option 1</option>
															<option>Option 2</option>
															<option>Option 3</option>
															<option>Option 4</option>
															<option>Option 5</option>
														</select>
													</div>
			
			---->

		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Datatables JS -->
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
