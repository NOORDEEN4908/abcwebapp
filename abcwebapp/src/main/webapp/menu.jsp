<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.abcwebapp.DatabaseConnection" %>
<%@ page import="com.example.abcwebapp.Models.Product" %>
<!DOCTYPE html>
<html lang="en">
<style>
.header {
    height: 34vw;
    margin: 30px auto;
    background: url('<%= request.getContextPath() %>/assets/images/header_img.png') no-repeat center;
    background-size: contain;
    position: relative;
    }
    .header-contents{
    position: absolute;
    display: flex;
    flex-direction: column;
    align-items: start;
    gap: 1.5vw;
    max-width: 50%;
    bottom: 10%;
padding-left:60px;
    animation: fadeIn 3s;
}

.header-contents .h2{

font-weight: 500;
color: white;
font-size: max(4.5vw,22px);
}

.header-contents p{
    color: white;
    font-size: 1vw;
}

.header-contents button{
    border: none;
    color: #747474;
    font-weight: 500;
    padding: 1vw 2.3vw;
    background-color: white;
    font-size: max(1vw,13px);
    border-radius: 50px;
    text-decoration: none;
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Menu</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/menu.css">
</head>
<body>

    <!-- Header Section -->
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>
     <div class='header' >
 
 <div class="header-contents" >
    <h2>Order your favourite food here</h2>
    <p>Choose from a diverse menu featuring a delectable array of dishes crafted with the finest ingredients and culinary expertise. expertise. Our mission is to satisfy your cravings and elevate your dining experience, one delicious meal at a time.</p>
    <button><a href="menu.jsp" style="text-decoration: none;" >View Menu</a></button>
 </div>
    </div>
<div class="slideshow-container">
    <div class="slides fade">
        <img  style="width:100%">
    </div>

    <div class="slides fade">
        <img src="images/image2.jpg" style="width:100%">
    </div>

    <div class="slides fade">
        <img src="images/image3.jpg" style="width:100%">
    </div>

    <!-- Navigation buttons -->
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>

<!-- Dots for navigation -->
<div style="text-align:center">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
</div>

<script src="slideshow.js"></script>

    <!-- Main Content -->
    <main class="container">
        <h1 class="menu-title">Our Delicious Menu</h1>
        <div class="menu-grid">
            <%
                List<Product> products = new ArrayList<Product>();
                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;

                try {
                    connection = DatabaseConnection.getConnection();
                    String query = "SELECT * FROM products";
                    statement = connection.prepareStatement(query);
                    resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        Product product = new Product();
                        product.setId(resultSet.getInt("id"));
                        product.setName(resultSet.getString("name"));
                        product.setDescription(resultSet.getString("description"));
                        product.setPrice(resultSet.getDouble("price"));
                        product.setImageUrl(resultSet.getString("image_url"));
                        products.add(product);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                if (!products.isEmpty()) {
                    for (Product product : products) {
            %>
                <div class="menu-item">
                    <div class="menu-item-image">
                        <img src="<%= request.getContextPath() %>/assets/<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                    </div>
                    <div class="content">
                        <h3><%= product.getName() %></h3>
                        <p class="description"><%= product.getDescription() %></p>
                        <p class="price">$<%= product.getPrice() %></p>
                    </div>
                </div>
            <%
                    }
                } else {
            %>
                <p>No products available.</p>
            <%
                }
            %>
        </div>
    </main>

</body>
</html>
