package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.TestDriveDAO;
import hamrogadi12345.controller.models.TestDriveModel;
import hamrogadi12345.controller.Dao.DBConnections;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/TestDriveServlet")
public class TestDriveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TestDriveServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carIDParam = request.getParameter("id");  // 'id' from query string
        if (carIDParam == null || carIDParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/WEB-INF/pages/errorPage.jsp");
            return;
        }

        request.setAttribute("carID", carIDParam);
        request.getRequestDispatcher("/WEB-INF/pages/testride.jsp").forward(request, response);
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleTestDriveSubmission(request, response);
    }

    private void handleTestDriveSubmission(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String testDate = request.getParameter("testDate");
        String testTime = request.getParameter("testTime");
        String notes = request.getParameter("testNotes");
        String carIDParam = request.getParameter("carID");

        // Validate carID
        if (carIDParam == null || carIDParam.isEmpty()) {
            response.sendRedirect("/WEB-INF/pages/errorPage.jsp"); // Redirect to error page if missing
            return;
        }

        int carID;
        try {
            carID = Integer.parseInt(carIDParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("/WEB-INF/pages/errorPage.jsp"); // Redirect to error page if invalid
            return;
        }

        // Parse the test date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsedTestDate;
        try {
            parsedTestDate = dateFormat.parse(testDate);
        } catch (ParseException e) {
            response.sendRedirect("/WEB-INF/pages/errorPage.jsp"); // Redirect to error page on invalid date
            return;
        }

        // Create TestDriveModel object
        TestDriveModel testDrive = new TestDriveModel();
        testDrive.setCarID(carID);
        testDrive.setUserEmail(email);
        testDrive.setTestDriveDate(parsedTestDate);
        testDrive.setTestDriveTime(testTime);
        testDrive.setTestDriveStatus("Pending");
        testDrive.setTestDriveNotes(notes);

        // Save to database
        try (Connection connection = DBConnections.getConnection()) {
            TestDriveDAO testDriveDAO = new TestDriveDAO(connection);
            if (testDriveDAO.insertTestDrive(testDrive)) {
            	response.sendRedirect("home");   // Redirect to success page
            } else {
                response.sendRedirect("/WEB-INF/pages/errorPage.jsp");  // Redirect to failure page
            }
        } catch (SQLException | ClassNotFoundException e) {
            response.sendRedirect("/WEB-INF/pages/errorPage.jsp");  // Redirect on DB connection error
        }
    }
}