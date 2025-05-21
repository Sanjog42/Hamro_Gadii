<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HamroGadi | Admin Dashboard</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f6f9;
      display: flex;
      min-height: 100vh;
    }

    .sidebar {
      width: 250px;
      background-color: #2c3e50;
      color: white;
      display: flex;
      flex-direction: column;
      padding: 20px;
    }

    .sidebar .logo {
      display: flex;
      align-items: center;
      margin-bottom: 30px;
    }

    .sidebar .logo img {
      width: 40px;
      margin-right: 10px;
    }

    .sidebar ul {
      list-style: none;
      padding: 0;
    }

    .sidebar ul li {
      margin: 15px 0;
    }

    .sidebar ul li a {
      color: white;
      text-decoration: none;
      padding: 10px;
      display: block;
      border-radius: 4px;
      transition: background 0.3s;
    }

    .sidebar ul li a:hover,
    .sidebar ul li a.active {
      background-color: #34495e;
    }

    .admin-dashboard {
      flex: 1;
      padding: 30px;
    }

    .welcome-section {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 30px;
    }

    .welcome-icon {
      font-size: 2rem;
      margin-bottom: 10px;
    }

    .dashboard-stats {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
    }

    .stat-card {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      text-align: center;
    }

    .stat-card h3 {
      margin-bottom: 10px;
      font-size: 18px;
      color: #555;
    }

    .stat-number {
      font-size: 28px;
      font-weight: bold;
      color: #2c3e50;
    }

    footer {
      position: fixed;
      bottom: 0;
      left: 250px;
      width: calc(100% - 250px);
      background-color: #ecf0f1;
      text-align: center;
      padding: 10px 0;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <!-- Sidebar -->
  <aside class="sidebar">
    <div class="logo">
      <img src="${pageContext.request.contextPath}/image/logo.png" alt="HamroGadi Logo" />
      <span>HamroGadi - Admin</span>
    </div>
    <ul>
      <li><a class="active" href="${pageContext.request.contextPath}/AdminDashboardServlet">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/AddCarServlet">Add Car Listing</a></li>
      <li><a href="${pageContext.request.contextPath}/RemoveServlet">Remove Listing</a></li>
      <li><a href="${pageContext.request.contextPath}/managetestServlet">Manage Test Rides</a></li>
      <li><a href="${pageContext.request.contextPath}/manageuserServlet">Manage Users</a></li>
      <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    </ul>
  </aside>

  <!-- Main Content -->
  <main class="admin-dashboard">
    <div class="welcome-section">
      <div class="welcome-icon">👋</div>
      <h2>Welcome to Admin Dashboard</h2>
      <p>Manage your car listings, test rides, and users from the sidebar.</p>
    </div>

    <div class="dashboard-stats">
      <div class="stat-card">
        <h3>Total Cars</h3>
        <p class="stat-number">${carCount}</p>
      </div>
      <div class="stat-card">
        <h3>Total Admins</h3>
        <p class="stat-number">${adminCount}</p>
      </div>
     
      <div class="stat-card">
        <h3>Test Ride Requests</h3>
        <p class="stat-number">${testRideCount}</p>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <footer>
    <p>© 2025 HamroGadi. Admin Panel</p>
  </footer>
</body>
</html>