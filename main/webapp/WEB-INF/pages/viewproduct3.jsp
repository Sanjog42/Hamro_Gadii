<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Suzuki Swift | HamroGadi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>

<body>

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

    <section class="product-details">
        <div class="details-container">
            <div class="product-image">
                <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/54399/swift-exterior-right-front-three-quarter-64.jpeg"
                    alt="Suzuki Swift" />
            </div>

            <div class="product-info">
                <h2>Suzuki Swift</h2>
                <p class="price">NPR 14,75,000</p>
                <p class="description">
                    Popular city car known for fuel efficiency, compact size, and sporty looks.
                </p>
                <ul class="specs">
                    <li><strong>Condition:</strong> Fair</li>
                    <li><strong>Status:</strong> Available</li>
                    <li><strong>Date Listed:</strong> 2025-04-14</li>
                </ul>
                <div class="actions">
                    <a href="testride.jsp" class="btn-primary">Request Test Ride</a>
                    <a href="products.jsp" class="btn-secondary">Back to Products</a>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <p>© 2025 HamroGadi. All rights reserved.</p>
        <div class="footer-links">
            <a href="aboutus.jsp">About Us</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </footer>

</body>

</html>