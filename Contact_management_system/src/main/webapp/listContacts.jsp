<%@ page import="java.util.List" %>
<%@ page import="model.Contact" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String successMsg = (String) session.getAttribute("successMsg");
    if (successMsg != null) {
        session.removeAttribute("successMsg");
    }
%>
<html>
<head>
    <title>Contact List</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Contact List</h1>
    <% if (successMsg != null) { %>
        <div class="success"><%= successMsg %></div>
    <% } %>
    <table border="1">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% List<Contact> contacts = (List<Contact>)request.getAttribute("contacts");
           if (contacts != null) {
               for (Contact c : contacts) { %>
            <tr>
                <td><%= c.getFirstName() %></td>
                <td><%= c.getLastName() %></td>
                <td><%= c.getAddress() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getPhone() %></td>
                <td>
                    <a href="editContactForm?id=<%= c.getId() %>">Edit</a>
                    <form action="deleteContact" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= c.getId() %>">
                        <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this contact?');">Delete</button>
                    </form>
                </td>
            </tr>
        <%   }
           }
        %>
        </tbody>
    </table>
    <div class="form-actions">
      <a href="addContact.jsp"><button type="button">Add New Contact</button></a>
      <a href="dashboard"><button type="button">Back to Dashboard</button></a>
    </div>
</div>
</body>
</html> 