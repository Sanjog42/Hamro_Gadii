package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.CarDao;
import hamrogadi12345.controller.models.CarModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CarDao carDao = new CarDao();
		List<CarModel> carList = carDao.getAllCars();  // <-- Fetch all cars
		request.setAttribute("carList", carList);       // <-- Set the list in request scope

		request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
	}
}