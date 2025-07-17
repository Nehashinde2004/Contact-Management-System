package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Pattern;

import dao.ContactDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contact;

@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Contact contact = new Contact(firstName, lastName, address, email, phone);
        ContactDAO dao = new ContactDAO();
        String errorMsg = null;
        try {
            if (dao.emailExists(email)) {
                errorMsg = "Email already exists.";
            } else if (!Pattern.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$", email)) {
                errorMsg = "Invalid email format.";
            } else if (!Pattern.matches("^\\d{10,}$", phone)) {
                errorMsg = "Phone number must be at least 10 digits.";
            }
            if (errorMsg != null) {
                request.setAttribute("errorMsg", errorMsg);
                request.setAttribute("contact", contact);
                request.getRequestDispatcher("addContact.jsp").forward(request, response);
            } else {
                int newContactId = dao.addContact(contact);
                request.setAttribute("successMsg", "Contact added successfully! Contact ID: " + newContactId);
                request.setAttribute("newContactId", newContactId);
                request.setAttribute("contact", null); // clear form
                request.getRequestDispatcher("addContact.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
} 