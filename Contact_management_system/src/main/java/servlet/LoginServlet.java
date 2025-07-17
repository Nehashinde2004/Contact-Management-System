package servlet;

import java.io.IOException;

import dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        Admin admin = dao.loginAdmin(username, password);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("dashboard");
        } else {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
} 