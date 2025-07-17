<%@ page import="java.util.List" %>
<%@ page import="model.Contact" %>
<%
    int totalContacts = request.getAttribute("totalContacts") != null ? (Integer)request.getAttribute("totalContacts") : 0;
    int recentlyAdded = request.getAttribute("recentlyAdded") != null ? (Integer)request.getAttribute("recentlyAdded") : 0;
    int deletedContacts = request.getAttribute("deletedContacts") != null ? (Integer)request.getAttribute("deletedContacts") : 0;
    List<Contact> recentContacts = (List<Contact>)request.getAttribute("recentContacts");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>ContactManager Dashboard</title>
  <link href="https://fonts.googleapis.com/css?family=Inter:400,500,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="dashboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
  <div class="container">
    <!-- Remove topbar-flex, search bar, profile icon, dropdown, and JS -->
  
    <aside class="sidebar">
      <div class="sidebar-title">ContactManager</div>
      <nav>
        <ul>
          <li class="active"><i class="fa fa-home"></i> Dashboard</li>
          <li><a href="addContact.jsp"><i class="fa fa-user-plus"></i> Add Contact</a></li>
          <li><a href="listContacts"><i class="fa fa-address-book"></i> View All Contacts</a></li>
          <li><a href="listContacts"><i class="fa fa-edit"></i> Update/Delete Contact</a></li>
        </ul>
      </nav>
      <a href="LogoutServlet" class="sidebar-logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </aside>

    <!-- Main Content -->
    <div class="main">
      <!-- Dashboard Content -->
      <section class="dashboard">
        <h1>Welcome, Neha <span class="wave"></span></h1>
        <!-- Search by Contact ID -->
        <form action="dashboard" method="get" style="margin-bottom: 20px;">
          <label for="searchId">Search Contact by ID:</label>
          <input type="number" id="searchId" name="searchId" placeholder="Enter Contact ID" required>
          <button type="submit">Search</button>
        </form>
        <% if (request.getAttribute("searchedContact") != null) {
             model.Contact searched = (model.Contact)request.getAttribute("searchedContact");
             if (searched != null) { %>
          <div class="search-result">
            <h3>Search Result:</h3>
            <table>
              <tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th></tr>
              <tr>
                <td><%= searched.getId() %></td>
                <td><%= searched.getFirstName() %> <%= searched.getLastName() %></td>
                <td><%= searched.getEmail() %></td>
                <td><%= searched.getPhone() %></td>
                <td><%= searched.getAddress() %></td>
              </tr>
            </table>
          </div>
        <%   } else { %>
          <div class="search-result">
            <h3>Contact not found in your contact list.</h3>
          </div>
        <%   }
           }
        %>
        <div class="stats-cards">
          <div class="card">
            <div class="card-icon"><i class="fa fa-users"></i></div>
            <div class="card-label">Total Contacts</div>
            <div class="card-value"><%= totalContacts %></div>
          </div>
          <div class="card">
            <div class="card-icon"><i class="fa fa-plus-square"></i></div>
            <div class="card-label">Recently Added</div>
            <div class="card-value"><%= recentlyAdded %></div>
          </div>
          <div class="card">
            <div class="card-icon"><i class="fa fa-trash"></i></div>
            <div class="card-label">Deleted Contacts</div>
            <div class="card-value"><%= deletedContacts %></div>
          </div>
        </div>
        <div class="recent-contacts">
          <h2>Recent Contacts</h2>
          <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
            <% if (recentContacts != null) {
                for (Contact c : recentContacts) { %>
              <tr>
                <td><%= c.getFirstName() %> <%= c.getLastName() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getPhone() %></td>
                <td>
                  <a href="editContactForm?id=<%= c.getId() %>" class="edit">Edit</a>
                  <form action="deleteContact" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <button type="submit" class="delete" onclick="return confirm('Are you sure you want to delete this contact?');">Delete</button>
                  </form>
                </td>
              </tr>
            <%   }
               } %>
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </div>
</body>
</html> 