<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
    // Include config.jsp
    %><%@ include file="config.jsp" %><%

    String fid = request.getParameter("id");
    String msg = "";

    String deleteSql = "DELETE FROM feedback WHERE fid = ?";
    try (Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
         PreparedStatement deleteStatement = connection.prepareStatement(deleteSql)) {

        deleteStatement.setString(1, fid);
        int rowsAffected = deleteStatement.executeUpdate();

        if (rowsAffected > 0) {
            msg = "<p class='alert alert-success'>Feedback Deleted</p>";
            response.sendRedirect("feedbackview.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
        } else {
            msg = "<p class='alert alert-warning'>Feedback Not Deleted</p>";
            response.sendRedirect("feedbackview.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
