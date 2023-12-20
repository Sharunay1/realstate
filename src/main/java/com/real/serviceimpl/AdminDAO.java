package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.real.bean.AddAdmin;
import com.real.utility.DBUtil;

public class AdminDAO {

    private static final Logger logger = Logger.getLogger(AdminDAO.class.getName());

    public List<AddAdmin> getAllAdmins() {
        List<AddAdmin> adminList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM admin")) {

            while (resultSet.next()) {
                AddAdmin admin = new AddAdmin();
                admin.setAid(resultSet.getString("aid"));
                admin.setAuser(resultSet.getString("auser"));
                admin.setAemail(resultSet.getString("aemail"));
                admin.setApass(resultSet.getString("apass"));
                admin.setAphone(resultSet.getString("aphone"));

                adminList.add(admin);
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching all admins", e);
        }
        return adminList;
    }

    public AddAdmin getAdminById(String adminId) {
        AddAdmin admin = null;
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM admin WHERE aid = ?")) {

            preparedStatement.setString(1, adminId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    admin = new AddAdmin();
                    admin.setAid(resultSet.getString("aid"));
                    admin.setAuser(resultSet.getString("auser"));
                    admin.setAemail(resultSet.getString("aemail"));
                    admin.setApass(resultSet.getString("apass"));
                    admin.setAphone(resultSet.getString("aphone"));
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching admin by ID", e);
        }
        return admin;
    }

    public boolean addAdmin(AddAdmin admin) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO admin (auser, aemail, apass, aphone) VALUES (?, ?, ?, ?)")) {

            preparedStatement.setString(1, admin.getAuser());
            preparedStatement.setString(2, admin.getAemail());
            preparedStatement.setString(3, admin.getApass());
            preparedStatement.setString(4, admin.getAphone());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error adding admin", e);
            return false;
        }
    }

    public boolean updateAdmin(AddAdmin admin) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE admin SET auser = ?, aemail = ?, apass = ?, aphone = ? WHERE aid = ?")) {

            preparedStatement.setString(1, admin.getAuser());
            preparedStatement.setString(2, admin.getAemail());
            preparedStatement.setString(3, admin.getApass());
            preparedStatement.setString(4, admin.getAphone());
            preparedStatement.setString(5, admin.getAid());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating admin", e);
            return false;
        }
    }

    public boolean deleteAdmin(String adminId) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM admin WHERE aid = ?")) {

            preparedStatement.setString(1, adminId);

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error deleting admin", e);
            return false;
        }
    }
}
