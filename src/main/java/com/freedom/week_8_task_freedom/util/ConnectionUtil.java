package com.freedom.week_8_task_freedom.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
    private static Connection connection = null;
    private static String username = "root";
    private static String classname = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/newjdbcdb";
    private static String password = "Freedom83@";

    static {
        try {
            Class.forName(classname);
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static java.sql.Connection getConnection() {
        return connection;
    }

}
