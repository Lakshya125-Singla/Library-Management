<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ page import="java.sql.*" %>
<%
if (!"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect("../unauthorized.jsp");
    return;
}
%>
<html>
<head>

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
    padding: 5px;
    border: 1px solid #4CAF50;
	border-radius:15px;
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
<script src="../js/script.js" defer></script>
</head>
<body class="container mt-4">
<h3>Delete Book</h3>
<table >
  <thead ><tr><th>Title</th><th>Author</th><th>Action</th></tr></thead>
  <tbody>
<%@ include file="../db.jsp" %>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    int bookId = Integer.parseInt(request.getParameter("book_id"));
    PreparedStatement ps = con.prepareStatement("DELETE FROM books WHERE id=?");
    ps.setInt(1, bookId);
    ps.executeUpdate();
}

ResultSet rs = con.createStatement().executeQuery("SELECT * FROM books");
while(rs.next()) {
%>
  <tr>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getString("author") %></td>
    <td class="delete-td">
      <form method="post">
        <input type="hidden" name="book_id" value="<%= rs.getInt("id") %>">
        <button type="submit" class="delete-btn">Delete</button>
      </form>
    </td>
  </tr>
<% } %>
  </tbody>
</table>

</body>
<a class="delete-back" href="../dashboard.jsp">Back to Dashboard</a>
</html>
