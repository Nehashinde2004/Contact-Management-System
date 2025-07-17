package servlet;

import java.io.IOException;
import java.sql.SQLException;

import dao.ContactDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contact;

@WebServlet("/editContactForm")
public class EditContactFormServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ContactDAO dao = new ContactDAO();
        try {
            Contact contact = dao.getContactById(id);
            if (contact != null) {
                request.setAttribute("contact", contact);
                request.getRequestDispatcher("editContact.jsp").forward(request, response);
            } else {
                response.sendRedirect("listContacts");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
} 