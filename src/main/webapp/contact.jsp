<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Query</title>
    <link rel="stylesheet" href="./css/contact.css">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>

    <main>
        <div class="contact-container">
            <form action="QueryServlet" method="post" class="query-form">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="query">Query:</label>
                <textarea id="query" name="query" rows="5" required></textarea>
                
                <button type="submit" class="contact-submit-btn">Submit</button>
            </form>
            
            <!-- Contact Details Section -->
            <section class="contact-details">
                <h2>Contact Us</h2>
                <p><strong>Phone:</strong> +111 23446474</p>
                <p><strong>Email:</strong> contact@abcrestaurant.com</p>
                <p><strong>Address:</strong> 23, Second Street, Colombo</p>
            </section>
        </div>
    </main>

</body>
</html>
