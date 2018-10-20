package dao;

import model.User;

import java.sql.*;

public class UserDAOImpl implements UserDAO {

    private String driverName = "org.postgresql.Driver";
    private String url = "jdbc:postgresql://localhost:5432/step_db";
    private String user = "postgres";
    private String password = "admin";

    public Connection connect() {
        Connection connection = null;

        try {
            Class.forName(driverName);
            connection =
                    DriverManager.getConnection(
                            url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }

    @Override
    public User getOne(int id) {

        User user = null;

        String sqlText =
                "SELECT id, name, surname, gender " +
                        "FROM users WHERE id = " + id;
        try(Connection connection = connect();
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
}
