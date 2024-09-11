<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery Page</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/gallery.css">
</head>

<body>
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>

    <main>
        <div class="container gallery">
            <h2>Our Gallery</h2>
            <div class="gallery-grid">
                <div class="gallery-item" onclick="openModal('<%= request.getContextPath() %>/assets/images/privatediningroom.jpg', 'Private Dining - Our exclusive private dining room offers a secluded space for special occasions and business meetings.')">
                    <div class="gallery-item-inner">
                        <img src="<%= request.getContextPath() %>/assets/images/1.jpg" alt="Private Dining">
                    </div>
                </div>
                <div class="gallery-item" onclick="openModal('<%= request.getContextPath() %>/assets/images/privatediningroom.jpg', 'Private Dining - Our exclusive private dining room offers a secluded space for special occasions and business meetings.')">
                    <div class="gallery-item-inner">
                        <img src="<%= request.getContextPath() %>/assets/images/2.jpg" alt="Private Dining">
                    </div>
                </div>
                <div class="gallery-item" onclick="openModal('<%= request.getContextPath() %>/assets/images/privatediningroom.jpg', 'Private Dining - Our exclusive private dining room offers a secluded space for special occasions and business meetings.')">
                    <div class="gallery-item-inner">
                        <img src="<%= request.getContextPath() %>/assets/images/3.jpg" alt="Private Dining">
                    </div>
                </div>
                <!-- Repeat gallery-item for other images -->
            </div>
        </div>
    </main>

</body>

</html>
