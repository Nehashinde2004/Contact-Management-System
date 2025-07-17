<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String errorMsg = (String) request.getAttribute("errorMsg");
    model.Contact contact = (model.Contact) request.getAttribute("contact");
%>
<html>
<head>
    <title>Add Contact</title>
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
    <% Integer newContactId = (Integer) request.getAttribute("newContactId"); %>
    <h1>Add Contact</h1>
    <% if (errorMsg != null) { %>
        <div class="error"><%= errorMsg %></div>
    <% } %>
    <% if (request.getAttribute("successMsg") != null) { %>
        <div class="success"><%= request.getAttribute("successMsg") %></div>
    <% } %>
    <% if (newContactId != null && newContactId > 0) { %>
        <div class="info">New Contact ID: <strong><%= newContactId %></strong></div>
    <% } %>
    <form name="contactForm" action="addContact" method="post" onsubmit="return validateForm();">
        <label>First Name: <input type="text" name="firstName" required value="<%= contact != null ? contact.getFirstName() : "" %>"></label><br>
        <label>Last Name: <input type="text" name="lastName" required value="<%= contact != null ? contact.getLastName() : "" %>"></label><br>
        <label>Address: <input type="text" name="address" value="<%= contact != null ? contact.getAddress() : "" %>"></label><br>
        <label>Email: <input type="email" name="email" required value="<%= contact != null ? contact.getEmail() : "" %>"></label><br>
        <label>Phone: <input type="text" name="phone" required value="<%= contact != null ? contact.getPhone() : "" %>"></label><br>
        <div class="form-actions">
          <button type="submit">Add Contact</button>
          <a href="dashboard"><button type="button">Back to Dashboard</button></a>
        </div>
    </form>
    <a href="listContacts">Back to List</a>
</div>
</body>
</html> 