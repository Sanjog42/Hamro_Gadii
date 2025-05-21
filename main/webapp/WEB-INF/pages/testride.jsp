<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Test Ride | HamroGadi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <script>
        // Function to get a cookie value by name
        function getCookie(name) {
            let cookieArr = document.cookie.split(";");
            for (let i = 0; i < cookieArr.length; i++) {
                let cookiePair = cookieArr[i].trim().split("=");
                if (cookiePair[0] === name) {
                    return cookiePair[1];
                }
            }
            return null;
        }

        // Function to get a query parameter by name
        function getQueryParam(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        // On window load, autofill email and car ID
        window.onload = function() {
            var userEmail = getCookie("userEmail");
            var carID = getQueryParam("id");

            if (userEmail) {
                document.getElementById("email").value = userEmail;  // Autofill email input
            }

            if (carID) {
                document.getElementById("carID").value = carID;  // Set car ID
            }
        }
    </script>
</head>

<body>

    <!-- Navbar (unchanged) -->
    <header>
        <div class="logo">
           <img src="${pageContext.request.contextPath}/image/logo.png" alt="HamroGadi Logo" />
            <span>HamroGadi</span>
        </div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="products.jsp">Products</a></li>
                <li><a href="aboutus.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="login.jsp">Login/Register</a></li>
            </ul>
        </nav>
    </header>

    <!-- Test Ride Request -->
    <section class="form-section test-ride-section">
        <h2>Request a Test Ride</h2>
       <form action="${pageContext.request.contextPath}/TestDriveServlet" method="POST" class="form-container test-ride-form">
            <p class="ride-location">
                <strong>Location:</strong> HamroGadi Showroom, Kathmandu
            </p>

            <input type="hidden" id="carID" name="carID" />
    <input type="hidden" name="userEmail" value="<%= session.getAttribute("userEmail") %>" /> <!-- Use userEmail instead of userID -->

    <label for="name">Your Name</label>
    <input type="text" id="name" name="name" placeholder="John Doe" required />

    <label for="email">Email Address</label>
<input type="email" id="email" name="email" placeholder="you@example.com" required readonly />

    <label for="phone">Phone Number</label>
    <input type="tel" id="phone" name="phone" placeholder="+977-98XXXXXXXX" required />

    <label for="testDate">Preferred Date</label>
    <input type="date" id="testDate" name="testDate" required />

    <label for="testTime">Preferred Time</label>
    <input type="time" id="testTime" name="testTime" required />

    <label for="testNotes">Additional Notes</label>
    <textarea id="testNotes" name="testNotes" placeholder="Any special request..."></textarea>

    <button type="submit">Submit Test Ride Request</button>
        </form>
    </section>

    <!-- Footer (unchanged) -->
    <footer>
        <p>© 2025 HamroGadi. All rights reserved.</p>
        <div class="footer-links">
            <a href="aboutus.jsp">About Us</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </footer>

</body>

</html>