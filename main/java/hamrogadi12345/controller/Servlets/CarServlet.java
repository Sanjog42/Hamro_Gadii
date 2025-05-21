package hamrogadi12345.controller.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import hamrogadi12345.controller.Dao.CarDao;
import hamrogadi12345.controller.models.CarModel;

@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CarDao carDao = new CarDao();
        
        // Get search and filter parameters
        String query = request.getParameter("query");
        String brand = request.getParameter("brand");
        String priceRange = request.getParameter("price");
        String condition = request.getParameter("condition");
        String bodyType = request.getParameter("bodyType");
        
        List<CarModel> carList;
        
        if (query != null || brand != null || priceRange != null || condition != null || bodyType != null) {
            // If any filter is applied, use the filtered search
            carList = carDao.searchCars(query, brand, priceRange, condition, bodyType);
        } else {
            // Otherwise get all cars
            carList = carDao.getAllCars();
        }
        
        request.setAttribute("carList", carList);
        request.getRequestDispatcher("/WEB-INF/pages/products.jsp").forward(request, response);
    }
}