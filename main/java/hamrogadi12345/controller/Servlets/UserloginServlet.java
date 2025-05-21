package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.UserDao;
import hamrogadi12345.controller.util.CookieUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class UserloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public UserloginServlet() {
		super();
	}

	@Override
	public void init() throws ServletException {
		userDao = new UserDao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		loginUser(request, response);
	}

	private void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		int result = userDao.loginUser(email, password);

		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("userEmail", email);

			CookieUtil.addCookie(response, "userEmail", email, 7 * 24 * 60 * 60); // 7 days

			try {
				String role = userDao.getUserRole(email);
				
				session.setAttribute("userRole", role);

				if ("Admin".equalsIgnoreCase(role)) {
					response.sendRedirect("AddCarServlet");
				} else {
					response.sendRedirect("home");
				}
			} catch (ClassNotFoundException | SQLException e) {
				throw new ServletException("Error retrieving user role", e);
			}
		} else {
			request.setAttribute("error", true);
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		}
	}
}