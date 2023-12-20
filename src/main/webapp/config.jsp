<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
    String dbUrl = "jdbc:mysql://localhost:3306/realstate";
    String dbUser = "root";
    String dbPassword = "";
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }

    if (con == null) {
        out.println("Failed to connect to MySQL");
    }
%>
