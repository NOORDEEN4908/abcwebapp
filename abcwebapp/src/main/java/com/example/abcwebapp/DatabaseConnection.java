package com.example.abcwebapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseConnection {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/fastfood";
    private static final String JDBC_USER = "root";  
    private static final String JDBC_PASSWORD = "Nrasheed2012";  

    // Static block to load the MySQL JDBC driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    // Method to establish and return a connection to the database
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }
}
