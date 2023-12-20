<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.io.File" %>

<%
    // Include config.jsp
    %><%@ include file="config.jsp" %><%

    String aid = request.getParameter("id");
    String img = "";

   
    String viewSql = "SELECT * FROM about WHERE id = ?";
    try (Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
         PreparedStatement viewStatement = connection.prepareStatement(viewSql)) {

        viewStatement.setString(1, aid);
        ResultSet viewResult = viewStatement.executeQuery();

        while (viewResult.next()) {
            img = viewResult.getString("image");
        }

        // Delete the file
        File fileToDelete = new File("upload", img);
        if (fileToDelete.exists()) {
            fileToDelete.delete();
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    // End view code

    String msg = "";
    String deleteSql = "DELETE FROM about WHERE id = ?";
    try (Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
         PreparedStatement deleteStatement = connection.prepareStatement(deleteSql)) {

        deleteStatement.setString(1, aid);
        int rowsAffected = deleteStatement.executeUpdate();

        if (rowsAffected > 0) {
            msg = "<p class='alert alert-success'>About Deleted</p>";
            response.sendRedirect("aboutview.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
        } else {
            msg = "<p class='alert alert-warning'>About not Deleted</p>";
            response.sendRedirect("aboutview.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
