<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <a href="index.jsp">
                
        
                    <img src="<%= request.getContextPath() %>/assets/images/logo.png" alt="Logo">
                </a>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="gallery.jsp">Gallery</a></li>
             
                
                
                <% if (session != null && session.getAttribute("userId") != null) {
                    if ("staff".equals(session.getAttribute("userRole"))) { %>
                        <li><a href="staff_dashboard.jsp">Staff Dashboard</a></li>
                    <% } else if ("admin".equals(session.getAttribute("userRole"))) { %>
                        <li><a href="admin_dashboard.jsp">Admin Dashboard</a></li>
                           <li><a href="product.jsp">addProduct</a></li>
                           
                           
                           
                           
                    <% } else { %>    
                        <li><a href="reservation.jsp">Reservation</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                        <li><a href="customer_dashboard.jsp">Profile</a></li>
                    <% } %> 
                    <li><a href="logout.jsp">Logout</a></li>
                <% } else { %>
                    <li><a href="register.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                <% } %>                
            </ul>
            <div class="menu-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </nav>
    </header>
</body>
</html>
