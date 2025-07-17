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

@WebServlet("/editContact")
public class EditContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Contact contact = new Contact(id, firstName, lastName, address, email, phone);
        ContactDAO dao = new ContactDAO();
        String errorMsg = null;
        try {
            if (dao.emailExistsForOtherId(email, id)) {
                errorMsg = "Email already exists for another contact.";
            } else if (!Pattern.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$", email)) {
                errorMsg = "Invalid email format.";
            } else if (!Pattern.matches("^\\d{10,}$", phone)) {
                errorMsg = "Phone number must be at least 10 digits.";
            }
            if (errorMsg != null) {
                request.setAttribute("errorMsg", errorMsg);
                request.setAttribute("contact", contact);
                request.getRequestDispatcher("editContact.jsp").forward(request, response);
            } else {
                dao.updateContact(contact);
                request.getSession().setAttribute("successMsg", "Contact updated successfully!");
                response.sendRedirect("listContacts");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
} 