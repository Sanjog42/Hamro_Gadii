package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.CarDao;
import hamrogadi12345.controller.models.CarModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/GetcarServelt")
public class GetcarServelt extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GetcarServelt() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String carIdParam = request.getParameter("id");
        if (carIdParam != null) {
            try {
                int carId = Integer.parseInt(carIdParam);
                CarDao carDao = new CarDao();
                for (CarModel car : carDao.getAllCars()) {
                    if (car.getCarID() == carId) {
                        request.setAttribute("car", car);
                        break;
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("viewcar.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}