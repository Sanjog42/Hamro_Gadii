<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Add Car | HamroGadi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard.css" />
  <style>
    .form-container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .form-container input,
    .form-container select,
    .form-container textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }
    .form-container button {
     background-color: #1E3C72;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }
    .form-container button:hover {
      background-color: #1E3C72;
    }
    .alert {
      padding: 15px;
      margin-bottom: 20px;
      border-radius: 4px;
    }
    .alert-success {
      background-color: #dff0d8;
      color: #3c763d;
    }
    .alert-danger {
      background-color: #f2dede;
      color: #a94442;
    }
    .next-id {
      font-weight: bold;
      margin-bottom: 15px;
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
      <li><a href="${pageContext.request.contextPath}/AdminDashboardServlet">Dashboard</a></li>
      <li><a class="active" href="${pageContext.request.contextPath}/AddCarServlet">Add Car Listing</a></li>
      <li><a href="${pageContext.request.contextPath}/RemoveServlet">Remove Listing</a></li>
      <li><a href="${pageContext.request.contextPath}/managetestServlet">Manage Test Rides</a></li>
      <li><a href="${pageContext.request.contextPath}/manageuserServlet">Manage Users</a></li>
      <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    </ul>
  </aside>

  <!-- Add Car Form -->
  <section class="form-section">
    <h2>Add a New Car</h2>
    
    
    <form action="${pageContext.request.contextPath}/AddCarServlet" method="POST" class="form-container">
      <select name="categoryId" required>
        <option value="">Select Category</option>
        <c:forEach var="category" items="${categories}">
          <option value="${category.categoryID}">${category.categoryName}</option>
        </c:forEach>
      </select>

      <select name="brand" required>
        <option value="">Select Brand</option>
        <option value="Toyota">Toyota</option>
        <option value="Hyundai">Hyundai</option>
        <option value="Honda">Honda</option>
        <option value="Tata">Tata</option>
        <option value="Kia">Kia</option>
        <option value="Suzuki">Suzuki</option>
        <option value="Ford">Ford</option>
        <option value="Nissan">Nissan</option>
        <option value="Volkswagen">Volkswagen</option>
        <option value="Chevrolet">Chevrolet</option>
      </select>

      <select name="model" required>
        <option value="">Select Model</option>
        <option value="Corolla">Corolla</option>
        <option value="Creta">Creta</option>
        <option value="City">City</option>
        <option value="Altroz">Altroz</option>
        <option value="Seltos">Seltos</option>
        <option value="Swift">Swift</option>
        <option value="Figo">Figo</option>
        <option value="Magnite">Magnite</option>
        <option value="Polo">Polo</option>
        <option value="Beat">Beat</option>
      </select>

      <input type="number" step="0.01" name="price" placeholder="Price (NPR)" required />
      <textarea name="description" placeholder="Description" rows="4" required></textarea>
      <input type="text" name="carCondition" placeholder="Condition (e.g., Good, Excellent)" required />
      <input type="text" name="url" placeholder="Image URL" />
      <button type="submit">Add Car</button>
    </form>

    <!-- Messages -->
    <c:if test="${not empty success}">
      <div class="alert alert-success">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
      <div class="alert alert-danger">${error}</div>
    </c:if>
  </section>

  <!-- Footer -->
  <footer>
    <p>© 2025 HamroGadi. All rights reserved.</p>
    <div class="footer-links">
      <a href="${pageContext.request.contextPath}/aboutus.jsp">About Us</a>
      <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
    </div>
  </footer>
</body>
</html>