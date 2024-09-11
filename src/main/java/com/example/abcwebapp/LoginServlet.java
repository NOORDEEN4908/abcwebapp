package com.example.abcwebapp;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	
	private Connection connection;
	
	  public void setConnection(Connection connection) {
	        this.connection = connection;
	    }


	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, password);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("userId", resultSet.getInt("id"));
                    session.setAttribute("userRole", resultSet.getString("role")); 

                    String role = resultSet.getString("role");
                    if ("admin".equalsIgnoreCase(role)) {
                        response.sendRedirect("admin_dashboard.jsp");
                    } else if ("staff".equalsIgnoreCase(role)) {
                        response.sendRedirect("staff_dashboard.jsp");
                    } else {
                        response.sendRedirect("index.jsp"); 
                    }
                    
                } else {
                    response.sendRedirect("login.jsp?error=invalid");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
