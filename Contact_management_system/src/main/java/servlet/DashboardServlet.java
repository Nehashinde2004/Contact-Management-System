package servlet;

import dao.ContactDAO;
import model.Contact;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContactDAO dao = new ContactDAO();
        String searchIdParam = request.getParameter("searchId");
        if (searchIdParam != null && !searchIdParam.isEmpty()) {
            try {
                int searchId = Integer.parseInt(searchIdParam);
                Contact searchedContact = dao.getContactById(searchId);
                request.setAttribute("searchedContact", searchedContact);
            } catch (NumberFormatException | SQLException e) {
                request.setAttribute("searchedContact", null);
            }
        }
        try {
            int totalContacts = dao.getTotalContacts();
            List<Contact> recentContacts = dao.getRecentContacts(5);
            List<Contact> deletedContactsList = dao.getDeletedContacts();
            int deletedContactsCount = deletedContactsList.size();
            request.setAttribute("totalContacts", totalContacts);
            request.setAttribute("recentlyAdded", recentContacts.size());
            request.setAttribute("deletedContacts", deletedContactsCount);
            request.setAttribute("recentContacts", recentContacts);
            request.setAttribute("deletedContactsList", deletedContactsList);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
} 