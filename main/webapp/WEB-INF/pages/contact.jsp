<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HamroGadi | Contact</title>
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
        <li><a href="${pageContext.request.contextPath}/home" >Home</a></li>
        <li><a href="${pageContext.request.contextPath}/CarServlet" class="active">Products</a></li>
        <li><a href="${pageContext.request.contextPath}/aboutServlet">About Us</a></li>
        <li><a href="${pageContext.request.contextPath}/ContactusServelt">Contact</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
        <li><a href="${pageContext.request.contextPath}/UserProfileServlet">My Profile</a></li>
      
      </ul>
     
        </nav>
    </header>

    <!-- Contact Section -->
    <section class="contact-section">
        <h2>Contact Us</h2>
        <form id="contactForm">
            <input type="text" id="name" placeholder="Your Name" required />
            <input type="email" id="email" placeholder="Your Email" required />
            <textarea id="message" placeholder="Your Message" rows="5" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </section>

    <!-- Footer -->
    <footer>
        <p>© 2025 HamroGadi. All rights reserved.</p>
        <div class="footer-links">
            <a href="aboutus.jsp">About Us</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </footer>

    <!-- JS Alert Logic -->
    <script>
        const form = document.getElementById("contactForm");
        form.addEventListener("submit", function (e) {
            e.preventDefault();
            const name = document.getElementById("name").value.trim();
            const email = document.getElementById("email").value.trim();
            const message = document.getElementById("message").value.trim();

            if (!name  !email  !message) {
                alert("⚠️ Please fill in all required fields.");
            } else {
                alert("✅ Message sent successfully!");
                form.reset();
            }
        });
    </script>

</body>

</html>