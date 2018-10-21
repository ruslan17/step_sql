package dao;

import jdbc.DBConnection;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    public void test(String name) {

        name = "John";
        name = "John ' OR 1 = 1";
        String sqlText =
                "SELECT * FROM users WHERE name = " + name;

        String sqlText2 =
                "SELECT * FROM users WHERE name = 'John'";

        String sqlText3 =
                "SELECT * FROM users WHERE name = 'John' OR 1 = 1";


    }

    @Override
    public User getOne(int id) {
        DBConnection dbConnection = new DBConnection();

        User user = null;

        String sqlText =
                "SELECT id, name, surname, gender " +
                        "FROM users WHERE id = " + id;
        try(Connection connection = dbConnection.connect();
            Statement statement = connection.createStatement()) {

            ResultSet resultSet = statement.executeQuery(sqlText);
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setSurname(resultSet.getString(3));
                user.setGender(resultSet.getBoolean(4));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public List<User> getAll() {
        DBConnection dbConnection = new DBConnection();
        String sql = "SELECT id, name, surname, gender FROM users";
        List<User> userList = new ArrayList<>();

        try(Connection connection = dbConnection.connect();
            PreparedStatement preparedStatement =
                    connection.prepareStatement(sql)) {

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setSurname(resultSet.getString(3));
                user.setGender(resultSet.getBoolean(4));
                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;

//        Connection connection = null;
//        PreparedStatement preparedStatement = null;
//        try {
//            connection = dbConnection.connect();
//            preparedStatement =
//                    connection.prepareStatement(sql);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//
//            try {
//                if (connection != null) {
//                    connection.close();
//                }
//                if (preparedStatement != null) {
//                    preparedStatement.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//
//        }
    }

    @Override
    public void save(User user) {

        DBConnection dbConnection = new DBConnection();
        String sql = "INSERT INTO users(name, surname, gender)" +
                " VALUES (?, ?, ?)";
        List<User> userList = new ArrayList<>();

        try (Connection connection = dbConnection.connect();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setBoolean(3, user.isGender());

//            UPDATE, INSERT, DELETE
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
