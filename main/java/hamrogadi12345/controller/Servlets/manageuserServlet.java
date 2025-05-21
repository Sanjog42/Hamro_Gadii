package hamrogadi12345.controller.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import hamrogadi12345.controller.models.UserModel;
import hamrogadi12345.controller.Dao.UserDao;

@WebServlet("/manageuserServlet")
public class manageuserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public manageuserServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<UserModel> users = UserDao.getAllUsers(); // Make sure this method exists
            request.setAttribute("users", users);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/pages/manageuser.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String email = request.getParameter("email");

        try {
            if ("delete".equalsIgnoreCase(action)) {
                UserDao.deleteUserByEmail(email);
            } else if ("update".equalsIgnoreCase(action)) {
                UserModel updatedUser = new UserModel();
                updatedUser.setName(request.getParameter("name"));
                updatedUser.setEmail(email);
                updatedUser.setPassword(request.getParameter("password"));
                updatedUser.setPhoneNumber(request.getParameter("phoneNumber"));
                updatedUser.setRole(request.getParameter("role"));
                updatedUser.setAddress(request.getParameter("address"));
                UserDao.updateUser(updatedUser);
            } else if ("ban".equalsIgnoreCase(action)) {
                // Optionally handle banning by setting role to "Banned"
                UserModel user = UserDao.getUserByEmail(email);
                if (user != null) {
                    user.setRole("Banned");
                    UserDao.updateUser(user);
                }
            } else if ("promote".equalsIgnoreCase(action)) {
                UserModel user = UserDao.getUserByEmail(email);
                if (user != null) {
                    user.setRole("Admin");
                    UserDao.updateUser(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("manageuserServlet");
    }
}