<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>User Dashboard | HamroGadi</title>
    <link rel="stylesheet" href="style.css" />
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
                <li><a href="home.jss">Home</a></li>
                <li><a href="logout.jss">Logout</a></li>
            </ul>
        </nav>
    </header>

    <!-- User Dashboard Content -->
    <section class="user-dashboard">
        <h2>Your Profile</h2>
        <div class="user-info">
            <p><strong>Name:</strong> John Doe</p>
            <p><strong>Email:</strong> johndoe@example.com</p>
            <p><strong>Phone:</strong> 9876543210</p>
            <p><strong>Address:</strong> Kathmandu, Nepal</p>
            <p><strong>Role:</strong> User</p>
        </div>

        <a href="updateprofile.jss"><button class="dashboard-btn">Update Profile</button></a>
    </section>

    <!-- Footer -->
    <footer>
        <p>© 2025 HamroGadi. All rights reserved.</p>
    </footer>

</body>

</html>