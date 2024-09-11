package com.example.abcwebapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateQueryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int queryId = Integer.parseInt(request.getParameter("queryId"));
        String answer = request.getParameter("answer");
        
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("userRole");
        
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE user_queries SET answer = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, answer);
                statement.setInt(2, queryId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the query.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return; 
        }

        if ("admin".equals(userRole)) {
            response.sendRedirect("admin_dashboard.jsp");
        } else if ("staff".equals(userRole)) {
            response.sendRedirect("staff_dashboard.jsp");
        } else {
            response.sendRedirect("index.jsp"); 
        }
    }
}
