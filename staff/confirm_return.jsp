<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%@ page import="java.sql.*" %>
<%@ include file="../includes/navbar.jsp" %>
<%
if (!"staff".equals(session.getAttribute("role"))) {
    response.sendRedirect("../unauthorized.jsp");
    return;
}
String currentUser = (String) session.getAttribute("username");
%>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h3>Confirm Book Return</h3>

<table class="table table-bordered">
  <thead class="table-light">
    <tr><th>Book</th><th>Issue Date</th><th>Return Date</th><th>Action</th></tr>
  </thead>
  <tbody>
<%@ include file="../db.jsp" %>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String id = request.getParameter("issue_id");
    PreparedStatement ps = con.prepareStatement("DELETE FROM issued_books WHERE id=?");
    ps.setInt(1, Integer.parseInt(id));
    ps.executeUpdate();
}

PreparedStatement ps = con.prepareStatement("SELECT ib.id, b.title, ib.issue_date, ib.return_date FROM issued_books ib JOIN books b ON ib.book_id = b.id WHERE ib.issued_to=?");
ps.setString(1, currentUser);
ResultSet rs = ps.executeQuery();
while (rs.next()) {
%>
  <tr>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getDate("issue_date") %></td>
    <td><%= rs.getDate("return_date") %></td>
    <td>
      <form method="post">
        <input type="hidden" name="issue_id" value="<%= rs.getInt("id") %>">
        <button class="btn btn-success btn-sm">Confirm Return</button>
      </form>
    </td>
  </tr>
<% } %>
  </tbody>
</table>
</body>
</html>
