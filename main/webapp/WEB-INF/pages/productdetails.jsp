<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="hamrogadi12345.controller.models.CarModel" %>

<%
    CarModel car = (CarModel) request.getAttribute("selectedCar");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title><%= (car != null) ? car.getBrand() + " " + car.getModel() : "Car Details" %> | HamroGadi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <style>
        /* Basic modal styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <!-- Header and other sections -->

    <section class="product-details">
        <div class="details-container">
            <% if (car != null) { %>
                <div class="product-image">
                    <img src="<%= car.getUrl() %>" alt="<%= car.getBrand() %> <%= car.getModel() %>" />
                </div>

                <div class="product-info">
                    <h2><%= car.getBrand() %> <%= car.getModel() %></h2>
                    <p class="price">NPR <%= car.getPrice() %></p>
                    <p class="description"><%= car.getDescription() %></p>
                    <ul class="specs">
                        <li><strong>Condition:</strong> <%= car.getCarCondition() %></li>
                        <li><strong>Status:</strong> Available</li>
                        <li><strong>Date Listed:</strong> <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></li>
                    </ul>
                    <div class="actions">
                        <!-- Trigger the Modal -->
                     <a href="${pageContext.request.contextPath}/TestDriveServlet?id=<%= car.getCarID() %>" class="btn-primary">
    Request Test Ride
</a>
                        
                        
                        
                        <a href="javascript:history.back()" class="btn-secondary">Back to Previous Page</a>
                    </div>
                </div>
            <% } else { %>
                <p style="text-align: center; padding: 2rem;">Car details not available.</p>
            <% } %>
        </div>
    </section>

    <footer>
        <p>© 2025 HamroGadi. All rights reserved.</p>
        <div class="footer-links">
            <a href="aboutus.jsp">About Us</a>
            <a href="contact.jsp">Contact</a>
        </div>
    </footer>

  
</body>

</html>