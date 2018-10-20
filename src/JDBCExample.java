import dao.UserDAO;
import dao.UserDAOImpl;
import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCExample {

    private String driverName = "org.postgresql.Driver";
    private String url = "jdbc:postgresql://localhost:5432/step_db";
    private String user = "step_user";
    private String password = "admin1";

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

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAOImpl();

        User user = userDAO.getOne(101);
        System.out.println(user);
    }





}
