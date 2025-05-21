package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.UserDao;
import hamrogadi12345.controller.models.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")

//@WebServlet(urlPatterns = {"/register", "/"}) 
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDao userDao;

	public UserServlet() {
		super();
	}

	@Override
	public void init() throws ServletException {
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		registerUser(request, response);
	}

	private void registerUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		UserModel user = new UserModel(name, email, password, phone, role, address, role);

		int result = userDao.registerUser(user);

		if (result == 1) {
			request.setAttribute("success", true);
			request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
		} else if (result == -2) {
			request.setAttribute("error", "EmailAlreadyExists");
			request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
		} else {
			request.setAttribute("error", true);
			request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
		}
	}
}