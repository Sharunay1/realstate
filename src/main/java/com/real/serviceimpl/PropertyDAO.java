package com.real.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.real.bean.AddProperty;
import com.real.utility.DBUtil;

public class PropertyDAO {

    private static final Logger logger = Logger.getLogger(PropertyDAO.class.getName());

    public List<AddProperty> getAllProperties() {
        List<AddProperty> propertyList = new ArrayList<>();
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT pid, title, pcontent, type, bhk, stype, bedroom, bathroom, balcony, kitchen, hall, floor, size, price, location, city, state, feature, pimage, pimage1, pimage2, pimage3, pimage4, uid, status, mapimage, topmapimage, groundmapimage, totalfloor, date FROM property");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AddProperty property = new AddProperty();
                property.setPid(resultSet.getString("pid"));
                property.setTitle(resultSet.getString("title"));
                property.setPcontent(resultSet.getString("pcontent"));
                property.setType(resultSet.getString("type"));
                property.setBhk(resultSet.getString("bhk"));
                property.setStype(resultSet.getString("stype"));
                property.setBedroom(resultSet.getString("bedroom"));
                property.setBathroom(resultSet.getString("bathroom"));
                property.setBalcony(resultSet.getString("balcony"));
                property.setKitchen(resultSet.getString("kitchen"));
                property.setHall(resultSet.getString("hall"));
                property.setFloor(resultSet.getString("floor"));
                property.setSize(resultSet.getString("size"));
                property.setPrice(resultSet.getString("price"));
                property.setLocation(resultSet.getString("location"));
                property.setCity(resultSet.getString("city"));
                property.setState(resultSet.getString("state"));
                property.setFeature(resultSet.getString("feature"));
                property.setPimage(resultSet.getString("pimage"));
                property.setPimage1(resultSet.getString("pimage1"));
                property.setPimage2(resultSet.getString("pimage2"));
                property.setPimage3(resultSet.getString("pimage3"));
                property.setPimage4(resultSet.getString("pimage4"));
                property.setUid(resultSet.getString("uid"));
                property.setStatus(resultSet.getString("status"));
                property.setMapimage(resultSet.getString("mapimage"));
                property.setTopmapimage(resultSet.getString("topmapimage"));
                property.setGroundmapimage(resultSet.getString("groundmapimage"));
                property.setTotalfloor(resultSet.getString("totalfloor"));
                property.setDate(resultSet.getString("date"));

                propertyList.add(property);
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching all properties", e);
        }
        return propertyList;
    }

    public AddProperty getPropertyById(String propertyId) {
        AddProperty property = null;
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT pid, title, pcontent, type, bhk, stype, bedroom, bathroom, balcony, kitchen, hall, floor, size, price, location, city, state, feature, pimage, pimage1, pimage2, pimage3, pimage4, uid, status, mapimage, topmapimage, groundmapimage, totalfloor, date FROM property WHERE pid = ?")) {

            preparedStatement.setString(1, propertyId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    property = new AddProperty();
                    property.setPid(resultSet.getString("pid"));
                    property.setTitle(resultSet.getString("title"));
                    property.setPcontent(resultSet.getString("pcontent"));
                    property.setType(resultSet.getString("type"));
                    property.setBhk(resultSet.getString("bhk"));
                    property.setStype(resultSet.getString("stype"));
                    property.setBedroom(resultSet.getString("bedroom"));
                    property.setBathroom(resultSet.getString("bathroom"));
                    property.setBalcony(resultSet.getString("balcony"));
                    property.setKitchen(resultSet.getString("kitchen"));
                    property.setHall(resultSet.getString("hall"));
                    property.setFloor(resultSet.getString("floor"));
                    property.setSize(resultSet.getString("size"));
                    property.setPrice(resultSet.getString("price"));
                    property.setLocation(resultSet.getString("location"));
                    property.setCity(resultSet.getString("city"));
                    property.setState(resultSet.getString("state"));
                    property.setFeature(resultSet.getString("feature"));
                    property.setPimage(resultSet.getString("pimage"));
                    property.setPimage1(resultSet.getString("pimage1"));
                    property.setPimage2(resultSet.getString("pimage2"));
                    property.setPimage3(resultSet.getString("pimage3"));
                    property.setPimage4(resultSet.getString("pimage4"));
                    property.setUid(resultSet.getString("uid"));
                    property.setStatus(resultSet.getString("status"));
                    property.setMapimage(resultSet.getString("mapimage"));
                    property.setTopmapimage(resultSet.getString("topmapimage"));
                    property.setGroundmapimage(resultSet.getString("groundmapimage"));
                    property.setTotalfloor(resultSet.getString("totalfloor"));
                    property.setDate(resultSet.getString("date"));
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error fetching property by ID", e);
        }
        return property;
    }

    public boolean addProperty(AddProperty property) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO property (title, pcontent, type, bhk, stype, bedroom, bathroom, balcony, kitchen, hall, floor, size, price, location, city, state, feature, pimage, pimage1, pimage2, pimage3, pimage4, uid, status, mapimage, topmapimage, groundmapimage, totalfloor, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

            preparedStatement.setString(1, property.getTitle());
            preparedStatement.setString(2, property.getPcontent());
            preparedStatement.setString(3, property.getType());
            preparedStatement.setString(4, property.getBhk());
            preparedStatement.setString(5, property.getStype());
            preparedStatement.setString(6, property.getBedroom());
            preparedStatement.setString(7, property.getBathroom());
            preparedStatement.setString(8, property.getBalcony());
            preparedStatement.setString(9, property.getKitchen());
            preparedStatement.setString(10, property.getHall());
            preparedStatement.setString(11, property.getFloor());
            preparedStatement.setString(12, property.getSize());
            preparedStatement.setString(13, property.getPrice());
            preparedStatement.setString(14, property.getLocation());
            preparedStatement.setString(15, property.getCity());
            preparedStatement.setString(16, property.getState());
            preparedStatement.setString(17, property.getFeature());
            preparedStatement.setString(18, property.getPimage());
            preparedStatement.setString(19, property.getPimage1());
            preparedStatement.setString(20, property.getPimage2());
            preparedStatement.setString(21, property.getPimage3());
            preparedStatement.setString(22, property.getPimage4());
            preparedStatement.setString(23, property.getUid());
            preparedStatement.setString(24, property.getStatus());
            preparedStatement.setString(25, property.getMapimage());
            preparedStatement.setString(26, property.getTopmapimage());
            preparedStatement.setString(27, property.getGroundmapimage());
            preparedStatement.setString(28, property.getTotalfloor());
            preparedStatement.setString(29, property.getDate());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error adding property", e);
            return false;
        }
    }

    public boolean updateProperty(AddProperty property) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE property SET title = ?, pcontent = ?, type = ?, bhk = ?, stype = ?, bedroom = ?, bathroom = ?, balcony = ?, kitchen = ?, hall = ?, floor = ?, size = ?, price = ?, location = ?, city = ?, state = ?, feature = ?, pimage = ?, pimage1 = ?, pimage2 = ?, pimage3 = ?, pimage4 = ?, uid = ?, status = ?, mapimage = ?, topmapimage = ?, groundmapimage = ?, totalfloor = ?, date = ? WHERE pid = ?")) {

            preparedStatement.setString(1, property.getTitle());
            preparedStatement.setString(2, property.getPcontent());
            preparedStatement.setString(3, property.getType());
            preparedStatement.setString(4, property.getBhk());
            preparedStatement.setString(5, property.getStype());
            preparedStatement.setString(6, property.getBedroom());
            preparedStatement.setString(7, property.getBathroom());
            preparedStatement.setString(8, property.getBalcony());
            preparedStatement.setString(9, property.getKitchen());
            preparedStatement.setString(10, property.getHall());
            preparedStatement.setString(11, property.getFloor());
            preparedStatement.setString(12, property.getSize());
            preparedStatement.setString(13, property.getPrice());
            preparedStatement.setString(14, property.getLocation());
            preparedStatement.setString(15, property.getCity());
            preparedStatement.setString(16, property.getState());
            preparedStatement.setString(17, property.getFeature());
            preparedStatement.setString(18, property.getPimage());
            preparedStatement.setString(19, property.getPimage1());
            preparedStatement.setString(20, property.getPimage2());
            preparedStatement.setString(21, property.getPimage3());
            preparedStatement.setString(22, property.getPimage4());
            preparedStatement.setString(23, property.getUid());
            preparedStatement.setString(24, property.getStatus());
            preparedStatement.setString(25, property.getMapimage());
            preparedStatement.setString(26, property.getTopmapimage());
            preparedStatement.setString(27, property.getGroundmapimage());
            preparedStatement.setString(28, property.getTotalfloor());
            preparedStatement.setString(29, property.getDate());
            preparedStatement.setString(30, property.getPid());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating property", e);
            return false;
        }
    }

    public boolean deleteProperty(String propertyId) {
        try (Connection connection = DBUtil.provideConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM property WHERE pid = ?")) {

            preparedStatement.setString(1, propertyId);

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error deleting property", e);
            return false;
        }
    }
}
