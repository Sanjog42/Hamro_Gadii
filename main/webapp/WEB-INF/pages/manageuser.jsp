<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Manage Users | HamroGadi Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-dashboard.css" />
    <style>
        .btn-ban {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-promote {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .sidebar {
            width: 200px;
            float: left;
        }

        .form-section {
            margin-left: 220px;
            padding: 20px;
        }

        .logo img {
            height: 40px;
            vertical-align: middle;
        }

        .logo span {
            font-weight: bold;
            margin-left: 10px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin: 10px 0;
        }

        ul li a {
            text-decoration: none;
        }

        ul li a.active {
            font-weight: bold;
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
        <li><a href="${pageContext.request.contextPath}/managetestServlet">Manage Test Rides</a></li>
        <li><a class="active" href="${pageContext.request.contextPath}/manageuserServlet">Manage Users</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
    </ul>
</aside>

		<!-- Main Section -->
		<section class="form-section">
		    <h2>Manage Users</h2>
		    <table>
		        <thead>
		            <tr>
		                <th>Name</th>
		                <th>Email</th>
		                <th>Role</th>
		                <th>Phone</th>
		                <th>Address</th>
		                <th>Promote to Admin</th>
		                <th>Delete User</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="user" items="${users}">
		                <tr>
		                    <td>${user.name}</td>
		                    <td>${user.email}</td>
		                    <td>${user.role}</td>
		                    <td>${user.phoneNumber}</td>
		                    <td>${user.address}</td>
		                    <td>
		    <c:choose>
		        <c:when test="${fn:toLowerCase(user.role) eq 'admin'}">
		            <em>Already Admin</em>
		        </c:when>
		        <c:when test="${fn:toLowerCase(user.role) eq 'customer'}">
		            <em>Customer can't be promoted to admin</em>
		        </c:when>
		        <c:otherwise>
		            <form method="post" action="${pageContext.request.contextPath}/manageuserServlet" style="margin-top: 5px;">
		                <input type="hidden" name="action" value="promote" />
		                <input type="hidden" name="email" value="${user.email}" />
		                <button type="submit" class="btn-promote">Approve</button>
		            </form>
		        </c:otherwise>
		    </c:choose>
		</td>
		                    <td>
		                        <form method="post" action="${pageContext.request.contextPath}/manageuserServlet" onsubmit="return confirm('Are you sure you want to delete this user?');">
		                            <input type="hidden" name="action" value="delete" />
		                            <input type="hidden" name="email" value="${user.email}" />
		                            <button type="submit" class="btn-ban">Delete</button>
		                        </form>
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</section>
		
		</body>
		</html>