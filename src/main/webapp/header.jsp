<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RealEstate Title</title>
    <!-- Include your CSS files, if any -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/feathericon.css">
    
    <style>
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background-color:white; /* Adjust as needed */
        color: white; /* Adjust as needed */
    }

    .navbar-left img {
        max-width: 100%;
        height: auto;
    }

    .navbar-right ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    .navbar-right li {
        margin-left: 10px;
    }

    /* Add the following styles for alignment */
    .navbar-right {
        margin-left: auto;
    }
</style>

</head>
<body>

<!-- Header Section -->
<nav class="navbar">
    <div class="navbar-left">
        <a href="dashboard.jsp">
            <img src="./images/logo/logo.png" style="width: 100%;" alt="Logo">
        </a>
    </div>
    
    <div class="navbar-right">
        <ul>
            <li>
                <a class="nav-link" href="profile.jsp">
                    <button type="button" class="btn btn-primary btn-block">Profile</button>
                </a>
            </li>
            
            <li>
                <a class="nav-link" href="logout.jsp">
                    <button type="button" class="btn btn-success">Logout</button>
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- /Header Section -->

<!-- Your Page Content Goes Here -->

<!-- Include your JavaScript files, if any -->
<script src="js/script.js"></script>

</body>
</html>
