<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
    // Include config.jsp
    %><%@ include file="config.jsp" %><%

    String contactId = request.getParameter("id");
    String msg = "";

    String deleteContactSql = "DELETE FROM contact WHERE contact_id = ?";
    try (Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
         PreparedStatement deleteContactStatement = connection.prepareStatement(deleteContactSql)) {

        deleteContactStatement.setString(1, contactId);
        int rowsAffected = deleteContactStatement.executeUpdate();

        if (rowsAffected > 0) {
            msg = "<p class='alert alert-success'>Contact Deleted</p>";
            response.sendRedirect("contact_list.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
        } else {
            msg = "<p class='alert alert-warning'>Contact Not Deleted</p>";
            response.sendRedirect("contact_list.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
