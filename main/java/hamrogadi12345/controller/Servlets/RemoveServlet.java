package hamrogadi12345.controller.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import hamrogadi12345.controller.Dao.CarDao;
import hamrogadi12345.controller.models.CarModel;
import java.io.IOException;
import java.util.List;

@WebServlet("/RemoveServlet")
public class RemoveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarDao carDao;

    @Override
    public void init() throws ServletException {
        super.init();
        carDao = new CarDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<CarModel> cars = carDao.getAllCars();
        request.setAttribute("cars", cars);
        request.getRequestDispatcher("/WEB-INF/pages/remove.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("delete".equals(action)) {
            int carId = Integer.parseInt(request.getParameter("carId"));
            carDao.deleteCar(carId);
        } else if ("update".equals(action)) {
            // Handle update if needed
        }
        
        response.sendRedirect(request.getContextPath() + "/RemoveServlet");
    }
}