<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
    // Include config.jsp
    %><%@ include file="config.jsp" %><%

    String cid = request.getParameter("id");
    String msg = "";

    String deleteSql = "DELETE FROM contact WHERE cid = ?";
    try (Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
         PreparedStatement deleteStatement = connection.prepareStatement(deleteSql)) {

        deleteStatement.setString(1, cid);
        int rowsAffected = deleteStatement.executeUpdate();

        if (rowsAffected > 0) {
            msg = "<p class='alert alert-success'>Contact Deleted</p>";
            response.sendRedirect("contactview.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
        } else {
            msg = "<p class='alert alert-warning'>Contact Not Deleted</p>";
            response.sendRedirect("contactview.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
