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
.food-item{
    width: 100%;
    margin: auto;
    border-radius: 15px;
    box-shadow: 0px 0px 10px #00000015;
    transition: 0,3s;
    animation: fadeIn 1s;
}

.food-item-image{
    width: 100%;
    border-radius: 15px 15px 0px 0px;
}

.food-item-info{
    padding: 20px;
}

.food-item-name-rating{
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.food-item-name-rating p{
    font-size: 20px;
    font-weight: 500;
}

.food-item-name-rating img{
    width: 70px;
}

.food-item-desc{
    color: #676767;
    font-size: 12px;
}

.food-item-price{
    color: tomato;
    font-size: 22px;
    font-weight: 500;
    margin: 10px 0px;
}

.food-item-img-container{
    position: relative;
}

.food-item-img-container .add{
    width: 35px;
    position: absolute;
    bottom: 15px;
    right: 15px;
    cursor: pointer;
    border-radius: 50%;
}

.food-item-counter{
    position: absolute;
    bottom: 15px;
    right: 15px;
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 6px;
    border-radius: 50px;
    background-color: white;
}

.food-item-counter img{
    width: 30px;
}

</style>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Restaurant - Home</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <%@ include file="navbar.jsp" %>
        </div>
    </header>

    <!-- Main Content Section -->
    <main>
    <br>
     <div class='header' >
 
 <div class="header-contents" >
    <h2>Order your favourite food here</h2>
    <p>Choose from a diverse menu featuring a delectable array of dishes crafted with the finest ingredients and culinary expertise. expertise. Our mission is to satisfy your cravings and elevate your dining experience, one delicious meal at a time.</p>
    <button><a href="menu.jsp" style="text-decoration: none;" >View Menu</a></button>
 </div>
    </div>
    <div class="container">
    
    </div>
        <div class="container">
        
            <img src="<%= request.getContextPath() %>/assets/images/hero.png" alt="Logo" class="hero-img">
            <div class="hero-text">Where Every Bite is a Celebration...</div>
        </div>
    </main>
     <div class='app-download' id='app-download' >
        <p>For Better Experience Download <br />Tomato App</p>
        <div class="app-download-platforms">
            <img src= "<%= request.getContextPath() %>/assets/images/app_store.png" />
            <img src="<%= request.getContextPath() %>/assets/images/play_store.png" />
        </div>
    </div>
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
  Created by NOORDEEN  .Copyright © 2024 . All rights reserved.


</p>


    </div>
    
</body>

</html>
