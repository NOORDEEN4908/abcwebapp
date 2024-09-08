<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="com.example.abcwebapp.DatabaseConnection" %>
<%

    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Reservation</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/reservation.css">
</head>
<body>
    
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>

    <div id="paymentPopup" class="popup">
        <div class="popup-content">
            <h2>Payment Details</h2>
            <form id="paymentForm">
                <div class="form-group">
                    <label for="cardNumber">Card Number:</label>
                    <input type="text" id="cardNumber" name="cardNumber" required>
                </div>
                <div class="form-group">
                    <label for="expiryDate">Expiry Date:</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
                </div>
                <div class="form-group">
                    <label for="cvv">CVV:</label>
                    <input type="text" id="cvv" name="cvv" required>
                </div>
                <button type="button" id="confirmPaymentBtn">Confirm Payment</button>
                <button type="button" id="cancelPaymentBtn">Cancel</button>
            </form>
        </div>
    </div>

    <main class="container">
        <section class="reservation-form-section">
            <form id="reservationForm" action="ReservationServlet" method="POST" class="reservation-form">
                <div class="form-group">
                    <label for="serviceType">Service Type:</label>
                    <select id="serviceType" name="serviceType" required>
                        <option value="Host an event">Host an event</option>
                        <option value="Catering">Catering</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="reservationDate">Date:</label>
                    <input type="date" id="reservationDate" name="reservationDate" required>
                </div>
                <div class="form-group" id="participantsGroup">
                    <label for="participants">Number of Participants:</label>
                    <input type="number" id="participants" name="participants" min="1" max="100" value="1" required>
                </div>
                <div class="form-group">
                    <label for="customerName">Your Name:</label>
                    <input type="text" id="customerName" name="customerName" required>
                </div>
                <div class="form-group">
                    <label for="contactDetails">Contact Details:</label>
                    <input type="text" id="contactDetails" name="contactDetails" required>
                </div>
                <div class="form-group">
                    <label for="specialRequests">Notes:</label>
                    <textarea id="specialRequests" name="specialRequests" rows="4"></textarea>
                </div>
                <input type="hidden" id="paymentStatus" name="paymentStatus" value="Pending">
                <button type="button" class="submit-btn" id="reserveBtn">Submit</button>
            </form>
        </section>
    </main>


    <%
        String selectedDate = request.getParameter("reservationDate");
        String serviceType = request.getParameter("serviceType");
        boolean isEventExist = false;

        if ("Event Hosting".equals(serviceType) && selectedDate != null) {
            try {
                Connection conn = DatabaseConnection.getConnection();
                String sql = "SELECT COUNT(*) FROM reservations WHERE reservation_date = ? AND service_type = 'Host an event'";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, selectedDate);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt(1);
                    if (count > 0) {
                        isEventExist = false;
                    }
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <script>
        document.getElementById('reserveBtn').addEventListener('click', function() {

            var isEventExist = '<%= isEventExist %>' === 'true';

            if (isEventExist) {
                alert('An event is already scheduled for this date. Please choose another date.');
            } else {
                document.getElementById('paymentPopup').style.display = 'block';
            }
        });
    
        document.getElementById('cancelPaymentBtn').addEventListener('click', function() {
            document.getElementById('paymentPopup').style.display = 'none';
        });
    
        document.getElementById('confirmPaymentBtn').addEventListener('click', function() {
            var cardNumber = document.getElementById('cardNumber').value;
            var expiryDate = document.getElementById('expiryDate').value;
            var cvv = document.getElementById('cvv').value;
    
            if (validatePayment(cardNumber, expiryDate, cvv)) {
                document.getElementById('paymentStatus').value = "Done";

                document.getElementById('paymentPopup').style.display = 'none';
                document.getElementById('reservationForm').submit();
            } else {
                alert('Invalid payment details.');
            }
        });
    
        function validatePayment(cardNumber, expiryDate, cvv) {
            var cardNumberRegex = /^\d{16}$/;
            var expiryDateRegex = /^(0[1-9]|1[0-2])\/\d{2}$/;
            var cvvRegex = /^\d{3,4}$/;

            if (!cardNumberRegex.test(cardNumber)) {
                alert('Please enter a valid 16-digit card number.');
                return false;
            }
            if (!expiryDateRegex.test(expiryDate)) {
                alert('Please enter a valid expiry date in MM/YY format.');
                return false;
            }
            if (!cvvRegex.test(cvv)) {
                alert('Please enter a valid CVV (3 or 4 digits).');
                return false;
            }
            return true;
        }
    </script>

</body>
</html>
