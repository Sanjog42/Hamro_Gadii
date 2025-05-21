package hamrogadi12345.controller.Servlets;

import hamrogadi12345.controller.util.CookieUtil;
import hamrogadi12345.controller.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/logout")
public class logoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public logoutServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session
        SessionUtil.setAttribute(request, "userEmail", null);
        
        // Remove the user email cookie
        CookieUtil.addCookie(response, "userEmail", null, 0); 
        
        // Redirect the user to the login page after logout
        response.sendRedirect(request.getContextPath() + "/login");
    }
}