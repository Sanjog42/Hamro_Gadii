package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.TestDriveDAO;
import hamrogadi12345.controller.Dao.DBConnections;
import hamrogadi12345.controller.models.TestDriveModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/managetestServlet")
public class managetestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try (Connection connection = DBConnections.getConnection()) {
            TestDriveDAO testDriveDAO = new TestDriveDAO(connection);
            List<TestDriveModel> testDrives = testDriveDAO.getAllTestDrives();
            
            request.setAttribute("testDrives", testDrives);
            request.getRequestDispatcher("/WEB-INF/pages/managetest.jsp").forward(request, response);
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int testDriveID = Integer.parseInt(request.getParameter("testDriveID"));
        
        try (Connection connection = DBConnections.getConnection()) {
            TestDriveDAO testDriveDAO = new TestDriveDAO(connection);
            
            if ("update".equals(action)) {
                String newStatus = request.getParameter("status");
                testDriveDAO.updateTestDriveStatus(testDriveID, newStatus);
            } else if ("delete".equals(action)) {
                testDriveDAO.deleteTestDrive(testDriveID);
            }
            
            response.sendRedirect(request.getContextPath() + "/managetestServlet");
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}