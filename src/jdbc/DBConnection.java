package jdbc;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

// ResultSet, Statement, PrepareStatement
// Driver, DriverManager, Connection

public class DBConnection {

    public Connection connect() {

        Properties properties = new Properties();

        Path path = Paths.get("config.properties");

        try (InputStream in = Files.newInputStream(path)) {
            properties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }

        Connection connection = null;

        try {

            String driverName = properties.getProperty("jdbc.driver");
            String url = properties.getProperty("jdbc.url");
            String user = properties.getProperty("jdbc.user");
            String password = properties.getProperty("jdbc.password");

            Class.forName(driverName);
            connection =
                    DriverManager.getConnection(
                            url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }

}
