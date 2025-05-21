package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.models.CategoryModel;
import hamrogadi12345.controller.Dao.CategoryDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryDao categoryDao;

  
    @Override
    public void init() throws ServletException {
        categoryDao = new CategoryDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<CategoryModel> categories = categoryDao.getAllCategories();
            request.setAttribute("categoryList", categories);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading categories.");
        }

        request.getRequestDispatcher("/WEB-INF/pages/remover.jsp").forward(request, response);
    }


   
    
}