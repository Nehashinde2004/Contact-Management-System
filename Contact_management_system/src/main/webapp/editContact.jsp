<%@ page import="model.Contact" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String errorMsg = (String) request.getAttribute("errorMsg");
    Contact contact = (Contact) request.getAttribute("contact");
    if (contact == null) {
        response.sendRedirect("listContacts");
        return;
    }
%>
<html>
<head>
    <title>Edit Contact</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function validateForm() {
            var email = document.forms["contactForm"]["email"].value;
            var phone = document.forms["contactForm"]["phone"].value;
            var emailPattern = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
            var phonePattern = /^\d{10,}$/;
            var errorMsg = "";
            if (!emailPattern.test(email)) {
                errorMsg += "Invalid email format.\n";
            }
            if (!phonePattern.test(phone)) {
                errorMsg += "Phone number must be at least 10 digits.\n";
            }
            if (errorMsg) {
                alert(errorMsg);
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Edit Contact</h1>
    <% if (errorMsg != null) { %>
        <div class="error"><%= errorMsg %></div>
    <% } %>
    <form name="contactForm" action="editContact" method="post" onsubmit="return validateForm();">
        <input type="hidden" name="id" value="<%= contact.getId() %>">
        <label>First Name: <input type="text" name="firstName" value="<%= contact.getFirstName() %>" required></label><br>
        <label>Last Name: <input type="text" name="lastName" value="<%= contact.getLastName() %>" required></label><br>
        <label>Address: <input type="text" name="address" value="<%= contact.getAddress() %>"></label><br>
        <label>Email: <input type="email" name="email" value="<%= contact.getEmail() %>" required></label><br>
        <label>Phone: <input type="text" name="phone" value="<%= contact.getPhone() %>" required></label><br>
        <div class="form-actions">
          <button type="submit">Update Contact</button>
          <form action="deleteContact" method="post" style="display:inline;">
            <input type="hidden" name="id" value="<%= contact.getId() %>">
            <button type="submit" onclick="return confirm('Are you sure you want to delete this contact?');">Delete Contact</button>
          </form>
          <a href="dashboard"><button type="button">Back to Dashboard</button></a>
        </div>
    </form>
    <a href="listContacts">Back to List</a>
</div>
</body>
</html> 