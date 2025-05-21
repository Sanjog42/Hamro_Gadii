<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - HamroGadi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
</head>
<body>

<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/image/logo.png" alt="HamroGadi Logo" />
        <span>HamroGadi</span>
    </div>
</header>

<section class="form-section">
    <h2>Login</h2>

    <!-- Show error if login failed -->
    <c:if test="${requestScope.error == true}">
        <p style="color: red;">Invalid email or password. Please try again.</p>
    </c:if>

    <!-- Optional success message (e.g., after registration) -->
    <c:if test="${not empty successMessage}">
        <p style="color: green;">${successMessage}</p>
    </c:if>

    <!-- Actual login form -->
    <form method="POST" action="${pageContext.request.contextPath}/login">
        <div class="form-container">
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit">Login</button>
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a></p>
        </div>
    </form>
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