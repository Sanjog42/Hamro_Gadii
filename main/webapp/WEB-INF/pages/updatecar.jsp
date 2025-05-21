<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Update Car | HamroGadi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="updatecar.css" />
</head>

<body>

    <!-- Header -->
    <header>
        <div class="logo">
            <img src="logo.png" alt="HamroGadi Logo" />
            <span>HamroGadi</span>
        </div>
        <nav>
            <ul>
                <li><a href="admindashboard.jsp">Dashboard</a></li>
            </ul>
        </nav>
    </header>

    <!-- Update Car Form -->
    <section class="update-form-wrapper">
        <h2>Update Car Listing</h2>
        <form action="UpdateCarServlet" method="POST">
            <input type="hidden" name="carId" value="1" />

            <label for="category">Category</label>
            <input type="text" id="category" name="category" value="Sedan" required />

            <label for="brand">Brand</label>
            <input type="text" id="brand" name="brand" value="TOYOTA" required />

            <label for="model">Model</label>
            <input type="text" id="model" name="model" value="COROLLA" required />

            <label for="price">Price</label>
            <input type="text" id="price" name="price" value="NPR 3,800,000" required />

            <label for="status">Status</label>
            <select id="status" name="status" required>
                <option value="Available" selected>Available</option>
                <option value="Sold">Sold</option>
                <option value="Pending">Pending</option>
            </select>

            <label for="dateListed">Date Listed</label>
            <input type="date" id="dateListed" name="dateListed" value="2025-04-14" required />

            <button type="submit">Save Changes</button>
        </form>
    </section>

    <!-- Footer -->
    <footer>
        <p>© 2025 HamroGadi. All rights reserved.</p>
    </footer>

</body>

</html>