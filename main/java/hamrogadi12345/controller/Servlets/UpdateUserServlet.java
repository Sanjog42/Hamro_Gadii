package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.UserDao;
import hamrogadi12345.controller.models.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");  // Email assumed immutable
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        try {
            UserModel user = UserDao.getUserByEmail(email);
            if (user != null) {
                user.setName(name);
                user.setPhoneNumber(phone);
                user.setAddress(address);
                user.setPassword(password);

                boolean updated = UserDao.updateUser(user);
                if (updated) {
                    request.setAttribute("message", "Profile updated successfully.");
                } else {
                    request.setAttribute("error", "Failed to update profile.");
                }
            } else {
                request.setAttribute("error", "User not found.");
            }

            request.getRequestDispatcher("/UserProfileServlet").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}