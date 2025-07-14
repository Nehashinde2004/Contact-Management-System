# Contact-Management-System
# MyContactManager

## 📌 Overview
**MyContactManager** is a web-based application that allows users to efficiently manage contact records. The system enables adding, updating, deleting, and viewing contact details, as well as managing reminders and other personal information. Designed for administrative use, it ensures secure access and easy management of all your contacts.

---

## 🚀 Features
- Add New Contacts
- View Contact Details
- Update Contact Information
- Delete Contacts (Soft Delete)
- Manage Reminders
- Secure Admin Login & Authentication
- Dashboard with Statistics

---

## 🛠️ Technologies Used
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Java (Servlets, JSP)
- **Database:** MySQL
- **Server:** Apache Tomcat

---

## 💼 Project Structure
```
MyContactManager/
├── src/main/java/                  # Java Source Code
│   └── servlet/                    # Java Servlets
│       ├── AddContactServlet.java
│       ├── DashboardServlet.java
│       ├── DeleteContactServlet.java
│       ├── EditContactFormServlet.java
│       ├── EditContactServlet.java
│       ├── ListContactsServlet.java
│       ├── LoginServlet.java
│       ├── LogoutServlet.java
│       └── RegisterServlet.java
├── src/main/java/dao/              # Data Access Objects
├── src/main/java/model/            # Data Models
├── src/main/java/database/         # Database Connection
├── src/main/webapp/                # Web Application Files
│   ├── images/                     # Image Assets
│   ├── META-INF/                   # Meta Information
│   ├── WEB-INF/                    # Configuration Files
│   ├── addContact.jsp
│   ├── dashboard.jsp
│   ├── editContact.jsp
│   ├── home.jsp
│   ├── listContacts.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── style.css
├── add_is_deleted.sql              # SQL Script for DB
├── README.md                       # Project Documentation
```
## 📌 Setup Instructions

### 1⃣ Clone the Repository
```bash
git clone https://github.com/YOUR-GITHUB-USERNAME/MyContactManager.git
cd MyContactManager
```

### 2⃣ Import into Eclipse (or any Java IDE)
1. Open Eclipse and select **File > Import**
2. Choose **Existing Projects into Workspace**
3. Select the cloned repository folder
4. Click **Finish**

### 3⃣ Set Up Database (MySQL)
1. Open MySQL and create the database:
   ```sql
   CREATE DATABASE mycontactmanager;
   ```
2. Import `add_is_deleted.sql` into the database.

### 4⃣ Configure Apache Tomcat
1. Open **Eclipse > Servers**
2. Add **Apache Tomcat Server**
3. Deploy the project

### 5⃣ Run the Application
- Open [http://localhost:8080/MyContactManager](http://localhost:8080/MyContactManager) in your browser.

---

## 🐜 License
This project is for educational and demonstration purposes.

---

**📌 Contributor:** [Neha shinde]
Feel free to contribute! 🚀 
