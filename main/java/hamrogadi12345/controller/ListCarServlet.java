package hamrogadi12345.controller;

//import hamrogadi12345.controller.Dao.CarDao;

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

@WebServlet("/ListCarServlet")
public class ListCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarDao carDao = new CarDao();
        CategoryDao categoryDao = new CategoryDao();

        List<CarModel> carList = carDao.getAllCars(); // Ensure this method is implemented in CarDao
        List<CategoryModel> categoryList = categoryDao.getAllCategories(); // Likewise for CategoryDao

        request.setAttribute("carList", carList);
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admincar.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Optional: handle POST as GET
    }
}