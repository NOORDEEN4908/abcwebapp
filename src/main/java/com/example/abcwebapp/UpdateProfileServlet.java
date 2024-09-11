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

public class UpdateProfileServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (Integer) session.getAttribute("userId");

        String name = request.getParameter("name");
        String email = request.getParameter("email");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE users SET username = ?, email = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setInt(3, userId);

                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        session.setAttribute("name", name);
        session.setAttribute("email", email);

        response.sendRedirect("customer_dashboard.jsp");
    }
}
