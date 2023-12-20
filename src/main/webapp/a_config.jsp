<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<%
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/realstate";
        String username = "root";
        String password = "";
        con = DriverManager.getConnection(url, username, password);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    if (con != null) {
        out.println("Successfully connected to MySQL");
        // Perform any database operations here
        // ...
        // Close the connection when done
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } else {
        out.println("Failed to connect to MySQL");
    }
%>
