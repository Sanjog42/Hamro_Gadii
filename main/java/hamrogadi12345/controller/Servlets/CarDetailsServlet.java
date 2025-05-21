package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.CarDao;
import hamrogadi12345.controller.models.CarModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/CarDetailsServlet")
public class CarDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CarDao carDao = new CarDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int carId = Integer.parseInt(idParam);
                CarModel selectedCar = carDao.getCarById(carId);

                if (selectedCar != null) {
                    request.setAttribute("selectedCar", selectedCar);
                    request.getRequestDispatcher("/WEB-INF/pages/productdetails.jsp").forward(request, response);
                } else {
                    response.sendRedirect("error.jsp");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}