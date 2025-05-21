<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HamroGadi | Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>

<body>

    <header>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/image/logo.png" alt="HamroGadi Logo" />
            <span>HamroGadi</span>
        </div>
        
    </header>

    <section class="form-section">
        <h2>Create Account</h2>
      <% 
    String success = request.getParameter("success"); 
    String error = request.getParameter("error"); 
%>

<% if (success != null) { %>
    <p style="color: green;">Registration successful! You can now login.</p>
<% } %>

<% if (error != null) { %>
    <p style="color: red;">Something went wrong. Please try again.</p>
<% } %>

<form action="${pageContext.request.contextPath}/register" method="POST" class="form-container">
    <input type="text" name="name" placeholder="Full Name" required />
    <input type="email" name="email" placeholder="Email" required />
    <input type="text" name="phone" placeholder="Phone Number" required />
    <input type="text" name="address" placeholder="Address" required />
    <input type="password" name="password" placeholder="Password" required />
    
    <!-- Add Role Dropdown -->
    <select name="role" required>
        <option value="">Select Role</option>
        <option value="admin">Admin</option>
        <option value="customer">Customer</option>
    </select>

    <button type="submit">Register</button>
    <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
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