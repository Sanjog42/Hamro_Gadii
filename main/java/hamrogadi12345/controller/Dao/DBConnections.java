package hamrogadi12345.controller.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import hamrogadi12345.controller.view.HamrogadiView;

public class DBConnections {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Load the JDBC driver class specified by the DRIVER_NAME constant
        Class.forName(HamrogadiView.DRIVER_NAME);

        // Create a connection to the database using the provided credentials
        Connection connection = DriverManager.getConnection(
                HamrogadiView.LOCALHOST_URL, 
                HamrogadiView.LOCALHOST_USERNAME, 
                HamrogadiView.LOCALHOST_PASSWORD
        );

        // If connection is successful, print "Database Connected"
        System.out.println("Database Connected");

        return connection;
    }
}