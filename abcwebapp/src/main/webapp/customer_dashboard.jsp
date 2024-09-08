<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.example.abcwebapp.Models.Reservation" %>
<%@ page import="com.example.abcwebapp.Models.User" %>
<%@ page import="com.example.abcwebapp.Models.Query" %>
<%@ page import="com.example.abcwebapp.DatabaseConnection" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        // Redirect to login page or show an error message
        response.sendRedirect("login.jsp");
        return;
    }

    List<Reservation> reservations = new ArrayList<Reservation>();
    List<Query> queries = new ArrayList<Query>();
    User user = null;
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        connection = DatabaseConnection.getConnection();
        // Fetch user data
        String userSql = "SELECT * FROM users WHERE id = ?";
        statement = connection.prepareStatement(userSql);
        statement.setInt(1, userId);
        resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            user = new User();
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("username"));
            user.setEmail(resultSet.getString("email"));
            // Set other user properties if needed
        }
        
        resultSet.close(); // Close the previous result set before executing the next query

        // Fetch reservations data
        String reservationsSql = "SELECT * FROM reservations WHERE user_id = ?";
        statement = connection.prepareStatement(reservationsSql);
        statement.setInt(1, userId);
        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Reservation reservation = new Reservation();
            reservation.setId(resultSet.getInt("id"));
            reservation.setUserId(resultSet.getInt("user_id"));
            reservation.setServiceType(resultSet.getString("service_type"));
            reservation.setReservationDate(resultSet.getDate("reservation_date"));
            reservation.setCustomerName(resultSet.getString("customer_name"));
            reservation.setContactDetails(resultSet.getString("contact_details"));
            reservation.setSpecialRequests(resultSet.getString("special_requests"));
            reservation.setStatus(resultSet.getString("status"));
            reservation.setCreatedAt(resultSet.getTimestamp("created_at"));
            reservations.add(reservation);
        }


        resultSet.close(); // Close the previous result set before executing the next query

        // Fetch user queries
        String queriesSql = "SELECT * FROM user_queries WHERE user_id = ?";
        statement = connection.prepareStatement(queriesSql);
        statement.setInt(1, userId);
        resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Query query = new Query();
            query.setId(resultSet.getInt("id"));
            query.setUserId(resultSet.getInt("user_id"));
            query.setName(resultSet.getString("name"));
            query.setEmail(resultSet.getString("email"));
            query.setQuery(resultSet.getString("query"));
            query.setSubmissionDate(resultSet.getDate("submission_date"));
            query.setAnswer(resultSet.getString("answer"));
            queries.add(query);
        }


    } catch (SQLException e) {
        e.printStackTrace();  // Consider logging this instead of printing stack trace in production
        request.setAttribute("errorMessage", "An error occurred while retrieving reservations. Please try again later.");
    } finally {
        // Close resources in reverse order of their creation
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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

    request.setAttribute("user", user);
    request.setAttribute("reservations", reservations);
    request.setAttribute("queries", queries); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="./css/customer_dashboard.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>

    <main>
        <div class="container">

            <div class="dashboard">
                <div class="user-queries">
                    <h2>MY ISSUES</h2>
                    <%
                        if (queries.isEmpty()) {
                    %>
                    <p>No queries found.</p>
                    <% 
                        } else { 
                    %>
                    <table>
                        <thead>
                            <tr>
                                <th>Issue</th>
                                <th>Date</th>
                                <th>Answer</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Query query : queries) {
                            %>
                            <tr>
                                <td><%= query.getQuery() %></td>
                                <td><%= query.getSubmissionDate() %></td>
                                <td><%= query.getAnswer() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <% 
                        } 
                    %>
                </div>

                <!-- Reservation Management Section -->
                <div class="reservation-management">
                    <h2>MY RESERVATIONS</h2>
                    <%
                        if (reservations.isEmpty()) {
                    %>
                    <p>No reservations found.</p>
                    <% 
                        } else { 
                    %>
                    <table>
                        <thead>
                            <tr>
                                <th>Service Type</th>
                                <th>Date</th>
                                <th>Name</th>
                                <th>Contact Details</th>
                                <th>Notes</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Reservation reservation : reservations) {
                            %>
                            <tr>
                                <td><%= reservation.getServiceType() %></td>
                                <td><%= reservation.getReservationDate() %></td>
                                <td><%= reservation.getCustomerName() %></td>
                                <td><%= reservation.getContactDetails() %></td>
                                <td><%= reservation.getSpecialRequests() %></td>
                                <td><%= reservation.getStatus() %></td>
                                <td>
                                    <form action="CancelReservationServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="reservationId" value="<%= reservation.getId() %>">
                                        <button type="submit" onclick="return confirm('Are you sure you want to cancel this reservation?');">Cancel</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <% 
                        } 
                    %>
                </div>

                <!-- Profile Management Section -->
                <div class="profile-management">
                    <h2>UPDATE PROFILE DETAILLS</h2>
                    <form action="UpdateProfileServlet" method="post">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" value="<%= user != null ? user.getName() : "" %>" required>

                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= user != null ? user.getEmail() : "" %>" required>

                        <button type="submit" class="update-profile-btn">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </main>

</body>
</html>
