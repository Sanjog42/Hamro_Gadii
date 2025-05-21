package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.CarDao;
import hamrogadi12345.controller.Dao.DBConnections;
import hamrogadi12345.controller.Dao.TestDriveDAO;
import hamrogadi12345.controller.Dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        Connection connection = null;
        TestDriveDAO testDriveDao = null;
        try {
            // Get database connection
            connection = DBConnections.getConnection();
            
            // Initialize DAOs
            CarDao carDao = new CarDao();
            UserDao userDao = new UserDao();
            testDriveDao = new TestDriveDAO(connection);
            
            // Get counts for dashboard statistics
            int carCount = carDao.getTotalCarsCount();
            int adminCount = userDao.getUserCountByRole("admin");
            int customerCount = userDao.getUserCountByRole("user");
            int testRideCount = testDriveDao.getTotalTestDrivesCount();
            
            // Set attributes for JSP
            request.setAttribute("carCount", carCount);
            request.setAttribute("adminCount", adminCount);
            request.setAttribute("customerCount", customerCount);
            request.setAttribute("testRideCount", testRideCount);
            
            // Forward to JSP
            request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading dashboard data");
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
        } finally {
            // Close resources
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}