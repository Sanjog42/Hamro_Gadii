<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Test Rides | HamroGadi Admin</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard.css" />
  <style>
    .status-pending { color: #FFA500; font-weight: bold; }
    .status-approved { color: #008000; font-weight: bold; }
    .status-completed { color: #0000FF; font-weight: bold; }
    .status-rejected { color: #FF0000; font-weight: bold; }
    
    .action-buttons form {
      display: inline-block;
      margin-right: 5px;
    }
    
    select.status-select {
      padding: 3px;
      border-radius: 4px;
      border: 1px solid #ddd;
    }
    
    .btn {
      padding: 5px 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
    }
    
    .btn-save {
      background-color: #4CAF50;
      color: white;
    }
    
    .btn-delete {
      background-color: #f44336;
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
    <li><a href="${pageContext.request.contextPath}/RemoveServlet">Remove Listing</a></li>
    <li><a class="active" href="${pageContext.request.contextPath}/managetestServlet">Manage Test Rides</a></li>
    <li><a href="${pageContext.request.contextPath}/manageuserServlet">Manage Users</a></li>
    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
  </ul>
</aside>

<!-- Main Section -->
<section class="form-section">
  <h2>Test Ride Management</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>User</th>
        <th>Car</th>
        <th>Date</th>
        <th>Time</th>
        <th>Status</th>
        <th>Notes</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
       <c:forEach var="drive" items="${testDrives}">
  <tr>
    <td>${drive.testDriveID}</td>
    <td>${drive.userName}</td>
    <td>${drive.carName}</td>
    <td>${drive.testDriveDate}</td>
    <td>${drive.testDriveTime}</td>
    <td class="status-${drive.testDriveStatus.toLowerCase()}">
      ${drive.testDriveStatus}
    </td>
    <td>${drive.testDriveNotes}</td>
    <td class="action-buttons">
      <form method="post" action="${pageContext.request.contextPath}/managetestServlet">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="testDriveID" value="${drive.testDriveID}" />
        <select name="status" class="status-select">
          <option value="Pending" ${drive.testDriveStatus == 'Pending' ? 'selected' : ''}>Pending</option>
          <option value="Approved" ${drive.testDriveStatus == 'Approved' ? 'selected' : ''}>Approved</option>
          <option value="Completed" ${drive.testDriveStatus == 'Completed' ? 'selected' : ''}>Completed</option>
          <option value="Rejected" ${drive.testDriveStatus == 'Rejected' ? 'selected' : ''}>Rejected</option>
        </select>
        <button type="submit" class="btn btn-save">Save</button>
      </form>
      <form method="post" action="${pageContext.request.contextPath}/managetestServlet">
        <input type="hidden" name="action" value="delete" />
        <input type="hidden" name="testDriveID" value="${drive.testDriveID}" />
        <button type="submit" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this test ride?');">Delete</button>
      </form>
    </td>
</c:forEach>
    </tbody>
  </table>
</section>

</body>
</html>