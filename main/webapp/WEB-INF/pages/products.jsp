<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HamroGadi | Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        .search-filter-container {
            background-color: #f8f9fa;
            padding: 20px;
            margin: 20px auto;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 1200px;
        }
        
        .search-box {
            display: flex;
            margin-bottom: 20px;
        }
        
        .search-box input {
            flex: 1;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px 0 0 4px;
            font-size: 16px;
            outline: none;
        }
        
        .search-box button {
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .search-box button:hover {
            background-color: #0056b3;
        }
        
        .filter-section {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .filter-group {
            flex: 1;
            min-width: 180px;
        }
        
        .filter-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
        }
        
        .filter-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background-color: white;
        }
        
        .filter-actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 15px;
            gap: 10px;
        }
        
        .filter-actions button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
        }
        
        .apply-filters {
            background-color: #28a745;
            color: white;
        }
        
        .reset-filters {
            background-color: #dc3545;
            color: white;
        }
        
        @media (max-width: 768px) {
            .filter-group {
                min-width: 100%;
            }
        }
    </style>
</head>

<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/image/logo.png" alt="HamroGadi Logo" />
            <span>HamroGadi</span>
        </div>
        <nav>
             <ul>
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/CarServlet" class="active">Products</a></li>
                <li><a href="${pageContext.request.contextPath}/aboutServlet">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/ContactusServelt">Contact</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                <li><a href="${pageContext.request.contextPath}/UserProfileServlet">My Profile</a></li>
            </ul>
        </nav>
    </header>

    <!-- Search and Filter Section -->
    <div class="search-filter-container">
        <form action="${pageContext.request.contextPath}/CarServlet" method="get">
            <div class="search-box">
                <input type="text" name="query" placeholder="Search by brand, model or description..." 
                       value="${param.query}">
                <button type="submit"><i class="fas fa-search"></i> Search</button>
            </div>
            
            <div class="filter-section">
                <div class="filter-group">
                    <label for="brand">Brand</label>
                    <select id="brand" name="brand">
                        <option value="">All Brands</option>
                        <option value="Toyota" ${param.brand == 'Toyota' ? 'selected' : ''}>Toyota</option>
                        <option value="Honda" ${param.brand == 'Honda' ? 'selected' : ''}>Honda</option>
                        <option value="Hyundai" ${param.brand == 'Hyundai' ? 'selected' : ''}>Hyundai</option>
                        <option value="Suzuki" ${param.brand == 'Suzuki' ? 'selected' : ''}>Suzuki</option>
                        <option value="Ford" ${param.brand == 'Ford' ? 'selected' : ''}>Ford</option>
                        <option value="Nissan" ${param.brand == 'Nissan' ? 'selected' : ''}>Nissan</option>
                        <option value="BMW" ${param.brand == 'BMW' ? 'selected' : ''}>BMW</option>
                        <option value="Mercedes" ${param.brand == 'Mercedes' ? 'selected' : ''}>Mercedes</option>
                    </select>
                </div>
           <div class="filter-actions">
    <button type="submit" class="apply-filters">Apply Filters</button>
    <button type="button" class="reset-filters" onclick="window.location.href='${pageContext.request.contextPath}/CarServlet'">
        Reset Filters
    </button>
</div>
        </form>
    </div>
    <section class="featured">
        <h2>Available Cars</h2>
        <c:choose>
            <c:when test="${not empty carList}">
                <div class="car-grid">
                    <c:forEach var="car" items="${carList}">
                        <div class="car-card">
                            <img src="${car.url}" alt="${car.brand} ${car.model}" style="width: 100%; height: auto; object-fit: contain;" />
                            <h3>${car.brand} ${car.model}</h3>
                            <p>Price: NPR ${car.price}</p>
                            <a href="CarDetailsServlet?id=${car.carID}">
                                <button>View Details</button>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <p style="text-align: center; padding: 2rem; font-size: 1.2rem;">
                    No cars found matching your criteria. Try adjusting your filters.
                </p>
            </c:otherwise>
        </c:choose>
    </section>
    <!-- Footer -->
    <footer>
        <p>© 2025 HamroGadi. All rights reserved.</p>
        <div class="footer-links">
            <a href="${pageContext.request.contextPath}/aboutServlet">About Us</a>
            <a href="${pageContext.request.contextPath}/ContactusServelt">Contact</a>
        </div>
    </footer>

</body>
</html>