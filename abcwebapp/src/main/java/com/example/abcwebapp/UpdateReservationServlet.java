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

public class UpdateReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationId = Integer.parseInt(request.getParameter("reservationId"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("userRole");

        String newStatus = null;
        if ("confirm".equals(action)) {
            newStatus = "Confirmed";
        } else if ("cancel".equals(action)) {
            newStatus = "Cancelled";
        }

        if (newStatus != null) {
            try (Connection connection = DatabaseConnection.getConnection()) {
                String sql = "UPDATE reservations SET status = ? WHERE id = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, newStatus);
                    statement.setInt(2, reservationId);
                    statement.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while updating the reservation.");
            }
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
