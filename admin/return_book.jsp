<%@ page import="java.sql.*" %>
<%@ include file="../db.jsp" %>

<%
if (!"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect("../unauthorized.jsp");
    return;
}

if("POST".equalsIgnoreCase(request.getMethod())) {

    String issueIdStr = request.getParameter("issue_id");
    String bookIdStr = request.getParameter("book_id");

    if(issueIdStr == null || bookIdStr == null || issueIdStr.trim().equals("") || bookIdStr.trim().equals("")) {
        out.println("<div class='alert alert-danger'>Error: Missing parameters!</div>");
    } else {
        int issueId = Integer.parseInt(issueIdStr);
        int bookId = Integer.parseInt(bookIdStr);

        try {
          // Instead of UPDATE issued_books SET return_date=NOW()
PreparedStatement ps = con.prepareStatement("DELETE FROM issued_books WHERE id=?");
ps.setInt(1, issueId);
int deleted = ps.executeUpdate();

if(deleted > 0) {
    PreparedStatement update = con.prepareStatement("UPDATE books SET available=TRUE WHERE id=?");
    update.setInt(1, bookId);
    update.executeUpdate();

    out.println("<div class='alert alert-success'>Book Returned and Record Deleted!</div>");
} else {
    out.println("<div class='alert alert-warning'>This book was already returned or issue not found.</div>");
}


        } catch(Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    }
}
%>

<html>
<head>
<title>Return Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 10px;
    padding: 0;
}

h2 {
    color: #333;
    text-align: center;
}

form {
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #fff;
    max-width: 400px;
    margin: 0 auto;
    border-radius: 10px;
}

input {
    display: block;
    width: 100%;
    margin: 10px 0;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

button {
    background-color: #4CAF50;
	
    color: white;
    // border: none;
    cursor: pointer;
	display: block;
    // width: 100%;
    // margin: 0px 0;
    padding: 8px;
    border: 1px solid #4CAF50;
	border-radius:10px;
}

button:hover {
    background-color: #47a079;
}

a {
    color: #4CAF50;
    text-decoration: none;
    display: block;
    text-align: center;
    margin-top: 10px;
}
.delete-back{
    color: #4CAF50;
    text-decoration: none;
    display: block;
    text-align: center;
    margin-top: 10px;
}
table {
    width: 90%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: white;
}

table th, table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

table th {
    background-color: #4CAF50;
    color: white;
}
.navbar {
    background-color: #333;
    padding: 10px 20px;
}

.nav-container {
    max-width: 1000px;
    margin: 0 auto;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    color: white;
}

.nav-title {
    font-size: 1.2rem;
    font-weight: bold;
}

.nav-links {
    display: flex;
    gap: 15px;
    flex-wrap: wrap;
}

.nav-links a {
    color: white;
    text-decoration: none;
    padding: 8px 12px;
    border-radius: 5px;
    display: flex;
    align-items: center;
    gap: 5px;
}

.nav-links a:hover {
    background-color: #4CAF50;
}

.menu-icon {
    display: none;
    font-size: 26px;
    cursor: pointer;
}

#menu-toggle {
    display: none;
}

/* Responsive Styles */
@media screen and (max-width: 768px) {
    .nav-links {
        display: none;
        width: 100%;
        flex-direction: column;
        background-color: #444;
        margin-top: 10px;
        padding: 10px;
    }

    #menu-toggle:checked + .menu-icon + .nav-links {
        display: flex;
    }

    .menu-icon {
        display: block;
    }
}

</style>
</head>
<body class="p-4">

<h3>Return a Book</h3>

<table class="table table-bordered">
  <thead class="table-light">
    <tr>
      <th>Book Title</th>
      <th>Issued To</th>
      <th>Issue Date</th>
      <th>Return Date</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  try {
      String query = "SELECT ib.id, b.id as book_id, b.title, ib.issued_to, ib.issue_date, ib.return_date " +
                     "FROM issued_books ib JOIN books b ON ib.book_id = b.id";
      ResultSet rs = con.createStatement().executeQuery(query);

      while (rs.next()) {
  %>
    <tr>
      <td><%= rs.getString("title") %></td>
      <td><%= rs.getString("issued_to") %></td>
      <td><%= rs.getDate("issue_date") %></td>
      <td><%= rs.getDate("return_date") != null ? rs.getDate("return_date") : "Not Returned" %></td>
      <td>
        <% if(rs.getDate("return_date") == null) { %>
        <form method="post" style="margin:0;">
          <input type="hidden" name="issue_id" value="<%= rs.getInt("id") %>">
          <input type="hidden" name="book_id" value="<%= rs.getInt("book_id") %>">
          <button type="submit" class="delete-btn">Return</button>
        </form>
        <% } else { %>
          <span class="text-success">Returned</span>
        <% } %>
      </td>
    </tr>
  <%
      }
  } catch(Exception e) {
      out.println("<tr><td colspan='5' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
  }
  %>
  </tbody>
</table>

<a href="../dashboard.jsp">Back to Dashboard</a>

</body>
</html>
