package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.Dao.UserDao;
import hamrogadi12345.controller.models.UserModel;
import hamrogadi12345.controller.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("userEmail") : null;

        if (email == null) {
            response.sendRedirect("login");
            return;
        }

        try {
            UserModel user = UserDao.getUserByEmail(email);
            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("/WEB-INF/pages/updateprofile.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "User not found.");
                request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (session != null) ? (String) session.getAttribute("userEmail") : null;
        
        if (email == null) {
            response.sendRedirect("login");
            return;
        }

        try {
            // Get current user data
            UserModel currentUser = UserDao.getUserByEmail(email);
            if (currentUser == null) {
                request.setAttribute("error", "User not found.");
                request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
                return;
            }

            // Get updated fields from form
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phone");
            String address = request.getParameter("address");
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            
            // Create updated user object
            UserModel updatedUser = new UserModel();
            updatedUser.setEmail(email);
            updatedUser.setName(name);
            updatedUser.setPhoneNumber(phoneNumber);
            updatedUser.setAddress(address);
            updatedUser.setRole(currentUser.getRole());
            
            // Handle password change
            if (newPassword != null && !newPassword.isEmpty()) {
                // Verify current password
                if (!PasswordUtil.verifyPassword(currentPassword, currentUser.getPassword(), currentUser.getSalt())) {
                    request.setAttribute("error", "Current password is incorrect.");
                    request.setAttribute("user", currentUser);
                    request.getRequestDispatcher("/WEB-INF/pages/updateprofile.jsp").forward(request, response);
                    return;
                }
                
                if (!newPassword.equals(confirmPassword)) {
                    request.setAttribute("error", "New passwords do not match.");
                    request.setAttribute("user", currentUser);
                    request.getRequestDispatcher("/WEB-INF/pages/updateprofile.jsp").forward(request, response);
                    return;
                }
                
                // Hash and set new password
                String newSalt = PasswordUtil.generateSalt();
                String hashedPassword = PasswordUtil.hashPassword(newPassword, newSalt);
                updatedUser.setPassword(hashedPassword);
                updatedUser.setSalt(newSalt);
            } else {
                // Keep existing password if not changed
                updatedUser.setPassword(currentUser.getPassword());
                updatedUser.setSalt(currentUser.getSalt());
            }
            
            // Update user in database
            boolean success = UserDao.updateUser(updatedUser);
            
            if (success) {
                request.setAttribute("success", "Profile updated successfully!");
                request.setAttribute("user", updatedUser);
            } else {
                request.setAttribute("error", "Failed to update profile. Please try again.");
                request.setAttribute("user", currentUser);
            }
            
            request.getRequestDispatcher("/WEB-INF/pages/updateprofile.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating your profile.");
            try {
                request.setAttribute("user", UserDao.getUserByEmail(email));
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            request.getRequestDispatcher("/WEB-INF/pages/updateprofile.jsp").forward(request, response);
        }
    }
}