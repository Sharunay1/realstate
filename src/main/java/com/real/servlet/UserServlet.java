	package com.real.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.real.bean.AddRoles;
import com.real.bean.AddUserlist;
import com.real.serviceimpl.AddUserlistServiceimpl;
import com.real.utility.DBUtil;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // default action
        }

        switch (action) {
            case "list":
                listUsers(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUsers(request, response);
        }
    }	

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // default action
        }

        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            default:
                listUsers(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<AddUserlist> userList = AddUserlistServiceimpl.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("userlist.jsp").forward(request, response);
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        AddUserlist user = AddUserlistServiceimpl.getUserById(userId);
        List<AddRoles> roleList = getAllRoles(); 
        request.setAttribute("user", user);
        request.setAttribute("roleList", roleList);
        request.getRequestDispatcher("Roles.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        AddUserlistServiceimpl.deleteUser(userId);
        listUsers(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String image = request.getParameter("image");
        int roleId = Integer.parseInt(request.getParameter("roleId"));

        AddUserlist user = new AddUserlist();
        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setImage(image);
        user.setRoleId(roleId);

        AddUserlistServiceimpl.addUser(user);
        listUsers(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String image = request.getParameter("image");
        int roleId = Integer.parseInt(request.getParameter("roleId"));

        AddUserlist user = new AddUserlist();
        user.setId(userId);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setImage(image);
        user.setRoleId(roleId);

        AddUserlistServiceimpl.updateUser(user);
        listUsers(request, response);
    }

    public static List<AddRoles> getAllRoles() {
        List<AddRoles> roleList = new ArrayList<>();
        Connection connection = null;
        java.sql.PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
 
        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT RoleID, RoleName, Description FROM roles";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AddRoles role = new AddRoles();
                role.setRoleID(resultSet.getString("RoleID"));
                role.setRoleName(resultSet.getString("RoleName"));
                role.setDescription(resultSet.getString("Description"));

                roleList.add(role);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //... existing code
        }

        return roleList;
    }
}