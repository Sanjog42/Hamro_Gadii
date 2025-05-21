<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HamroGadi | About Us</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
    <style>
        .about-intro {
            text-align: center;
            padding: 50px 20px;
            background-color: #f0f4f8;
        }

        .about-intro h2 {
            font-size: 36px;
            color: #1e3c72;
            margin-bottom: 20px;
        }

        .about-intro p {
            font-size: 18px;
            max-width: 700px;
            margin: auto;
            color: #444;
        }

        .team-section {
            padding: 60px 20px;
            background-color: #fff;
            text-align: center;
        }

        .team-section h2 {
            font-size: 32px;
            color: #1e3c72;
            margin-bottom: 40px;
        }

        .team-grid {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
        }

        .team-member {
            background-color: #f9fafc;
            border-radius: 12px;
            padding: 20px;
            width: 250px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            transition: 0.3s ease;
        }

        .team-member:hover {
            transform: translateY(-5px);
        }

        .team-member h3 {
            margin-bottom: 10px;
            color: #1e3c72;
        }

        .team-member p {
            font-size: 14px;
            color: #555;
        }

        footer {
            margin-top: auto;
        }
    </style>
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
                <li><a href="products.jsp">Products</a></li>
                <li><a class="active" href="#">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="login.html">Login/Register</a></li>
            </ul>
        </nav>
    </header>

    <!-- About Intro -->
    <section class="about-intro">
        <h2>About HamroGadi</h2>
        <p>
            HamroGadi is Nepal's trusted car marketplace, connecting buyers and sellers with verified, top-quality
            listings.
            Our mission is to provide reliable, transparent, and efficient automotive solutions to all Nepalis.
        </p>
    </section>

    <!-- Team Members -->
    <section class="team-section">
        <h2>Meet Our Team</h2>
        <div class="team-grid">
           <div class="team-grid">
            <div class="team-member">
                <h3>Sanjog Gauchan</h3>
                <p>Frontend developer focused on creating smooth, responsive user interfaces and delivering great user
                    experiences across all pages.</p>
            </div>
            <div class="team-member">
                <h3>Aayush Koirala</h3>
                <p>Handles backend development and database integration. Ensures everything runs securely and
                    efficiently behind the scenes.</p>
            </div>
            <div class="team-member">
                <h3>Sujal Pandit</h3>
                <p>Designer dedicated to designing clean layouts and improving overall website usability and
                    accessibility.</p>
            </div>
            <div class="team-member">
                <h3>Saurav Shah</h3>
                <p>Developer contributing to both backend logic with a focus on performance and scalability.</p>
            </div>
            <div class="team-member">
                <h3>Bikash Kumar Das</h3>
                <p>Helping in project coordination. Manages deadlines and helps promote HamroGadi online.</p>
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