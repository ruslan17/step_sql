package jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TransactionExample {

    public static void main(String[] args) {
        TransactionExample transactionExample = new TransactionExample();
        transactionExample.transaction();
    }

    public void transaction() {

        DBConnection dbConnection = new DBConnection();
        String sql = "UPDATE users SET balance = balance - 100 " +
                "WHERE id = 1";

        String sql2 = "UPDATE users SET balance = balance + 100 " +
                "WHERE id = 2";

        try(Connection connection = dbConnection.connect();
            Statement statement = connection.createStatement()) {
            connection.setAutoCommit(false);
            statement.executeUpdate(sql);
            statement.executeUpdate(sql2);
            connection.commit();

        } catch (SQLException e) {
            e.printStackTrace();
//            connection.rollback();
        }


    }

}
