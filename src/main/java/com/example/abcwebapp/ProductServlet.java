package com.example.abcwebapp;



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends HttpServlet {

       


	private static final long serialVersionUID = 1L;


	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Extract parameters
	    String name = request.getParameter("name");
	    String description = request.getParameter("description");
	    double price;
	    try {
	        price = Double.parseDouble(request.getParameter("price"));
	    } catch (NumberFormatException e) {
	        response.sendRedirect("error.jsp"); // Handle error if price is invalid
	        return; // Exit to prevent further processing
	    }
	    String imageUrl = request.getParameter("imageUrl");

	    // Database connection
	    Connection connection = null;
	    PreparedStatement statement = null;

	    try {
	        // Get the connection
	        connection = DatabaseConnection.getConnection();

	        // SQL query to insert product data
	        String sql = "INSERT INTO products (name, description, price, image_url) VALUES (?, ?, ?, ?)";
	        statement = connection.prepareStatement(sql);
	        statement.setString(1, name);
	        statement.setString(2, description);
	        statement.setDouble(3, price);
	        statement.setString(4, imageUrl);

	        // Execute the query
	        int rowsInserted = statement.executeUpdate();
	        if (rowsInserted > 0) {
	            response.sendRedirect("product_success.jsp");
	        } else {
	            response.sendRedirect("product_failure.jsp");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Ensure the error response doesn't commit the response
	        if (!response.isCommitted()) {
	            response.sendRedirect("error.jsp");
	        }
	    } finally {
	        // Close resources
	        if (statement != null) {
	            try {
	                statement.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}


 

}
