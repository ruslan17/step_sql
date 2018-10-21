package jdbc;

import dao.UserDAO;
import dao.UserDAOImpl;
import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class JDBCExample {

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAOImpl();

        User user = userDAO.getOne(1);
        System.out.println(user);

        List<User> userList = userDAO.getAll();
        System.out.println(userList);

        User user1 = new User("JJJ", "SSS", true);
        userDAO.save(user1);
    }

}
