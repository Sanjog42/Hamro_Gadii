package hamrogadi12345.controller.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import hamrogadi12345.controller.Dao.CarDao;
import hamrogadi12345.controller.models.CarModel;
import java.io.IOException;

@WebServlet("/UpdateCarServlet")
public class UpdateCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarDao carDao;

    @Override
    public void init() throws ServletException {
        super.init();
        carDao = new CarDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CarModel car = new CarModel();
            car.setCarID(Integer.parseInt(request.getParameter("carId")));
            car.setBrand(request.getParameter("brand"));
            car.setModel(request.getParameter("model"));
            car.setPrice(Double.parseDouble(request.getParameter("price")));
            car.setDescription(request.getParameter("description"));
            car.setCarCondition(request.getParameter("condition"));
            car.setUrl(request.getParameter("url"));
            car.setCategoryID(Integer.parseInt(request.getParameter("category")));

            carDao.updateCar(car);
            response.sendRedirect(request.getContextPath() + "/RemoveServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/RemoveServlet?error=update_failed");
        }
    }
}