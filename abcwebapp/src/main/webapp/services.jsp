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

.hero-section {
    background: url('<%= request.getContextPath() %>/assets/images/hero.jpg') no-repeat center center/cover;
    padding: 100px 0;
    color: black;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background-size: cover;
    position: relative;
    }
    /* Hero Section */


.hero-section::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background:#16537e;
}

.hero-content {
    z-index: 2;
    position: relative;
}

.hero-content h1 {
    font-size: 48px;
    margin-bottom: 20px;
}

.hero-content p {
    font-size: 20px;
    margin-bottom: 30px;
}

.cta-button {
    background-color: #FF821E;
    color: white;
    padding: 12px 30px;
    font-size: 18px;
    border-radius: 30px;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.cta-button:hover {
    background-color: #e67300;
}

/* Services Section */
.service-types {
    padding: 60px 60px;
    background-color: #ffffff;
    border-radius: 60px;
    margin-bottom: 30px;
}

.service-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 10px;
}

.service-item {
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
}

.service-image img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 15px;
}

.service-item h3 {
    font-size: 24px;
    margin: 20px 0 10px;
}

.service-item p {
    color: #666;
    font-size: 16px;
    line-height: 1.6;
}

.service-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
}

/* Special Facilities Section */
.special-facilities {
    padding: 60px 60px;
    background-color: #ffffff;
    border-radius: 60px;
}

.facility-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;
}

.facility-item {
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 4px 12px #ffffff;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
}

.facility-image img {
    width: 100%;
    height: 300px;
    object-fit: cover;
    border-radius: 15px;
}

.facility-item h3 {
    font-size: 24px;
    margin: 20px 0 10px;
}

.facility-item p {
    color: #666;
    font-size: 16px;
    line-height: 1.6;
}

.facility-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
}
    
}
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Services</title>
    <link rel="stylesheet" href="./css/style.css">
    
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

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <div class="hero-content">
                <h1>Discover Our Exceptional Services</h1>
                <p>Experience culinary excellence with our variety of dining options and special facilities.</p>
            </div>
        </div>
</div>

    <!-- Main Content -->
    <main class="container">
        <section id="services" class="service-types">
            <div class="service-grid">
                <div class="service-item">
                    <div class="service-image take-out">
                        <img src="<%= request.getContextPath() %>/assets/images/takeaway.jpg" alt="Take-Away">
                    </div>
                    <h3>Take-Away</h3>
                </div>
                <div class="service-item">
                    <div class="service-image delivery">
                        <img src="<%= request.getContextPath() %>/assets/images/delivery.jpg" alt="Delivery">
                    </div>
                    <h3>Delivery</h3>
                </div>
                <div class="service-item">
                    <div class="service-image catering">
                        <img src="<%= request.getContextPath() %>/assets/images/catering.jpg" alt="Catering">
                    </div>
                    <h3>Catering</h3>
                </div>
            </div>
        </section>

        <section class="special-facilities">
            <div class="facility-grid">
                <div class="facility-item">
                    <div class="facility-image private-dining">
                        <img src="<%= request.getContextPath() %>/assets/images/cheftable.jpeg" alt="Chef's Table">
                    </div>
                    <h3>Chef's Table</h3>
                    <p>An Exclusive Culinary Experience Indulge in a unique dining adventure at our Chef’s Table, where gastronomy meets artistry. Situated in an intimate setting near our open kitchen, the Chef’s Table offers you a front-row seat to the culinary action. Watch as our expert chefs craft exquisite dishes just for you, using the finest ingredients and techniques. This personalized dining experience includes a specially curated menu, interactive sessions with the chef, and the opportunity to learn the stories behind each course. Perfect for food enthusiasts and special occasions, the Chef’s Table promises an unforgettable meal that delights all the senses.</p>
                </div>
                <div class="facility-item">
                    <div class="facility-image event-hosting">
                        <img src="<%= request.getContextPath() %>/assets/images/drivethru.webp" alt="Drive-Thru">
                    </div>
                    <h3>Drive-Thru</h3>
                    <p>Convenience at Your Fingertips Experience the ultimate convenience with our Drive-Thru service, designed for those on the go. Whether you're in a rush or simply prefer the comfort of your car, our Drive-Thru allows you to enjoy your favorite meals without leaving your vehicle. Place your order, and we'll have it freshly prepared and ready for you in no time. Perfect for busy days, quick lunches, or a hassle-free dining experience, our Drive-Thru ensures you get the delicious food you love, fast and easy.</p>
                </div>
            </div>
        </section>
    </main>
     <div class='footer' id='footer' >
        <div class="footer-content">
            <div class="footer-content-left">
<img src={assets.logo} alt="" />
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus saepe, nam consequatur nulla tempora ipsa non laborum. Sint quis praesentium maiores, aut sunt recusandae aliquam, labore distinctio ullam nemo impedit.</p>

<div class="footer-social-icon">
    <img src= "<%= request.getContextPath() %>/assets/images/twitter_icon.png" /> 
 <img src= "<%= request.getContextPath() %>/assets/images/facebook_icon.png" />    
  <img src= "<%= request.getContextPath() %>/assets/images/linkedin_icon.png" />
</div>
            </div>
            <div class"footer-content-center">
                <h2>COMPANY</h2>
                <ul>
                    <li>Home</li>
                    <li>About us</li>
                    <li>Delivery</li>
                    <li>Privacy policy</li>
                    
                </ul>

            </div>
            <div class="footer-content-right">
<h2>GET IN TOUCH</h2>
<ul>
    <li>+94 75-027-6174</li>
    <li>nd712562@gmail.com</li>
</ul>
            </div>
        </div>
<hr />
<p class='footer-copyright'> 
  Created by NOORDEEN  .Copyright � 2024 . All rights reserved.


</p>


    </div>
</body>
</html>
