<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Initialize the session
    session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>

<h2>You have been successfully logged out.</h2>
<%
    // Redirect to login page
    response.sendRedirect("index.jsp");
%>

</body>
</html>
