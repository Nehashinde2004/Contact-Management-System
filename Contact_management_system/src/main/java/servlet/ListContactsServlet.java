package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.ContactDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contact;

@WebServlet("/listContacts")
public class ListContactsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContactDAO dao = new ContactDAO();
        try {
            List<Contact> contacts = dao.getAllContacts();
            request.setAttribute("contacts", contacts);
            request.getRequestDispatcher("listContacts.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
} 