package servlet;

import java.io.IOException;

import dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        Admin admin = new Admin(username, password);
        AdminDAO dao = new AdminDAO();
        boolean success = dao.registerAdmin(admin);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Registration failed. Username may already exist.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
} 