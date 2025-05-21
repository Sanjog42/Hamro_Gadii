<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="hamrogadi12345.controller.models.CarModel" %>
<%
    CarModel car = (CarModel) request.getAttribute("car");
    if (car == null) {
        out.println("<h2>Car not found</h2>");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= car.getBrand() %> <%= car.getModel() %> | HamroGadi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>

<body>

    <!-- Navbar -->
    <header>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/image/logo.png" alt="HamroGadi Logo" />
            <span>HamroGadi</span>
        </div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="products.jsp" class="active">Products</a></li>
                <li><a href="aboutus.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="login.jsp">Login/Register</a></li>
            </ul>
        </nav>
    </header>

    <!-- Product Details -->
    <section class="product-details">
        <div class="details-container">
            <!-- Left: Image -->
            <div class="product-image">
                <img src="<%= car.getUrl() %>" alt="<%= car.getBrand() %> <%= car.getModel() %>" />
            </div>

            <!-- Right: Info -->
            <div class="product-info">
                <h2><%= car.getBrand() %> <%= car.getModel() %></h2>
                <p class="price">NPR <%= String.format("%,.2f", car.getPrice()) %></p>
                <p class="description"><%= car.getDescription() %></p>
                <ul class="specs">
                    <li><strong>Condition:</strong> <%= car.getCarCondition() %></li>
                    <li><strong>Status:</strong> Available</li>
                    <li><strong>Date Listed:</strong> <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></li>
                </ul>
                <div class="actions">
                    <a href="testride.jsp" class="btn-primary">Request Test Ride</a>
                    <a href="products.jsp" class="btn-secondary">Back to Products</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>© 2025 HamroGadi. All rights reserved.</p>
        <div class="footer-links">
            <a href="aboutus.jsp">About Us</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </footer>

</body>

</html>