package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.CarDao;
import hamrogadi12345.controller.Dao.CategoryDao;
import hamrogadi12345.controller.models.CarModel;
import hamrogadi12345.controller.models.CategoryModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/AddCarServlet")
public class AddCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarDao carDao;
    private CategoryDao categoryDao;

    
    @Override
    public void init() throws ServletException {
        carDao = new CarDao();
        categoryDao = new CategoryDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Load categories for dropdown
        List<CategoryModel> categories = categoryDao.getAllCategories();
        request.setAttribute("categories", categories);
        
        // Get next available car ID
        int nextCarId = carDao.getNextCarId();
        request.setAttribute("nextCarId", nextCarId);
        
        request.getRequestDispatcher("/WEB-INF/pages/addcar.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Extract form data - no need for carId parameter anymore
            String categoryIdParam = request.getParameter("categoryId");
            
            if (categoryIdParam == null || categoryIdParam.isEmpty()) {
                request.setAttribute("error", "Category must be selected.");
                reloadFormData(request);
                request.getRequestDispatcher("/WEB-INF/pages/addcar.jsp").forward(request, response);
                return;
            }

            int categoryID = Integer.parseInt(categoryIdParam);
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            String carCondition = request.getParameter("carCondition");
            String url = request.getParameter("url");

            // Create CarModel object - ID will be auto-generated
            CarModel car = new CarModel();
            car.setBrand(brand);
            car.setModel(model);
            car.setPrice(price);
            car.setDescription(description);
            car.setCarCondition(carCondition);
            car.setUrl(url);
            car.setCategoryID(categoryID);

            // Add the car to the database
            int generatedId = carDao.addCar(car);

            if (generatedId > 0) {
                request.setAttribute("success", "Car added successfully with ID: " + generatedId);
            } else {
                request.setAttribute("error", "Failed to add car.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid number format for category ID or price.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while adding the car: " + e.getMessage());
        }

        reloadFormData(request);
        request.getRequestDispatcher("/WEB-INF/pages/addcar.jsp").forward(request, response);
    }

    private void reloadFormData(HttpServletRequest request) {
        // Reload categories and next available ID
        List<CategoryModel> categories = categoryDao.getAllCategories();
        request.setAttribute("categories", categories);
        int nextCarId = carDao.getNextCarId();
        request.setAttribute("nextCarId", nextCarId);
    }
}