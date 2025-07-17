package servlet;

import java.io.IOException;
import java.sql.SQLException;

import dao.ContactDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteContact")
public class DeleteContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ContactDAO dao = new ContactDAO();
        try {
            dao.deleteContact(id);
            request.getSession().setAttribute("successMsg", "Contact deleted successfully!");
            response.sendRedirect("listContacts");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
} 