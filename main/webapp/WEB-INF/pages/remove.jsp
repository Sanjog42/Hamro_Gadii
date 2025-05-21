<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Remove/Update Car | HamroGadi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard.css" />
  <style>
    /* Modal styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.5);
      overflow-y: auto; /* Enable scrolling if needed */
    }
    
    .modal-content {
      background-color: #fefefe;
      margin: 20px auto; /* Changed from 15% to fixed pixels */
      padding: 20px;
      border-radius: 8px;
      width: 80%; /* Increased width for better visibility */
      max-width: 850px; /* Increased max-width */
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      position: relative;
      top: 20px; /* Position from top */
    }
    
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
      cursor: pointer;
    }
    
    .close:hover {
      color: black;
    }
    
    .form-group {
      margin-bottom: 15px;
    }
    
    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    
    .form-group input, .form-group select, .form-group textarea {
      width: 100%;
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }
    
    .form-actions {
      text-align: right;
      margin-top: 20px;
    }
    
    .btn {
      padding: 8px 16px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
    }
    
    .btn-primary {
      background-color: #4CAF50;
      color: white;
    }
    
    .btn-secondary {
      background-color: #f44336;
      color: white;
      margin-right: 10px;
    }
    
    .btn-danger {
      background-color: #f44336;
      color: white;
    }
    
    .btn-warning {
      background-color: #ff9800;
      color: white;
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
      <li><a href="${pageContext.request.contextPath}/AddCarServlet">Add Car Listing</a></li>
      <li><a class="active" href="${pageContext.request.contextPath}/RemoveServlet">Remove Listing</a></li>
      <li><a href="${pageContext.request.contextPath}/managetestServlet">Manage Test Rides</a></li>
      <li><a href="${pageContext.request.contextPath}/manageuserServlet">Manage Users</a></li>
    
      <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    </ul>
  </aside>

  <!-- Remove or Update Car Table -->
  <section class="form-section">
    <h2>Manage Listings</h2>
    <table>
      <thead>
        <tr>
          <th>Car ID</th>
          <th>Brand</th>
          <th>Model</th>
          <th>Price</th>
          <th>Condition</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="car" items="${cars}">
          <tr>
            <td>${car.carID}</td>
            <td>${car.brand}</td>
            <td>${car.model}</td>
            <td>NPR ${car.price}</td>
            <td>${car.carCondition}</td>
            <td class="action-buttons">
              <button onclick="openDeleteModal(${car.carID})" class="delete-btn">Delete</button>
              <button onclick="openUpdateModal(
                ${car.carID},
                '${car.brand}',
                '${car.model}',
                ${car.price},
                '${car.description}',
                '${car.carCondition}',
                '${car.url}',
                ${car.categoryID}
              )" class="update-btn">Update</button>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </section>

  <!-- Delete Confirmation Modal -->
  <div id="deleteModal" class="modal">
    <div class="modal-content">
      <span class="close" onclick="closeDeleteModal()">&times;</span>
      <h3>Confirm Deletion</h3>
      <p>Are you sure you want to delete this car listing?</p>
      <form id="deleteForm" action="${pageContext.request.contextPath}/DeleteCarServlet" method="POST">
        <input type="hidden" name="carId" id="deleteCarId" value="">
        <div class="form-actions">
          <button type="button" class="btn btn-secondary" onclick="closeDeleteModal()">Cancel</button>
          <button type="submit" class="btn btn-danger">Delete</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Update Car Modal -->
 <div id="updateModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeUpdateModal()">&times;</span>
        <h3>Update Car Listing</h3>
        <div style="max-height: 70vh; overflow-y: auto;"> <!-- Scrollable container -->
            <form id="updateForm" action="${pageContext.request.contextPath}/UpdateCarServlet" method="POST">
                <input type="hidden" name="carId" id="updateCarId" value="">
                
                <div class="form-group">
                    <label for="brand">Brand:</label>
                    <input type="text" id="brand" name="brand" required>
                </div>
        
        <div class="form-group">
          <label for="model">Model:</label>
          <input type="text" id="model" name="model" required>
        </div>
        
        <div class="form-group">
          <label for="price">Price (NPR):</label>
          <input type="number" id="price" name="price" step="0.01" required>
        </div>
        
        <div class="form-group">
          <label for="description">Description:</label>
          <textarea id="description" name="description" rows="3"></textarea>
        </div>
        
        <div class="form-group">
          <label for="condition">Condition:</label>
          <select id="condition" name="condition" required>
            <option value="New">New</option>
            <option value="Used">Used</option>
            <option value="Refurbished">Refurbished</option>
          </select>
        </div>
        
        <div class="form-group">
          <label for="url">Image URL:</label>
          <input type="text" id="url" name="url">
        </div>
        
        <div class="form-group">
          <label for="category">Category ID:</label>
          <input type="number" id="category" name="category" required>
        </div>
        
         <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="closeUpdateModal()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

  <!-- Footer -->
  <footer>
    <p>© 2025 HamroGadi. All rights reserved.</p>
    <div class="footer-links">
      <a href="${pageContext.request.contextPath}/aboutus.jsp">About Us</a>
      <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
    </div>
  </footer>

  <script>
    // Delete Modal Functions
    function openDeleteModal(carId) {
      document.getElementById('deleteCarId').value = carId;
      document.getElementById('deleteModal').style.display = 'block';
    }
    
    function closeDeleteModal() {
      document.getElementById('deleteModal').style.display = 'none';
    }
    
    // Update Modal Functions
    function openUpdateModal(carId, brand, model, price, description, condition, url, category) {
      document.getElementById('updateCarId').value = carId;
      document.getElementById('brand').value = brand;
      document.getElementById('model').value = model;
      document.getElementById('price').value = price;
      document.getElementById('description').value = description;
      document.getElementById('condition').value = condition;
      document.getElementById('url').value = url;
      document.getElementById('category').value = category;
      
      document.getElementById('updateModal').style.display = 'block';
    }
    
    function closeUpdateModal() {
      document.getElementById('updateModal').style.display = 'none';
    }
    
    // Close modals when clicking outside
    window.onclick = function(event) {
      if (event.target == document.getElementById('deleteModal')) {
        closeDeleteModal();
      }
      if (event.target == document.getElementById('updateModal')) {
        closeUpdateModal();
      }
    }
  </script>
</body>
</html>